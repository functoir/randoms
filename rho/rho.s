	.file	"rho.c"
	.text
	.globl	gcd
	.type	gcd, @function
gcd:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	jmp	.L2
.L3:
	movl	-20(%rbp), %eax
	cltd
	idivl	-24(%rbp)
	movl	%edx, -4(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -24(%rbp)
.L2:
	cmpl	$0, -24(%rbp)
	jne	.L3
	movl	-20(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	gcd, .-gcd
	.section	.rodata
.LC0:
	.string	"Usage: %s <number>\n"
.LC1:
	.string	"Invalid number: %lld\n"
.LC2:
	.string	"----   loop %4d   ----\n"
	.align 8
.LC3:
	.string	"count = %4i  x = %6i  factor = %lld\n"
.LC4:
	.string	"factor is %lld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	cmpl	$2, -52(%rbp)
	je	.L6
	movq	-64(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %edi
	call	exit@PLT
.L6:
	movl	$1, -4(%rbp)
	movq	$-1, -32(%rbp)
	movq	-64(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-48(%rbp), %rcx
	movl	$10, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtol@PLT
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L7
	movq	stderr(%rip), %rax
	movq	-32(%rbp), %rdx
	leaq	.LC1(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %edi
	call	exit@PLT
.L7:
	movl	$2, -12(%rbp)
	movl	$2, -16(%rbp)
	movl	$2, -20(%rbp)
.L10:
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-20(%rbp), %eax
	movl	%eax, -8(%rbp)
.L9:
	movl	-16(%rbp), %eax
	imull	%eax, %eax
	addl	$1, %eax
	cltq
	movl	$0, %edx
	divq	-32(%rbp)
	movq	%rdx, %rax
	movl	%eax, -16(%rbp)
	movq	-32(%rbp), %rax
	movl	%eax, %ecx
	movl	-16(%rbp), %eax
	subl	-12(%rbp), %eax
	movl	%eax, %edx
	negl	%edx
	cmovns	%edx, %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	gcd
	cltq
	movq	%rax, -40(%rbp)
	movl	-20(%rbp), %eax
	subl	-8(%rbp), %eax
	leal	1(%rax), %esi
	movq	-40(%rbp), %rdx
	movl	-16(%rbp), %eax
	movq	%rdx, %rcx
	movl	%eax, %edx
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	subl	$1, -8(%rbp)
	cmpl	$0, -8(%rbp)
	je	.L8
	cmpq	$1, -40(%rbp)
	je	.L9
.L8:
	sall	-20(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, -12(%rbp)
	addl	$1, -4(%rbp)
	cmpq	$1, -40(%rbp)
	je	.L10
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-40(%rbp), %rax
	cmpq	-32(%rbp), %rax
	sete	%al
	movzbl	%al, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (Debian 11.2.0-13) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
