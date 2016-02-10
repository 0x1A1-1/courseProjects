/* first pointer returned is 4-byte aligned */
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <string.h>
#include <assert.h>
#include <stdlib.h>
#include <stdint.h>
#include "mem.h"

typedef struct block_hd{
  /* The blocks are maintained as a linked list */
  /* The blocks are ordered in the increasing order of addresses */
  struct block_hd* next;

  /* size of the block is always a multiple of 4 */
  /* ie, last two bits are always zero - can be used to store other information*/
  /* LSB = 0 => free block */
  /* LSB = 1 => allocated/busy block */

  /* So for a free block, the value stored in size_status will be the same as the block size*/
  /* And for an allocated block, the value stored in size_status will be one more than the block size*/

  /* The value stored here does not include the space required to store the header */

  /* Example: */
  /* For a block with a payload of 24 bytes (ie, 24 bytes data + an additional 8 bytes for header) */
  /* If the block is allocated, size_status should be set to 25, not 24!, not 23! not 32! not 33!, not 31! */
  /* If the block is free, size_status should be set to 24, not 25!, not 23! not 32! not 33!, not 31! */
  int size_status;

}block_header;

/* Global variable - This will always point to the first block */
/* ie, the block with the lowest address */
block_header* list_head = NULL;


/* Function used to Initialize the memory allocator */
/* Not intended to be called more than once by a program */
/* Argument - sizeOfRegion: Specifies the size of the chunk which needs to be allocated */
/* Returns 0 on success and -1 on failure */
int Mem_Init(int sizeOfRegion)
{
  int pagesize;
  int padsize;
  int fd;
  int alloc_size;
  void* space_ptr;
  static int allocated_once = 0;
  
  if(0 != allocated_once)
  {
    fprintf(stderr,"Error:mem.c: Mem_Init has allocated space during a previous call\n");
    return -1;
  }
  if(sizeOfRegion <= 0)
  {
    fprintf(stderr,"Error:mem.c: Requested block size is not positive\n");
    return -1;
  }

  /* Get the pagesize */
  pagesize = getpagesize();

  /* Calculate padsize as the padding required to round up sizeOfRegio to a multiple of pagesize */
  padsize = sizeOfRegion % pagesize;
  padsize = (pagesize - padsize) % pagesize;

  alloc_size = sizeOfRegion + padsize;

  /* Using mmap to allocate memory */
  fd = open("/dev/zero", O_RDWR);
  if(-1 == fd)
  {
    fprintf(stderr,"Error:mem.c: Cannot open /dev/zero\n");
    return -1;
  }
  space_ptr = mmap(NULL, alloc_size, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
  if (MAP_FAILED == space_ptr)
  {
    fprintf(stderr,"Error:mem.c: mmap cannot allocate space\n");
    allocated_once = 0;
    return -1;
  }
  
  allocated_once = 1;
  
  /* To begin with, there is only one big, free block */
  list_head = (block_header*)space_ptr;
  list_head->next = NULL;
  /* Remember that the 'size' stored in block size excludes the space for the header */
  list_head->size_status = alloc_size - (int)sizeof(block_header);
  
  return 0;
}


/* Function for allocating 'size' bytes. */
/* Returns address of allocated block on success */
/* Returns NULL on failure */
/* Here is what this function should accomplish */
/* - Check for sanity of size - Return NULL when appropriate */
/* - Round up size to a multiple of 4 */
/* - Traverse the list of blocks and allocate the best free block which can accommodate the requested size */
/* -- Also, when allocating a block - split it into two blocks when possible */
/* Tips: Be careful with pointer arithmetic */
void* Mem_Alloc(int size)
{ 
  int align =  size % 4;
  if (align != 0){
  size = size + (4-align);
  }
  
 // int best=0;
  int bkn=0;
  
  block_header* b =NULL;
  block_header* b_new=NULL;
  block_header* best_block = NULL;
  block_header* curr= list_head;
	 while(curr!=NULL){
  // printf("curr: %d\n",curr->size_status);
   
	if ((curr->size_status % 4 == 0)&&(curr->size_status>size)&&((best_block == NULL)||(curr->size_status=best_block->size_status))){
   //  printf("got here\n");
    best_block=curr;
   // best=1;
    }
    bkn++;
	curr=curr->next;
  }
  
	if(best_block == NULL){
      return NULL;
  }else{
   
     b=best_block;
     //printf("%d\n",b->size_status);
     
    if (b->size_status-size>=12){
      b_new = (void*)b+size+sizeof(block_header);
      b_new->size_status=(b->size_status)-size;
      b_new->next=b->next;
      b->next=b_new;
    }
      b->size_status=size+1;
    //  printf("b: %d\n",b->size_status);
    //  printf("b_new: %d\n",b_new->size_status);
    //  printf("%08x,  and bkn=%d, and bstatus=%d \n", b, bkn, b->size_status);
    //  printf("%08x\n", b);
       printf("b: %d\n",b->size_status);
      return (void*)b+sizeof(block_header);
  }
	/* Your code should go in here */
}
void Mem_Dump()
{
  int counter;
  block_header* current = NULL;
  char* t_Begin = NULL;
  char* Begin = NULL;
  int Size;
  int t_Size;
  char* End = NULL;
  int free_size;
  int busy_size;
  int total_size;
  char status[5];

  free_size = 0;
  busy_size = 0;
  total_size = 0;
  current = list_head;
  counter = 1;
  fprintf(stdout,"************************************Block list***********************************\n");
  fprintf(stdout,"No.\tStatus\tBegin\t\tEnd\t\tSize\tt_Size\tt_Begin\n");
  fprintf(stdout,"---------------------------------------------------------------------------------\n");
  while(NULL != current)
  {
    t_Begin = (char*)current;
    Begin = t_Begin + (int)sizeof(block_header);
    Size = current->size_status;
    strcpy(status,"Free");
    if(Size & 1) /*LSB = 1 => busy block*/
    {
      strcpy(status,"Busy");
      Size = Size - 1; /*Minus one for ignoring status in busy block*/
      t_Size = Size + (int)sizeof(block_header);
      busy_size = busy_size + t_Size;
    }
    else
    {
      t_Size = Size + (int)sizeof(block_header);
      free_size = free_size + t_Size;
    }
    End = Begin + Size;
    fprintf(stdout,"%d\t%s\t0x%08lx\t0x%08lx\t%d\t%d\t0x%08lx\n",counter,status,(unsigned long int)Begin,(unsigned long int)End,Size,t_Size,(unsigned long int)t_Begin);
    total_size = total_size + t_Size;
    current = current->next;
    counter = counter + 1;
  }
  fprintf(stdout,"---------------------------------------------------------------------------------\n");
  fprintf(stdout,"*********************************************************************************\n");

  fprintf(stdout,"Total busy size = %d\n",busy_size);
  fprintf(stdout,"Total free size = %d\n",free_size);
  fprintf(stdout,"Total size = %d\n",busy_size+free_size);
  fprintf(stdout,"*********************************************************************************\n");
  fflush(stdout);
  return;
}

int Mem_Free(void *ptr)
{
  printf("ptr_para : %08x\n",ptr);
  if (ptr == NULL){
    return -1;
    }
    block_header* b =ptr-sizeof(block_header);
    printf("b : %08x\n",b);
    block_header* curr=list_head;
    if (b->size_status%4==0){
    return -1;
    }else{
      b->size_status=b->size_status-b->size_status%4;
      while (curr!=NULL && curr->next!=NULL){
       printf("curr: %d\n",curr->size_status);
       printf("curr_next: %d\n",curr->next->size_status);
        if((curr->size_status%4==0)&&(curr->next->size_status%4==0)){
          curr->next=curr->next->next;
          curr=list_head;
        }else{
          curr=curr->next;
        }
      }
    }
  return 0;
  /* Your code should go in here */
}

int main() {
void* ptr[4];

   Mem_Init(10);
  ptr[0] = Mem_Alloc(4);
  ptr[1] =  Mem_Alloc(4);
    //printf("ptr0 : %08x\n", ptr[0]);
    Mem_Dump();
    Mem_Free(ptr[0]);
    Mem_Dump();
   return 0;
}
