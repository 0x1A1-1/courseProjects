
b4:     file format elf32-i386


Disassembly of section .init:

08048390 <_init>:
 8048390:	55                   	push   %ebp
 8048391:	89 e5                	mov    %esp,%ebp
 8048393:	53                   	push   %ebx
 8048394:	83 ec 04             	sub    $0x4,%esp
 8048397:	e8 00 00 00 00       	call   804839c <_init+0xc>
 804839c:	5b                   	pop    %ebx
 804839d:	81 c3 04 15 00 00    	add    $0x1504,%ebx
 80483a3:	8b 93 fc ff ff ff    	mov    -0x4(%ebx),%edx
 80483a9:	85 d2                	test   %edx,%edx
 80483ab:	74 05                	je     80483b2 <_init+0x22>
 80483ad:	e8 1e 00 00 00       	call   80483d0 <__gmon_start__@plt>
 80483b2:	e8 39 01 00 00       	call   80484f0 <frame_dummy>
 80483b7:	e8 e4 02 00 00       	call   80486a0 <__do_global_ctors_aux>
 80483bc:	58                   	pop    %eax
 80483bd:	5b                   	pop    %ebx
 80483be:	c9                   	leave  
 80483bf:	c3                   	ret    

Disassembly of section .plt:

080483c0 <__gmon_start__@plt-0x10>:
 80483c0:	ff 35 a4 98 04 08    	pushl  0x80498a4
 80483c6:	ff 25 a8 98 04 08    	jmp    *0x80498a8
 80483cc:	00 00                	add    %al,(%eax)
	...

080483d0 <__gmon_start__@plt>:
 80483d0:	ff 25 ac 98 04 08    	jmp    *0x80498ac
 80483d6:	68 00 00 00 00       	push   $0x0
 80483db:	e9 e0 ff ff ff       	jmp    80483c0 <_init+0x30>

080483e0 <fgets@plt>:
 80483e0:	ff 25 b0 98 04 08    	jmp    *0x80498b0
 80483e6:	68 08 00 00 00       	push   $0x8
 80483eb:	e9 d0 ff ff ff       	jmp    80483c0 <_init+0x30>

080483f0 <__libc_start_main@plt>:
 80483f0:	ff 25 b4 98 04 08    	jmp    *0x80498b4
 80483f6:	68 10 00 00 00       	push   $0x10
 80483fb:	e9 c0 ff ff ff       	jmp    80483c0 <_init+0x30>

08048400 <strtol@plt>:
 8048400:	ff 25 b8 98 04 08    	jmp    *0x80498b8
 8048406:	68 18 00 00 00       	push   $0x18
 804840b:	e9 b0 ff ff ff       	jmp    80483c0 <_init+0x30>

08048410 <fopen@plt>:
 8048410:	ff 25 bc 98 04 08    	jmp    *0x80498bc
 8048416:	68 20 00 00 00       	push   $0x20
 804841b:	e9 a0 ff ff ff       	jmp    80483c0 <_init+0x30>

08048420 <printf@plt>:
 8048420:	ff 25 c0 98 04 08    	jmp    *0x80498c0
 8048426:	68 28 00 00 00       	push   $0x28
 804842b:	e9 90 ff ff ff       	jmp    80483c0 <_init+0x30>

08048430 <sleep@plt>:
 8048430:	ff 25 c4 98 04 08    	jmp    *0x80498c4
 8048436:	68 30 00 00 00       	push   $0x30
 804843b:	e9 80 ff ff ff       	jmp    80483c0 <_init+0x30>

08048440 <puts@plt>:
 8048440:	ff 25 c8 98 04 08    	jmp    *0x80498c8
 8048446:	68 38 00 00 00       	push   $0x38
 804844b:	e9 70 ff ff ff       	jmp    80483c0 <_init+0x30>

08048450 <exit@plt>:
 8048450:	ff 25 cc 98 04 08    	jmp    *0x80498cc
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
 804846b:	68 30 86 04 08       	push   $0x8048630
 8048470:	68 40 86 04 08       	push   $0x8048640
 8048475:	51                   	push   %ecx
 8048476:	56                   	push   %esi
 8048477:	68 5e 85 04 08       	push   $0x804855e
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
 8048497:	80 3d ec 98 04 08 00 	cmpb   $0x0,0x80498ec
 804849e:	75 3f                	jne    80484df <__do_global_dtors_aux+0x4f>
 80484a0:	a1 f0 98 04 08       	mov    0x80498f0,%eax
 80484a5:	bb cc 97 04 08       	mov    $0x80497cc,%ebx
 80484aa:	81 eb c8 97 04 08    	sub    $0x80497c8,%ebx
 80484b0:	c1 fb 02             	sar    $0x2,%ebx
 80484b3:	83 eb 01             	sub    $0x1,%ebx
 80484b6:	39 d8                	cmp    %ebx,%eax
 80484b8:	73 1e                	jae    80484d8 <__do_global_dtors_aux+0x48>
 80484ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80484c0:	83 c0 01             	add    $0x1,%eax
 80484c3:	a3 f0 98 04 08       	mov    %eax,0x80498f0
 80484c8:	ff 14 85 c8 97 04 08 	call   *0x80497c8(,%eax,4)
 80484cf:	a1 f0 98 04 08       	mov    0x80498f0,%eax
 80484d4:	39 d8                	cmp    %ebx,%eax
 80484d6:	72 e8                	jb     80484c0 <__do_global_dtors_aux+0x30>
 80484d8:	c6 05 ec 98 04 08 01 	movb   $0x1,0x80498ec
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
 80484f6:	a1 d0 97 04 08       	mov    0x80497d0,%eax
 80484fb:	85 c0                	test   %eax,%eax
 80484fd:	74 12                	je     8048511 <frame_dummy+0x21>
 80484ff:	b8 00 00 00 00       	mov    $0x0,%eax
 8048504:	85 c0                	test   %eax,%eax
 8048506:	74 09                	je     8048511 <frame_dummy+0x21>
 8048508:	c7 04 24 d0 97 04 08 	movl   $0x80497d0,(%esp)
 804850f:	ff d0                	call   *%eax
 8048511:	c9                   	leave  
 8048512:	c3                   	ret    
 8048513:	90                   	nop

08048514 <success>:
 8048514:	55                   	push   %ebp
 8048515:	89 e5                	mov    %esp,%ebp
 8048517:	83 ec 18             	sub    $0x18,%esp
 804851a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048521:	e8 0a ff ff ff       	call   8048430 <sleep@plt>
 8048526:	c7 04 24 f4 86 04 08 	movl   $0x80486f4,(%esp)
 804852d:	e8 0e ff ff ff       	call   8048440 <puts@plt>
 8048532:	c9                   	leave  
 8048533:	c3                   	ret    

08048534 <bomb>:
 8048534:	55                   	push   %ebp
 8048535:	89 e5                	mov    %esp,%ebp
 8048537:	83 ec 18             	sub    $0x18,%esp
 804853a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048541:	e8 ea fe ff ff       	call   8048430 <sleep@plt>
 8048546:	c7 04 24 fd 86 04 08 	movl   $0x80486fd,(%esp)
 804854d:	e8 ee fe ff ff       	call   8048440 <puts@plt>
 8048552:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048559:	e8 f2 fe ff ff       	call   8048450 <exit@plt>

0804855e <main>:
 804855e:	55                   	push   %ebp
 804855f:	89 e5                	mov    %esp,%ebp
 8048561:	83 e4 f0             	and    $0xfffffff0,%esp
 8048564:	57                   	push   %edi
 8048565:	56                   	push   %esi
 8048566:	53                   	push   %ebx
 8048567:	81 ec 24 02 00 00    	sub    $0x224,%esp
 804856d:	8b 1d e8 98 04 08    	mov    0x80498e8,%ebx
 8048573:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
 8048577:	75 18                	jne    8048591 <main+0x33>
 8048579:	c7 44 24 04 0b 87 04 	movl   $0x804870b,0x4(%esp)
 8048580:	08 
 8048581:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048584:	8b 40 04             	mov    0x4(%eax),%eax
 8048587:	89 04 24             	mov    %eax,(%esp)
 804858a:	e8 81 fe ff ff       	call   8048410 <fopen@plt>
 804858f:	89 c3                	mov    %eax,%ebx
 8048591:	be 01 00 00 00       	mov    $0x1,%esi
 8048596:	c7 44 24 1c e4 98 04 	movl   $0x80498e4,0x1c(%esp)
 804859d:	08 
 804859e:	8d 7c 24 20          	lea    0x20(%esp),%edi
 80485a2:	3b 1d e8 98 04 08    	cmp    0x80498e8,%ebx
 80485a8:	75 10                	jne    80485ba <main+0x5c>
 80485aa:	89 74 24 04          	mov    %esi,0x4(%esp)
 80485ae:	c7 04 24 0d 87 04 08 	movl   $0x804870d,(%esp)
 80485b5:	e8 66 fe ff ff       	call   8048420 <printf@plt>
 80485ba:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 80485be:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
 80485c5:	00 
 80485c6:	89 3c 24             	mov    %edi,(%esp)
 80485c9:	e8 12 fe ff ff       	call   80483e0 <fgets@plt>
 80485ce:	85 c0                	test   %eax,%eax
 80485d0:	74 34                	je     8048606 <main+0xa8>
 80485d2:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 80485d9:	00 
 80485da:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 80485e1:	00 
 80485e2:	89 3c 24             	mov    %edi,(%esp)
 80485e5:	e8 16 fe ff ff       	call   8048400 <strtol@plt>
 80485ea:	8b 54 24 1c          	mov    0x1c(%esp),%edx
 80485ee:	39 02                	cmp    %eax,(%edx)
 80485f0:	74 05                	je     80485f7 <main+0x99>
 80485f2:	e8 3d ff ff ff       	call   8048534 <bomb>
 80485f7:	83 c6 01             	add    $0x1,%esi
 80485fa:	83 fe 05             	cmp    $0x5,%esi
 80485fd:	7f 0c                	jg     804860b <main+0xad>
 80485ff:	83 6c 24 1c 04       	subl   $0x4,0x1c(%esp)
 8048604:	eb 9c                	jmp    80485a2 <main+0x44>
 8048606:	83 fe 05             	cmp    $0x5,%esi
 8048609:	7e 97                	jle    80485a2 <main+0x44>
 804860b:	e8 04 ff ff ff       	call   8048514 <success>
 8048610:	b8 00 00 00 00       	mov    $0x0,%eax
 8048615:	81 c4 24 02 00 00    	add    $0x224,%esp
 804861b:	5b                   	pop    %ebx
 804861c:	5e                   	pop    %esi
 804861d:	5f                   	pop    %edi
 804861e:	89 ec                	mov    %ebp,%esp
 8048620:	5d                   	pop    %ebp
 8048621:	c3                   	ret    
 8048622:	90                   	nop
 8048623:	90                   	nop
 8048624:	90                   	nop
 8048625:	90                   	nop
 8048626:	90                   	nop
 8048627:	90                   	nop
 8048628:	90                   	nop
 8048629:	90                   	nop
 804862a:	90                   	nop
 804862b:	90                   	nop
 804862c:	90                   	nop
 804862d:	90                   	nop
 804862e:	90                   	nop
 804862f:	90                   	nop

08048630 <__libc_csu_fini>:
 8048630:	55                   	push   %ebp
 8048631:	89 e5                	mov    %esp,%ebp
 8048633:	5d                   	pop    %ebp
 8048634:	c3                   	ret    
 8048635:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%eax,%eax,1)
 804863c:	00 00 00 00 

08048640 <__libc_csu_init>:
 8048640:	55                   	push   %ebp
 8048641:	89 e5                	mov    %esp,%ebp
 8048643:	57                   	push   %edi
 8048644:	56                   	push   %esi
 8048645:	53                   	push   %ebx
 8048646:	e8 4f 00 00 00       	call   804869a <__i686.get_pc_thunk.bx>
 804864b:	81 c3 55 12 00 00    	add    $0x1255,%ebx
 8048651:	83 ec 1c             	sub    $0x1c,%esp
 8048654:	e8 37 fd ff ff       	call   8048390 <_init>
 8048659:	8d bb 20 ff ff ff    	lea    -0xe0(%ebx),%edi
 804865f:	8d 83 20 ff ff ff    	lea    -0xe0(%ebx),%eax
 8048665:	29 c7                	sub    %eax,%edi
 8048667:	c1 ff 02             	sar    $0x2,%edi
 804866a:	85 ff                	test   %edi,%edi
 804866c:	74 24                	je     8048692 <__libc_csu_init+0x52>
 804866e:	31 f6                	xor    %esi,%esi
 8048670:	8b 45 10             	mov    0x10(%ebp),%eax
 8048673:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048677:	8b 45 0c             	mov    0xc(%ebp),%eax
 804867a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804867e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048681:	89 04 24             	mov    %eax,(%esp)
 8048684:	ff 94 b3 20 ff ff ff 	call   *-0xe0(%ebx,%esi,4)
 804868b:	83 c6 01             	add    $0x1,%esi
 804868e:	39 fe                	cmp    %edi,%esi
 8048690:	72 de                	jb     8048670 <__libc_csu_init+0x30>
 8048692:	83 c4 1c             	add    $0x1c,%esp
 8048695:	5b                   	pop    %ebx
 8048696:	5e                   	pop    %esi
 8048697:	5f                   	pop    %edi
 8048698:	5d                   	pop    %ebp
 8048699:	c3                   	ret    

0804869a <__i686.get_pc_thunk.bx>:
 804869a:	8b 1c 24             	mov    (%esp),%ebx
 804869d:	c3                   	ret    
 804869e:	90                   	nop
 804869f:	90                   	nop

080486a0 <__do_global_ctors_aux>:
 80486a0:	55                   	push   %ebp
 80486a1:	89 e5                	mov    %esp,%ebp
 80486a3:	53                   	push   %ebx
 80486a4:	83 ec 04             	sub    $0x4,%esp
 80486a7:	a1 c0 97 04 08       	mov    0x80497c0,%eax
 80486ac:	83 f8 ff             	cmp    $0xffffffff,%eax
 80486af:	74 13                	je     80486c4 <__do_global_ctors_aux+0x24>
 80486b1:	bb c0 97 04 08       	mov    $0x80497c0,%ebx
 80486b6:	66 90                	xchg   %ax,%ax
 80486b8:	83 eb 04             	sub    $0x4,%ebx
 80486bb:	ff d0                	call   *%eax
 80486bd:	8b 03                	mov    (%ebx),%eax
 80486bf:	83 f8 ff             	cmp    $0xffffffff,%eax
 80486c2:	75 f4                	jne    80486b8 <__do_global_ctors_aux+0x18>
 80486c4:	83 c4 04             	add    $0x4,%esp
 80486c7:	5b                   	pop    %ebx
 80486c8:	5d                   	pop    %ebp
 80486c9:	c3                   	ret    
 80486ca:	90                   	nop
 80486cb:	90                   	nop

Disassembly of section .fini:

080486cc <_fini>:
 80486cc:	55                   	push   %ebp
 80486cd:	89 e5                	mov    %esp,%ebp
 80486cf:	53                   	push   %ebx
 80486d0:	83 ec 04             	sub    $0x4,%esp
 80486d3:	e8 00 00 00 00       	call   80486d8 <_fini+0xc>
 80486d8:	5b                   	pop    %ebx
 80486d9:	81 c3 c8 11 00 00    	add    $0x11c8,%ebx
 80486df:	e8 ac fd ff ff       	call   8048490 <__do_global_dtors_aux>
 80486e4:	59                   	pop    %ecx
 80486e5:	5b                   	pop    %ebx
 80486e6:	c9                   	leave  
 80486e7:	c3                   	ret    
