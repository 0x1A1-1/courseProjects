.\" From goodman@gouda.cs.wisc.edu Wed Apr 13 07:58:22 1994
.\" Subject: Re:  chapter 12 exception handler
.\" 
.\" Sure.  Here's the code straight out of the book.  It's
.\" troff, so there may be some minor errors -- extra backslashes --
.\" in places.
.\" 
./" .sz -2
.ft C
.ls 1
.nf
# Assign addresses to labels
        .eq    KeyboardData     0xbfff0000
        .eq    KeyboardStatus   0xbfff0004
        .eq    DisplayData      0xbfff0008
        .eq    DisplayStatus    0xbfff000c
        .eq    KeyboardData     0xbfff0010
        .eq    KeyboardStatus   0xbfff0014
        .eq    DisplayData      0xbfff0018
        .eq    DisplayStatus    0xbfff001c
        .eq    ClockStatus      0xbfff0020

        .kdata
flag:   .word    0      # flag is set to one if entering the kernel
                        # has cause the loss of the user return address.
                        # This flag will help to notice problems.
                        # It will not prevent them.
BadReentry:
        .asciiz  "Bad re-entry into kernel\\nHalting\\n"

tmpr1:  .word 0        # Temporary storage for register 1
tmpr2:  .word 0        # Temporary storage for register 2
tmpr4:  .word 0        # Temporary storage for register 4
tmpr5:  .word 0        # Temporary storage for register 5
tmpr6:  .word 0        # Temporary storage for register 6
tmpr7:  .word 0        # Temporary storage for register 7
tmpr31: .word 0        # Temporary storage for register 31


        .ktext
        .space  0x80    # Skip space so kernel starts at 0x80000080
        add $k1, $1, $0 # Save register 1
        lw $k0, flag    # Test for illegal re-entry.
        beqz $k0, OK
        la $4, BadReentry
        j Panic

OK:     li $k0, 1       # Set flag to (help) prevent illegal re-entry.
        sw $k0, flag
        sw $k1, tmpr1   # Save registers
        sw $2, tmpr2
        sw $4, tmpr4
        sw $5, tmpr5
        sw $6, tmpr6
        sw $7, tmpr7
        sw $31, tmpr31
        mfc0 $k0, $13   # Get the Cause register
        andi $k0, $k0, 0x3c  # Mask out the ExcCode bits in the from Cause
        lw $k0, JumpTable($k0)  # Read address from jump table
        jr $k0          # Jump to exception handler


.fi
.bp
.nf
Return: lw $2, tmpr2    # Code to handle return to user
        lw $4, tmpr4    # Restore registers
        lw $5, tmpr5
        lw $6, tmpr6
        lw $7, tmpr7
        lw $31, tmpr31
        li $k1, 0       # Clear re-entry flag
        sw $k1, flag
        lw $k1, tmpr1   # Restore register 1
        add $1, $k1, $0
        mfc0 $k0, $14   # Get the EPC register
        rfe             # Return from exception
        jr $k0

        .kdata
PMess:  .asciiz "Panic:  "
        .ktext          # Panic prints a message and quits

Panic:  la $5, PMess
PLoop1: lb $6, ($5)     # Read letter to print
        beqz $6, PLoop3 # Done when we find a null
PLoop2: lw $7, DisplayStatus
        bgez $7, PLoop2 # loop until display is ready
        sw $6, DisplayData   # output character
        addi $5, $5, 1  # do next character
        j PLoop1
PLoop3: lb $6, ($4)     # Print message pointed to by $4
        beqz $6, PCont  # Done when we find a null
PLoop4: lw $7, DisplayStatus
        bgez $7, PLoop4 # loop until display is ready
        sw $6, DisplayData  # output character
        addi $4, $4, 1  # do next character
        j PLoop3
PCont:  li $2, 0        # Clear re-entry warning
        sw $2, flag
        li $2, 13       # The quit_now syscall
        syscall

                        # This is a blocking busy wait print routine
PrintString:            # It is used only to print errors.
        lb $6, ($4)
        beqz $6, PSCont
PSLoop: lw $7, DisplayStatus
        bgez $7, PSLoop
        sw $6, DisplayData
        addi $4, $4, 1
        j PrintString
PSCont: jr $31

.fi
.bp
.nf
        .kdata
        .align  2
JumpTable:
        .word HandleInt    # Interrupt
        .word HandleMOD    # TLB modification exception
        .word HandleTLBL   # TLB miss exception (load or fetch)
        .word HandleTLBS   # TLB miss exception (store)
        .word HandleAdEL   # Address error exception (load or fetch)
        .word HandleAdES   # Address error exception (store)
        .word HandleIBE    # Bus error exception (for a fetch)
        .word HandleDBE    # Bus error exception (for a load or store)
        .word HandleSys    # Syscall exception
        .word HandleBp     # Breakpoint exception
        .word HandleRI     # Reserved Instruction exception
        .word HandleCpU    # Co-processor Unusable exception
        .word HandleOvf    # Arithmetic overflow exception
        .word HandleFPInexact  # Inexact floating point result
        .word HandleDivideBy0  # Divide by 0
        .word HandleFPOvf
        .word HandleFPUnder
        .word HandleReserved, HandleReserved, HandleReserved, HandleReserved
        .word HandleReserved, HandleReserved, HandleReserved, HandleReserved
        .word HandleReserved, HandleReserved, HandleReserved, HandleReserved
        .word HandleReserved, HandleReserved, HandleReserved, HandleReserved

.fi
.bp
.nf
        .kdata
BadExp: .asciiz  "Unexpected exception (a bug in sim?)\\nHalting\\n"
        .ktext
HandleMOD:
HandleTLBL:
HandleTLBS:
HandleBp:
HandleReserved:
        la $4, BadExp
        j Panic

        .kdata
IntMess: .asciiz "Interrupt ignored\\n"
        .ktext
HandleInt:
        jal DP_handler
        jal KB_handler
        lw $0, ClockStatus  #This line clears the clock interrupt.
        j Return

        .kdata
AdEMess: .asciiz "Address error exception\\n"

        .ktext
HandleAdEL:
HandleAdES:
        la $4, AdEMess
        jal PrintString
        j Return

        .kdata
BEMess: .asciiz "Bus error exception\\n"
        .ktext
HandleDBE:
HandleIBE:
        la $4, BEMess
        jal PrintString
        j Return

.fi
.bp
.nf
        .kdata
SysMess: .asciiz "Illegal syscall number\\n"
        .ktext
HandleSys:
        mfc0 $k1, $14    # Get the EPC register
        addi $k1, $k1, 4 # Increment PC past syscall instruction
        mtc0 $k1, $14    # Set the EPC register

        lw $2, tmpr2     # Get the syscall number

        li $4, 11        # Is it putc?
        beq $2, $4, Putc

        li $4, 4         # Is it puts?
        beq $2, $4, Puts

        li $4, 12        # Is it getc?
        beq $2, $4, Getc

        li $4, 10        # Is is exit?
        beq $2, $4, Exit

        la $4, SysMess   # Bad number, print message.
        jal PrintString
        j Return

Exit:    jal DP_handler      # Empty the output queue
         lw $5, hpqp
         lw $6, tpqp
         bne $5, $6, Exit

         li $2, 0            # Clear re-entry warning
         sw $2, flag

         li $2, 13           # The call the quit_now syscall
         syscall

.fi
.bp
.nf
                             # PUTC
        .kdata
tmpc:   .word 0
tmpr:   .word 0
        .ktext
Putc:   lw $4, tmpr4         # Load the character to print into $4
        jal PutR4
        j Return

PutR4:  lw $6, hpqp          # Get head pointer for point queue
        lw $5, tpqp          # Get tail pointer for point queue
        addi $5, $5, 1       # Advance tail
        andi $5, $5, 0xff
        beq $5, $6, Full     # Check if full
        sb $4, putqueue($5)  # Add to queue
        sw $5, tpqp          # Save new tail pointer
        mfc0 $5, $12         # Get the Status register
        ori $5, 0x00005000   # Turn on display interrupts
        mtc0 $5, $12         # Set the Status register
        sw $31, tmpr         # Save return address
        jal DP_handler       # Try to print
        lw $31, tmpr         # Restore return address
        jr $31

Full:   sw $4, tmpc          # Save the character to print
        sw $31, tmpr         # Save the return address
        jal DP_handler       # Try to print
        lw $4, tmpc          # Restore the character to print
        lw $31, tmpr         # Restore the return address
        j PutR4              # Cannot KB_handler!

Puts:                        # PUTS
        lw $7, tmpr4         # Get address of string
PutsLoop:
        lbu $4, ($7)         # Get a character
        beq $4, $0, Return   # Check to see if we are done
        jal PutR4            # Print that character
        addi $7, $7, 1       # Move pointer
        j PutsLoop           # Loop

.fi
.bp
.nf
                             # GETC
Getc:
        mfc0 $5, $12         # Get the Status register
        ori $5, 0x000000800  # Turn on keyboard interrupts
        mtc0 $5, $12         # Set the Status register
        lw $4, tgqp          # Get the tail get queue pointer
        lw $5, hgqp          # Get the head get queue pointer
        beq $4, $5, GotNone  # See if queue is empty
        addi $5, $5, 1       # Advance the head pointer
        andi $5, $5, 0xff
        lb $2, getqueue($5)  # Get the character
        sw $2, tmpr2
        sw $5, hgqp
        j Return
GotNone:
        jal DP_handler       # Keep output going.
        jal KB_handler       # While waiting for next character
        j Getc

        .kdata
RIMess: .asciiz "Reserved instruction exception\\n"
        .ktext
HandleRI:
        la $4, RIMess
        jal PrintString
        j Return

        .kdata
CpUMess: .asciiz "Co-processor Unusable exception\\n"

        .ktext
HandleCpU:
        la $4, CpUMess    # Print message about exception
        jal PrintString
        j Return

        .kdata
OvfMess: .asciiz "Integer Overflow exception\\n"

        .ktext
HandleOvf:
        la $4, OvfMess     # Print message about exception
        jal PrintString
        j Return

        .kdata
FPIMess: .asciiz "Inexact floating point result exception\\n"
        .ktext
HandleFPInexact:
        la $4, FPIMess     # Print message about exception
        jal PrintString
        j Return

.fi
.bp
.nf
        .kdata
DB0Mess: .asciiz "Divide by zero exception\\n"
        .ktext
HandleDivideBy0:
        la $4, DB0Mess     # Print message about exception
        jal PrintString
        j Return

        .kdata
FPOvfMess: .asciiz "Floating point overflow exception\\n"
        .ktext
HandleFPOvf:
        la $4, FPOvfMess   # Print message about exception
        jal PrintString
        j Return

        .kdata
FPUnderMess: .asciiz "Floating point underflow exception\\n"
        .ktext
HandleFPUnder:
        la $4, FPUnderMess  # Print message about exception
        jal PrintString
        j Return


.fi
.bp
.nf
        .kdata
putqueue: .space 256
        .align 2
tpqp:   .word 0
hpqp:   .word 0
        .ktext
DP_handler:
        lw $4, DisplayStatus  # Get display status word
        bgez $4, PutRet       # Return if not ready
        lw $4, hpqp           # Get head put queue pointer
        lw $5, tpqp           # Get tail put queue pointer
        beq $4, $5, PutRet    # Is empty
        addi $4, $4, 1        # Remove character from queue
        andi $4, $4, 0xff
        sw $4, hpqp           # Update the head pointer
        lb $4, putqueue($4)   # Get the character to output
        sw $4, DisplayData    # Output the character
PutRet: jr $31                # Return to caller

        .kdata
getqueue: .space 256
tgqp:   .word 0
hgqp:   .word 0
        .ktext
KB_handler:
        lw $4, KeyboardStatus    # Get keyboard status word
        bgez $4, GetRet          # Return if not ready
        lw $4, tgqp              # Get tail get queue pointer
        lw $5, hgqp              # Get head get queue pointer
        addi $4, $4, 1           # Increment tail
        andi $4, $4, 0xff
        beq $4, $5, GetQueueFull # Branch if queue is full
        sw $4, tgqp              # Update tail pointer
        lw $5, KeyboardData      # Get keyboard data
        sb $5, getqueue($4)      # Store it in the queue
        move $4, $5              # Move to $4 so it can be printed
        j PutR4                  # PutR4 will do a "jr $31"
GetRet: jr $31                   # Return to caller

GetQueueFull:                    # Can't really do anything.
                                 # Characters may be lost.
        mfc0 $5, $12
        andi $5, $5, 0xffffff7ff # Turn off keyboard interrupts
        mtc0 $5, $12
        jr $31

        .text
        .globl __start
__start:
        sw $0, flag             # Clear check for bad kernel re-entry
        mfc0 $5, $12
        ori $5, 0x00001c01      # Turn on keyboard interrupts
        mtc0 $5, $12

.fi
.sp
.ft P
.ft B
