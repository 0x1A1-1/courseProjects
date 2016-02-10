
b3:     file format elf32-i386


Disassembly of section .init:

080483f8 <_init>:
 80483f8:	55                   	push   %ebp
 80483f9:	89 e5                	mov    %esp,%ebp
 80483fb:	53                   	push   %ebx
 80483fc:	83 ec 04             	sub    $0x4,%esp
 80483ff:	e8 00 00 00 00       	call   8048404 <_init+0xc>
 8048404:	5b                   	pop    %ebx
 8048405:	81 c3 cc 16 00 00    	add    $0x16cc,%ebx
 804840b:	8b 93 fc ff ff ff    	mov    -0x4(%ebx),%edx
 8048411:	85 d2                	test   %edx,%edx
 8048413:	74 05                	je     804841a <_init+0x22>
 8048415:	e8 1e 00 00 00       	call   8048438 <__gmon_start__@plt>
 804841a:	e8 71 01 00 00       	call   8048590 <frame_dummy>
 804841f:	e8 7c 04 00 00       	call   80488a0 <__do_global_ctors_aux>
 8048424:	58                   	pop    %eax
 8048425:	5b                   	pop    %ebx
 8048426:	c9                   	leave  
 8048427:	c3                   	ret    

Disassembly of section .plt:

08048428 <__gmon_start__@plt-0x10>:
 8048428:	ff 35 d4 9a 04 08    	pushl  0x8049ad4
 804842e:	ff 25 d8 9a 04 08    	jmp    *0x8049ad8
 8048434:	00 00                	add    %al,(%eax)
	...

08048438 <__gmon_start__@plt>:
 8048438:	ff 25 dc 9a 04 08    	jmp    *0x8049adc
 804843e:	68 00 00 00 00       	push   $0x0
 8048443:	e9 e0 ff ff ff       	jmp    8048428 <_init+0x30>

08048448 <fgets@plt>:
 8048448:	ff 25 e0 9a 04 08    	jmp    *0x8049ae0
 804844e:	68 08 00 00 00       	push   $0x8
 8048453:	e9 d0 ff ff ff       	jmp    8048428 <_init+0x30>

08048458 <__libc_start_main@plt>:
 8048458:	ff 25 e4 9a 04 08    	jmp    *0x8049ae4
 804845e:	68 10 00 00 00       	push   $0x10
 8048463:	e9 c0 ff ff ff       	jmp    8048428 <_init+0x30>

08048468 <__assert_fail@plt>:
 8048468:	ff 25 e8 9a 04 08    	jmp    *0x8049ae8
 804846e:	68 18 00 00 00       	push   $0x18
 8048473:	e9 b0 ff ff ff       	jmp    8048428 <_init+0x30>

08048478 <strtol@plt>:
 8048478:	ff 25 ec 9a 04 08    	jmp    *0x8049aec
 804847e:	68 20 00 00 00       	push   $0x20
 8048483:	e9 a0 ff ff ff       	jmp    8048428 <_init+0x30>

08048488 <free@plt>:
 8048488:	ff 25 f0 9a 04 08    	jmp    *0x8049af0
 804848e:	68 28 00 00 00       	push   $0x28
 8048493:	e9 90 ff ff ff       	jmp    8048428 <_init+0x30>

08048498 <fopen@plt>:
 8048498:	ff 25 f4 9a 04 08    	jmp    *0x8049af4
 804849e:	68 30 00 00 00       	push   $0x30
 80484a3:	e9 80 ff ff ff       	jmp    8048428 <_init+0x30>

080484a8 <printf@plt>:
 80484a8:	ff 25 f8 9a 04 08    	jmp    *0x8049af8
 80484ae:	68 38 00 00 00       	push   $0x38
 80484b3:	e9 70 ff ff ff       	jmp    8048428 <_init+0x30>

080484b8 <malloc@plt>:
 80484b8:	ff 25 fc 9a 04 08    	jmp    *0x8049afc
 80484be:	68 40 00 00 00       	push   $0x40
 80484c3:	e9 60 ff ff ff       	jmp    8048428 <_init+0x30>

080484c8 <sleep@plt>:
 80484c8:	ff 25 00 9b 04 08    	jmp    *0x8049b00
 80484ce:	68 48 00 00 00       	push   $0x48
 80484d3:	e9 50 ff ff ff       	jmp    8048428 <_init+0x30>

080484d8 <puts@plt>:
 80484d8:	ff 25 04 9b 04 08    	jmp    *0x8049b04
 80484de:	68 50 00 00 00       	push   $0x50
 80484e3:	e9 40 ff ff ff       	jmp    8048428 <_init+0x30>

080484e8 <exit@plt>:
 80484e8:	ff 25 08 9b 04 08    	jmp    *0x8049b08
 80484ee:	68 58 00 00 00       	push   $0x58
 80484f3:	e9 30 ff ff ff       	jmp    8048428 <_init+0x30>

Disassembly of section .text:

08048500 <_start>:
 8048500:	31 ed                	xor    %ebp,%ebp
 8048502:	5e                   	pop    %esi
 8048503:	89 e1                	mov    %esp,%ecx
 8048505:	83 e4 f0             	and    $0xfffffff0,%esp
 8048508:	50                   	push   %eax
 8048509:	54                   	push   %esp
 804850a:	52                   	push   %edx
 804850b:	68 30 88 04 08       	push   $0x8048830
 8048510:	68 40 88 04 08       	push   $0x8048840
 8048515:	51                   	push   %ecx
 8048516:	56                   	push   %esi
 8048517:	68 20 87 04 08       	push   $0x8048720
 804851c:	e8 37 ff ff ff       	call   8048458 <__libc_start_main@plt>
 8048521:	f4                   	hlt    
 8048522:	90                   	nop
 8048523:	90                   	nop
 8048524:	90                   	nop
 8048525:	90                   	nop
 8048526:	90                   	nop
 8048527:	90                   	nop
 8048528:	90                   	nop
 8048529:	90                   	nop
 804852a:	90                   	nop
 804852b:	90                   	nop
 804852c:	90                   	nop
 804852d:	90                   	nop
 804852e:	90                   	nop
 804852f:	90                   	nop

08048530 <__do_global_dtors_aux>:
 8048530:	55                   	push   %ebp
 8048531:	89 e5                	mov    %esp,%ebp
 8048533:	53                   	push   %ebx
 8048534:	83 ec 04             	sub    $0x4,%esp
 8048537:	80 3d 28 9b 04 08 00 	cmpb   $0x0,0x8049b28
 804853e:	75 3f                	jne    804857f <__do_global_dtors_aux+0x4f>
 8048540:	a1 2c 9b 04 08       	mov    0x8049b2c,%eax
 8048545:	bb fc 99 04 08       	mov    $0x80499fc,%ebx
 804854a:	81 eb f8 99 04 08    	sub    $0x80499f8,%ebx
 8048550:	c1 fb 02             	sar    $0x2,%ebx
 8048553:	83 eb 01             	sub    $0x1,%ebx
 8048556:	39 d8                	cmp    %ebx,%eax
 8048558:	73 1e                	jae    8048578 <__do_global_dtors_aux+0x48>
 804855a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048560:	83 c0 01             	add    $0x1,%eax
 8048563:	a3 2c 9b 04 08       	mov    %eax,0x8049b2c
 8048568:	ff 14 85 f8 99 04 08 	call   *0x80499f8(,%eax,4)
 804856f:	a1 2c 9b 04 08       	mov    0x8049b2c,%eax
 8048574:	39 d8                	cmp    %ebx,%eax
 8048576:	72 e8                	jb     8048560 <__do_global_dtors_aux+0x30>
 8048578:	c6 05 28 9b 04 08 01 	movb   $0x1,0x8049b28
 804857f:	83 c4 04             	add    $0x4,%esp
 8048582:	5b                   	pop    %ebx
 8048583:	5d                   	pop    %ebp
 8048584:	c3                   	ret    
 8048585:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048590 <frame_dummy>:
 8048590:	55                   	push   %ebp
 8048591:	89 e5                	mov    %esp,%ebp
 8048593:	83 ec 18             	sub    $0x18,%esp
 8048596:	a1 00 9a 04 08       	mov    0x8049a00,%eax
 804859b:	85 c0                	test   %eax,%eax
 804859d:	74 12                	je     80485b1 <frame_dummy+0x21>
 804859f:	b8 00 00 00 00       	mov    $0x0,%eax
 80485a4:	85 c0                	test   %eax,%eax
 80485a6:	74 09                	je     80485b1 <frame_dummy+0x21>
 80485a8:	c7 04 24 00 9a 04 08 	movl   $0x8049a00,(%esp)
 80485af:	ff d0                	call   *%eax
 80485b1:	c9                   	leave  
 80485b2:	c3                   	ret    
 80485b3:	90                   	nop
 80485b4:	90                   	nop
 80485b5:	90                   	nop
 80485b6:	90                   	nop
 80485b7:	90                   	nop
 80485b8:	90                   	nop
 80485b9:	90                   	nop
 80485ba:	90                   	nop
 80485bb:	90                   	nop
 80485bc:	90                   	nop
 80485bd:	90                   	nop
 80485be:	90                   	nop
 80485bf:	90                   	nop

080485c0 <dump>:
 80485c0:	55                   	push   %ebp
 80485c1:	89 e5                	mov    %esp,%ebp
 80485c3:	53                   	push   %ebx
 80485c4:	83 ec 14             	sub    $0x14,%esp
 80485c7:	8b 1d 30 9b 04 08    	mov    0x8049b30,%ebx
 80485cd:	85 db                	test   %ebx,%ebx
 80485cf:	74 19                	je     80485ea <dump+0x2a>
 80485d1:	8b 03                	mov    (%ebx),%eax
 80485d3:	89 44 24 04          	mov    %eax,0x4(%esp)
 80485d7:	c7 04 24 f4 88 04 08 	movl   $0x80488f4,(%esp)
 80485de:	e8 c5 fe ff ff       	call   80484a8 <printf@plt>
 80485e3:	8b 5b 04             	mov    0x4(%ebx),%ebx
 80485e6:	85 db                	test   %ebx,%ebx
 80485e8:	75 e7                	jne    80485d1 <dump+0x11>
 80485ea:	83 c4 14             	add    $0x14,%esp
 80485ed:	5b                   	pop    %ebx
 80485ee:	5d                   	pop    %ebp
 80485ef:	c3                   	ret    

080485f0 <pop>:
 80485f0:	55                   	push   %ebp
 80485f1:	89 e5                	mov    %esp,%ebp
 80485f3:	53                   	push   %ebx
 80485f4:	83 ec 14             	sub    $0x14,%esp
 80485f7:	a1 30 9b 04 08       	mov    0x8049b30,%eax
 80485fc:	8b 50 04             	mov    0x4(%eax),%edx
 80485ff:	89 15 30 9b 04 08    	mov    %edx,0x8049b30
 8048605:	8b 18                	mov    (%eax),%ebx
 8048607:	89 04 24             	mov    %eax,(%esp)
 804860a:	e8 79 fe ff ff       	call   8048488 <free@plt>
 804860f:	89 d8                	mov    %ebx,%eax
 8048611:	83 c4 14             	add    $0x14,%esp
 8048614:	5b                   	pop    %ebx
 8048615:	5d                   	pop    %ebp
 8048616:	c3                   	ret    

08048617 <insert2>:
 8048617:	55                   	push   %ebp
 8048618:	89 e5                	mov    %esp,%ebp
 804861a:	83 ec 18             	sub    $0x18,%esp
 804861d:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8048624:	e8 8f fe ff ff       	call   80484b8 <malloc@plt>
 8048629:	85 c0                	test   %eax,%eax
 804862b:	75 24                	jne    8048651 <insert2+0x3a>
 804862d:	c7 44 24 0c 3d 89 04 	movl   $0x804893d,0xc(%esp)
 8048634:	08 
 8048635:	c7 44 24 08 1d 00 00 	movl   $0x1d,0x8(%esp)
 804863c:	00 
 804863d:	c7 44 24 04 f8 88 04 	movl   $0x80488f8,0x4(%esp)
 8048644:	08 
 8048645:	c7 04 24 01 89 04 08 	movl   $0x8048901,(%esp)
 804864c:	e8 17 fe ff ff       	call   8048468 <__assert_fail@plt>
 8048651:	8b 55 08             	mov    0x8(%ebp),%edx
 8048654:	89 10                	mov    %edx,(%eax)
 8048656:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
 804865d:	8b 15 30 9b 04 08    	mov    0x8049b30,%edx
 8048663:	85 d2                	test   %edx,%edx
 8048665:	75 07                	jne    804866e <insert2+0x57>
 8048667:	a3 30 9b 04 08       	mov    %eax,0x8049b30
 804866c:	eb 17                	jmp    8048685 <insert2+0x6e>
 804866e:	8b 4a 04             	mov    0x4(%edx),%ecx
 8048671:	85 c9                	test   %ecx,%ecx
 8048673:	74 0d                	je     8048682 <insert2+0x6b>
 8048675:	8b 51 04             	mov    0x4(%ecx),%edx
 8048678:	85 d2                	test   %edx,%edx
 804867a:	74 04                	je     8048680 <insert2+0x69>
 804867c:	89 d1                	mov    %edx,%ecx
 804867e:	eb f5                	jmp    8048675 <insert2+0x5e>
 8048680:	89 ca                	mov    %ecx,%edx
 8048682:	89 42 04             	mov    %eax,0x4(%edx)
 8048685:	c9                   	leave  
 8048686:	c3                   	ret    

08048687 <insert1>:
 8048687:	55                   	push   %ebp
 8048688:	89 e5                	mov    %esp,%ebp
 804868a:	83 ec 18             	sub    $0x18,%esp
 804868d:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8048694:	e8 1f fe ff ff       	call   80484b8 <malloc@plt>
 8048699:	85 c0                	test   %eax,%eax
 804869b:	75 24                	jne    80486c1 <insert1+0x3a>
 804869d:	c7 44 24 0c 45 89 04 	movl   $0x8048945,0xc(%esp)
 80486a4:	08 
 80486a5:	c7 44 24 08 15 00 00 	movl   $0x15,0x8(%esp)
 80486ac:	00 
 80486ad:	c7 44 24 04 f8 88 04 	movl   $0x80488f8,0x4(%esp)
 80486b4:	08 
 80486b5:	c7 04 24 01 89 04 08 	movl   $0x8048901,(%esp)
 80486bc:	e8 a7 fd ff ff       	call   8048468 <__assert_fail@plt>
 80486c1:	8b 55 08             	mov    0x8(%ebp),%edx
 80486c4:	89 10                	mov    %edx,(%eax)
 80486c6:	8b 15 30 9b 04 08    	mov    0x8049b30,%edx
 80486cc:	89 50 04             	mov    %edx,0x4(%eax)
 80486cf:	a3 30 9b 04 08       	mov    %eax,0x8049b30
 80486d4:	c9                   	leave  
 80486d5:	c3                   	ret    

080486d6 <success>:
 80486d6:	55                   	push   %ebp
 80486d7:	89 e5                	mov    %esp,%ebp
 80486d9:	83 ec 18             	sub    $0x18,%esp
 80486dc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 80486e3:	e8 e0 fd ff ff       	call   80484c8 <sleep@plt>
 80486e8:	c7 04 24 12 89 04 08 	movl   $0x8048912,(%esp)
 80486ef:	e8 e4 fd ff ff       	call   80484d8 <puts@plt>
 80486f4:	c9                   	leave  
 80486f5:	c3                   	ret    

080486f6 <bomb>:
 80486f6:	55                   	push   %ebp
 80486f7:	89 e5                	mov    %esp,%ebp
 80486f9:	83 ec 18             	sub    $0x18,%esp
 80486fc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048703:	e8 c0 fd ff ff       	call   80484c8 <sleep@plt>
 8048708:	c7 04 24 1b 89 04 08 	movl   $0x804891b,(%esp)
 804870f:	e8 c4 fd ff ff       	call   80484d8 <puts@plt>
 8048714:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804871b:	e8 c8 fd ff ff       	call   80484e8 <exit@plt>

08048720 <main>:
 8048720:	55                   	push   %ebp
 8048721:	89 e5                	mov    %esp,%ebp
 8048723:	83 e4 f0             	and    $0xfffffff0,%esp
 8048726:	57                   	push   %edi
 8048727:	56                   	push   %esi
 8048728:	53                   	push   %ebx
 8048729:	81 ec 24 02 00 00    	sub    $0x224,%esp
 804872f:	8b 1d 24 9b 04 08    	mov    0x8049b24,%ebx
 8048735:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
 8048739:	75 18                	jne    8048753 <main+0x33>
 804873b:	c7 44 24 04 29 89 04 	movl   $0x8048929,0x4(%esp)
 8048742:	08 
 8048743:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048746:	8b 40 04             	mov    0x4(%eax),%eax
 8048749:	89 04 24             	mov    %eax,(%esp)
 804874c:	e8 47 fd ff ff       	call   8048498 <fopen@plt>
 8048751:	89 c3                	mov    %eax,%ebx
 8048753:	a1 10 9b 04 08       	mov    0x8049b10,%eax
 8048758:	89 04 24             	mov    %eax,(%esp)
 804875b:	e8 27 ff ff ff       	call   8048687 <insert1>
 8048760:	a1 20 9b 04 08       	mov    0x8049b20,%eax
 8048765:	89 04 24             	mov    %eax,(%esp)
 8048768:	e8 aa fe ff ff       	call   8048617 <insert2>
 804876d:	a1 18 9b 04 08       	mov    0x8049b18,%eax
 8048772:	89 04 24             	mov    %eax,(%esp)
 8048775:	e8 0d ff ff ff       	call   8048687 <insert1>
 804877a:	a1 1c 9b 04 08       	mov    0x8049b1c,%eax
 804877f:	89 04 24             	mov    %eax,(%esp)
 8048782:	e8 90 fe ff ff       	call   8048617 <insert2>
 8048787:	be 14 9b 04 08       	mov    $0x8049b14,%esi
 804878c:	8b 06                	mov    (%esi),%eax
 804878e:	89 04 24             	mov    %eax,(%esp)
 8048791:	e8 81 fe ff ff       	call   8048617 <insert2>
 8048796:	8b 06                	mov    (%esi),%eax
 8048798:	89 04 24             	mov    %eax,(%esp)
 804879b:	e8 e7 fe ff ff       	call   8048687 <insert1>
 80487a0:	be 01 00 00 00       	mov    $0x1,%esi
 80487a5:	8d 7c 24 20          	lea    0x20(%esp),%edi
 80487a9:	3b 1d 24 9b 04 08    	cmp    0x8049b24,%ebx
 80487af:	75 10                	jne    80487c1 <main+0xa1>
 80487b1:	89 74 24 04          	mov    %esi,0x4(%esp)
 80487b5:	c7 04 24 2b 89 04 08 	movl   $0x804892b,(%esp)
 80487bc:	e8 e7 fc ff ff       	call   80484a8 <printf@plt>
 80487c1:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 80487c5:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
 80487cc:	00 
 80487cd:	89 3c 24             	mov    %edi,(%esp)
 80487d0:	e8 73 fc ff ff       	call   8048448 <fgets@plt>
 80487d5:	85 c0                	test   %eax,%eax
 80487d7:	74 36                	je     804880f <main+0xef>
 80487d9:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 80487e0:	00 
 80487e1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 80487e8:	00 
 80487e9:	89 3c 24             	mov    %edi,(%esp)
 80487ec:	e8 87 fc ff ff       	call   8048478 <strtol@plt>
 80487f1:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 80487f5:	e8 f6 fd ff ff       	call   80485f0 <pop>
 80487fa:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
 80487fe:	74 05                	je     8048805 <main+0xe5>
 8048800:	e8 f1 fe ff ff       	call   80486f6 <bomb>
 8048805:	83 c6 01             	add    $0x1,%esi
 8048808:	83 fe 05             	cmp    $0x5,%esi
 804880b:	7e 9c                	jle    80487a9 <main+0x89>
 804880d:	eb 05                	jmp    8048814 <main+0xf4>
 804880f:	83 fe 05             	cmp    $0x5,%esi
 8048812:	7e 95                	jle    80487a9 <main+0x89>
 8048814:	e8 bd fe ff ff       	call   80486d6 <success>
 8048819:	b8 00 00 00 00       	mov    $0x0,%eax
 804881e:	81 c4 24 02 00 00    	add    $0x224,%esp
 8048824:	5b                   	pop    %ebx
 8048825:	5e                   	pop    %esi
 8048826:	5f                   	pop    %edi
 8048827:	89 ec                	mov    %ebp,%esp
 8048829:	5d                   	pop    %ebp
 804882a:	c3                   	ret    
 804882b:	90                   	nop
 804882c:	90                   	nop
 804882d:	90                   	nop
 804882e:	90                   	nop
 804882f:	90                   	nop

08048830 <__libc_csu_fini>:
 8048830:	55                   	push   %ebp
 8048831:	89 e5                	mov    %esp,%ebp
 8048833:	5d                   	pop    %ebp
 8048834:	c3                   	ret    
 8048835:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%eax,%eax,1)
 804883c:	00 00 00 00 

08048840 <__libc_csu_init>:
 8048840:	55                   	push   %ebp
 8048841:	89 e5                	mov    %esp,%ebp
 8048843:	57                   	push   %edi
 8048844:	56                   	push   %esi
 8048845:	53                   	push   %ebx
 8048846:	e8 4f 00 00 00       	call   804889a <__i686.get_pc_thunk.bx>
 804884b:	81 c3 85 12 00 00    	add    $0x1285,%ebx
 8048851:	83 ec 1c             	sub    $0x1c,%esp
 8048854:	e8 9f fb ff ff       	call   80483f8 <_init>
 8048859:	8d bb 20 ff ff ff    	lea    -0xe0(%ebx),%edi
 804885f:	8d 83 20 ff ff ff    	lea    -0xe0(%ebx),%eax
 8048865:	29 c7                	sub    %eax,%edi
 8048867:	c1 ff 02             	sar    $0x2,%edi
 804886a:	85 ff                	test   %edi,%edi
 804886c:	74 24                	je     8048892 <__libc_csu_init+0x52>
 804886e:	31 f6                	xor    %esi,%esi
 8048870:	8b 45 10             	mov    0x10(%ebp),%eax
 8048873:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048877:	8b 45 0c             	mov    0xc(%ebp),%eax
 804887a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804887e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048881:	89 04 24             	mov    %eax,(%esp)
 8048884:	ff 94 b3 20 ff ff ff 	call   *-0xe0(%ebx,%esi,4)
 804888b:	83 c6 01             	add    $0x1,%esi
 804888e:	39 fe                	cmp    %edi,%esi
 8048890:	72 de                	jb     8048870 <__libc_csu_init+0x30>
 8048892:	83 c4 1c             	add    $0x1c,%esp
 8048895:	5b                   	pop    %ebx
 8048896:	5e                   	pop    %esi
 8048897:	5f                   	pop    %edi
 8048898:	5d                   	pop    %ebp
 8048899:	c3                   	ret    

0804889a <__i686.get_pc_thunk.bx>:
 804889a:	8b 1c 24             	mov    (%esp),%ebx
 804889d:	c3                   	ret    
 804889e:	90                   	nop
 804889f:	90                   	nop

080488a0 <__do_global_ctors_aux>:
 80488a0:	55                   	push   %ebp
 80488a1:	89 e5                	mov    %esp,%ebp
 80488a3:	53                   	push   %ebx
 80488a4:	83 ec 04             	sub    $0x4,%esp
 80488a7:	a1 f0 99 04 08       	mov    0x80499f0,%eax
 80488ac:	83 f8 ff             	cmp    $0xffffffff,%eax
 80488af:	74 13                	je     80488c4 <__do_global_ctors_aux+0x24>
 80488b1:	bb f0 99 04 08       	mov    $0x80499f0,%ebx
 80488b6:	66 90                	xchg   %ax,%ax
 80488b8:	83 eb 04             	sub    $0x4,%ebx
 80488bb:	ff d0                	call   *%eax
 80488bd:	8b 03                	mov    (%ebx),%eax
 80488bf:	83 f8 ff             	cmp    $0xffffffff,%eax
 80488c2:	75 f4                	jne    80488b8 <__do_global_ctors_aux+0x18>
 80488c4:	83 c4 04             	add    $0x4,%esp
 80488c7:	5b                   	pop    %ebx
 80488c8:	5d                   	pop    %ebp
 80488c9:	c3                   	ret    
 80488ca:	90                   	nop
 80488cb:	90                   	nop

Disassembly of section .fini:

080488cc <_fini>:
 80488cc:	55                   	push   %ebp
 80488cd:	89 e5                	mov    %esp,%ebp
 80488cf:	53                   	push   %ebx
 80488d0:	83 ec 04             	sub    $0x4,%esp
 80488d3:	e8 00 00 00 00       	call   80488d8 <_fini+0xc>
 80488d8:	5b                   	pop    %ebx
 80488d9:	81 c3 f8 11 00 00    	add    $0x11f8,%ebx
 80488df:	e8 4c fc ff ff       	call   8048530 <__do_global_dtors_aux>
 80488e4:	59                   	pop    %ecx
 80488e5:	5b                   	pop    %ebx
 80488e6:	c9                   	leave  
 80488e7:	c3                   	ret    
