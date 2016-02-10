
b2:     file format elf32-i386


Disassembly of section .init:

08048390 <_init>:
 8048390:	55                   	push   %ebp
 8048391:	89 e5                	mov    %esp,%ebp
 8048393:	53                   	push   %ebx
 8048394:	83 ec 04             	sub    $0x4,%esp
 8048397:	e8 00 00 00 00       	call   804839c <_init+0xc>
 804839c:	5b                   	pop    %ebx
 804839d:	81 c3 30 15 00 00    	add    $0x1530,%ebx
 80483a3:	8b 93 fc ff ff ff    	mov    -0x4(%ebx),%edx
 80483a9:	85 d2                	test   %edx,%edx
 80483ab:	74 05                	je     80483b2 <_init+0x22>
 80483ad:	e8 1e 00 00 00       	call   80483d0 <__gmon_start__@plt>
 80483b2:	e8 39 01 00 00       	call   80484f0 <frame_dummy>
 80483b7:	e8 d4 02 00 00       	call   8048690 <__do_global_ctors_aux>
 80483bc:	58                   	pop    %eax
 80483bd:	5b                   	pop    %ebx
 80483be:	c9                   	leave  
 80483bf:	c3                   	ret    

Disassembly of section .plt:

080483c0 <__gmon_start__@plt-0x10>:
 80483c0:	ff 35 d0 98 04 08    	pushl  0x80498d0
 80483c6:	ff 25 d4 98 04 08    	jmp    *0x80498d4
 80483cc:	00 00                	add    %al,(%eax)
	...

080483d0 <__gmon_start__@plt>:
 80483d0:	ff 25 d8 98 04 08    	jmp    *0x80498d8
 80483d6:	68 00 00 00 00       	push   $0x0
 80483db:	e9 e0 ff ff ff       	jmp    80483c0 <_init+0x30>

080483e0 <fgets@plt>:
 80483e0:	ff 25 dc 98 04 08    	jmp    *0x80498dc
 80483e6:	68 08 00 00 00       	push   $0x8
 80483eb:	e9 d0 ff ff ff       	jmp    80483c0 <_init+0x30>

080483f0 <__libc_start_main@plt>:
 80483f0:	ff 25 e0 98 04 08    	jmp    *0x80498e0
 80483f6:	68 10 00 00 00       	push   $0x10
 80483fb:	e9 c0 ff ff ff       	jmp    80483c0 <_init+0x30>

08048400 <fopen@plt>:
 8048400:	ff 25 e4 98 04 08    	jmp    *0x80498e4
 8048406:	68 18 00 00 00       	push   $0x18
 804840b:	e9 b0 ff ff ff       	jmp    80483c0 <_init+0x30>

08048410 <printf@plt>:
 8048410:	ff 25 e8 98 04 08    	jmp    *0x80498e8
 8048416:	68 20 00 00 00       	push   $0x20
 804841b:	e9 a0 ff ff ff       	jmp    80483c0 <_init+0x30>

08048420 <sleep@plt>:
 8048420:	ff 25 ec 98 04 08    	jmp    *0x80498ec
 8048426:	68 28 00 00 00       	push   $0x28
 804842b:	e9 90 ff ff ff       	jmp    80483c0 <_init+0x30>

08048430 <puts@plt>:
 8048430:	ff 25 f0 98 04 08    	jmp    *0x80498f0
 8048436:	68 30 00 00 00       	push   $0x30
 804843b:	e9 80 ff ff ff       	jmp    80483c0 <_init+0x30>

08048440 <strcmp@plt>:
 8048440:	ff 25 f4 98 04 08    	jmp    *0x80498f4
 8048446:	68 38 00 00 00       	push   $0x38
 804844b:	e9 70 ff ff ff       	jmp    80483c0 <_init+0x30>

08048450 <exit@plt>:
 8048450:	ff 25 f8 98 04 08    	jmp    *0x80498f8
 8048456:	68 40 00 00 00       	push   $0x40
 804845b:	e9 60 ff ff ff       	jmp    80483c0 <_init+0x30>

Disassembly of section .text:

08048460 <_start>:
 8048460:	31 ed                	xor    %ebp,%ebp
 8048462:	5e                   	pop    %esi
 8048463:	89 e1                	mov    %esp,%ecx
 8048465:	83 e4 f0             	and    $0xfffffff0,%esp
 8048468:	50                   	push   %eax
 8048469:	54                   	push   %esp
 804846a:	52                   	push   %edx
 804846b:	68 20 86 04 08       	push   $0x8048620
 8048470:	68 30 86 04 08       	push   $0x8048630
 8048475:	51                   	push   %ecx
 8048476:	56                   	push   %esi
 8048477:	68 6a 85 04 08       	push   $0x804856a
 804847c:	e8 6f ff ff ff       	call   80483f0 <__libc_start_main@plt>
 8048481:	f4                   	hlt    
 8048482:	90                   	nop
 8048483:	90                   	nop
 8048484:	90                   	nop
 8048485:	90                   	nop
 8048486:	90                   	nop
 8048487:	90                   	nop
 8048488:	90                   	nop
 8048489:	90                   	nop
 804848a:	90                   	nop
 804848b:	90                   	nop
 804848c:	90                   	nop
 804848d:	90                   	nop
 804848e:	90                   	nop
 804848f:	90                   	nop

08048490 <__do_global_dtors_aux>:
 8048490:	55                   	push   %ebp
 8048491:	89 e5                	mov    %esp,%ebp
 8048493:	53                   	push   %ebx
 8048494:	83 ec 04             	sub    $0x4,%esp
 8048497:	80 3d 1c 99 04 08 00 	cmpb   $0x0,0x804991c
 804849e:	75 3f                	jne    80484df <__do_global_dtors_aux+0x4f>
 80484a0:	a1 20 99 04 08       	mov    0x8049920,%eax
 80484a5:	bb f8 97 04 08       	mov    $0x80497f8,%ebx
 80484aa:	81 eb f4 97 04 08    	sub    $0x80497f4,%ebx
 80484b0:	c1 fb 02             	sar    $0x2,%ebx
 80484b3:	83 eb 01             	sub    $0x1,%ebx
 80484b6:	39 d8                	cmp    %ebx,%eax
 80484b8:	73 1e                	jae    80484d8 <__do_global_dtors_aux+0x48>
 80484ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80484c0:	83 c0 01             	add    $0x1,%eax
 80484c3:	a3 20 99 04 08       	mov    %eax,0x8049920
 80484c8:	ff 14 85 f4 97 04 08 	call   *0x80497f4(,%eax,4)
 80484cf:	a1 20 99 04 08       	mov    0x8049920,%eax
 80484d4:	39 d8                	cmp    %ebx,%eax
 80484d6:	72 e8                	jb     80484c0 <__do_global_dtors_aux+0x30>
 80484d8:	c6 05 1c 99 04 08 01 	movb   $0x1,0x804991c
 80484df:	83 c4 04             	add    $0x4,%esp
 80484e2:	5b                   	pop    %ebx
 80484e3:	5d                   	pop    %ebp
 80484e4:	c3                   	ret    
 80484e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80484e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080484f0 <frame_dummy>:
 80484f0:	55                   	push   %ebp
 80484f1:	89 e5                	mov    %esp,%ebp
 80484f3:	83 ec 18             	sub    $0x18,%esp
 80484f6:	a1 fc 97 04 08       	mov    0x80497fc,%eax
 80484fb:	85 c0                	test   %eax,%eax
 80484fd:	74 12                	je     8048511 <frame_dummy+0x21>
 80484ff:	b8 00 00 00 00       	mov    $0x0,%eax
 8048504:	85 c0                	test   %eax,%eax
 8048506:	74 09                	je     8048511 <frame_dummy+0x21>
 8048508:	c7 04 24 fc 97 04 08 	movl   $0x80497fc,(%esp)
 804850f:	ff d0                	call   *%eax
 8048511:	c9                   	leave  
 8048512:	c3                   	ret    
 8048513:	90                   	nop
 8048514:	90                   	nop
 8048515:	90                   	nop
 8048516:	90                   	nop
 8048517:	90                   	nop
 8048518:	90                   	nop
 8048519:	90                   	nop
 804851a:	90                   	nop
 804851b:	90                   	nop
 804851c:	90                   	nop
 804851d:	90                   	nop
 804851e:	90                   	nop
 804851f:	90                   	nop

08048520 <success>:
 8048520:	55                   	push   %ebp
 8048521:	89 e5                	mov    %esp,%ebp
 8048523:	83 ec 18             	sub    $0x18,%esp
 8048526:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804852d:	e8 ee fe ff ff       	call   8048420 <sleep@plt>
 8048532:	c7 04 24 e4 86 04 08 	movl   $0x80486e4,(%esp)
 8048539:	e8 f2 fe ff ff       	call   8048430 <puts@plt>
 804853e:	c9                   	leave  
 804853f:	c3                   	ret    

08048540 <bomb>:
 8048540:	55                   	push   %ebp
 8048541:	89 e5                	mov    %esp,%ebp
 8048543:	83 ec 18             	sub    $0x18,%esp
 8048546:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804854d:	e8 ce fe ff ff       	call   8048420 <sleep@plt>
 8048552:	c7 04 24 ed 86 04 08 	movl   $0x80486ed,(%esp)
 8048559:	e8 d2 fe ff ff       	call   8048430 <puts@plt>
 804855e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048565:	e8 e6 fe ff ff       	call   8048450 <exit@plt>

0804856a <main>:
 804856a:	55                   	push   %ebp
 804856b:	89 e5                	mov    %esp,%ebp
 804856d:	83 e4 f0             	and    $0xfffffff0,%esp
 8048570:	57                   	push   %edi
 8048571:	56                   	push   %esi
 8048572:	53                   	push   %ebx
 8048573:	81 ec 14 02 00 00    	sub    $0x214,%esp
 8048579:	8b 35 18 99 04 08    	mov    0x8049918,%esi
 804857f:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
 8048583:	75 18                	jne    804859d <main+0x33>
 8048585:	c7 44 24 04 fb 86 04 	movl   $0x80486fb,0x4(%esp)
 804858c:	08 
 804858d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048590:	8b 40 04             	mov    0x4(%eax),%eax
 8048593:	89 04 24             	mov    %eax,(%esp)
 8048596:	e8 65 fe ff ff       	call   8048400 <fopen@plt>
 804859b:	89 c6                	mov    %eax,%esi
 804859d:	bb 01 00 00 00       	mov    $0x1,%ebx
 80485a2:	bf 00 99 04 08       	mov    $0x8049900,%edi
 80485a7:	3b 35 18 99 04 08    	cmp    0x8049918,%esi
 80485ad:	75 10                	jne    80485bf <main+0x55>
 80485af:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 80485b3:	c7 04 24 fd 86 04 08 	movl   $0x80486fd,(%esp)
 80485ba:	e8 51 fe ff ff       	call   8048410 <printf@plt>
 80485bf:	89 74 24 08          	mov    %esi,0x8(%esp)
 80485c3:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
 80485ca:	00 
 80485cb:	8d 44 24 10          	lea    0x10(%esp),%eax
 80485cf:	89 04 24             	mov    %eax,(%esp)
 80485d2:	e8 09 fe ff ff       	call   80483e0 <fgets@plt>
 80485d7:	85 c0                	test   %eax,%eax
 80485d9:	74 22                	je     80485fd <main+0x93>
 80485db:	8b 14 9f             	mov    (%edi,%ebx,4),%edx
 80485de:	89 54 24 04          	mov    %edx,0x4(%esp)
 80485e2:	89 04 24             	mov    %eax,(%esp)
 80485e5:	e8 56 fe ff ff       	call   8048440 <strcmp@plt>
 80485ea:	85 c0                	test   %eax,%eax
 80485ec:	74 05                	je     80485f3 <main+0x89>
 80485ee:	e8 4d ff ff ff       	call   8048540 <bomb>
 80485f3:	83 c3 01             	add    $0x1,%ebx
 80485f6:	83 fb 05             	cmp    $0x5,%ebx
 80485f9:	7e ac                	jle    80485a7 <main+0x3d>
 80485fb:	eb 05                	jmp    8048602 <main+0x98>
 80485fd:	83 fb 05             	cmp    $0x5,%ebx
 8048600:	7e a5                	jle    80485a7 <main+0x3d>
 8048602:	e8 19 ff ff ff       	call   8048520 <success>
 8048607:	b8 00 00 00 00       	mov    $0x0,%eax
 804860c:	81 c4 14 02 00 00    	add    $0x214,%esp
 8048612:	5b                   	pop    %ebx
 8048613:	5e                   	pop    %esi
 8048614:	5f                   	pop    %edi
 8048615:	89 ec                	mov    %ebp,%esp
 8048617:	5d                   	pop    %ebp
 8048618:	c3                   	ret    
 8048619:	90                   	nop
 804861a:	90                   	nop
 804861b:	90                   	nop
 804861c:	90                   	nop
 804861d:	90                   	nop
 804861e:	90                   	nop
 804861f:	90                   	nop

08048620 <__libc_csu_fini>:
 8048620:	55                   	push   %ebp
 8048621:	89 e5                	mov    %esp,%ebp
 8048623:	5d                   	pop    %ebp
 8048624:	c3                   	ret    
 8048625:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%eax,%eax,1)
 804862c:	00 00 00 00 

08048630 <__libc_csu_init>:
 8048630:	55                   	push   %ebp
 8048631:	89 e5                	mov    %esp,%ebp
 8048633:	57                   	push   %edi
 8048634:	56                   	push   %esi
 8048635:	53                   	push   %ebx
 8048636:	e8 4f 00 00 00       	call   804868a <__i686.get_pc_thunk.bx>
 804863b:	81 c3 91 12 00 00    	add    $0x1291,%ebx
 8048641:	83 ec 1c             	sub    $0x1c,%esp
 8048644:	e8 47 fd ff ff       	call   8048390 <_init>
 8048649:	8d bb 20 ff ff ff    	lea    -0xe0(%ebx),%edi
 804864f:	8d 83 20 ff ff ff    	lea    -0xe0(%ebx),%eax
 8048655:	29 c7                	sub    %eax,%edi
 8048657:	c1 ff 02             	sar    $0x2,%edi
 804865a:	85 ff                	test   %edi,%edi
 804865c:	74 24                	je     8048682 <__libc_csu_init+0x52>
 804865e:	31 f6                	xor    %esi,%esi
 8048660:	8b 45 10             	mov    0x10(%ebp),%eax
 8048663:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048667:	8b 45 0c             	mov    0xc(%ebp),%eax
 804866a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804866e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048671:	89 04 24             	mov    %eax,(%esp)
 8048674:	ff 94 b3 20 ff ff ff 	call   *-0xe0(%ebx,%esi,4)
 804867b:	83 c6 01             	add    $0x1,%esi
 804867e:	39 fe                	cmp    %edi,%esi
 8048680:	72 de                	jb     8048660 <__libc_csu_init+0x30>
 8048682:	83 c4 1c             	add    $0x1c,%esp
 8048685:	5b                   	pop    %ebx
 8048686:	5e                   	pop    %esi
 8048687:	5f                   	pop    %edi
 8048688:	5d                   	pop    %ebp
 8048689:	c3                   	ret    

0804868a <__i686.get_pc_thunk.bx>:
 804868a:	8b 1c 24             	mov    (%esp),%ebx
 804868d:	c3                   	ret    
 804868e:	90                   	nop
 804868f:	90                   	nop

08048690 <__do_global_ctors_aux>:
 8048690:	55                   	push   %ebp
 8048691:	89 e5                	mov    %esp,%ebp
 8048693:	53                   	push   %ebx
 8048694:	83 ec 04             	sub    $0x4,%esp
 8048697:	a1 ec 97 04 08       	mov    0x80497ec,%eax
 804869c:	83 f8 ff             	cmp    $0xffffffff,%eax
 804869f:	74 13                	je     80486b4 <__do_global_ctors_aux+0x24>
 80486a1:	bb ec 97 04 08       	mov    $0x80497ec,%ebx
 80486a6:	66 90                	xchg   %ax,%ax
 80486a8:	83 eb 04             	sub    $0x4,%ebx
 80486ab:	ff d0                	call   *%eax
 80486ad:	8b 03                	mov    (%ebx),%eax
 80486af:	83 f8 ff             	cmp    $0xffffffff,%eax
 80486b2:	75 f4                	jne    80486a8 <__do_global_ctors_aux+0x18>
 80486b4:	83 c4 04             	add    $0x4,%esp
 80486b7:	5b                   	pop    %ebx
 80486b8:	5d                   	pop    %ebp
 80486b9:	c3                   	ret    
 80486ba:	90                   	nop
 80486bb:	90                   	nop

Disassembly of section .fini:

080486bc <_fini>:
 80486bc:	55                   	push   %ebp
 80486bd:	89 e5                	mov    %esp,%ebp
 80486bf:	53                   	push   %ebx
 80486c0:	83 ec 04             	sub    $0x4,%esp
 80486c3:	e8 00 00 00 00       	call   80486c8 <_fini+0xc>
 80486c8:	5b                   	pop    %ebx
 80486c9:	81 c3 04 12 00 00    	add    $0x1204,%ebx
 80486cf:	e8 bc fd ff ff       	call   8048490 <__do_global_dtors_aux>
 80486d4:	59                   	pop    %ecx
 80486d5:	5b                   	pop    %ebx
 80486d6:	c9                   	leave  
 80486d7:	c3                   	ret    
