	.text
	.file	"matrix.c"
	.section	.debug_info,"",@progbits
.Lsection_info:
	.section	.debug_abbrev,"",@progbits
.Lsection_abbrev:
	.section	.debug_line,"",@progbits
.Lsection_line:
	.section	.debug_pubnames,"",@progbits
	.section	.debug_pubtypes,"",@progbits
	.section	.debug_str,"MS",@progbits,1
.Linfo_string:
	.section	.debug_loc,"",@progbits
.Lsection_debug_loc:
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
	.file	1 "/usr/include/bits" "types.h"
	.file	2 "/usr/include" "stdio.h"
	.file	3 "matrix.c"
	.file	4 "/usr/include" "stdint.h"
	.text
	.globl	set_seed
	.align	16, 0x90
	.type	set_seed,@function
set_seed:                               # @set_seed
.Lfunc_begin0:
	.loc	3 84 0                  # matrix.c:84:0
	.cfi_startproc
# BB#0:
	#DEBUG_VALUE: set_seed:seed <- EDI
	.loc	3 85 2 prologue_end     # matrix.c:85:2
	movl	%edi, g_seed(%rip)
	.loc	3 86 1                  # matrix.c:86:1
	retq
.Ltmp0:
.Ltmp1:
	.size	set_seed, .Ltmp1-set_seed
.Lfunc_end0:
	.cfi_endproc

	.globl	set_nthreads
	.align	16, 0x90
	.type	set_nthreads,@function
set_nthreads:                           # @set_nthreads
.Lfunc_begin1:
	.loc	3 92 0                  # matrix.c:92:0
	.cfi_startproc
# BB#0:
	#DEBUG_VALUE: set_nthreads:count <- RDI
	.loc	3 93 2 prologue_end     # matrix.c:93:2
	movq	%rdi, g_nthreads(%rip)
	.loc	3 94 1                  # matrix.c:94:1
	retq
.Ltmp2:
.Ltmp3:
	.size	set_nthreads, .Ltmp3-set_nthreads
.Lfunc_end1:
	.cfi_endproc

	.globl	set_dimensions
	.align	16, 0x90
	.type	set_dimensions,@function
set_dimensions:                         # @set_dimensions
.Lfunc_begin2:
	.loc	3 100 0                 # matrix.c:100:0
	.cfi_startproc
# BB#0:
	#DEBUG_VALUE: set_dimensions:order <- RDI
	.loc	3 101 2 prologue_end    # matrix.c:101:2
	movq	%rdi, %rax
	sarq	$63, %rax
	shrq	$62, %rax
	addq	%rdi, %rax
	andq	$-4, %rax
	movq	%rdi, %rcx
	subq	%rax, %rcx
	movl	$4, %edx
	.loc	3 101 2 discriminator 4 # matrix.c:101:2
.Ltmp4:
	subq	%rcx, %rdx
	xorl	%ecx, %ecx
.Ltmp5:
	.loc	3 101 2                 # matrix.c:101:2
	cmpq	%rax, %rdi
	.loc	3 101 2 discriminator 4 # matrix.c:101:2
.Ltmp6:
	cmovneq	%rdx, %rcx
	movq	%rcx, g_padding(%rip)
.Ltmp7:
	.loc	3 102 2                 # matrix.c:102:2
	movq	%rdi, g_soft_width(%rip)
	.loc	3 103 2                 # matrix.c:103:2
	addq	%rdi, %rcx
	movq	%rcx, g_hard_width(%rip)
	.loc	3 104 2                 # matrix.c:104:2
	movq	%rdi, g_height(%rip)
	.loc	3 107 2                 # matrix.c:107:2
	imulq	%rdi, %rcx
	.loc	3 106 2                 # matrix.c:106:2
	imulq	%rdi, %rdi
.Ltmp8:
	movq	%rdi, g_soft_elements(%rip)
	.loc	3 107 2                 # matrix.c:107:2
	movq	%rcx, g_hard_elements(%rip)
	.loc	3 108 1                 # matrix.c:108:1
	retq
.Ltmp9:
.Ltmp10:
	.size	set_dimensions, .Ltmp10-set_dimensions
.Lfunc_end2:
	.cfi_endproc

	.globl	display
	.align	16, 0x90
	.type	display,@function
display:                                # @display
.Lfunc_begin3:
	.loc	3 114 0                 # matrix.c:114:0
	.cfi_startproc
# BB#0:
	.loc	3 116 2 prologue_end    # matrix.c:116:2
	pushq	%rbp
.Ltmp11:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp12:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp13:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp14:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp15:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp16:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp17:
	.cfi_def_cfa_offset 64
.Ltmp18:
	.cfi_offset %rbx, -56
.Ltmp19:
	.cfi_offset %r12, -48
.Ltmp20:
	.cfi_offset %r13, -40
.Ltmp21:
	.cfi_offset %r14, -32
.Ltmp22:
	.cfi_offset %r15, -24
.Ltmp23:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: display:matrix_obj <- RDI
	movl	g_height(%rip), %r15d
.Ltmp24:
	#DEBUG_VALUE: display:rows_remaining <- R15D
	.loc	3 117 2 discriminator 1 # matrix.c:117:2
	testl	%r15d, %r15d
	je	.LBB3_7
.Ltmp25:
# BB#1:                                 # %.lr.ph6
	#DEBUG_VALUE: display:matrix_obj <- RDI
	#DEBUG_VALUE: display:rows_remaining <- R15D
	.loc	3 115 2                 # matrix.c:115:2
	movq	(%rdi), %r13
.Ltmp26:
	#DEBUG_VALUE: display:matrix <- R13
	movl	$4294967295, %r14d      # imm = 0xFFFFFFFF
.Ltmp27:
	.align	16, 0x90
.LBB3_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_4 Depth 2
	.loc	3 119 3                 # matrix.c:119:3
	movl	(%r13), %esi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	3 120 8                 # matrix.c:120:8
.Ltmp28:
	movq	g_soft_width(%rip), %rbp
	.loc	3 120 8 discriminator 1 # matrix.c:120:8
.Ltmp29:
	movl	%ebp, %eax
	addl	%r14d, %eax
	je	.LBB3_6
# BB#3:                                 # %.lr.ph
                                        #   in Loop: Header=BB3_2 Depth=1
	leal	-1(%rbp,%r14), %r12d
	andq	%r14, %r12
	leaq	4(%r13), %rbx
	addl	%r14d, %ebp
	negl	%ebp
.Ltmp30:
	.align	16, 0x90
.LBB3_4:                                #   Parent Loop BB3_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	3 122 4                 # matrix.c:122:4
	movl	(%rbx), %esi
	movl	$.L.str1, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp31:
	.loc	3 120 8 discriminator 1 # matrix.c:120:8
	addq	$4, %rbx
	incl	%ebp
	jne	.LBB3_4
.Ltmp32:
# BB#5:                                 # %._crit_edge
                                        #   in Loop: Header=BB3_2 Depth=1
	leaq	4(%r13,%r12,4), %r13
.LBB3_6:                                #   in Loop: Header=BB3_2 Depth=1
	.loc	3 117 2 discriminator 1 # matrix.c:117:2
.Ltmp33:
	decl	%r15d
.Ltmp34:
	#DEBUG_VALUE: display:rows_remaining <- R15D
	.loc	3 124 3                 # matrix.c:124:3
	movq	g_padding(%rip), %rax
	leaq	4(%r13,%rax,4), %r13
.Ltmp35:
	#DEBUG_VALUE: display:matrix <- R13
	movl	$10, %edi
	.loc	3 125 3                 # matrix.c:125:3
	callq	putchar
.Ltmp36:
	.loc	3 117 2 discriminator 1 # matrix.c:117:2
	testl	%r15d, %r15d
	jne	.LBB3_2
.Ltmp37:
.LBB3_7:                                # %._crit_edge7
	.loc	3 127 1                 # matrix.c:127:1
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp38:
.Ltmp39:
	.size	display, .Ltmp39-display
.Lfunc_end3:
	.cfi_endproc

	.globl	display_row
	.align	16, 0x90
	.type	display_row,@function
display_row:                            # @display_row
.Lfunc_begin4:
	.loc	3 133 0                 # matrix.c:133:0
	.cfi_startproc
# BB#0:
	pushq	%r15
.Ltmp40:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp41:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp42:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp43:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp44:
	.cfi_def_cfa_offset 48
.Ltmp45:
	.cfi_offset %rbx, -40
.Ltmp46:
	.cfi_offset %r12, -32
.Ltmp47:
	.cfi_offset %r14, -24
.Ltmp48:
	.cfi_offset %r15, -16
	#DEBUG_VALUE: display_row:matrix_obj <- RDI
	#DEBUG_VALUE: display_row:row <- RSI
	movq	%rsi, %r14
.Ltmp49:
	#DEBUG_VALUE: display_row:row <- R14
	movl	$4294967295, %r12d      # imm = 0xFFFFFFFF
	.loc	3 134 2 prologue_end    # matrix.c:134:2
.Ltmp50:
	movq	(%rdi), %rbx
.Ltmp51:
	#DEBUG_VALUE: display_row:matrix <- RBX
	.loc	3 135 2                 # matrix.c:135:2
	imulq	g_hard_width(%rip), %r14
.Ltmp52:
	.loc	3 136 2                 # matrix.c:136:2
	movl	(%rbx,%r14,4), %esi
	movl	$.L.str3, %edi
.Ltmp53:
	xorl	%eax, %eax
	callq	printf
	.loc	3 137 7                 # matrix.c:137:7
.Ltmp54:
	movq	g_soft_width(%rip), %r15
	.loc	3 137 7 discriminator 1 # matrix.c:137:7
.Ltmp55:
	cmpl	$1, %r15d
	je	.LBB4_3
.Ltmp56:
# BB#1:                                 # %.lr.ph
	#DEBUG_VALUE: display_row:matrix <- RBX
	.loc	3 136 2                 # matrix.c:136:2
	leaq	4(%rbx,%r14,4), %rbx
.Ltmp57:
	.loc	3 137 7 discriminator 1 # matrix.c:137:7
	addl	%r12d, %r15d
	negl	%r15d
.Ltmp58:
	.align	16, 0x90
.LBB4_2:                                # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: display_row:matrix <- RBX
	.loc	3 139 3                 # matrix.c:139:3
	movl	(%rbx), %esi
	addq	$4, %rbx
.Ltmp59:
	movl	$.L.str3, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp60:
	.loc	3 137 7 discriminator 1 # matrix.c:137:7
	incl	%r15d
	jne	.LBB4_2
.Ltmp61:
.LBB4_3:                                # %._crit_edge
	movl	$10, %edi
	.loc	3 141 2                 # matrix.c:141:2
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	jmp	putchar                 # TAILCALL
.Ltmp62:
.Ltmp63:
	.size	display_row, .Ltmp63-display_row
.Lfunc_end4:
	.cfi_endproc

	.globl	display_column
	.align	16, 0x90
	.type	display_column,@function
display_column:                         # @display_column
.Lfunc_begin5:
	.loc	3 148 0                 # matrix.c:148:0
	.cfi_startproc
# BB#0:
	pushq	%r14
.Ltmp64:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp65:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Ltmp66:
	.cfi_def_cfa_offset 32
.Ltmp67:
	.cfi_offset %rbx, -24
.Ltmp68:
	.cfi_offset %r14, -16
	#DEBUG_VALUE: display_column:matrix_obj <- RDI
	#DEBUG_VALUE: display_column:column <- RSI
	movq	%rsi, %rbx
.Ltmp69:
	#DEBUG_VALUE: display_column:column <- RBX
	.loc	3 151 6 prologue_end    # matrix.c:151:6
	movq	g_height(%rip), %r14
.Ltmp70:
	#DEBUG_VALUE: rows_remaining <- R14D
	.loc	3 151 6 discriminator 1 # matrix.c:151:6
	testl	%r14d, %r14d
	je	.LBB5_3
.Ltmp71:
# BB#1:                                 # %.lr.ph
	#DEBUG_VALUE: display_column:matrix_obj <- RDI
	#DEBUG_VALUE: display_column:column <- RBX
	#DEBUG_VALUE: rows_remaining <- R14D
	.loc	3 150 2                 # matrix.c:150:2
	shlq	$2, %rbx
.Ltmp72:
	addq	(%rdi), %rbx
.Ltmp73:
	#DEBUG_VALUE: display_column:matrix <- RBX
	.loc	3 151 6 discriminator 1 # matrix.c:151:6
	negl	%r14d
.Ltmp74:
	.align	16, 0x90
.LBB5_2:                                # =>This Inner Loop Header: Depth=1
	.loc	3 153 3                 # matrix.c:153:3
	movl	(%rbx), %esi
	movl	$.L.str4, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	3 154 3                 # matrix.c:154:3
	movq	g_hard_width(%rip), %rax
	leaq	(%rbx,%rax,4), %rbx
.Ltmp75:
	#DEBUG_VALUE: display_column:matrix <- RBX
	.loc	3 151 6 discriminator 1 # matrix.c:151:6
	incl	%r14d
	jne	.LBB5_2
.Ltmp76:
.LBB5_3:                                # %._crit_edge
	.loc	3 156 1                 # matrix.c:156:1
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
.Ltmp77:
.Ltmp78:
	.size	display_column, .Ltmp78-display_column
.Lfunc_end5:
	.cfi_endproc

	.globl	display_element
	.align	16, 0x90
	.type	display_element,@function
display_element:                        # @display_element
.Lfunc_begin6:
	.loc	3 162 0                 # matrix.c:162:0
	.cfi_startproc
# BB#0:
	#DEBUG_VALUE: display_element:matrix_obj <- RDI
	#DEBUG_VALUE: display_element:row <- RSI
	#DEBUG_VALUE: display_element:column <- RDX
	.loc	3 163 2 prologue_end    # matrix.c:163:2
	imulq	g_hard_width(%rip), %rsi
.Ltmp79:
	addq	%rdx, %rsi
	movq	(%rdi), %rax
	movl	(%rax,%rsi,4), %esi
	movl	$.L.str4, %edi
.Ltmp80:
	xorl	%eax, %eax
	jmp	printf                  # TAILCALL
.Ltmp81:
.Ltmp82:
	.size	display_element, .Ltmp82-display_element
.Lfunc_end6:
	.cfi_endproc

	.globl	identity_matrix
	.align	16, 0x90
	.type	identity_matrix,@function
identity_matrix:                        # @identity_matrix
.Lfunc_begin7:
	.loc	3 248 0                 # matrix.c:248:0
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp83:
	.cfi_def_cfa_offset 16
.Ltmp84:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp85:
	.cfi_def_cfa_register %rbp
	.loc	3 249 25 prologue_end   # matrix.c:249:25
.Ltmp86:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
.Ltmp87:
	.cfi_offset %rbx, -56
.Ltmp88:
	.cfi_offset %r12, -48
.Ltmp89:
	.cfi_offset %r13, -40
.Ltmp90:
	.cfi_offset %r14, -32
.Ltmp91:
	.cfi_offset %r15, -24
	callq	new_matrix
	movq	%rax, %r15
.Ltmp92:
	#DEBUG_VALUE: identity_matrix:matrix_obj <- R15
	.loc	3 251 2                 # matrix.c:251:2
	movq	g_nthreads(%rip), %rdi
	movq	%rsp, %r13
	leaq	15(,%rdi,8), %rax
	andq	$-16, %rax
	subq	%rax, %r13
	movq	%r13, %rsp
	.loc	3 253 35                # matrix.c:253:35
	shlq	$4, %rdi
	callq	malloc
	movq	%rax, -48(%rbp)         # 8-byte Spill
.Ltmp93:
	#DEBUG_VALUE: identity_matrix:start_row <- 0
	.loc	3 255 6                 # matrix.c:255:6
	movq	g_nthreads(%rip), %rcx
.Ltmp94:
	#DEBUG_VALUE: i <- ECX
	.loc	3 255 6 discriminator 1 # matrix.c:255:6
	testl	%ecx, %ecx
	je	.LBB7_3
.Ltmp95:
# BB#1:                                 # %.lr.ph8
	#DEBUG_VALUE: identity_matrix:matrix_obj <- R15
	#DEBUG_VALUE: identity_matrix:start_row <- 0
	#DEBUG_VALUE: i <- ECX
	.loc	3 257 3                 # matrix.c:257:3
	movq	g_height(%rip), %rax
	cqto
	idivq	g_nthreads(%rip)
.Ltmp96:
	.loc	3 255 6 discriminator 1 # matrix.c:255:6
	leal	-1(%rcx), %esi
	subq	%rsi, %rdx
	shlq	$4, %rsi
	movq	-48(%rbp), %rdi         # 8-byte Reload
	leaq	12(%rsi,%rdi), %rsi
	negl	%ecx
.Ltmp97:
	xorl	%edi, %edi
.Ltmp98:
	.align	16, 0x90
.LBB7_2:                                # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: identity_matrix:matrix_obj <- R15
	#DEBUG_VALUE: identity_matrix:start_row <- 0
	.loc	3 257 3                 # matrix.c:257:3
	testq	%rdx, %rdx
	setg	%bl
	movzbl	%bl, %ebx
	addl	%eax, %ebx
.Ltmp99:
	#DEBUG_VALUE: this_rows <- EDI
	.loc	3 258 9                 # matrix.c:258:9
	movq	%r15, -12(%rsi)
	movl	%edi, -4(%rsi)
	movl	%ebx, (%rsi)
	.loc	3 264 3                 # matrix.c:264:3
	addl	%ebx, %edi
.Ltmp100:
	#DEBUG_VALUE: identity_matrix:start_row <- EDI
	.loc	3 255 6 discriminator 1 # matrix.c:255:6
	addq	$-16, %rsi
	incq	%rdx
	incl	%ecx
	jne	.LBB7_2
.Ltmp101:
.LBB7_3:                                # %._crit_edge9
	#DEBUG_VALUE: identity_matrix:matrix_obj <- R15
	#DEBUG_VALUE: identity_matrix:start_row <- 0
	.loc	3 267 6                 # matrix.c:267:6
	movq	g_nthreads(%rip), %r14
.Ltmp102:
	#DEBUG_VALUE: i <- R14D
	.loc	3 267 6 discriminator 1 # matrix.c:267:6
	testl	%r14d, %r14d
	je	.LBB7_6
.Ltmp103:
# BB#4:                                 # %.lr.ph4.preheader
	#DEBUG_VALUE: identity_matrix:matrix_obj <- R15
	#DEBUG_VALUE: identity_matrix:start_row <- 0
	#DEBUG_VALUE: i <- R14D
	leal	-1(%r14), %r12d
	leaq	(%r13,%r12,8), %rbx
	shlq	$4, %r12
	addq	-48(%rbp), %r12         # 8-byte Folded Reload
	negl	%r14d
.Ltmp104:
	.align	16, 0x90
.LBB7_5:                                # %.lr.ph4
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: identity_matrix:matrix_obj <- R15
	#DEBUG_VALUE: identity_matrix:start_row <- 0
	xorl	%esi, %esi
	.loc	3 269 9                 # matrix.c:269:9
.Ltmp105:
	movl	$identity_worker, %edx
	movq	%rbx, %rdi
	movq	%r12, %rcx
	callq	pthread_create
.Ltmp106:
	.loc	3 267 6 discriminator 1 # matrix.c:267:6
	addq	$-16, %r12
	addq	$-8, %rbx
	incl	%r14d
	jne	.LBB7_5
.Ltmp107:
.LBB7_6:                                # %._crit_edge5
	#DEBUG_VALUE: identity_matrix:matrix_obj <- R15
	#DEBUG_VALUE: identity_matrix:start_row <- 0
	.loc	3 272 2                 # matrix.c:272:2
	movq	24(%r15), %rax
	movb	$3, 8(%rax)
	movabsq	$4294967296, %rax       # imm = 0x100000000
	.loc	3 274 2                 # matrix.c:274:2
	movq	%rax, 8(%r15)
	.loc	3 276 2                 # matrix.c:276:2
	movl	g_height(%rip), %eax
	movl	%eax, 16(%r15)
	.loc	3 278 6                 # matrix.c:278:6
.Ltmp108:
	movq	g_nthreads(%rip), %r14
.Ltmp109:
	#DEBUG_VALUE: i <- R14D
	.loc	3 278 6 discriminator 1 # matrix.c:278:6
	testl	%r14d, %r14d
	je	.LBB7_9
.Ltmp110:
# BB#7:                                 # %.lr.ph.preheader
	#DEBUG_VALUE: identity_matrix:matrix_obj <- R15
	#DEBUG_VALUE: identity_matrix:start_row <- 0
	#DEBUG_VALUE: i <- R14D
	leal	-1(%r14), %eax
	leaq	(%r13,%rax,8), %rbx
	negl	%r14d
.Ltmp111:
	.align	16, 0x90
.LBB7_8:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: identity_matrix:matrix_obj <- R15
	#DEBUG_VALUE: identity_matrix:start_row <- 0
	.loc	3 280 9                 # matrix.c:280:9
	movq	(%rbx), %rdi
	xorl	%esi, %esi
	callq	pthread_join
.Ltmp112:
	.loc	3 278 6 discriminator 1 # matrix.c:278:6
	addq	$-8, %rbx
	incl	%r14d
	jne	.LBB7_8
.Ltmp113:
.LBB7_9:                                # %._crit_edge
	#DEBUG_VALUE: identity_matrix:matrix_obj <- R15
	#DEBUG_VALUE: identity_matrix:start_row <- 0
	.loc	3 283 2                 # matrix.c:283:2
	movq	-48(%rbp), %rdi         # 8-byte Reload
	callq	free
	.loc	3 286 1                 # matrix.c:286:1
	movq	%r15, %rax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
.Ltmp114:
	popq	%rbp
	retq
.Ltmp115:
.Ltmp116:
	.size	identity_matrix, .Ltmp116-identity_matrix
.Lfunc_end7:
	.cfi_endproc

	.align	16, 0x90
	.type	new_matrix,@function
new_matrix:                             # @new_matrix
.Lfunc_begin8:
	.loc	3 212 0                 # matrix.c:212:0
	.cfi_startproc
# BB#0:
	pushq	%rbx
.Ltmp117:
	.cfi_def_cfa_offset 16
.Ltmp118:
	.cfi_offset %rbx, -16
	movl	$1, %edi
	movl	$32, %esi
	.loc	3 213 25 prologue_end   # matrix.c:213:25
.Ltmp119:
	callq	calloc
	movq	%rax, %rbx
.Ltmp120:
	#DEBUG_VALUE: new_matrix:matrix_obj <- RBX
	.loc	3 214 21                # matrix.c:214:21
	movq	g_hard_width(%rip), %rdi
	imulq	%rdi, %rdi
	movl	$4, %esi
	callq	calloc
	movq	%rax, (%rbx)
	movl	$1, %edi
	movl	$176, %esi
	.loc	3 215 27                # matrix.c:215:27
	callq	calloc
	movq	%rax, 24(%rbx)
	.loc	3 216 2                 # matrix.c:216:2
	movb	$0, 8(%rax)
	movl	$32768, %edi            # imm = 0x8000
	movl	$4, %esi
	.loc	3 217 33                # matrix.c:217:33
	callq	calloc
	movq	24(%rbx), %rcx
	movq	%rax, (%rcx)
	.loc	3 218 2                 # matrix.c:218:2
	movq	%rbx, %rax
	popq	%rbx
.Ltmp121:
	retq
.Ltmp122:
.Ltmp123:
	.size	new_matrix, .Ltmp123-new_matrix
.Lfunc_end8:
	.cfi_endproc

	.align	16, 0x90
	.type	identity_worker,@function
identity_worker:                        # @identity_worker
.Lfunc_begin9:
	.loc	3 234 0                 # matrix.c:234:0
	.cfi_startproc
# BB#0:
	#DEBUG_VALUE: identity_worker:arg <- RDI
	movl	8(%rdi), %edx
	.loc	3 239 6 prologue_end    # matrix.c:239:6
.Ltmp124:
	movl	12(%rdi), %eax
.Ltmp125:
	#DEBUG_VALUE: i <- EAX
	.loc	3 239 6 discriminator 1 # matrix.c:239:6
	testl	%eax, %eax
	je	.LBB9_3
.Ltmp126:
# BB#1:                                 # %.lr.ph
	#DEBUG_VALUE: identity_worker:arg <- RDI
	#DEBUG_VALUE: i <- EAX
	.loc	3 236 2                 # matrix.c:236:2
	movq	(%rdi), %rsi
	.loc	3 237 2                 # matrix.c:237:2
	movq	g_hard_width(%rip), %rdi
.Ltmp127:
	.loc	3 242 3                 # matrix.c:242:3
	leaq	1(%rdi), %rcx
.Ltmp128:
	.loc	3 239 6 discriminator 1 # matrix.c:239:6
	imulq	%rdx, %rcx
	shlq	$2, %rcx
	addq	(%rsi), %rcx
	leaq	4(,%rdi,4), %rdx
.Ltmp129:
	.align	16, 0x90
.LBB9_2:                                # =>This Inner Loop Header: Depth=1
	.loc	3 241 3                 # matrix.c:241:3
	movl	$1, (%rcx)
.Ltmp130:
	.loc	3 239 6 discriminator 1 # matrix.c:239:6
	leaq	(%rcx,%rdx), %rcx
	decl	%eax
	jne	.LBB9_2
.Ltmp131:
.LBB9_3:                                # %._crit_edge
	xorl	%eax, %eax
	.loc	3 244 2                 # matrix.c:244:2
	retq
.Ltmp132:
.Ltmp133:
	.size	identity_worker, .Ltmp133-identity_worker
.Lfunc_end9:
	.cfi_endproc

	.globl	random_matrix
	.align	16, 0x90
	.type	random_matrix,@function
random_matrix:                          # @random_matrix
.Lfunc_begin10:
	.loc	3 294 0                 # matrix.c:294:0
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp134:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp135:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp136:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp137:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp138:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp139:
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
.Ltmp140:
	.cfi_def_cfa_offset 96
.Ltmp141:
	.cfi_offset %rbx, -56
.Ltmp142:
	.cfi_offset %r12, -48
.Ltmp143:
	.cfi_offset %r13, -40
.Ltmp144:
	.cfi_offset %r14, -32
.Ltmp145:
	.cfi_offset %r15, -24
.Ltmp146:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: random_matrix:seed <- EDI
	movl	%edi, %ebp
.Ltmp147:
	#DEBUG_VALUE: random_matrix:seed <- EBP
	.loc	3 296 34 prologue_end   # matrix.c:296:34
	callq	new_matrix
.Ltmp148:
	#DEBUG_VALUE: random_matrix:matrix_obj <- RAX
	.loc	3 297 2                 # matrix.c:297:2
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	(%rax), %rcx
.Ltmp149:
	#DEBUG_VALUE: random_matrix:matrix_cpy <- RCX
	.loc	3 299 2                 # matrix.c:299:2
	movq	24(%rax), %rax
.Ltmp150:
	#DEBUG_VALUE: random_matrix:matrix_obj <- [RSP+8]
	movq	(%rax), %r13
.Ltmp151:
	#DEBUG_VALUE: random_matrix:occurances <- R13
	.loc	3 301 2                 # matrix.c:301:2
	movl	%ebp, g_seed(%rip)
.Ltmp152:
	#DEBUG_VALUE: random_matrix:sum <- 0
	#DEBUG_VALUE: random_matrix:max <- 0
	#DEBUG_VALUE: random_matrix:min <- -1
	.loc	3 309 6                 # matrix.c:309:6
	movl	g_height(%rip), %edx
.Ltmp153:
	#DEBUG_VALUE: y <- EDX
	movl	$-1, %ebx
	xorl	%r12d, %r12d
	#DEBUG_VALUE: random_matrix:matrix_obj <- [RSP+8]
	#DEBUG_VALUE: random_matrix:matrix_cpy <- RCX
	#DEBUG_VALUE: random_matrix:occurances <- R13
	#DEBUG_VALUE: random_matrix:min <- -1
	#DEBUG_VALUE: random_matrix:max <- 0
	#DEBUG_VALUE: random_matrix:sum <- 0
	xorl	%ebp, %ebp
.Ltmp154:
	.loc	3 309 6 discriminator 1 # matrix.c:309:6
	testl	%edx, %edx
	je	.LBB10_6
.Ltmp155:
	.align	16, 0x90
.LBB10_1:                               # %.lr.ph14
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB10_3 Depth 2
	#DEBUG_VALUE: random_matrix:matrix_obj <- [RSP+8]
	#DEBUG_VALUE: random_matrix:occurances <- R13
	#DEBUG_VALUE: random_matrix:min <- -1
	#DEBUG_VALUE: random_matrix:max <- 0
	#DEBUG_VALUE: random_matrix:sum <- 0
	.loc	3 311 7                 # matrix.c:311:7
	movq	g_soft_width(%rip), %r14
.Ltmp156:
	#DEBUG_VALUE: x <- R14D
	.loc	3 311 7 discriminator 1 # matrix.c:311:7
	testl	%r14d, %r14d
	je	.LBB10_5
.Ltmp157:
# BB#2:                                 # %.lr.ph
                                        #   in Loop: Header=BB10_1 Depth=1
	#DEBUG_VALUE: random_matrix:matrix_obj <- [RSP+8]
	#DEBUG_VALUE: random_matrix:occurances <- R13
	#DEBUG_VALUE: random_matrix:min <- -1
	#DEBUG_VALUE: random_matrix:max <- 0
	#DEBUG_VALUE: random_matrix:sum <- 0
	#DEBUG_VALUE: x <- R14D
	movl	%edx, 28(%rsp)          # 4-byte Spill
	leal	-1(%r14), %eax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	negl	%r14d
.Ltmp158:
	movq	%rcx, 32(%rsp)          # 8-byte Spill
	movq	%rcx, %r15
.Ltmp159:
	.align	16, 0x90
.LBB10_3:                               #   Parent Loop BB10_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: random_matrix:matrix_obj <- [RSP+8]
	#DEBUG_VALUE: random_matrix:occurances <- R13
	#DEBUG_VALUE: random_matrix:min <- -1
	#DEBUG_VALUE: random_matrix:max <- 0
	#DEBUG_VALUE: random_matrix:sum <- 0
	.loc	3 313 18                # matrix.c:313:18
	callq	fast_rand
.Ltmp160:
	#DEBUG_VALUE: random_matrix:max <- EAX
	#DEBUG_VALUE: random_matrix:min <- EAX
	movl	%eax, (%r15)
	.loc	3 314 7                 # matrix.c:314:7
.Ltmp161:
	cmpl	%ebx, %eax
	cmovbl	%eax, %ebx
.Ltmp162:
	.loc	3 315 7                 # matrix.c:315:7
	cmpl	%ebp, %eax
	cmoval	%eax, %ebp
.Ltmp163:
	.loc	3 316 4                 # matrix.c:316:4
	addl	%eax, %r12d
.Ltmp164:
	#DEBUG_VALUE: random_matrix:sum <- R12D
	.loc	3 317 4                 # matrix.c:317:4
	movl	%eax, %eax
.Ltmp165:
	incl	(%r13,%rax,4)
	.loc	3 318 4                 # matrix.c:318:4
	addq	$4, %r15
.Ltmp166:
	.loc	3 311 7 discriminator 1 # matrix.c:311:7
	incl	%r14d
	jne	.LBB10_3
.Ltmp167:
# BB#4:                                 # %._crit_edge
                                        #   in Loop: Header=BB10_1 Depth=1
	#DEBUG_VALUE: random_matrix:matrix_obj <- [RSP+8]
	#DEBUG_VALUE: random_matrix:occurances <- R13
	#DEBUG_VALUE: random_matrix:sum <- R12D
	movq	32(%rsp), %rcx          # 8-byte Reload
	movq	16(%rsp), %rax          # 8-byte Reload
	leaq	4(%rcx,%rax,4), %rcx
.Ltmp168:
	#DEBUG_VALUE: random_matrix:matrix_cpy <- RCX
	movl	28(%rsp), %edx          # 4-byte Reload
.Ltmp169:
.LBB10_5:                               #   in Loop: Header=BB10_1 Depth=1
	#DEBUG_VALUE: random_matrix:matrix_obj <- [RSP+8]
	#DEBUG_VALUE: random_matrix:occurances <- R13
	#DEBUG_VALUE: random_matrix:min <- -1
	#DEBUG_VALUE: random_matrix:max <- 0
	#DEBUG_VALUE: random_matrix:sum <- 0
	.loc	3 320 3                 # matrix.c:320:3
	movq	g_padding(%rip), %rax
	leaq	(%rcx,%rax,4), %rcx
.Ltmp170:
	#DEBUG_VALUE: random_matrix:matrix_cpy <- RCX
	.loc	3 309 6 discriminator 1 # matrix.c:309:6
	decl	%edx
.Ltmp171:
	#DEBUG_VALUE: y <- EDX
	jne	.LBB10_1
.Ltmp172:
.LBB10_6:                               # %._crit_edge15
	#DEBUG_VALUE: random_matrix:matrix_obj <- [RSP+8]
	#DEBUG_VALUE: random_matrix:min <- -1
	#DEBUG_VALUE: random_matrix:max <- 0
	#DEBUG_VALUE: random_matrix:sum <- 0
	movq	8(%rsp), %rax           # 8-byte Reload
.Ltmp173:
	#DEBUG_VALUE: random_matrix:matrix_obj <- RAX
	.loc	3 323 2                 # matrix.c:323:2
	movq	24(%rax), %rcx
	movb	$4, 8(%rcx)
	.loc	3 325 2                 # matrix.c:325:2
	movl	%ebx, 8(%rax)
	.loc	3 326 2                 # matrix.c:326:2
	movl	%ebp, 12(%rax)
	.loc	3 327 2                 # matrix.c:327:2
	movl	%r12d, 16(%rax)
	.loc	3 329 2                 # matrix.c:329:2
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp174:
.Ltmp175:
	.size	random_matrix, .Ltmp175-random_matrix
.Lfunc_end10:
	.cfi_endproc

	.align	16, 0x90
	.type	fast_rand,@function
fast_rand:                              # @fast_rand
.Lfunc_begin11:
	.loc	3 46 0                  # matrix.c:46:0
	.cfi_startproc
# BB#0:
	.loc	3 47 5 prologue_end     # matrix.c:47:5
	imull	$214013, g_seed(%rip), %eax # imm = 0x343FD
	addl	$2531011, %eax          # imm = 0x269EC3
	movl	%eax, g_seed(%rip)
	movl	$3856, %ecx             # imm = 0xF10
	.loc	3 48 5                  # matrix.c:48:5
	bextrl	%ecx, %eax, %eax
	retq
.Ltmp176:
.Ltmp177:
	.size	fast_rand, .Ltmp177-fast_rand
.Lfunc_end11:
	.cfi_endproc

	.globl	uniform_matrix
	.align	16, 0x90
	.type	uniform_matrix,@function
uniform_matrix:                         # @uniform_matrix
.Lfunc_begin12:
	.loc	3 468 0                 # matrix.c:468:0
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp178:
	.cfi_def_cfa_offset 16
.Ltmp179:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp180:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
.Ltmp181:
	.cfi_offset %rbx, -56
.Ltmp182:
	.cfi_offset %r12, -48
.Ltmp183:
	.cfi_offset %r13, -40
.Ltmp184:
	.cfi_offset %r14, -32
.Ltmp185:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: uniform_matrix:value <- EDI
	movl	%edi, %r15d
.Ltmp186:
	#DEBUG_VALUE: uniform_matrix:value <- R15D
	.loc	3 471 35 prologue_end   # matrix.c:471:35
	callq	new_matrix
	movq	%rax, %r14
.Ltmp187:
	#DEBUG_VALUE: matrix_obj <- R14
	#DEBUG_VALUE: uniform_matrix:matrix_obj <- R14
	.loc	3 469 5                 # matrix.c:469:5
	testl	%r15d, %r15d
	je	.LBB12_1
.Ltmp188:
# BB#2:
	#DEBUG_VALUE: uniform_matrix:value <- R15D
	#DEBUG_VALUE: uniform_matrix:matrix_obj <- R14
	.loc	3 480 2                 # matrix.c:480:2
	movq	%rsp, -56(%rbp)         # 8-byte Spill
	movq	g_nthreads(%rip), %rax
	movq	%rsp, %rcx
	leaq	15(,%rax,8), %rax
	andq	$-16, %rax
	subq	%rax, %rcx
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	movq	%rcx, %rsp
	.loc	3 482 34                # matrix.c:482:34
	movq	g_nthreads(%rip), %rax
	shlq	$3, %rax
	leaq	(%rax,%rax,2), %rdi
	callq	malloc
	movq	%rax, %r8
.Ltmp189:
	#DEBUG_VALUE: uniform_matrix:start_row <- 0
	.loc	3 485 6                 # matrix.c:485:6
	movq	g_nthreads(%rip), %rsi
.Ltmp190:
	#DEBUG_VALUE: i <- ESI
	.loc	3 485 6 discriminator 1 # matrix.c:485:6
	testl	%esi, %esi
	je	.LBB12_5
.Ltmp191:
# BB#3:                                 # %.lr.ph9
	#DEBUG_VALUE: uniform_matrix:value <- R15D
	#DEBUG_VALUE: uniform_matrix:matrix_obj <- R14
	#DEBUG_VALUE: uniform_matrix:start_row <- 0
	#DEBUG_VALUE: i <- ESI
	.loc	3 487 3                 # matrix.c:487:3
	movq	g_height(%rip), %rax
	cqto
	idivq	g_nthreads(%rip)
.Ltmp192:
	.loc	3 485 6 discriminator 1 # matrix.c:485:6
	leal	-1(%rsi), %ebx
	leaq	(%rbx,%rbx,2), %rdi
	leaq	16(%r8,%rdi,8), %rdi
	subq	%rbx, %rdx
	negl	%esi
.Ltmp193:
	xorl	%ebx, %ebx
.Ltmp194:
	.align	16, 0x90
.LBB12_4:                               # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: uniform_matrix:value <- R15D
	#DEBUG_VALUE: uniform_matrix:matrix_obj <- R14
	#DEBUG_VALUE: uniform_matrix:start_row <- 0
	.loc	3 487 3                 # matrix.c:487:3
	testq	%rdx, %rdx
	setg	%cl
	movzbl	%cl, %ecx
	addl	%eax, %ecx
.Ltmp195:
	#DEBUG_VALUE: this_rows <- EBX
	.loc	3 488 9                 # matrix.c:488:9
	movq	%r14, -16(%rdi)
	movl	%r15d, -8(%rdi)
	movl	%ebx, -4(%rdi)
	movl	%ecx, (%rdi)
	.loc	3 495 3                 # matrix.c:495:3
	addl	%ecx, %ebx
.Ltmp196:
	#DEBUG_VALUE: uniform_matrix:start_row <- EBX
	.loc	3 485 6 discriminator 1 # matrix.c:485:6
	addq	$-24, %rdi
	incq	%rdx
	incl	%esi
	jne	.LBB12_4
.Ltmp197:
.LBB12_5:                               # %._crit_edge10
	#DEBUG_VALUE: uniform_matrix:value <- R15D
	#DEBUG_VALUE: uniform_matrix:matrix_obj <- R14
	#DEBUG_VALUE: uniform_matrix:start_row <- 0
	.loc	3 498 6                 # matrix.c:498:6
	movq	g_nthreads(%rip), %r13
.Ltmp198:
	#DEBUG_VALUE: i <- R13D
	.loc	3 498 6 discriminator 1 # matrix.c:498:6
	testl	%r13d, %r13d
	je	.LBB12_8
.Ltmp199:
# BB#6:                                 # %.lr.ph5.preheader
	#DEBUG_VALUE: uniform_matrix:value <- R15D
	#DEBUG_VALUE: uniform_matrix:matrix_obj <- R14
	#DEBUG_VALUE: uniform_matrix:start_row <- 0
	#DEBUG_VALUE: i <- R13D
	leal	-1(%r13), %eax
	leaq	(%rax,%rax,2), %rcx
	leaq	(%r8,%rcx,8), %r12
	movq	-48(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %rbx
	negl	%r13d
.Ltmp200:
	.align	16, 0x90
.LBB12_7:                               # %.lr.ph5
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: uniform_matrix:value <- R15D
	#DEBUG_VALUE: uniform_matrix:matrix_obj <- R14
	#DEBUG_VALUE: uniform_matrix:start_row <- 0
	xorl	%esi, %esi
	.loc	3 500 9                 # matrix.c:500:9
.Ltmp201:
	movl	$uniform_worker, %edx
	movq	%rbx, %rdi
	movq	%r12, %rcx
	callq	pthread_create
.Ltmp202:
	.loc	3 498 6 discriminator 1 # matrix.c:498:6
	addq	$-24, %r12
	addq	$-8, %rbx
	incl	%r13d
	jne	.LBB12_7
.Ltmp203:
.LBB12_8:                               # %._crit_edge6
	#DEBUG_VALUE: uniform_matrix:value <- R15D
	#DEBUG_VALUE: uniform_matrix:matrix_obj <- R14
	#DEBUG_VALUE: uniform_matrix:start_row <- 0
	.loc	3 504 2                 # matrix.c:504:2
	movq	24(%r14), %rax
	movb	$2, 8(%rax)
	.loc	3 505 2                 # matrix.c:505:2
	movq	24(%r14), %rax
	movq	(%rax), %rax
	movl	%r15d, (%rax)
	.loc	3 507 2                 # matrix.c:507:2
	movl	%r15d, 8(%r14)
	.loc	3 508 2                 # matrix.c:508:2
	movl	%r15d, 12(%r14)
	.loc	3 509 2                 # matrix.c:509:2
	imull	g_soft_elements(%rip), %r15d
.Ltmp204:
	movl	%r15d, 16(%r14)
	.loc	3 511 6                 # matrix.c:511:6
.Ltmp205:
	movq	g_nthreads(%rip), %r15
.Ltmp206:
	#DEBUG_VALUE: i <- R15D
	.loc	3 511 6 discriminator 1 # matrix.c:511:6
	testl	%r15d, %r15d
	je	.LBB12_11
.Ltmp207:
# BB#9:                                 # %.lr.ph.preheader
	#DEBUG_VALUE: uniform_matrix:matrix_obj <- R14
	#DEBUG_VALUE: uniform_matrix:start_row <- 0
	#DEBUG_VALUE: i <- R15D
	leal	-1(%r15), %eax
	movq	-48(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %rbx
	negl	%r15d
.Ltmp208:
	.align	16, 0x90
.LBB12_10:                              # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: uniform_matrix:matrix_obj <- R14
	#DEBUG_VALUE: uniform_matrix:start_row <- 0
	.loc	3 513 9                 # matrix.c:513:9
	movq	(%rbx), %rdi
	xorl	%esi, %esi
	callq	pthread_join
.Ltmp209:
	.loc	3 511 6 discriminator 1 # matrix.c:511:6
	addq	$-8, %rbx
	incl	%r15d
	jne	.LBB12_10
.Ltmp210:
.LBB12_11:                              # %._crit_edge
	#DEBUG_VALUE: uniform_matrix:matrix_obj <- R14
	#DEBUG_VALUE: uniform_matrix:start_row <- 0
	.loc	3 517 1                 # matrix.c:517:1
	movq	-56(%rbp), %rsp         # 8-byte Reload
	jmp	.LBB12_12
.Ltmp211:
.LBB12_1:
	#DEBUG_VALUE: uniform_matrix:matrix_obj <- R14
	#DEBUG_VALUE: matrix_obj <- R14
	.loc	3 473 3                 # matrix.c:473:3
	movq	24(%r14), %rax
	movb	$2, 8(%rax)
.Ltmp212:
.LBB12_12:
	#DEBUG_VALUE: uniform_matrix:matrix_obj <- R14
	.loc	3 517 1                 # matrix.c:517:1
	movq	%r14, %rax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
.Ltmp213:
	popq	%r15
	popq	%rbp
	retq
.Ltmp214:
.Ltmp215:
	.size	uniform_matrix, .Ltmp215-uniform_matrix
.Lfunc_end12:
	.cfi_endproc

	.align	16, 0x90
	.type	uniform_worker,@function
uniform_worker:                         # @uniform_worker
.Lfunc_begin13:
	.loc	3 450 0                 # matrix.c:450:0
	.cfi_startproc
# BB#0:
	#DEBUG_VALUE: uniform_worker:arg <- RDI
	.loc	3 454 2 prologue_end    # matrix.c:454:2
	movq	g_hard_width(%rip), %rdx
	.loc	3 458 6                 # matrix.c:458:6
.Ltmp216:
	movl	16(%rdi), %ecx
	imulq	%rdx, %rcx
	movq	%rcx, %rax
	sarq	$63, %rax
	shrq	$62, %rax
	addq	%rcx, %rax
	sarq	$2, %rax
.Ltmp217:
	#DEBUG_VALUE: i <- EAX
	.loc	3 458 6 discriminator 1 # matrix.c:458:6
	testl	%eax, %eax
	je	.LBB13_3
.Ltmp218:
# BB#1:                                 # %.lr.ph
	#DEBUG_VALUE: uniform_worker:arg <- RDI
	#DEBUG_VALUE: i <- EAX
	.loc	3 456 17                # matrix.c:456:17
	vbroadcastss	8(%rdi), %xmm0
	.loc	3 452 2                 # matrix.c:452:2
	movq	(%rdi), %rsi
	.loc	3 454 2                 # matrix.c:454:2
	movl	12(%rdi), %ecx
	imulq	%rdx, %rcx
	shlq	$2, %rcx
	addq	(%rsi), %rcx
.Ltmp219:
	#DEBUG_VALUE: uniform_worker:matrix <- RCX
	.loc	3 458 6 discriminator 1 # matrix.c:458:6
	negl	%eax
.Ltmp220:
	.align	16, 0x90
.LBB13_2:                               # =>This Inner Loop Header: Depth=1
	.loc	3 460 3                 # matrix.c:460:3
	vmovaps	%xmm0, (%rcx)
	.loc	3 461 3                 # matrix.c:461:3
	addq	$16, %rcx
.Ltmp221:
	#DEBUG_VALUE: uniform_worker:matrix <- RCX
	.loc	3 458 6 discriminator 1 # matrix.c:458:6
	incl	%eax
	jne	.LBB13_2
.Ltmp222:
.LBB13_3:                               # %._crit_edge
	xorl	%eax, %eax
	.loc	3 464 2                 # matrix.c:464:2
	retq
.Ltmp223:
.Ltmp224:
	.size	uniform_worker, .Ltmp224-uniform_worker
.Lfunc_end13:
	.cfi_endproc

	.globl	sequence_matrix
	.align	16, 0x90
	.type	sequence_matrix,@function
sequence_matrix:                        # @sequence_matrix
.Lfunc_begin14:
	.loc	3 623 0                 # matrix.c:623:0
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp225:
	.cfi_def_cfa_offset 16
.Ltmp226:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp227:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
.Ltmp228:
	.cfi_offset %rbx, -56
.Ltmp229:
	.cfi_offset %r12, -48
.Ltmp230:
	.cfi_offset %r13, -40
.Ltmp231:
	.cfi_offset %r14, -32
.Ltmp232:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: sequence_matrix:start <- EDI
	#DEBUG_VALUE: sequence_matrix:step <- ESI
	movl	%esi, %r13d
.Ltmp233:
	#DEBUG_VALUE: sequence_matrix:step <- R13D
	movl	%edi, %eax
.Ltmp234:
	#DEBUG_VALUE: sequence_matrix:start <- EAX
	.loc	3 624 5 prologue_end    # matrix.c:624:5
	testl	%r13d, %r13d
	je	.LBB14_12
.Ltmp235:
# BB#1:
	#DEBUG_VALUE: sequence_matrix:start <- EAX
	#DEBUG_VALUE: sequence_matrix:step <- R13D
	.loc	3 629 35                # matrix.c:629:35
	imulq	$56, g_nthreads(%rip), %rdi
	movl	%eax, %r15d
.Ltmp236:
	#DEBUG_VALUE: sequence_matrix:start <- R15D
	callq	malloc
	movq	%rax, -72(%rbp)         # 8-byte Spill
	.loc	3 630 25                # matrix.c:630:25
	callq	new_matrix
	movq	%rax, %r12
.Ltmp237:
	#DEBUG_VALUE: sequence_matrix:matrix_obj <- R12
	.loc	3 632 28                # matrix.c:632:28
	movq	g_nthreads(%rip), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, %rbx
	.loc	3 633 29                # matrix.c:633:29
	movq	g_nthreads(%rip), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, %r14
	.loc	3 634 28                # matrix.c:634:28
	movq	g_nthreads(%rip), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rbx, %r9
	movl	%r15d, %r8d
.Ltmp238:
	#DEBUG_VALUE: sequence_matrix:start <- R8D
	movq	%rax, %r15
	.loc	3 636 2                 # matrix.c:636:2
	movq	%rsp, -88(%rbp)         # 8-byte Spill
	movq	g_nthreads(%rip), %rax
	movq	%rsp, %rcx
	leaq	15(,%rax,8), %rax
	andq	$-16, %rax
	subq	%rax, %rcx
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	movq	%rcx, %rsp
.Ltmp239:
	#DEBUG_VALUE: sequence_matrix:start_row <- 0
	.loc	3 639 6                 # matrix.c:639:6
	movq	g_nthreads(%rip), %rcx
.Ltmp240:
	#DEBUG_VALUE: i <- ECX
	.loc	3 639 6 discriminator 1 # matrix.c:639:6
	testl	%ecx, %ecx
	je	.LBB14_4
.Ltmp241:
# BB#2:                                 # %.lr.ph13
	#DEBUG_VALUE: sequence_matrix:start <- R8D
	#DEBUG_VALUE: sequence_matrix:step <- R13D
	#DEBUG_VALUE: sequence_matrix:matrix_obj <- R12
	#DEBUG_VALUE: sequence_matrix:start_row <- 0
	#DEBUG_VALUE: i <- ECX
	.loc	3 641 3                 # matrix.c:641:3
	movq	g_height(%rip), %rax
	cqto
	idivq	g_nthreads(%rip)
.Ltmp242:
	.loc	3 639 6 discriminator 1 # matrix.c:639:6
	decl	%ecx
.Ltmp243:
	imulq	$56, %rcx, %rsi
	movq	-72(%rbp), %rdi         # 8-byte Reload
	leaq	48(%rsi,%rdi), %rsi
	subq	%rcx, %rdx
	xorl	%edi, %edi
.Ltmp244:
	.align	16, 0x90
.LBB14_3:                               # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: sequence_matrix:start <- R8D
	#DEBUG_VALUE: sequence_matrix:step <- R13D
	#DEBUG_VALUE: sequence_matrix:matrix_obj <- R12
	#DEBUG_VALUE: sequence_matrix:start_row <- 0
	.loc	3 641 3                 # matrix.c:641:3
	testq	%rdx, %rdx
	setg	%bl
	movzbl	%bl, %ebx
	addl	%eax, %ebx
.Ltmp245:
	#DEBUG_VALUE: this_rows <- EDI
	.loc	3 642 9                 # matrix.c:642:9
	movq	%r12, -48(%rsi)
	movl	%r8d, -40(%rsi)
	movl	%r13d, -36(%rsi)
	movl	%edi, -32(%rsi)
	movl	%ebx, -28(%rsi)
	movq	%r9, -24(%rsi)
	movq	%r14, -16(%rsi)
	movq	%r15, -8(%rsi)
	movl	%ecx, (%rsi)
	.loc	3 654 3                 # matrix.c:654:3
	addl	%ebx, %edi
.Ltmp246:
	#DEBUG_VALUE: sequence_matrix:start_row <- EDI
	.loc	3 639 6 discriminator 1 # matrix.c:639:6
	decl	%ecx
	addq	$-56, %rsi
	incq	%rdx
	cmpl	$-1, %ecx
	jne	.LBB14_3
.Ltmp247:
.LBB14_4:                               # %._crit_edge14
	#DEBUG_VALUE: sequence_matrix:start <- R8D
	#DEBUG_VALUE: sequence_matrix:step <- R13D
	#DEBUG_VALUE: sequence_matrix:matrix_obj <- R12
	#DEBUG_VALUE: sequence_matrix:start_row <- 0
	movq	%r9, -96(%rbp)          # 8-byte Spill
	movl	%r8d, -64(%rbp)         # 4-byte Spill
.Ltmp248:
	#DEBUG_VALUE: sequence_matrix:start <- [RBP+-64]
	movl	%r13d, -52(%rbp)        # 4-byte Spill
.Ltmp249:
	#DEBUG_VALUE: sequence_matrix:step <- [RBP+-52]
	movq	%r12, -80(%rbp)         # 8-byte Spill
.Ltmp250:
	#DEBUG_VALUE: sequence_matrix:matrix_obj <- [RBP+-80]
	.loc	3 657 6                 # matrix.c:657:6
	movq	g_nthreads(%rip), %rbx
.Ltmp251:
	#DEBUG_VALUE: i <- EBX
	.loc	3 657 6 discriminator 1 # matrix.c:657:6
	testl	%ebx, %ebx
	je	.LBB14_7
.Ltmp252:
# BB#5:                                 # %.lr.ph9.preheader
	#DEBUG_VALUE: sequence_matrix:start <- [RBP+-64]
	#DEBUG_VALUE: sequence_matrix:step <- [RBP+-52]
	#DEBUG_VALUE: sequence_matrix:matrix_obj <- [RBP+-80]
	#DEBUG_VALUE: sequence_matrix:start_row <- 0
	#DEBUG_VALUE: i <- EBX
	leal	-1(%rbx), %eax
	imulq	$56, %rax, %r13
	addq	-72(%rbp), %r13         # 8-byte Folded Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %r12
	negl	%ebx
.Ltmp253:
	.align	16, 0x90
.LBB14_6:                               # %.lr.ph9
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: sequence_matrix:start <- [RBP+-64]
	#DEBUG_VALUE: sequence_matrix:step <- [RBP+-52]
	#DEBUG_VALUE: sequence_matrix:matrix_obj <- [RBP+-80]
	#DEBUG_VALUE: sequence_matrix:start_row <- 0
	xorl	%esi, %esi
	.loc	3 659 9                 # matrix.c:659:9
.Ltmp254:
	movl	$sequence_worker, %edx
	movq	%r12, %rdi
	movq	%r13, %rcx
	callq	pthread_create
.Ltmp255:
	.loc	3 657 6 discriminator 1 # matrix.c:657:6
	addq	$-56, %r13
	addq	$-8, %r12
	incl	%ebx
	jne	.LBB14_6
.Ltmp256:
.LBB14_7:                               # %._crit_edge10
	#DEBUG_VALUE: sequence_matrix:start <- [RBP+-64]
	#DEBUG_VALUE: sequence_matrix:step <- [RBP+-52]
	#DEBUG_VALUE: sequence_matrix:matrix_obj <- [RBP+-80]
	#DEBUG_VALUE: sequence_matrix:start_row <- 0
	movq	-80(%rbp), %rcx         # 8-byte Reload
.Ltmp257:
	#DEBUG_VALUE: sequence_matrix:matrix_obj <- RCX
	.loc	3 663 2                 # matrix.c:663:2
	movq	24(%rcx), %rax
	movb	$1, 8(%rax)
	.loc	3 664 2                 # matrix.c:664:2
	movq	24(%rcx), %rax
	movq	(%rax), %rax
	movl	-64(%rbp), %edx         # 4-byte Reload
	movl	%edx, (%rax)
	.loc	3 665 2                 # matrix.c:665:2
	movq	24(%rcx), %rax
.Ltmp258:
	#DEBUG_VALUE: sequence_matrix:matrix_obj <- [RBP+-80]
	movq	(%rax), %rax
	movl	-52(%rbp), %ecx         # 4-byte Reload
	movl	%ecx, 4(%rax)
.Ltmp259:
	#DEBUG_VALUE: sequence_matrix:sum <- 0
	#DEBUG_VALUE: sequence_matrix:max <- 0
	#DEBUG_VALUE: sequence_matrix:min <- -1
	.loc	3 671 6                 # matrix.c:671:6
	movq	g_nthreads(%rip), %rdx
.Ltmp260:
	#DEBUG_VALUE: i <- EDX
	.loc	3 671 6 discriminator 1 # matrix.c:671:6
	testl	%edx, %edx
	je	.LBB14_8
.Ltmp261:
# BB#9:                                 # %.lr.ph.preheader
	#DEBUG_VALUE: sequence_matrix:matrix_obj <- [RBP+-80]
	#DEBUG_VALUE: sequence_matrix:start_row <- 0
	#DEBUG_VALUE: sequence_matrix:min <- -1
	#DEBUG_VALUE: sequence_matrix:max <- 0
	#DEBUG_VALUE: sequence_matrix:sum <- 0
	#DEBUG_VALUE: i <- EDX
	leal	-1(%rdx), %eax
	leaq	(%r14,%rax,4), %rdi
	movq	-96(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,4), %rbx
	leaq	(%r15,%rax,4), %r12
	movq	-48(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %r14
	negl	%edx
.Ltmp262:
	movl	$-1, %esi
	xorl	%ecx, %ecx
	xorl	%r15d, %r15d
.Ltmp263:
	.align	16, 0x90
.LBB14_10:                              # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: sequence_matrix:matrix_obj <- [RBP+-80]
	#DEBUG_VALUE: sequence_matrix:start_row <- 0
	#DEBUG_VALUE: sequence_matrix:min <- -1
	#DEBUG_VALUE: sequence_matrix:max <- 0
	#DEBUG_VALUE: sequence_matrix:sum <- 0
	.loc	3 673 9                 # matrix.c:673:9
	movq	%rdi, -64(%rbp)         # 8-byte Spill
	movl	%esi, -52(%rbp)         # 4-byte Spill
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	movq	(%r14), %rdi
	xorl	%esi, %esi
	movq	%rdx, %r13
	callq	pthread_join
	movq	-64(%rbp), %rdi         # 8-byte Reload
	movl	-52(%rbp), %esi         # 4-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	movq	%r13, %rdx
	.loc	3 674 3                 # matrix.c:674:3
	addl	(%r12), %ecx
.Ltmp264:
	#DEBUG_VALUE: sequence_matrix:sum <- ECX
	.loc	3 675 6                 # matrix.c:675:6
	movl	(%rbx), %eax
.Ltmp265:
	#DEBUG_VALUE: sequence_matrix:min <- EAX
	cmpl	%esi, %eax
	cmovbl	%eax, %esi
.Ltmp266:
	.loc	3 676 6                 # matrix.c:676:6
	movl	(%rdi), %eax
.Ltmp267:
	#DEBUG_VALUE: sequence_matrix:max <- EAX
	cmpl	%r15d, %eax
	cmoval	%eax, %r15d
.Ltmp268:
	.loc	3 671 6 discriminator 1 # matrix.c:671:6
	addq	$-4, %rdi
	addq	$-4, %rbx
	addq	$-4, %r12
	addq	$-8, %r14
	incl	%edx
	jne	.LBB14_10
	jmp	.LBB14_11
.Ltmp269:
.LBB14_12:
	#DEBUG_VALUE: sequence_matrix:start <- EAX
	.loc	3 626 10                # matrix.c:626:10
	movl	%eax, %edi
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	uniform_matrix          # TAILCALL
.Ltmp270:
.LBB14_8:
	#DEBUG_VALUE: sequence_matrix:matrix_obj <- [RBP+-80]
	#DEBUG_VALUE: sequence_matrix:start_row <- 0
	#DEBUG_VALUE: sequence_matrix:min <- -1
	#DEBUG_VALUE: sequence_matrix:max <- 0
	#DEBUG_VALUE: sequence_matrix:sum <- 0
	xorl	%ecx, %ecx
	movl	$-1, %esi
	xorl	%r15d, %r15d
.LBB14_11:
	#DEBUG_VALUE: sequence_matrix:matrix_obj <- [RBP+-80]
	#DEBUG_VALUE: sequence_matrix:start_row <- 0
	#DEBUG_VALUE: sequence_matrix:min <- -1
	#DEBUG_VALUE: sequence_matrix:max <- 0
	#DEBUG_VALUE: sequence_matrix:sum <- 0
	movq	-80(%rbp), %rbx         # 8-byte Reload
.Ltmp271:
	#DEBUG_VALUE: sequence_matrix:matrix_obj <- RBX
	.loc	3 679 2                 # matrix.c:679:2
	movl	%esi, 8(%rbx)
	.loc	3 680 2                 # matrix.c:680:2
	movl	%r15d, 12(%rbx)
	.loc	3 681 2                 # matrix.c:681:2
	movl	%ecx, 16(%rbx)
	.loc	3 683 2                 # matrix.c:683:2
	movq	-72(%rbp), %rdi         # 8-byte Reload
	callq	free
	.loc	3 686 1                 # matrix.c:686:1
	movq	-88(%rbp), %rsp         # 8-byte Reload
	movq	%rbx, %rax
	leaq	-40(%rbp), %rsp
	popq	%rbx
.Ltmp272:
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp273:
.Ltmp274:
	.size	sequence_matrix, .Ltmp274-sequence_matrix
.Lfunc_end14:
	.cfi_endproc

	.align	16, 0x90
	.type	sequence_worker,@function
sequence_worker:                        # @sequence_worker
.Lfunc_begin15:
	.loc	3 538 0                 # matrix.c:538:0
	.cfi_startproc
# BB#0:
	.loc	3 553 18 prologue_end   # matrix.c:553:18
	pushq	%r14
.Ltmp275:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp276:
	.cfi_def_cfa_offset 24
.Ltmp277:
	.cfi_offset %rbx, -24
.Ltmp278:
	.cfi_offset %r14, -16
	#DEBUG_VALUE: sequence_worker:arg <- RDI
.Ltmp279:
	#DEBUG_VALUE: sequence_worker:min <- -1
	#DEBUG_VALUE: sequence_worker:max <- 0
	#DEBUG_VALUE: sequence_worker:sum <- 0
	movl	8(%rdi), %r8d
	movl	12(%rdi), %r10d
	.loc	3 543 2                 # matrix.c:543:2
	movl	16(%rdi), %ebx
	.loc	3 564 6                 # matrix.c:564:6
.Ltmp280:
	movl	20(%rdi), %ecx
.Ltmp281:
	#DEBUG_VALUE: y <- ECX
	.loc	3 564 6 discriminator 1 # matrix.c:564:6
	testl	%ecx, %ecx
	je	.LBB15_1
.Ltmp282:
# BB#2:                                 # %.preheader.lr.ph
	#DEBUG_VALUE: sequence_worker:arg <- RDI
	#DEBUG_VALUE: sequence_worker:min <- -1
	#DEBUG_VALUE: sequence_worker:max <- 0
	#DEBUG_VALUE: sequence_worker:sum <- 0
	#DEBUG_VALUE: y <- ECX
	.loc	3 543 2                 # matrix.c:543:2
	movq	g_hard_width(%rip), %r9
	.loc	3 553 18                # matrix.c:553:18
	movq	g_soft_width(%rip), %r11
	movq	%r11, %rsi
	imulq	%rbx, %rsi
	.loc	3 559 17                # matrix.c:559:17
	leal	(,%r10,4), %eax
	vmovd	%eax, %xmm0
	vpbroadcastd	%xmm0, %xmm0
	movl	g_padding(%rip), %eax
	.loc	3 560 17                # matrix.c:560:17
	imull	%r10d, %eax
	vmovd	%eax, %xmm1
	vpbroadcastd	%xmm1, %xmm1
	.loc	3 562 2                 # matrix.c:562:2
	movq	%r9, %r14
	sarq	$63, %r14
	shrq	$62, %r14
	addq	%r9, %r14
	sarq	$2, %r14
.Ltmp283:
	#DEBUG_VALUE: sequence_worker:m_max <- R14D
	.loc	3 553 18                # matrix.c:553:18
	movl	%ebx, %eax
	imull	%r10d, %eax
	imull	%eax, %r11d
	addl	%r8d, %r11d
	leal	1(%rsi), %eax
	imull	%r10d, %eax
	addl	%r8d, %eax
	leal	2(%rsi), %edx
	imull	%r10d, %edx
	addl	%r8d, %edx
	addl	$3, %esi
	imull	%r10d, %esi
	addl	%r8d, %esi
	vmovd	%r11d, %xmm2
	vpinsrd	$1, %eax, %xmm2, %xmm2
	vpinsrd	$2, %edx, %xmm2, %xmm2
	vpinsrd	$3, %esi, %xmm2, %xmm2
	.loc	3 540 2                 # matrix.c:540:2
	movq	(%rdi), %rax
	.loc	3 543 2                 # matrix.c:543:2
	imulq	%r9, %rbx
	shlq	$2, %rbx
	addq	(%rax), %rbx
.Ltmp284:
	#DEBUG_VALUE: sequence_worker:matrix <- RBX
	movabsq	$17179869180, %rax      # imm = 0x3FFFFFFFC
	.loc	3 564 6 discriminator 1 # matrix.c:564:6
.Ltmp285:
	leaq	(%rax,%r14,4), %r8
	andq	%rax, %r8
	addq	$4, %r8
	movl	%r14d, %edx
	negl	%edx
	vpxor	%xmm3, %xmm3, %xmm3
	vpcmpeqd	%xmm4, %xmm4, %xmm4
	vpxor	%xmm5, %xmm5, %xmm5
.Ltmp286:
	.align	16, 0x90
.LBB15_3:                               # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB15_4 Depth 2
	#DEBUG_VALUE: sequence_worker:arg <- RDI
	#DEBUG_VALUE: sequence_worker:min <- -1
	#DEBUG_VALUE: sequence_worker:max <- 0
	#DEBUG_VALUE: sequence_worker:sum <- 0
	#DEBUG_VALUE: sequence_worker:m_max <- R14D
	movl	%edx, %esi
	movq	%rbx, %rax
	testl	%r14d, %r14d
	je	.LBB15_6
.Ltmp287:
	.align	16, 0x90
.LBB15_4:                               # %.lr.ph
                                        #   Parent Loop BB15_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: sequence_worker:arg <- RDI
	#DEBUG_VALUE: sequence_worker:min <- -1
	#DEBUG_VALUE: sequence_worker:max <- 0
	#DEBUG_VALUE: sequence_worker:sum <- 0
	#DEBUG_VALUE: sequence_worker:m_max <- R14D
	.loc	3 569 4                 # matrix.c:569:4
	vmovdqa	%xmm2, (%rax)
	.loc	3 570 12                # matrix.c:570:12
	vpminud	%xmm2, %xmm4, %xmm4
	.loc	3 574 13                # matrix.c:574:13
	vpmaxud	%xmm2, %xmm3, %xmm3
	.loc	3 575 11                # matrix.c:575:11
	vpaddd	%xmm2, %xmm5, %xmm5
	.loc	3 576 12                # matrix.c:576:12
	vpaddd	%xmm0, %xmm2, %xmm2
	.loc	3 577 4                 # matrix.c:577:4
	addq	$16, %rax
.Ltmp288:
	.loc	3 567 7 discriminator 1 # matrix.c:567:7
	incl	%esi
	jne	.LBB15_4
.Ltmp289:
# BB#5:                                 # %._crit_edge
                                        #   in Loop: Header=BB15_3 Depth=1
	#DEBUG_VALUE: sequence_worker:arg <- RDI
	#DEBUG_VALUE: sequence_worker:min <- -1
	#DEBUG_VALUE: sequence_worker:max <- 0
	#DEBUG_VALUE: sequence_worker:sum <- 0
	#DEBUG_VALUE: sequence_worker:m_max <- R14D
	leaq	(%rbx,%r8,4), %rbx
.Ltmp290:
	#DEBUG_VALUE: sequence_worker:matrix <- RBX
.LBB15_6:                               #   in Loop: Header=BB15_3 Depth=1
	#DEBUG_VALUE: sequence_worker:arg <- RDI
	#DEBUG_VALUE: sequence_worker:min <- -1
	#DEBUG_VALUE: sequence_worker:max <- 0
	#DEBUG_VALUE: sequence_worker:sum <- 0
	#DEBUG_VALUE: sequence_worker:m_max <- R14D
	.loc	3 579 11                # matrix.c:579:11
	vpsubd	%xmm1, %xmm2, %xmm2
.Ltmp291:
	.loc	3 564 6 discriminator 1 # matrix.c:564:6
	decl	%ecx
.Ltmp292:
	#DEBUG_VALUE: y <- ECX
	jne	.LBB15_3
	jmp	.LBB15_7
.Ltmp293:
.LBB15_1:
	#DEBUG_VALUE: sequence_worker:arg <- RDI
	#DEBUG_VALUE: sequence_worker:min <- -1
	#DEBUG_VALUE: sequence_worker:max <- 0
	#DEBUG_VALUE: sequence_worker:sum <- 0
	vpcmpeqd	%xmm4, %xmm4, %xmm4
	vpxor	%xmm3, %xmm3, %xmm3
	vpxor	%xmm5, %xmm5, %xmm5
.LBB15_7:                               # %._crit_edge21
	#DEBUG_VALUE: sequence_worker:arg <- RDI
	#DEBUG_VALUE: sequence_worker:min <- -1
	#DEBUG_VALUE: sequence_worker:max <- 0
	#DEBUG_VALUE: sequence_worker:sum <- 0
.Ltmp294:
	#DEBUG_VALUE: __a <- XMM4
	.loc	3 582 19                # matrix.c:582:19
	vpshufd	$14, %xmm4, %xmm0       # xmm0 = xmm4[2,3,0,0]
.Ltmp295:
	.loc	3 583 10                # matrix.c:583:10
	vpminud	%xmm0, %xmm4, %xmm0
	.loc	3 584 11                # matrix.c:584:11
.Ltmp296:
	vpshufd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0,0,0]
.Ltmp297:
	.loc	3 585 10                # matrix.c:585:10
	vpminud	%xmm1, %xmm0, %xmm0
	.loc	3 588 19                # matrix.c:588:19
.Ltmp298:
	vpshufd	$14, %xmm3, %xmm1       # xmm1 = xmm3[2,3,0,0]
.Ltmp299:
	.loc	3 589 11                # matrix.c:589:11
	vpmaxud	%xmm1, %xmm3, %xmm1
	.loc	3 590 11                # matrix.c:590:11
.Ltmp300:
	vpshufd	$1, %xmm1, %xmm2        # xmm2 = xmm1[1,0,0,0]
.Ltmp301:
	.loc	3 591 11                # matrix.c:591:11
	vpmaxud	%xmm2, %xmm1, %xmm1
	.loc	3 594 19                # matrix.c:594:19
.Ltmp302:
	vpshufd	$14, %xmm5, %xmm2       # xmm2 = xmm5[2,3,0,0]
.Ltmp303:
	.loc	3 595 9                 # matrix.c:595:9
	vpaddd	%xmm2, %xmm5, %xmm2
	.loc	3 597 9                 # matrix.c:597:9
	vphaddd	%xmm2, %xmm2, %xmm2
	.loc	3 615 2                 # matrix.c:615:2
	movq	24(%rdi), %rax
	movl	48(%rdi), %ecx
	vmovd	%xmm0, (%rax,%rcx,4)
	.loc	3 616 2                 # matrix.c:616:2
	movq	32(%rdi), %rax
	movl	48(%rdi), %ecx
	vmovd	%xmm1, (%rax,%rcx,4)
	.loc	3 617 2                 # matrix.c:617:2
	movq	40(%rdi), %rax
	movl	48(%rdi), %ecx
	vmovd	%xmm2, (%rax,%rcx,4)
	xorl	%eax, %eax
.Ltmp304:
	#DEBUG_VALUE: __a <- XMM5
	#DEBUG_VALUE: __a <- XMM3
	.loc	3 619 2                 # matrix.c:619:2
	popq	%rbx
	popq	%r14
	retq
.Ltmp305:
.Ltmp306:
	.size	sequence_worker, .Ltmp306-sequence_worker
.Lfunc_end15:
	.cfi_endproc

	.globl	cloned
	.align	16, 0x90
	.type	cloned,@function
cloned:                                 # @cloned
.Lfunc_begin16:
	.loc	3 724 0                 # matrix.c:724:0
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp307:
	.cfi_def_cfa_offset 16
.Ltmp308:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp309:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
.Ltmp310:
	.cfi_offset %rbx, -56
.Ltmp311:
	.cfi_offset %r12, -48
.Ltmp312:
	.cfi_offset %r13, -40
.Ltmp313:
	.cfi_offset %r14, -32
.Ltmp314:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: cloned:matrix_obj <- RDI
	movq	%rdi, %r12
.Ltmp315:
	#DEBUG_VALUE: cloned:matrix_obj <- R12
	.loc	3 726 5 prologue_end    # matrix.c:726:5
	movq	24(%r12), %rax
	movzbl	8(%rax), %eax
	cmpl	$3, %eax
	jne	.LBB16_1
.Ltmp316:
# BB#11:
	.loc	3 728 10                # matrix.c:728:10
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	identity_matrix         # TAILCALL
.Ltmp317:
.LBB16_1:
	#DEBUG_VALUE: cloned:matrix_obj <- R12
	.loc	3 731 34                # matrix.c:731:34
	callq	new_matrix
	movq	%rax, %r15
.Ltmp318:
	#DEBUG_VALUE: cloned:result_obj <- R15
	.loc	3 733 2                 # matrix.c:733:2
	movq	%rsp, -64(%rbp)         # 8-byte Spill
	movq	g_nthreads(%rip), %rax
	movq	%rsp, %rcx
	leaq	15(,%rax,8), %rax
	andq	$-16, %rax
	subq	%rax, %rcx
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	movq	%rcx, %rsp
	.loc	3 735 32                # matrix.c:735:32
	movq	g_nthreads(%rip), %rax
	shlq	$3, %rax
	leaq	(%rax,%rax,2), %rdi
	callq	malloc
	movq	%rax, -48(%rbp)         # 8-byte Spill
.Ltmp319:
	#DEBUG_VALUE: cloned:start_row <- 0
	.loc	3 737 6                 # matrix.c:737:6
	movq	g_nthreads(%rip), %rcx
.Ltmp320:
	#DEBUG_VALUE: i <- ECX
	.loc	3 737 6 discriminator 1 # matrix.c:737:6
	testl	%ecx, %ecx
	je	.LBB16_4
.Ltmp321:
# BB#2:                                 # %.lr.ph8
	#DEBUG_VALUE: cloned:matrix_obj <- R12
	#DEBUG_VALUE: cloned:result_obj <- R15
	#DEBUG_VALUE: cloned:start_row <- 0
	#DEBUG_VALUE: i <- ECX
	.loc	3 739 3                 # matrix.c:739:3
	movq	g_height(%rip), %rax
	cqto
	idivq	g_nthreads(%rip)
.Ltmp322:
	.loc	3 737 6 discriminator 1 # matrix.c:737:6
	leal	-1(%rcx), %edi
	leaq	(%rdi,%rdi,2), %rsi
	movq	-48(%rbp), %rbx         # 8-byte Reload
	leaq	20(%rbx,%rsi,8), %rsi
	subq	%rdi, %rdx
	negl	%ecx
.Ltmp323:
	xorl	%edi, %edi
.Ltmp324:
	.align	16, 0x90
.LBB16_3:                               # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: cloned:matrix_obj <- R12
	#DEBUG_VALUE: cloned:result_obj <- R15
	#DEBUG_VALUE: cloned:start_row <- 0
	.loc	3 739 3                 # matrix.c:739:3
	testq	%rdx, %rdx
	setg	%bl
	movzbl	%bl, %ebx
	addl	%eax, %ebx
.Ltmp325:
	#DEBUG_VALUE: this_rows <- EDI
	.loc	3 740 9                 # matrix.c:740:9
	movq	%r12, -20(%rsi)
	movq	%r15, -12(%rsi)
	movl	%edi, -4(%rsi)
	movl	%ebx, (%rsi)
	.loc	3 747 3                 # matrix.c:747:3
	addl	%ebx, %edi
.Ltmp326:
	#DEBUG_VALUE: cloned:start_row <- EDI
	.loc	3 737 6 discriminator 1 # matrix.c:737:6
	addq	$-24, %rsi
	incq	%rdx
	incl	%ecx
	jne	.LBB16_3
.Ltmp327:
.LBB16_4:                               # %._crit_edge9
	#DEBUG_VALUE: cloned:matrix_obj <- R12
	#DEBUG_VALUE: cloned:result_obj <- R15
	#DEBUG_VALUE: cloned:start_row <- 0
	.loc	3 750 6                 # matrix.c:750:6
	movq	g_nthreads(%rip), %r14
.Ltmp328:
	#DEBUG_VALUE: i <- R14D
	.loc	3 750 6 discriminator 1 # matrix.c:750:6
	testl	%r14d, %r14d
	je	.LBB16_7
.Ltmp329:
# BB#5:                                 # %.lr.ph4.preheader
	#DEBUG_VALUE: cloned:matrix_obj <- R12
	#DEBUG_VALUE: cloned:result_obj <- R15
	#DEBUG_VALUE: cloned:start_row <- 0
	#DEBUG_VALUE: i <- R14D
	leal	-1(%r14), %eax
	leaq	(%rax,%rax,2), %rcx
	movq	-48(%rbp), %rdx         # 8-byte Reload
	leaq	(%rdx,%rcx,8), %r13
	movq	-56(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %rbx
	negl	%r14d
.Ltmp330:
	.align	16, 0x90
.LBB16_6:                               # %.lr.ph4
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: cloned:matrix_obj <- R12
	#DEBUG_VALUE: cloned:result_obj <- R15
	#DEBUG_VALUE: cloned:start_row <- 0
	xorl	%esi, %esi
	.loc	3 752 9                 # matrix.c:752:9
.Ltmp331:
	movl	$clone_worker, %edx
	movq	%rbx, %rdi
	movq	%r13, %rcx
	callq	pthread_create
.Ltmp332:
	.loc	3 750 6 discriminator 1 # matrix.c:750:6
	addq	$-24, %r13
	addq	$-8, %rbx
	incl	%r14d
	jne	.LBB16_6
.Ltmp333:
.LBB16_7:                               # %._crit_edge5
	#DEBUG_VALUE: cloned:matrix_obj <- R12
	#DEBUG_VALUE: cloned:result_obj <- R15
	#DEBUG_VALUE: cloned:start_row <- 0
	.loc	3 755 2                 # matrix.c:755:2
	movl	8(%r12), %eax
	movl	%eax, 8(%r15)
	.loc	3 756 2                 # matrix.c:756:2
	movl	12(%r12), %eax
	movl	%eax, 12(%r15)
	.loc	3 757 2                 # matrix.c:757:2
	movl	16(%r12), %eax
	movl	%eax, 16(%r15)
	.loc	3 759 2                 # matrix.c:759:2
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	copy_occurances
	.loc	3 761 6                 # matrix.c:761:6
.Ltmp334:
	movq	g_nthreads(%rip), %r14
.Ltmp335:
	#DEBUG_VALUE: i <- R14D
	.loc	3 761 6 discriminator 1 # matrix.c:761:6
	testl	%r14d, %r14d
	je	.LBB16_10
.Ltmp336:
# BB#8:                                 # %.lr.ph.preheader
	#DEBUG_VALUE: cloned:result_obj <- R15
	#DEBUG_VALUE: cloned:start_row <- 0
	#DEBUG_VALUE: i <- R14D
	leal	-1(%r14), %eax
	movq	-56(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %rbx
	negl	%r14d
.Ltmp337:
	.align	16, 0x90
.LBB16_9:                               # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: cloned:result_obj <- R15
	#DEBUG_VALUE: cloned:start_row <- 0
	.loc	3 763 9                 # matrix.c:763:9
	movq	(%rbx), %rdi
	xorl	%esi, %esi
	callq	pthread_join
.Ltmp338:
	.loc	3 761 6 discriminator 1 # matrix.c:761:6
	addq	$-8, %rbx
	incl	%r14d
	jne	.LBB16_9
.Ltmp339:
.LBB16_10:
	#DEBUG_VALUE: cloned:result_obj <- R15
	#DEBUG_VALUE: cloned:start_row <- 0
	.loc	3 766 2                 # matrix.c:766:2
	movq	-48(%rbp), %rdi         # 8-byte Reload
	callq	free
	.loc	3 769 1                 # matrix.c:769:1
	movq	-64(%rbp), %rsp         # 8-byte Reload
	movq	%r15, %rax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
.Ltmp340:
	popq	%rbp
	retq
.Ltmp341:
.Ltmp342:
	.size	cloned, .Ltmp342-cloned
.Lfunc_end16:
	.cfi_endproc

	.align	16, 0x90
	.type	clone_worker,@function
clone_worker:                           # @clone_worker
.Lfunc_begin17:
	.loc	3 705 0                 # matrix.c:705:0
	.cfi_startproc
# BB#0:
	#DEBUG_VALUE: clone_worker:arg <- RDI
	.loc	3 710 2 prologue_end    # matrix.c:710:2
	movl	16(%rdi), %eax
	.loc	3 713 6                 # matrix.c:713:6
.Ltmp343:
	movl	20(%rdi), %esi
.Ltmp344:
	.loc	3 710 2                 # matrix.c:710:2
	movq	g_hard_width(%rip), %rdx
	.loc	3 713 6                 # matrix.c:713:6
.Ltmp345:
	imulq	%rdx, %rsi
	movq	%rsi, %rcx
	sarq	$63, %rcx
	shrq	$62, %rcx
	addq	%rsi, %rcx
	sarq	$2, %rcx
.Ltmp346:
	#DEBUG_VALUE: i <- ECX
	.loc	3 713 6 discriminator 1 # matrix.c:713:6
	testl	%ecx, %ecx
	je	.LBB17_3
.Ltmp347:
# BB#1:                                 # %.lr.ph
	#DEBUG_VALUE: clone_worker:arg <- RDI
	#DEBUG_VALUE: i <- ECX
	.loc	3 710 2                 # matrix.c:710:2
	imulq	%rdx, %rax
	.loc	3 707 2                 # matrix.c:707:2
	movq	(%rdi), %rsi
	.loc	3 708 2                 # matrix.c:708:2
	movq	8(%rdi), %rdx
	.loc	3 711 2                 # matrix.c:711:2
	shlq	$2, %rax
	movq	(%rdx), %rdx
	addq	%rax, %rdx
.Ltmp348:
	#DEBUG_VALUE: clone_worker:result <- RDX
	.loc	3 710 2                 # matrix.c:710:2
	addq	(%rsi), %rax
.Ltmp349:
	#DEBUG_VALUE: clone_worker:matrix <- RAX
	.loc	3 713 6 discriminator 1 # matrix.c:713:6
	negl	%ecx
.Ltmp350:
	.align	16, 0x90
.LBB17_2:                               # =>This Inner Loop Header: Depth=1
	.loc	3 715 18                # matrix.c:715:18
	vmovaps	(%rax), %xmm0
.Ltmp351:
	#DEBUG_VALUE: vput <- XMM0
	.loc	3 716 3                 # matrix.c:716:3
	vmovaps	%xmm0, (%rdx)
	.loc	3 717 3                 # matrix.c:717:3
	addq	$16, %rax
.Ltmp352:
	#DEBUG_VALUE: clone_worker:matrix <- RAX
	.loc	3 718 3                 # matrix.c:718:3
	addq	$16, %rdx
.Ltmp353:
	#DEBUG_VALUE: clone_worker:result <- RDX
	.loc	3 713 6 discriminator 1 # matrix.c:713:6
	incl	%ecx
	jne	.LBB17_2
.Ltmp354:
.LBB17_3:                               # %._crit_edge
	xorl	%eax, %eax
	.loc	3 721 2                 # matrix.c:721:2
	retq
.Ltmp355:
.Ltmp356:
	.size	clone_worker, .Ltmp356-clone_worker
.Lfunc_end17:
	.cfi_endproc

	.align	16, 0x90
	.type	copy_occurances,@function
copy_occurances:                        # @copy_occurances
.Lfunc_begin18:
	.loc	3 183 0                 # matrix.c:183:0
	.cfi_startproc
# BB#0:
	pushq	%r15
.Ltmp357:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp358:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp359:
	.cfi_def_cfa_offset 32
.Ltmp360:
	.cfi_offset %rbx, -32
.Ltmp361:
	.cfi_offset %r14, -24
.Ltmp362:
	.cfi_offset %r15, -16
	#DEBUG_VALUE: copy_occurances:target_obj <- RDI
	#DEBUG_VALUE: copy_occurances:source_obj <- RSI
	movq	%rsi, %r15
.Ltmp363:
	#DEBUG_VALUE: copy_occurances:source_obj <- R15
	movq	%rdi, %r14
.Ltmp364:
	#DEBUG_VALUE: copy_occurances:target_obj <- R14
	.loc	3 184 5 prologue_end    # matrix.c:184:5
	cmpq	%r15, %r14
	je	.LBB18_5
.Ltmp365:
# BB#1:
	#DEBUG_VALUE: copy_occurances:target_obj <- R14
	#DEBUG_VALUE: copy_occurances:source_obj <- R15
	.loc	3 185 2                 # matrix.c:185:2
	movq	24(%r14), %rax
	movq	(%rax), %rdi
	movq	24(%r15), %rax
	movq	(%rax), %rsi
	movl	$131072, %edx           # imm = 0x20000
	callq	memcpy
	.loc	3 186 2                 # matrix.c:186:2
	movq	24(%r15), %rax
	movb	8(%rax), %al
	movq	24(%r14), %rcx
	movb	%al, 8(%rcx)
	movl	$21, %ebx
.Ltmp366:
	#DEBUG_VALUE: i <- 19
	.align	16, 0x90
.LBB18_2:                               # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: copy_occurances:target_obj <- R14
	#DEBUG_VALUE: copy_occurances:source_obj <- R15
	#DEBUG_VALUE: i <- 19
	.loc	3 189 6                 # matrix.c:189:6
	movq	24(%r15), %rax
	movq	(%rax,%rbx,8), %rsi
	testq	%rsi, %rsi
	je	.LBB18_4
.Ltmp367:
# BB#3:                                 #   in Loop: Header=BB18_2 Depth=1
	#DEBUG_VALUE: copy_occurances:target_obj <- R14
	#DEBUG_VALUE: copy_occurances:source_obj <- R15
	#DEBUG_VALUE: i <- 19
	.loc	3 191 4                 # matrix.c:191:4
	movq	24(%r14), %rax
	movq	(%rax,%rbx,8), %rdi
	callq	copy_occurances
.Ltmp368:
.LBB18_4:                               # %.backedge
                                        #   in Loop: Header=BB18_2 Depth=1
	#DEBUG_VALUE: copy_occurances:target_obj <- R14
	#DEBUG_VALUE: copy_occurances:source_obj <- R15
	#DEBUG_VALUE: i <- 19
	.loc	3 187 6 discriminator 1 # matrix.c:187:6
	decq	%rbx
	cmpl	$1, %ebx
	jne	.LBB18_2
.Ltmp369:
.LBB18_5:                               # %.loopexit
	.loc	3 194 1                 # matrix.c:194:1
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Ltmp370:
.Ltmp371:
	.size	copy_occurances, .Ltmp371-copy_occurances
.Lfunc_end18:
	.cfi_endproc

	.globl	reversed
	.align	16, 0x90
	.type	reversed,@function
reversed:                               # @reversed
.Lfunc_begin19:
	.loc	3 806 0                 # matrix.c:806:0
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp372:
	.cfi_def_cfa_offset 16
.Ltmp373:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp374:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
.Ltmp375:
	.cfi_offset %rbx, -56
.Ltmp376:
	.cfi_offset %r12, -48
.Ltmp377:
	.cfi_offset %r13, -40
.Ltmp378:
	.cfi_offset %r14, -32
.Ltmp379:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: reversed:matrix_obj <- RDI
	movq	%rdi, %r12
.Ltmp380:
	#DEBUG_VALUE: reversed:matrix_obj <- R12
	.loc	3 807 5 prologue_end    # matrix.c:807:5
	movq	24(%r12), %rax
	movb	8(%rax), %al
	andb	$-2, %al
	movzbl	%al, %eax
	cmpl	$2, %eax
	jne	.LBB19_1
.Ltmp381:
# BB#11:
	#DEBUG_VALUE: reversed:matrix_obj <- R12
	.loc	3 809 10                # matrix.c:809:10
	movq	%r12, %rdi
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
.Ltmp382:
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	cloned                  # TAILCALL
.Ltmp383:
.LBB19_1:
	#DEBUG_VALUE: reversed:matrix_obj <- R12
	.loc	3 812 25                # matrix.c:812:25
	callq	new_matrix
	movq	%rax, %r14
.Ltmp384:
	#DEBUG_VALUE: reversed:result_obj <- R14
	.loc	3 814 2                 # matrix.c:814:2
	movq	%rsp, -64(%rbp)         # 8-byte Spill
	movq	g_nthreads(%rip), %rax
	movq	%rsp, %rcx
	leaq	15(,%rax,8), %rax
	andq	$-16, %rax
	subq	%rax, %rcx
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	movq	%rcx, %rsp
	.loc	3 816 34                # matrix.c:816:34
	movq	g_nthreads(%rip), %rax
	shlq	$3, %rax
	leaq	(%rax,%rax,2), %rdi
	callq	malloc
	movq	%rax, -48(%rbp)         # 8-byte Spill
.Ltmp385:
	#DEBUG_VALUE: reversed:start_row <- 0
	.loc	3 818 6                 # matrix.c:818:6
	movq	g_nthreads(%rip), %rcx
.Ltmp386:
	#DEBUG_VALUE: i <- ECX
	.loc	3 818 6 discriminator 1 # matrix.c:818:6
	testl	%ecx, %ecx
	je	.LBB19_4
.Ltmp387:
# BB#2:                                 # %.lr.ph8
	#DEBUG_VALUE: reversed:matrix_obj <- R12
	#DEBUG_VALUE: reversed:result_obj <- R14
	#DEBUG_VALUE: reversed:start_row <- 0
	#DEBUG_VALUE: i <- ECX
	.loc	3 820 3                 # matrix.c:820:3
	movq	g_height(%rip), %rax
	cqto
	idivq	g_nthreads(%rip)
.Ltmp388:
	.loc	3 818 6 discriminator 1 # matrix.c:818:6
	leal	-1(%rcx), %edi
	leaq	(%rdi,%rdi,2), %rsi
	movq	-48(%rbp), %rbx         # 8-byte Reload
	leaq	20(%rbx,%rsi,8), %rsi
	subq	%rdi, %rdx
	negl	%ecx
.Ltmp389:
	xorl	%edi, %edi
.Ltmp390:
	.align	16, 0x90
.LBB19_3:                               # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: reversed:matrix_obj <- R12
	#DEBUG_VALUE: reversed:result_obj <- R14
	#DEBUG_VALUE: reversed:start_row <- 0
	.loc	3 820 3                 # matrix.c:820:3
	testq	%rdx, %rdx
	setg	%bl
	movzbl	%bl, %ebx
	addl	%eax, %ebx
.Ltmp391:
	#DEBUG_VALUE: this_rows <- EDI
	.loc	3 821 9                 # matrix.c:821:9
	movq	%r14, -20(%rsi)
	movq	%r12, -12(%rsi)
	movl	%ebx, -4(%rsi)
	movl	%edi, (%rsi)
	.loc	3 828 3                 # matrix.c:828:3
	addl	%ebx, %edi
.Ltmp392:
	#DEBUG_VALUE: reversed:start_row <- EDI
	.loc	3 818 6 discriminator 1 # matrix.c:818:6
	addq	$-24, %rsi
	incq	%rdx
	incl	%ecx
	jne	.LBB19_3
.Ltmp393:
.LBB19_4:                               # %._crit_edge9
	#DEBUG_VALUE: reversed:matrix_obj <- R12
	#DEBUG_VALUE: reversed:result_obj <- R14
	#DEBUG_VALUE: reversed:start_row <- 0
	.loc	3 831 6                 # matrix.c:831:6
	movq	g_nthreads(%rip), %r15
.Ltmp394:
	#DEBUG_VALUE: i <- R15D
	.loc	3 831 6 discriminator 1 # matrix.c:831:6
	testl	%r15d, %r15d
	je	.LBB19_7
.Ltmp395:
# BB#5:                                 # %.lr.ph4.preheader
	#DEBUG_VALUE: reversed:matrix_obj <- R12
	#DEBUG_VALUE: reversed:result_obj <- R14
	#DEBUG_VALUE: reversed:start_row <- 0
	#DEBUG_VALUE: i <- R15D
	leal	-1(%r15), %eax
	leaq	(%rax,%rax,2), %rcx
	movq	-48(%rbp), %rdx         # 8-byte Reload
	leaq	(%rdx,%rcx,8), %r13
	movq	-56(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %rbx
	negl	%r15d
.Ltmp396:
	.align	16, 0x90
.LBB19_6:                               # %.lr.ph4
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: reversed:matrix_obj <- R12
	#DEBUG_VALUE: reversed:result_obj <- R14
	#DEBUG_VALUE: reversed:start_row <- 0
	xorl	%esi, %esi
	.loc	3 833 9                 # matrix.c:833:9
.Ltmp397:
	movl	$reverse_worker, %edx
	movq	%rbx, %rdi
	movq	%r13, %rcx
	callq	pthread_create
.Ltmp398:
	.loc	3 831 6 discriminator 1 # matrix.c:831:6
	addq	$-24, %r13
	addq	$-8, %rbx
	incl	%r15d
	jne	.LBB19_6
.Ltmp399:
.LBB19_7:                               # %._crit_edge5
	#DEBUG_VALUE: reversed:matrix_obj <- R12
	#DEBUG_VALUE: reversed:result_obj <- R14
	#DEBUG_VALUE: reversed:start_row <- 0
	.loc	3 836 6                 # matrix.c:836:6
	movq	g_nthreads(%rip), %r15
.Ltmp400:
	#DEBUG_VALUE: i <- R15D
	.loc	3 836 6 discriminator 1 # matrix.c:836:6
	testl	%r15d, %r15d
	je	.LBB19_10
.Ltmp401:
# BB#8:                                 # %.lr.ph.preheader
	#DEBUG_VALUE: reversed:matrix_obj <- R12
	#DEBUG_VALUE: reversed:result_obj <- R14
	#DEBUG_VALUE: reversed:start_row <- 0
	#DEBUG_VALUE: i <- R15D
	leal	-1(%r15), %eax
	movq	-56(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %rbx
	negl	%r15d
.Ltmp402:
	.align	16, 0x90
.LBB19_9:                               # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: reversed:matrix_obj <- R12
	#DEBUG_VALUE: reversed:result_obj <- R14
	#DEBUG_VALUE: reversed:start_row <- 0
	.loc	3 838 9                 # matrix.c:838:9
	movq	(%rbx), %rdi
	xorl	%esi, %esi
	callq	pthread_join
.Ltmp403:
	.loc	3 836 6 discriminator 1 # matrix.c:836:6
	addq	$-8, %rbx
	incl	%r15d
	jne	.LBB19_9
.Ltmp404:
.LBB19_10:
	#DEBUG_VALUE: reversed:matrix_obj <- R12
	#DEBUG_VALUE: reversed:result_obj <- R14
	#DEBUG_VALUE: reversed:start_row <- 0
	.loc	3 841 2                 # matrix.c:841:2
	movl	8(%r12), %eax
	movl	%eax, 8(%r14)
	.loc	3 842 2                 # matrix.c:842:2
	movl	12(%r12), %eax
	movl	%eax, 12(%r14)
	.loc	3 843 2                 # matrix.c:843:2
	movl	16(%r12), %eax
	movl	%eax, 16(%r14)
	.loc	3 845 2                 # matrix.c:845:2
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	copy_occurances
	.loc	3 847 2                 # matrix.c:847:2
	movq	-48(%rbp), %rdi         # 8-byte Reload
	callq	free
	.loc	3 850 1                 # matrix.c:850:1
	movq	-64(%rbp), %rsp         # 8-byte Reload
	movq	%r14, %rax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
.Ltmp405:
	popq	%r13
	popq	%r14
.Ltmp406:
	popq	%r15
	popq	%rbp
	retq
.Ltmp407:
.Ltmp408:
	.size	reversed, .Ltmp408-reversed
.Lfunc_end19:
	.cfi_endproc

	.align	16, 0x90
	.type	reverse_worker,@function
reverse_worker:                         # @reverse_worker
.Lfunc_begin20:
	.loc	3 784 0                 # matrix.c:784:0
	.cfi_startproc
# BB#0:
	.loc	3 792 6 prologue_end    # matrix.c:792:6
	pushq	%rbp
.Ltmp409:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp410:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp411:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp412:
	.cfi_def_cfa_offset 40
.Ltmp413:
	.cfi_offset %rbx, -40
.Ltmp414:
	.cfi_offset %r14, -32
.Ltmp415:
	.cfi_offset %r15, -24
.Ltmp416:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: reverse_worker:arg <- RDI
	movl	16(%rdi), %eax
.Ltmp417:
	#DEBUG_VALUE: y <- EAX
	.loc	3 788 2                 # matrix.c:788:2
	movl	20(%rdi), %edx
	.loc	3 792 6 discriminator 1 # matrix.c:792:6
.Ltmp418:
	testl	%eax, %eax
	je	.LBB20_8
.Ltmp419:
# BB#1:                                 # %.lr.ph8
	#DEBUG_VALUE: reverse_worker:arg <- RDI
	#DEBUG_VALUE: y <- EAX
	.loc	3 788 2                 # matrix.c:788:2
	imulq	g_hard_width(%rip), %rdx
	.loc	3 787 2                 # matrix.c:787:2
	movq	(%rdi), %rcx
	.loc	3 786 2                 # matrix.c:786:2
	movq	8(%rdi), %rdi
.Ltmp420:
	.loc	3 789 2                 # matrix.c:789:2
	movq	%rdx, %rsi
	notq	%rsi
	addq	g_hard_elements(%rip), %rsi
	shlq	$2, %rsi
	addq	(%rdi), %rsi
.Ltmp421:
	#DEBUG_VALUE: reverse_worker:matrix <- RSI
	.loc	3 788 2                 # matrix.c:788:2
	shlq	$2, %rdx
	addq	(%rcx), %rdx
.Ltmp422:
	#DEBUG_VALUE: reverse_worker:result <- RDX
	.loc	3 794 7                 # matrix.c:794:7
	movq	g_soft_width(%rip), %r14
.Ltmp423:
	#DEBUG_VALUE: x <- R14D
	.loc	3 798 3                 # matrix.c:798:3
	movq	g_padding(%rip), %r8
	.loc	3 799 3                 # matrix.c:799:3
	movq	%r8, %r15
	negq	%r15
	movl	$4294967295, %ecx       # imm = 0xFFFFFFFF
.Ltmp424:
	.loc	3 792 6 discriminator 1 # matrix.c:792:6
	movq	%r14, %rbp
	addq	%rcx, %rbp
	movl	%ebp, %r9d
	incq	%r9
	movabsq	$-4294967296, %r10      # imm = 0xFFFFFFFF00000000
	orq	%rbp, %r10
	xorq	%rcx, %r10
	movl	%r14d, %r11d
	negl	%r11d
.Ltmp425:
	.align	16, 0x90
.LBB20_2:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB20_5 Depth 2
	testl	%r14d, %r14d
	je	.LBB20_3
# BB#4:                                 # %.lr.ph
                                        #   in Loop: Header=BB20_2 Depth=1
	leaq	(%rdx,%r9,4), %rbx
.Ltmp426:
	#DEBUG_VALUE: reverse_worker:result <- RBX
	movl	%r11d, %ebp
	movq	%rsi, %rcx
.Ltmp427:
	.align	16, 0x90
.LBB20_5:                               #   Parent Loop BB20_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: reverse_worker:result <- RBX
	.loc	3 796 4                 # matrix.c:796:4
	movl	(%rcx), %edi
	addq	$-4, %rcx
	movl	%edi, (%rdx)
	addq	$4, %rdx
.Ltmp428:
	.loc	3 794 7 discriminator 1 # matrix.c:794:7
	incl	%ebp
	jne	.LBB20_5
.Ltmp429:
# BB#6:                                 # %._crit_edge
                                        #   in Loop: Header=BB20_2 Depth=1
	#DEBUG_VALUE: reverse_worker:result <- RBX
	leaq	(%rsi,%r10,4), %rsi
.Ltmp430:
	#DEBUG_VALUE: reverse_worker:matrix <- RSI
	jmp	.LBB20_7
.Ltmp431:
	.align	16, 0x90
.LBB20_3:                               #   in Loop: Header=BB20_2 Depth=1
	movq	%rdx, %rbx
.LBB20_7:                               #   in Loop: Header=BB20_2 Depth=1
	.loc	3 798 3                 # matrix.c:798:3
	leaq	(%rbx,%r8,4), %rdx
.Ltmp432:
	#DEBUG_VALUE: reverse_worker:result <- RDX
	.loc	3 799 3                 # matrix.c:799:3
	leaq	(%rsi,%r15,4), %rsi
.Ltmp433:
	#DEBUG_VALUE: reverse_worker:matrix <- RSI
	.loc	3 792 6 discriminator 1 # matrix.c:792:6
	decl	%eax
.Ltmp434:
	#DEBUG_VALUE: y <- EAX
	jne	.LBB20_2
.Ltmp435:
.LBB20_8:                               # %._crit_edge9
	xorl	%eax, %eax
	.loc	3 802 2                 # matrix.c:802:2
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp436:
.Ltmp437:
	.size	reverse_worker, .Ltmp437-reverse_worker
.Lfunc_end20:
	.cfi_endproc

	.globl	transposed
	.align	16, 0x90
	.type	transposed,@function
transposed:                             # @transposed
.Lfunc_begin21:
	.loc	3 919 0                 # matrix.c:919:0
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp438:
	.cfi_def_cfa_offset 16
.Ltmp439:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp440:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
.Ltmp441:
	.cfi_offset %rbx, -56
.Ltmp442:
	.cfi_offset %r12, -48
.Ltmp443:
	.cfi_offset %r13, -40
.Ltmp444:
	.cfi_offset %r14, -32
.Ltmp445:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: transposed:matrix_obj <- RDI
	movq	%rdi, %r12
.Ltmp446:
	#DEBUG_VALUE: transposed:matrix_obj <- R12
	.loc	3 920 5 prologue_end    # matrix.c:920:5
	movq	24(%r12), %rax
	movb	8(%rax), %al
	andb	$-2, %al
	movzbl	%al, %eax
	cmpl	$2, %eax
	jne	.LBB21_1
.Ltmp447:
# BB#11:
	#DEBUG_VALUE: transposed:matrix_obj <- R12
	.loc	3 922 10                # matrix.c:922:10
	movq	%r12, %rdi
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
.Ltmp448:
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	cloned                  # TAILCALL
.Ltmp449:
.LBB21_1:
	#DEBUG_VALUE: transposed:matrix_obj <- R12
	.loc	3 925 25                # matrix.c:925:25
	callq	new_matrix
	movq	%rax, %r15
.Ltmp450:
	#DEBUG_VALUE: transposed:result_obj <- R15
	.loc	3 926 2                 # matrix.c:926:2
	movq	%rsp, -64(%rbp)         # 8-byte Spill
	movq	g_nthreads(%rip), %rax
	movq	%rsp, %rcx
	leaq	15(,%rax,8), %rax
	andq	$-16, %rax
	subq	%rax, %rcx
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	movq	%rcx, %rsp
	.loc	3 928 36                # matrix.c:928:36
	movq	g_nthreads(%rip), %rax
	shlq	$3, %rax
	leaq	(%rax,%rax,2), %rdi
	callq	malloc
	movq	%rax, -48(%rbp)         # 8-byte Spill
.Ltmp451:
	#DEBUG_VALUE: transposed:start_row <- 0
	.loc	3 930 6                 # matrix.c:930:6
	movq	g_nthreads(%rip), %rcx
.Ltmp452:
	#DEBUG_VALUE: i <- ECX
	.loc	3 930 6 discriminator 1 # matrix.c:930:6
	testl	%ecx, %ecx
	je	.LBB21_4
.Ltmp453:
# BB#2:                                 # %.lr.ph8
	#DEBUG_VALUE: transposed:matrix_obj <- R12
	#DEBUG_VALUE: transposed:result_obj <- R15
	#DEBUG_VALUE: transposed:start_row <- 0
	#DEBUG_VALUE: i <- ECX
	.loc	3 932 3                 # matrix.c:932:3
	movq	g_hard_width(%rip), %rdx
	movq	%rdx, %rax
	sarq	$63, %rax
	shrq	$62, %rax
	addq	%rdx, %rax
	sarq	$2, %rax
	cqto
	idivq	g_nthreads(%rip)
.Ltmp454:
	.loc	3 930 6 discriminator 1 # matrix.c:930:6
	leal	-1(%rcx), %edi
	leaq	(%rdi,%rdi,2), %rsi
	movq	-48(%rbp), %rbx         # 8-byte Reload
	leaq	20(%rbx,%rsi,8), %rsi
	subq	%rdi, %rdx
	negl	%ecx
.Ltmp455:
	xorl	%edi, %edi
.Ltmp456:
	.align	16, 0x90
.LBB21_3:                               # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: transposed:matrix_obj <- R12
	#DEBUG_VALUE: transposed:result_obj <- R15
	#DEBUG_VALUE: transposed:start_row <- 0
	.loc	3 932 3                 # matrix.c:932:3
	testq	%rdx, %rdx
	setg	%bl
	movzbl	%bl, %ebx
	addl	%eax, %ebx
.Ltmp457:
	#DEBUG_VALUE: this_rows <- EDI
	.loc	3 933 9                 # matrix.c:933:9
	movq	%r12, -20(%rsi)
	movq	%r15, -12(%rsi)
	movl	%ebx, -4(%rsi)
	movl	%edi, (%rsi)
	.loc	3 940 3                 # matrix.c:940:3
	addl	%ebx, %edi
.Ltmp458:
	#DEBUG_VALUE: transposed:start_row <- EDI
	.loc	3 930 6 discriminator 1 # matrix.c:930:6
	addq	$-24, %rsi
	incq	%rdx
	incl	%ecx
	jne	.LBB21_3
.Ltmp459:
.LBB21_4:                               # %._crit_edge9
	#DEBUG_VALUE: transposed:matrix_obj <- R12
	#DEBUG_VALUE: transposed:result_obj <- R15
	#DEBUG_VALUE: transposed:start_row <- 0
	.loc	3 943 6                 # matrix.c:943:6
	movq	g_nthreads(%rip), %r14
.Ltmp460:
	#DEBUG_VALUE: i <- R14D
	.loc	3 943 6 discriminator 1 # matrix.c:943:6
	testl	%r14d, %r14d
	je	.LBB21_7
.Ltmp461:
# BB#5:                                 # %.lr.ph4.preheader
	#DEBUG_VALUE: transposed:matrix_obj <- R12
	#DEBUG_VALUE: transposed:result_obj <- R15
	#DEBUG_VALUE: transposed:start_row <- 0
	#DEBUG_VALUE: i <- R14D
	leal	-1(%r14), %eax
	leaq	(%rax,%rax,2), %rcx
	movq	-48(%rbp), %rdx         # 8-byte Reload
	leaq	(%rdx,%rcx,8), %r13
	movq	-56(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %rbx
	negl	%r14d
.Ltmp462:
	.align	16, 0x90
.LBB21_6:                               # %.lr.ph4
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: transposed:matrix_obj <- R12
	#DEBUG_VALUE: transposed:result_obj <- R15
	#DEBUG_VALUE: transposed:start_row <- 0
	xorl	%esi, %esi
	.loc	3 945 9                 # matrix.c:945:9
.Ltmp463:
	movl	$transpose_worker, %edx
	movq	%rbx, %rdi
	movq	%r13, %rcx
	callq	pthread_create
.Ltmp464:
	.loc	3 943 6 discriminator 1 # matrix.c:943:6
	addq	$-24, %r13
	addq	$-8, %rbx
	incl	%r14d
	jne	.LBB21_6
.Ltmp465:
.LBB21_7:                               # %._crit_edge5
	#DEBUG_VALUE: transposed:matrix_obj <- R12
	#DEBUG_VALUE: transposed:result_obj <- R15
	#DEBUG_VALUE: transposed:start_row <- 0
	.loc	3 948 2                 # matrix.c:948:2
	movl	8(%r12), %eax
	movl	%eax, 8(%r15)
	.loc	3 949 2                 # matrix.c:949:2
	movl	12(%r12), %eax
	movl	%eax, 12(%r15)
	.loc	3 950 2                 # matrix.c:950:2
	movl	16(%r12), %eax
	movl	%eax, 16(%r15)
	.loc	3 952 2                 # matrix.c:952:2
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	copy_occurances
	.loc	3 954 6                 # matrix.c:954:6
.Ltmp466:
	movq	g_nthreads(%rip), %r14
.Ltmp467:
	#DEBUG_VALUE: i <- R14D
	.loc	3 954 6 discriminator 1 # matrix.c:954:6
	testl	%r14d, %r14d
	je	.LBB21_10
.Ltmp468:
# BB#8:                                 # %.lr.ph.preheader
	#DEBUG_VALUE: transposed:result_obj <- R15
	#DEBUG_VALUE: transposed:start_row <- 0
	#DEBUG_VALUE: i <- R14D
	leal	-1(%r14), %eax
	movq	-56(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %rbx
	negl	%r14d
.Ltmp469:
	.align	16, 0x90
.LBB21_9:                               # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: transposed:result_obj <- R15
	#DEBUG_VALUE: transposed:start_row <- 0
	.loc	3 956 9                 # matrix.c:956:9
	movq	(%rbx), %rdi
	xorl	%esi, %esi
	callq	pthread_join
.Ltmp470:
	.loc	3 954 6 discriminator 1 # matrix.c:954:6
	addq	$-8, %rbx
	incl	%r14d
	jne	.LBB21_9
.Ltmp471:
.LBB21_10:
	#DEBUG_VALUE: transposed:result_obj <- R15
	#DEBUG_VALUE: transposed:start_row <- 0
	.loc	3 959 2                 # matrix.c:959:2
	movq	-48(%rbp), %rdi         # 8-byte Reload
	callq	free
	.loc	3 962 1                 # matrix.c:962:1
	movq	-64(%rbp), %rsp         # 8-byte Reload
	movq	%r15, %rax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
.Ltmp472:
	popq	%rbp
	retq
.Ltmp473:
.Ltmp474:
	.size	transposed, .Ltmp474-transposed
.Lfunc_end21:
	.cfi_endproc

	.align	16, 0x90
	.type	transpose_worker,@function
transpose_worker:                       # @transpose_worker
.Lfunc_begin22:
	.loc	3 865 0                 # matrix.c:865:0
	.cfi_startproc
# BB#0:
	.loc	3 872 6 prologue_end    # matrix.c:872:6
	pushq	%rbp
.Ltmp475:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp476:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp477:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp478:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp479:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp480:
	.cfi_def_cfa_offset 56
.Ltmp481:
	.cfi_offset %rbx, -56
.Ltmp482:
	.cfi_offset %r12, -48
.Ltmp483:
	.cfi_offset %r13, -40
.Ltmp484:
	.cfi_offset %r14, -32
.Ltmp485:
	.cfi_offset %r15, -24
.Ltmp486:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: transpose_worker:arg <- RDI
	movl	16(%rdi), %eax
.Ltmp487:
	#DEBUG_VALUE: y <- EAX
	.loc	3 872 6 discriminator 1 # matrix.c:872:6
	testl	%eax, %eax
	je	.LBB22_6
.Ltmp488:
# BB#1:                                 # %.preheader.lr.ph
	#DEBUG_VALUE: transpose_worker:arg <- RDI
	#DEBUG_VALUE: y <- EAX
	.loc	3 869 2                 # matrix.c:869:2
	movq	g_hard_width(%rip), %rcx
	movq	%rcx, %rbp
	sarq	$63, %rbp
	shrq	$62, %rbp
	addq	%rcx, %rbp
	sarq	$2, %rbp
.Ltmp489:
	#DEBUG_VALUE: transpose_worker:tile_width <- EBP
	.loc	3 871 2                 # matrix.c:871:2
	movq	%rbp, -8(%rsp)          # 8-byte Spill
	movl	20(%rdi), %ecx
.Ltmp490:
	#DEBUG_VALUE: transpose_worker:curr_y <- ECX
	.loc	3 867 2                 # matrix.c:867:2
	movq	(%rdi), %rdx
	.loc	3 868 2                 # matrix.c:868:2
	movq	8(%rdi), %rsi
	movq	(%rsi), %rsi
.Ltmp491:
	#DEBUG_VALUE: transpose_worker:result <- [RSP+-24]
	.loc	3 867 2                 # matrix.c:867:2
	movq	%rsi, -24(%rsp)         # 8-byte Spill
	movq	(%rdx), %rdx
.Ltmp492:
	#DEBUG_VALUE: transpose_worker:matrix <- [RSP+-32]
	.loc	3 893 4                 # matrix.c:893:4
	movq	%rdx, -32(%rsp)         # 8-byte Spill
	movq	g_hard_width(%rip), %rsi
.Ltmp493:
	.loc	3 872 6 discriminator 1 # matrix.c:872:6
	movl	%ecx, %edx
	imull	%ebp, %edx
	shll	$2, %edx
	leal	(,%rbp,4), %edi
.Ltmp494:
	movl	%edi, -12(%rsp)         # 4-byte Spill
	leal	(%rbp,%rbp,2), %edi
	shlq	$4, %rdi
	movq	%rdi, -40(%rsp)         # 8-byte Spill
	movq	%rbp, %rdi
	andq	$2147483647, %rdi       # imm = 0x7FFFFFFF
	shlq	$5, %rdi
	movq	%rdi, -48(%rsp)         # 8-byte Spill
	movl	%ebp, %edi
	shlq	$4, %rdi
	movq	%rdi, -56(%rsp)         # 8-byte Spill
	shlq	$4, %rsi
	movl	%ebp, %edi
.Ltmp495:
	#DEBUG_VALUE: transpose_worker:tile_width <- [RSP+-8]
	negl	%edi
	movl	%edi, -60(%rsp)         # 4-byte Spill
.Ltmp496:
	.align	16, 0x90
.LBB22_2:                               # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB22_4 Depth 2
	#DEBUG_VALUE: transpose_worker:tile_width <- [RSP+-8]
	#DEBUG_VALUE: transpose_worker:result <- [RSP+-24]
	#DEBUG_VALUE: transpose_worker:matrix <- [RSP+-32]
	movl	%edx, %ebp
	movl	%ecx, %edi
	movq	-8(%rsp), %rbx          # 8-byte Reload
	testl	%ebx, %ebx
	je	.LBB22_5
# BB#3:                                 # %.lr.ph
                                        #   in Loop: Header=BB22_2 Depth=1
	#DEBUG_VALUE: transpose_worker:tile_width <- [RSP+-8]
	#DEBUG_VALUE: transpose_worker:result <- [RSP+-24]
	#DEBUG_VALUE: transpose_worker:matrix <- [RSP+-32]
	shlq	$4, %rbp
	shlq	$4, %rdi
	movl	%eax, %r14d
	movq	-40(%rsp), %rax         # 8-byte Reload
.Ltmp497:
	.loc	3 875 7 discriminator 1 # matrix.c:875:7
	leaq	(%rax,%rbp), %rbx
	movl	%ecx, %r9d
	movq	-48(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rbp), %r8
	movl	%edx, %r11d
	movq	-56(%rsp), %rdx         # 8-byte Reload
	leaq	(%rdx,%rbp), %r10
	leaq	(%rdx,%rdi), %r15
	movl	%r11d, %edx
	leaq	(%rcx,%rdi), %r11
	movl	%r9d, %ecx
	leaq	(%rax,%rdi), %r9
	movl	%r14d, %eax
	movl	-60(%rsp), %r14d        # 4-byte Reload
	movq	-24(%rsp), %r12         # 8-byte Reload
	movq	-32(%rsp), %r13         # 8-byte Reload
.Ltmp498:
	.align	16, 0x90
.LBB22_4:                               #   Parent Loop BB22_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: transpose_worker:tile_width <- [RSP+-8]
	#DEBUG_VALUE: transpose_worker:result <- [RSP+-24]
	#DEBUG_VALUE: transpose_worker:matrix <- [RSP+-32]
	.loc	3 883 17                # matrix.c:883:17
	vmovdqa	(%rbp,%r13), %xmm0
	vmovdqa	(%r10,%r13), %xmm1
	vpunpckldq	%xmm1, %xmm0, %xmm2 # xmm2 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	.loc	3 884 17                # matrix.c:884:17
	vmovdqa	(%r8,%r13), %xmm3
	vmovdqa	(%rbx,%r13), %xmm4
	vpunpckldq	%xmm4, %xmm3, %xmm5 # xmm5 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
	.loc	3 885 17                # matrix.c:885:17
	vpunpckhdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[2],xmm1[2],xmm0[3],xmm1[3]
	.loc	3 886 17                # matrix.c:886:17
	vpunpckhdq	%xmm4, %xmm3, %xmm1 # xmm1 = xmm3[2],xmm4[2],xmm3[3],xmm4[3]
	.loc	3 888 11                # matrix.c:888:11
	vpunpcklqdq	%xmm5, %xmm2, %xmm3 # xmm3 = xmm2[0],xmm5[0]
.Ltmp499:
	#DEBUG_VALUE: row1 <- XMM3
	.loc	3 889 11                # matrix.c:889:11
	vpunpckhqdq	%xmm5, %xmm2, %xmm2 # xmm2 = xmm2[1],xmm5[1]
.Ltmp500:
	#DEBUG_VALUE: row2 <- XMM2
	.loc	3 890 11                # matrix.c:890:11
	vpunpcklqdq	%xmm1, %xmm0, %xmm4 # xmm4 = xmm0[0],xmm1[0]
.Ltmp501:
	#DEBUG_VALUE: row3 <- XMM4
	.loc	3 891 11                # matrix.c:891:11
	vpunpckhqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[1],xmm1[1]
.Ltmp502:
	#DEBUG_VALUE: row4 <- XMM0
	.loc	3 893 4                 # matrix.c:893:4
	vmovdqa	%xmm3, (%rdi,%r12)
	.loc	3 894 4                 # matrix.c:894:4
	vmovdqa	%xmm2, (%r15,%r12)
	.loc	3 895 4                 # matrix.c:895:4
	vmovdqa	%xmm4, (%r11,%r12)
	.loc	3 896 4                 # matrix.c:896:4
	vmovdqa	%xmm0, (%r9,%r12)
.Ltmp503:
	.loc	3 875 7 discriminator 1 # matrix.c:875:7
	addq	$16, %r13
	addq	%rsi, %r12
	incl	%r14d
	jne	.LBB22_4
.Ltmp504:
.LBB22_5:                               # %._crit_edge
                                        #   in Loop: Header=BB22_2 Depth=1
	#DEBUG_VALUE: transpose_worker:tile_width <- [RSP+-8]
	#DEBUG_VALUE: transpose_worker:result <- [RSP+-24]
	#DEBUG_VALUE: transpose_worker:matrix <- [RSP+-32]
	.loc	3 872 6 discriminator 1 # matrix.c:872:6
	decl	%eax
.Ltmp505:
	#DEBUG_VALUE: y <- EAX
	.loc	3 900 3                 # matrix.c:900:3
	incl	%ecx
.Ltmp506:
	#DEBUG_VALUE: transpose_worker:curr_y <- ECX
	.loc	3 872 6 discriminator 1 # matrix.c:872:6
	addl	-12(%rsp), %edx         # 4-byte Folded Reload
	testl	%eax, %eax
	jne	.LBB22_2
.Ltmp507:
.LBB22_6:                               # %._crit_edge14
	xorl	%eax, %eax
	.loc	3 915 2                 # matrix.c:915:2
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp508:
.Ltmp509:
	.size	transpose_worker, .Ltmp509-transpose_worker
.Lfunc_end22:
	.cfi_endproc

	.globl	scalar_add
	.align	16, 0x90
	.type	scalar_add,@function
scalar_add:                             # @scalar_add
.Lfunc_begin23:
	.loc	3 1034 0                # matrix.c:1034:0
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp510:
	.cfi_def_cfa_offset 16
.Ltmp511:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp512:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$72, %rsp
.Ltmp513:
	.cfi_offset %rbx, -56
.Ltmp514:
	.cfi_offset %r12, -48
.Ltmp515:
	.cfi_offset %r13, -40
.Ltmp516:
	.cfi_offset %r14, -32
.Ltmp517:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: scalar_add:matrix_obj <- RDI
	#DEBUG_VALUE: scalar_add:scalar <- ESI
	movl	%esi, %r13d
.Ltmp518:
	#DEBUG_VALUE: scalar_add:scalar <- R13D
	.loc	3 1035 5 prologue_end   # matrix.c:1035:5
	testl	%r13d, %r13d
	je	.LBB23_21
.Ltmp519:
# BB#1:
	#DEBUG_VALUE: scalar_add:matrix_obj <- RDI
	#DEBUG_VALUE: scalar_add:scalar <- R13D
	movq	%rdi, %rbx
.Ltmp520:
	#DEBUG_VALUE: scalar_add:matrix_obj <- RBX
	.loc	3 1040 34               # matrix.c:1040:34
	movq	%rbx, -48(%rbp)         # 8-byte Spill
	callq	new_matrix
	movq	%rax, %r12
.Ltmp521:
	#DEBUG_VALUE: scalar_add:result_obj <- R12
	.loc	3 1042 2                # matrix.c:1042:2
	movq	%rsp, -88(%rbp)         # 8-byte Spill
	movq	g_nthreads(%rip), %rax
	movq	%rsp, %rcx
	leaq	15(,%rax,8), %rax
	andq	$-16, %rax
	subq	%rax, %rcx
	movq	%rcx, -64(%rbp)         # 8-byte Spill
	movq	%rcx, %rsp
.Ltmp522:
	#DEBUG_VALUE: scalar_add:do_min_max_sum <- 1
	.loc	3 1048 6                # matrix.c:1048:6
	movl	12(%rbx), %eax
.Ltmp523:
	#DEBUG_VALUE: scalar_add:matrix_obj <- [RBP+-48]
	leal	(%rax,%r13), %ecx
	cmpl	%eax, %ecx
	jbe	.LBB23_3
.Ltmp524:
# BB#2:
	#DEBUG_VALUE: scalar_add:matrix_obj <- [RBP+-48]
	#DEBUG_VALUE: scalar_add:scalar <- R13D
	#DEBUG_VALUE: scalar_add:result_obj <- R12
	#DEBUG_VALUE: scalar_add:do_min_max_sum <- 1
	.loc	3 1048 6 discriminator 1 # matrix.c:1048:6
	movq	-48(%rbp), %rax         # 8-byte Reload
	movl	8(%rax), %eax
	leal	(%rax,%r13), %ecx
	xorl	%esi, %esi
	movl	$0, %r15d
	movl	$0, %r14d
	movl	$0, %ebx
	movl	$0, %edx
	movq	%rdx, -56(%rbp)         # 8-byte Spill
	cmpl	%eax, %ecx
.Ltmp525:
	#DEBUG_VALUE: scalar_add:do_min_max_sum <- 0
	ja	.LBB23_4
.Ltmp526:
.LBB23_3:
	#DEBUG_VALUE: scalar_add:matrix_obj <- [RBP+-48]
	#DEBUG_VALUE: scalar_add:scalar <- R13D
	#DEBUG_VALUE: scalar_add:result_obj <- R12
	#DEBUG_VALUE: scalar_add:do_min_max_sum <- 1
	.loc	3 1067 10               # matrix.c:1067:10
	movq	g_nthreads(%rip), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, -56(%rbp)         # 8-byte Spill
.Ltmp527:
	#DEBUG_VALUE: scalar_add:mins <- [RBP+-56]
	.loc	3 1068 11               # matrix.c:1068:11
	movq	g_nthreads(%rip), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, %rbx
.Ltmp528:
	#DEBUG_VALUE: scalar_add:maxes <- RBX
	.loc	3 1069 10               # matrix.c:1069:10
	movq	g_nthreads(%rip), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, %r14
.Ltmp529:
	#DEBUG_VALUE: scalar_add:sums <- R14
	movl	$1, %r15d
	movb	$1, %sil
.Ltmp530:
.LBB23_4:
	#DEBUG_VALUE: scalar_add:matrix_obj <- [RBP+-48]
	#DEBUG_VALUE: scalar_add:scalar <- R13D
	#DEBUG_VALUE: scalar_add:result_obj <- R12
	#DEBUG_VALUE: scalar_add:do_min_max_sum <- 1
	movq	%rsi, -80(%rbp)         # 8-byte Spill
	.loc	3 1072 37               # matrix.c:1072:37
	movq	g_nthreads(%rip), %rdi
	shlq	$6, %rdi
	callq	malloc
	movq	%rax, -72(%rbp)         # 8-byte Spill
.Ltmp531:
	#DEBUG_VALUE: scalar_add:start_row <- 0
	.loc	3 1074 6                # matrix.c:1074:6
	movq	g_nthreads(%rip), %rcx
.Ltmp532:
	#DEBUG_VALUE: i <- ECX
	.loc	3 1074 6 discriminator 1 # matrix.c:1074:6
	testl	%ecx, %ecx
	movq	-48(%rbp), %r8          # 8-byte Reload
.Ltmp533:
	#DEBUG_VALUE: scalar_add:matrix_obj <- R8
	movq	-56(%rbp), %r9          # 8-byte Reload
	movq	%rbx, %r10
	je	.LBB23_7
.Ltmp534:
# BB#5:                                 # %.lr.ph17
	#DEBUG_VALUE: scalar_add:matrix_obj <- R8
	#DEBUG_VALUE: scalar_add:scalar <- R13D
	#DEBUG_VALUE: scalar_add:result_obj <- R12
	#DEBUG_VALUE: scalar_add:do_min_max_sum <- 1
	#DEBUG_VALUE: scalar_add:start_row <- 0
	#DEBUG_VALUE: i <- ECX
	.loc	3 1076 3                # matrix.c:1076:3
	movq	g_height(%rip), %rax
	cqto
	idivq	g_nthreads(%rip)
.Ltmp535:
	.loc	3 1074 6 discriminator 1 # matrix.c:1074:6
	decl	%ecx
.Ltmp536:
	subq	%rcx, %rdx
	movq	%rcx, %rsi
	shlq	$6, %rsi
	movq	-72(%rbp), %rdi         # 8-byte Reload
	leaq	56(%rsi,%rdi), %rsi
	xorl	%edi, %edi
.Ltmp537:
	.align	16, 0x90
.LBB23_6:                               # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: scalar_add:matrix_obj <- R8
	#DEBUG_VALUE: scalar_add:scalar <- R13D
	#DEBUG_VALUE: scalar_add:result_obj <- R12
	#DEBUG_VALUE: scalar_add:do_min_max_sum <- 1
	#DEBUG_VALUE: scalar_add:start_row <- 0
	.loc	3 1076 3                # matrix.c:1076:3
	testq	%rdx, %rdx
	setg	%bl
	movzbl	%bl, %ebx
	addl	%eax, %ebx
.Ltmp538:
	#DEBUG_VALUE: this_rows <- EDI
	.loc	3 1077 9                # matrix.c:1077:9
	movq	%r8, -56(%rsi)
	movq	%r12, -48(%rsi)
	movq	%r9, -40(%rsi)
	movq	%r10, -32(%rsi)
	movq	%r14, -24(%rsi)
	movl	%r13d, -16(%rsi)
	movl	%ebx, -12(%rsi)
	movl	%edi, -8(%rsi)
	movl	%ecx, -4(%rsi)
	movl	%r15d, (%rsi)
	.loc	3 1090 3                # matrix.c:1090:3
	addl	%ebx, %edi
.Ltmp539:
	#DEBUG_VALUE: scalar_add:start_row <- EDI
	.loc	3 1074 6 discriminator 1 # matrix.c:1074:6
	decl	%ecx
	addq	$-64, %rsi
	incq	%rdx
	cmpl	$-1, %ecx
	jne	.LBB23_6
.Ltmp540:
.LBB23_7:                               # %._crit_edge18
	#DEBUG_VALUE: scalar_add:matrix_obj <- R8
	#DEBUG_VALUE: scalar_add:scalar <- R13D
	#DEBUG_VALUE: scalar_add:result_obj <- R12
	#DEBUG_VALUE: scalar_add:do_min_max_sum <- 1
	#DEBUG_VALUE: scalar_add:start_row <- 0
	movq	%r10, -104(%rbp)        # 8-byte Spill
.Ltmp541:
	#DEBUG_VALUE: scalar_add:matrix_obj <- [RBP+-48]
	movq	%r13, -96(%rbp)         # 8-byte Spill
.Ltmp542:
	#DEBUG_VALUE: scalar_add:scalar <- [RBP+-96]
	movq	%r12, %r15
.Ltmp543:
	#DEBUG_VALUE: scalar_add:result_obj <- R15
	.loc	3 1093 6                # matrix.c:1093:6
	movq	g_nthreads(%rip), %rbx
.Ltmp544:
	#DEBUG_VALUE: i <- EBX
	.loc	3 1093 6 discriminator 1 # matrix.c:1093:6
	testl	%ebx, %ebx
	je	.LBB23_10
.Ltmp545:
# BB#8:                                 # %.lr.ph14.preheader
	#DEBUG_VALUE: scalar_add:matrix_obj <- [RBP+-48]
	#DEBUG_VALUE: scalar_add:scalar <- [RBP+-96]
	#DEBUG_VALUE: scalar_add:result_obj <- R15
	#DEBUG_VALUE: scalar_add:do_min_max_sum <- 1
	#DEBUG_VALUE: scalar_add:start_row <- 0
	#DEBUG_VALUE: i <- EBX
	leal	-1(%rbx), %r12d
	movq	-64(%rbp), %rax         # 8-byte Reload
	leaq	(%rax,%r12,8), %r13
	shlq	$6, %r12
	addq	-72(%rbp), %r12         # 8-byte Folded Reload
	negl	%ebx
.Ltmp546:
	.align	16, 0x90
.LBB23_9:                               # %.lr.ph14
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: scalar_add:matrix_obj <- [RBP+-48]
	#DEBUG_VALUE: scalar_add:scalar <- [RBP+-96]
	#DEBUG_VALUE: scalar_add:result_obj <- R15
	#DEBUG_VALUE: scalar_add:do_min_max_sum <- 1
	#DEBUG_VALUE: scalar_add:start_row <- 0
	xorl	%esi, %esi
	.loc	3 1095 9                # matrix.c:1095:9
.Ltmp547:
	movl	$scalar_add_worker, %edx
	movq	%r13, %rdi
	movq	%r12, %rcx
	callq	pthread_create
.Ltmp548:
	.loc	3 1093 6 discriminator 1 # matrix.c:1093:6
	addq	$-64, %r12
	addq	$-8, %r13
	incl	%ebx
	jne	.LBB23_9
.Ltmp549:
.LBB23_10:                              # %._crit_edge
	#DEBUG_VALUE: scalar_add:matrix_obj <- [RBP+-48]
	#DEBUG_VALUE: scalar_add:scalar <- [RBP+-96]
	#DEBUG_VALUE: scalar_add:result_obj <- R15
	#DEBUG_VALUE: scalar_add:do_min_max_sum <- 1
	#DEBUG_VALUE: scalar_add:start_row <- 0
	#DEBUG_VALUE: scalar_add:min <- -1
	#DEBUG_VALUE: scalar_add:max <- 0
	#DEBUG_VALUE: scalar_add:sum <- 0
	movq	%r15, %rbx
.Ltmp550:
	#DEBUG_VALUE: scalar_add:result_obj <- RBX
	.loc	3 1101 2                # matrix.c:1101:2
	movq	%rbx, %rdi
	callq	reset_occurances
	.loc	3 1103 5                # matrix.c:1103:5
.Ltmp551:
	movq	-80(%rbp), %rax         # 8-byte Reload
	testb	%al, %al
	je	.LBB23_15
.Ltmp552:
# BB#11:
	#DEBUG_VALUE: scalar_add:result_obj <- RBX
	#DEBUG_VALUE: scalar_add:do_min_max_sum <- 1
	#DEBUG_VALUE: scalar_add:start_row <- 0
	#DEBUG_VALUE: scalar_add:min <- -1
	#DEBUG_VALUE: scalar_add:max <- 0
	#DEBUG_VALUE: scalar_add:sum <- 0
	movq	%rbx, -80(%rbp)         # 8-byte Spill
.Ltmp553:
	#DEBUG_VALUE: scalar_add:result_obj <- [RBP+-80]
	.loc	3 1105 7                # matrix.c:1105:7
	movq	g_nthreads(%rip), %rsi
.Ltmp554:
	#DEBUG_VALUE: i <- ESI
	.loc	3 1105 7 discriminator 1 # matrix.c:1105:7
	testl	%esi, %esi
	je	.LBB23_12
.Ltmp555:
# BB#13:                                # %.lr.ph.preheader
	#DEBUG_VALUE: scalar_add:result_obj <- [RBP+-80]
	#DEBUG_VALUE: scalar_add:do_min_max_sum <- 1
	#DEBUG_VALUE: scalar_add:start_row <- 0
	#DEBUG_VALUE: scalar_add:min <- -1
	#DEBUG_VALUE: scalar_add:max <- 0
	#DEBUG_VALUE: scalar_add:sum <- 0
	#DEBUG_VALUE: i <- ESI
	leal	-1(%rsi), %eax
	movq	-104(%rbp), %rcx        # 8-byte Reload
	leaq	(%rcx,%rax,4), %rdi
	movq	-56(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,4), %r15
	leaq	(%r14,%rax,4), %r14
	movq	-64(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %r12
	negl	%esi
.Ltmp556:
	movl	$-1, %edx
	xorl	%ecx, %ecx
	xorl	%r13d, %r13d
.Ltmp557:
	.align	16, 0x90
.LBB23_14:                              # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: scalar_add:result_obj <- [RBP+-80]
	#DEBUG_VALUE: scalar_add:do_min_max_sum <- 1
	#DEBUG_VALUE: scalar_add:start_row <- 0
	#DEBUG_VALUE: scalar_add:min <- -1
	#DEBUG_VALUE: scalar_add:max <- 0
	#DEBUG_VALUE: scalar_add:sum <- 0
	.loc	3 1107 4                # matrix.c:1107:4
	movq	%rdi, -64(%rbp)         # 8-byte Spill
	movq	%rsi, -56(%rbp)         # 8-byte Spill
	movq	%r13, -48(%rbp)         # 8-byte Spill
	movq	(%r12), %rdi
	xorl	%esi, %esi
	movl	%edx, %r13d
	movq	%rcx, %rbx
	callq	pthread_join
	movq	-64(%rbp), %rdi         # 8-byte Reload
	movq	%rbx, %rcx
	movq	-56(%rbp), %rsi         # 8-byte Reload
	movl	%r13d, %edx
	movq	-48(%rbp), %r13         # 8-byte Reload
	.loc	3 1108 4                # matrix.c:1108:4
	addl	(%r14), %ecx
.Ltmp558:
	#DEBUG_VALUE: scalar_add:sum <- ECX
	.loc	3 1109 7                # matrix.c:1109:7
	movl	(%r15), %eax
.Ltmp559:
	#DEBUG_VALUE: scalar_add:min <- EAX
	cmpl	%edx, %eax
	cmovbl	%eax, %edx
.Ltmp560:
	.loc	3 1110 7                # matrix.c:1110:7
	movl	(%rdi), %eax
.Ltmp561:
	#DEBUG_VALUE: scalar_add:max <- EAX
	cmpl	%r13d, %eax
	cmoval	%eax, %r13d
.Ltmp562:
	.loc	3 1105 7 discriminator 1 # matrix.c:1105:7
	addq	$-4, %rdi
	addq	$-4, %r15
	addq	$-4, %r14
	addq	$-8, %r12
	incl	%esi
	jne	.LBB23_14
	jmp	.LBB23_20
.Ltmp563:
.LBB23_21:
	leaq	-40(%rbp), %rsp
.Ltmp564:
	#DEBUG_VALUE: scalar_add:matrix_obj <- RDI
	.loc	3 1037 10               # matrix.c:1037:10
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	cloned                  # TAILCALL
.Ltmp565:
.LBB23_15:
	#DEBUG_VALUE: scalar_add:matrix_obj <- [RBP+-48]
	#DEBUG_VALUE: scalar_add:scalar <- [RBP+-96]
	#DEBUG_VALUE: scalar_add:result_obj <- RBX
	#DEBUG_VALUE: scalar_add:do_min_max_sum <- 1
	#DEBUG_VALUE: scalar_add:start_row <- 0
	#DEBUG_VALUE: scalar_add:min <- -1
	#DEBUG_VALUE: scalar_add:max <- 0
	#DEBUG_VALUE: scalar_add:sum <- 0
	movq	%rbx, -80(%rbp)         # 8-byte Spill
.Ltmp566:
	#DEBUG_VALUE: scalar_add:result_obj <- [RBP+-80]
	movq	-48(%rbp), %rcx         # 8-byte Reload
.Ltmp567:
	#DEBUG_VALUE: scalar_add:matrix_obj <- RCX
	movl	8(%rcx), %edx
	movq	-96(%rbp), %rax         # 8-byte Reload
.Ltmp568:
	#DEBUG_VALUE: scalar_add:scalar <- EAX
	.loc	3 1115 3                # matrix.c:1115:3
	addl	%eax, %edx
.Ltmp569:
	#DEBUG_VALUE: scalar_add:min <- EDX
	movl	12(%rcx), %r13d
	.loc	3 1116 3                # matrix.c:1116:3
	addl	%eax, %r13d
.Ltmp570:
	#DEBUG_VALUE: scalar_add:max <- R13D
	.loc	3 1117 3                # matrix.c:1117:3
	imull	g_soft_elements(%rip), %eax
.Ltmp571:
	addl	16(%rcx), %eax
	.loc	3 1118 7                # matrix.c:1118:7
.Ltmp572:
	movq	g_nthreads(%rip), %r14
.Ltmp573:
	#DEBUG_VALUE: i <- R14D
	.loc	3 1118 7 discriminator 1 # matrix.c:1118:7
	testl	%r14d, %r14d
.Ltmp574:
	#DEBUG_VALUE: scalar_add:sum <- EAX
	je	.LBB23_16
.Ltmp575:
# BB#17:                                # %.lr.ph13.preheader
	#DEBUG_VALUE: scalar_add:result_obj <- [RBP+-80]
	#DEBUG_VALUE: scalar_add:do_min_max_sum <- 1
	#DEBUG_VALUE: scalar_add:start_row <- 0
	#DEBUG_VALUE: scalar_add:min <- EDX
	#DEBUG_VALUE: scalar_add:max <- R13D
	#DEBUG_VALUE: scalar_add:sum <- EAX
	#DEBUG_VALUE: i <- R14D
	movl	%edx, %r12d
.Ltmp576:
	#DEBUG_VALUE: scalar_add:min <- R12D
	movq	%rax, %r15
.Ltmp577:
	#DEBUG_VALUE: scalar_add:sum <- R15D
	leal	-1(%r14), %eax
	movq	-64(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %rbx
	negl	%r14d
.Ltmp578:
	.align	16, 0x90
.LBB23_18:                              # %.lr.ph13
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: scalar_add:result_obj <- [RBP+-80]
	#DEBUG_VALUE: scalar_add:do_min_max_sum <- 1
	#DEBUG_VALUE: scalar_add:start_row <- 0
	#DEBUG_VALUE: scalar_add:min <- R12D
	#DEBUG_VALUE: scalar_add:max <- R13D
	#DEBUG_VALUE: scalar_add:sum <- R15D
	.loc	3 1120 4                # matrix.c:1120:4
	movq	(%rbx), %rdi
	xorl	%esi, %esi
	callq	pthread_join
.Ltmp579:
	.loc	3 1118 7 discriminator 1 # matrix.c:1118:7
	addq	$-8, %rbx
	incl	%r14d
	jne	.LBB23_18
.Ltmp580:
# BB#19:
	#DEBUG_VALUE: scalar_add:result_obj <- [RBP+-80]
	#DEBUG_VALUE: scalar_add:do_min_max_sum <- 1
	#DEBUG_VALUE: scalar_add:start_row <- 0
	#DEBUG_VALUE: scalar_add:min <- R12D
	#DEBUG_VALUE: scalar_add:max <- R13D
	#DEBUG_VALUE: scalar_add:sum <- R15D
	movq	%r15, %rcx
.Ltmp581:
	#DEBUG_VALUE: scalar_add:sum <- ECX
	movl	%r12d, %edx
.Ltmp582:
	#DEBUG_VALUE: scalar_add:min <- EDX
	jmp	.LBB23_20
.Ltmp583:
.LBB23_12:
	#DEBUG_VALUE: scalar_add:result_obj <- [RBP+-80]
	#DEBUG_VALUE: scalar_add:do_min_max_sum <- 1
	#DEBUG_VALUE: scalar_add:start_row <- 0
	#DEBUG_VALUE: scalar_add:min <- -1
	#DEBUG_VALUE: scalar_add:max <- 0
	#DEBUG_VALUE: scalar_add:sum <- 0
	movl	$-1, %edx
	xorl	%r13d, %r13d
	xorl	%ecx, %ecx
	jmp	.LBB23_20
.Ltmp584:
.LBB23_16:
	#DEBUG_VALUE: scalar_add:result_obj <- [RBP+-80]
	#DEBUG_VALUE: scalar_add:do_min_max_sum <- 1
	#DEBUG_VALUE: scalar_add:start_row <- 0
	#DEBUG_VALUE: scalar_add:min <- EDX
	#DEBUG_VALUE: scalar_add:max <- R13D
	#DEBUG_VALUE: scalar_add:sum <- EAX
	movq	%rax, %rcx
.Ltmp585:
	#DEBUG_VALUE: scalar_add:sum <- ECX
.LBB23_20:
	#DEBUG_VALUE: scalar_add:result_obj <- [RBP+-80]
	#DEBUG_VALUE: scalar_add:do_min_max_sum <- 1
	#DEBUG_VALUE: scalar_add:start_row <- 0
	#DEBUG_VALUE: scalar_add:min <- -1
	#DEBUG_VALUE: scalar_add:max <- 0
	#DEBUG_VALUE: scalar_add:sum <- 0
	movq	-80(%rbp), %rbx         # 8-byte Reload
.Ltmp586:
	#DEBUG_VALUE: scalar_add:result_obj <- RBX
	.loc	3 1125 2                # matrix.c:1125:2
	movl	%edx, 8(%rbx)
	.loc	3 1126 2                # matrix.c:1126:2
	movl	%r13d, 12(%rbx)
	.loc	3 1127 2                # matrix.c:1127:2
	movl	%ecx, 16(%rbx)
	.loc	3 1129 2                # matrix.c:1129:2
	movq	-72(%rbp), %rdi         # 8-byte Reload
	callq	free
	.loc	3 1132 1                # matrix.c:1132:1
	movq	-88(%rbp), %rsp         # 8-byte Reload
	movq	%rbx, %rax
	leaq	-40(%rbp), %rsp
	popq	%rbx
.Ltmp587:
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp588:
.Ltmp589:
	.size	scalar_add, .Ltmp589-scalar_add
.Lfunc_end23:
	.cfi_endproc

	.align	16, 0x90
	.type	scalar_add_worker,@function
scalar_add_worker:                      # @scalar_add_worker
.Lfunc_begin24:
	.loc	3 983 0                 # matrix.c:983:0
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp590:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp591:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp592:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp593:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp594:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp595:
	.cfi_def_cfa_offset 56
.Ltmp596:
	.cfi_offset %rbx, -56
.Ltmp597:
	.cfi_offset %r12, -48
.Ltmp598:
	.cfi_offset %r13, -40
.Ltmp599:
	.cfi_offset %r14, -32
.Ltmp600:
	.cfi_offset %r15, -24
.Ltmp601:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: scalar_add_worker:arg <- RDI
	movl	$4294967295, %ebx       # imm = 0xFFFFFFFF
	.loc	3 985 2 prologue_end    # matrix.c:985:2
.Ltmp602:
	movq	(%rdi), %rax
	.loc	3 986 2                 # matrix.c:986:2
	movq	8(%rdi), %rcx
	.loc	3 987 2                 # matrix.c:987:2
	movl	40(%rdi), %r13d
.Ltmp603:
	#DEBUG_VALUE: scalar_add_worker:scalar <- R13D
	.loc	3 989 2                 # matrix.c:989:2
	movl	48(%rdi), %esi
	imulq	g_hard_width(%rip), %rsi
	shlq	$2, %rsi
	movq	(%rax), %r10
	addq	%rsi, %r10
.Ltmp604:
	#DEBUG_VALUE: scalar_add_worker:matrix <- R10
	.loc	3 990 2                 # matrix.c:990:2
	addq	(%rcx), %rsi
.Ltmp605:
	#DEBUG_VALUE: scalar_add_worker:result <- RSI
	.loc	3 992 5                 # matrix.c:992:5
	cmpl	$0, 56(%rdi)
	.loc	3 1018 7                # matrix.c:1018:7
.Ltmp606:
	movl	44(%rdi), %r8d
.Ltmp607:
	.loc	3 992 5                 # matrix.c:992:5
	je	.LBB24_3
.Ltmp608:
# BB#1:                                 # %.preheader3
	#DEBUG_VALUE: scalar_add_worker:arg <- RDI
	#DEBUG_VALUE: scalar_add_worker:scalar <- R13D
	#DEBUG_VALUE: scalar_add_worker:matrix <- R10
	#DEBUG_VALUE: scalar_add_worker:result <- RSI
	movq	%rdi, -8(%rsp)          # 8-byte Spill
.Ltmp609:
	#DEBUG_VALUE: scalar_add_worker:arg <- [RSP+-8]
	testl	%r8d, %r8d
	je	.LBB24_2
.Ltmp610:
# BB#7:                                 # %.lr.ph30
	#DEBUG_VALUE: scalar_add_worker:arg <- [RSP+-8]
	#DEBUG_VALUE: scalar_add_worker:scalar <- R13D
	#DEBUG_VALUE: scalar_add_worker:matrix <- R10
	#DEBUG_VALUE: scalar_add_worker:result <- RSI
	.loc	3 1000 8                # matrix.c:1000:8
	movl	g_soft_width(%rip), %r9d
.Ltmp611:
	#DEBUG_VALUE: x <- R9D
	.loc	3 1008 4                # matrix.c:1008:4
	movq	g_padding(%rip), %r11
	movl	$4294967295, %r14d      # imm = 0xFFFFFFFF
.Ltmp612:
	.loc	3 998 7 discriminator 1 # matrix.c:998:7
	addl	%r9d, %r14d
	andq	%rbx, %r14
	incq	%r14
	movl	%r9d, %edi
	negl	%edi
	movl	$-1, %ecx
	xorl	%edx, %edx
	xorl	%ebx, %ebx
.Ltmp613:
	.align	16, 0x90
.LBB24_8:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB24_11 Depth 2
	#DEBUG_VALUE: scalar_add_worker:arg <- [RSP+-8]
	#DEBUG_VALUE: scalar_add_worker:scalar <- R13D
	testl	%r9d, %r9d
	je	.LBB24_9
.Ltmp614:
# BB#10:                                # %.lr.ph18
                                        #   in Loop: Header=BB24_8 Depth=1
	#DEBUG_VALUE: scalar_add_worker:arg <- [RSP+-8]
	#DEBUG_VALUE: scalar_add_worker:scalar <- R13D
	leaq	(%rsi,%r14,4), %r12
.Ltmp615:
	#DEBUG_VALUE: scalar_add_worker:result <- R12
	movl	%edi, %ebp
	movq	%r10, %rax
.Ltmp616:
	.align	16, 0x90
.LBB24_11:                              #   Parent Loop BB24_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: scalar_add_worker:arg <- [RSP+-8]
	#DEBUG_VALUE: scalar_add_worker:scalar <- R13D
	#DEBUG_VALUE: scalar_add_worker:result <- R12
	movl	%edx, %r15d
	movl	(%rax), %edx
	.loc	3 1002 5                # matrix.c:1002:5
.Ltmp617:
	addl	%r13d, %edx
	addq	$4, %rax
.Ltmp618:
	#DEBUG_VALUE: min <- EDX
	#DEBUG_VALUE: max <- EDX
	movl	%edx, (%rsi)
	.loc	3 1003 8                # matrix.c:1003:8
.Ltmp619:
	cmpl	%ecx, %edx
	cmovbl	%edx, %ecx
.Ltmp620:
	.loc	3 1004 8                # matrix.c:1004:8
	cmpl	%ebx, %edx
	cmoval	%edx, %ebx
.Ltmp621:
	.loc	3 1005 5                # matrix.c:1005:5
	addl	%r15d, %edx
.Ltmp622:
	#DEBUG_VALUE: sum <- EDX
	.loc	3 1006 5                # matrix.c:1006:5
	addq	$4, %rsi
.Ltmp623:
	.loc	3 1000 8 discriminator 1 # matrix.c:1000:8
	incl	%ebp
	jne	.LBB24_11
.Ltmp624:
# BB#12:                                # %._crit_edge19
                                        #   in Loop: Header=BB24_8 Depth=1
	#DEBUG_VALUE: scalar_add_worker:arg <- [RSP+-8]
	#DEBUG_VALUE: scalar_add_worker:scalar <- R13D
	#DEBUG_VALUE: scalar_add_worker:result <- R12
	leaq	(%r10,%r14,4), %r10
.Ltmp625:
	#DEBUG_VALUE: scalar_add_worker:matrix <- R10
	jmp	.LBB24_13
.Ltmp626:
	.align	16, 0x90
.LBB24_9:                               #   in Loop: Header=BB24_8 Depth=1
	#DEBUG_VALUE: scalar_add_worker:arg <- [RSP+-8]
	#DEBUG_VALUE: scalar_add_worker:scalar <- R13D
	movq	%rsi, %r12
.Ltmp627:
.LBB24_13:                              #   in Loop: Header=BB24_8 Depth=1
	#DEBUG_VALUE: scalar_add_worker:arg <- [RSP+-8]
	#DEBUG_VALUE: scalar_add_worker:scalar <- R13D
	.loc	3 1008 4                # matrix.c:1008:4
	leaq	(%r10,%r11,4), %r10
.Ltmp628:
	#DEBUG_VALUE: scalar_add_worker:matrix <- R10
	.loc	3 1009 4                # matrix.c:1009:4
	leaq	(%r12,%r11,4), %rsi
.Ltmp629:
	#DEBUG_VALUE: scalar_add_worker:result <- RSI
	.loc	3 998 7 discriminator 1 # matrix.c:998:7
	decl	%r8d
.Ltmp630:
	#DEBUG_VALUE: y <- R8D
	jne	.LBB24_8
	jmp	.LBB24_14
.Ltmp631:
.LBB24_3:                               # %.preheader
	#DEBUG_VALUE: scalar_add_worker:scalar <- R13D
	#DEBUG_VALUE: scalar_add_worker:matrix <- R10
	#DEBUG_VALUE: scalar_add_worker:result <- RSI
	testl	%r8d, %r8d
	je	.LBB24_19
.Ltmp632:
# BB#4:                                 # %.lr.ph10
	#DEBUG_VALUE: scalar_add_worker:scalar <- R13D
	#DEBUG_VALUE: scalar_add_worker:matrix <- R10
	#DEBUG_VALUE: scalar_add_worker:result <- RSI
	.loc	3 1020 8                # matrix.c:1020:8
	movl	g_soft_width(%rip), %r11d
.Ltmp633:
	#DEBUG_VALUE: x <- R11D
	.loc	3 1025 4                # matrix.c:1025:4
	movq	g_padding(%rip), %rdx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
.Ltmp634:
	.loc	3 1018 7 discriminator 1 # matrix.c:1018:7
	addl	%r11d, %edi
	andq	%rbx, %rdi
	incq	%rdi
	movl	%r11d, %r9d
	negl	%r9d
.Ltmp635:
	.align	16, 0x90
.LBB24_5:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB24_16 Depth 2
	#DEBUG_VALUE: scalar_add_worker:scalar <- R13D
	testl	%r11d, %r11d
	je	.LBB24_6
.Ltmp636:
# BB#15:                                # %.lr.ph
                                        #   in Loop: Header=BB24_5 Depth=1
	#DEBUG_VALUE: scalar_add_worker:scalar <- R13D
	leaq	(%rsi,%rdi,4), %rax
.Ltmp637:
	#DEBUG_VALUE: scalar_add_worker:result <- RAX
	movl	%r9d, %ebp
	movq	%r10, %rbx
.Ltmp638:
	.align	16, 0x90
.LBB24_16:                              #   Parent Loop BB24_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: scalar_add_worker:scalar <- R13D
	#DEBUG_VALUE: scalar_add_worker:result <- RAX
	movl	(%rbx), %ecx
	.loc	3 1022 5                # matrix.c:1022:5
.Ltmp639:
	addl	%r13d, %ecx
	addq	$4, %rbx
	movl	%ecx, (%rsi)
	.loc	3 1023 5                # matrix.c:1023:5
	addq	$4, %rsi
.Ltmp640:
	.loc	3 1020 8 discriminator 1 # matrix.c:1020:8
	incl	%ebp
	jne	.LBB24_16
.Ltmp641:
# BB#17:                                # %._crit_edge
                                        #   in Loop: Header=BB24_5 Depth=1
	#DEBUG_VALUE: scalar_add_worker:scalar <- R13D
	#DEBUG_VALUE: scalar_add_worker:result <- RAX
	leaq	(%r10,%rdi,4), %r10
.Ltmp642:
	#DEBUG_VALUE: scalar_add_worker:matrix <- R10
	jmp	.LBB24_18
.Ltmp643:
	.align	16, 0x90
.LBB24_6:                               #   in Loop: Header=BB24_5 Depth=1
	#DEBUG_VALUE: scalar_add_worker:scalar <- R13D
	movq	%rsi, %rax
.Ltmp644:
.LBB24_18:                              #   in Loop: Header=BB24_5 Depth=1
	#DEBUG_VALUE: scalar_add_worker:scalar <- R13D
	.loc	3 1025 4                # matrix.c:1025:4
	leaq	(%r10,%rdx,4), %r10
.Ltmp645:
	#DEBUG_VALUE: scalar_add_worker:matrix <- R10
	.loc	3 1026 4                # matrix.c:1026:4
	leaq	(%rax,%rdx,4), %rsi
.Ltmp646:
	#DEBUG_VALUE: scalar_add_worker:result <- RSI
	.loc	3 1018 7 discriminator 1 # matrix.c:1018:7
	decl	%r8d
.Ltmp647:
	#DEBUG_VALUE: y <- R8D
	jne	.LBB24_5
	jmp	.LBB24_19
.Ltmp648:
.LBB24_2:
	#DEBUG_VALUE: scalar_add_worker:arg <- [RSP+-8]
	xorl	%edx, %edx
	movl	$-1, %ecx
	xorl	%ebx, %ebx
.LBB24_14:                              # %._crit_edge31
	#DEBUG_VALUE: scalar_add_worker:arg <- [RSP+-8]
	movq	-8(%rsp), %rdi          # 8-byte Reload
.Ltmp649:
	#DEBUG_VALUE: scalar_add_worker:arg <- RDI
	.loc	3 1012 3                # matrix.c:1012:3
	movq	16(%rdi), %rax
	movl	52(%rdi), %esi
	movl	%ecx, (%rax,%rsi,4)
	.loc	3 1013 3                # matrix.c:1013:3
	movq	24(%rdi), %rax
	movl	52(%rdi), %ecx
	movl	%ebx, (%rax,%rcx,4)
	.loc	3 1014 3                # matrix.c:1014:3
	movq	32(%rdi), %rax
	movl	52(%rdi), %ecx
	movl	%edx, (%rax,%rcx,4)
.Ltmp650:
.LBB24_19:                              # %.loopexit
	xorl	%eax, %eax
	.loc	3 1030 2                # matrix.c:1030:2
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp651:
.Ltmp652:
	.size	scalar_add_worker, .Ltmp652-scalar_add_worker
.Lfunc_end24:
	.cfi_endproc

	.align	16, 0x90
	.type	reset_occurances,@function
reset_occurances:                       # @reset_occurances
.Lfunc_begin25:
	.loc	3 170 0                 # matrix.c:170:0
	.cfi_startproc
# BB#0:
	#DEBUG_VALUE: reset_occurances:matrix_obj <- RDI
	.loc	3 171 2 prologue_end    # matrix.c:171:2
	movq	24(%rdi), %rax
	movb	$0, 8(%rax)
	.loc	3 172 1                 # matrix.c:172:1
	retq
.Ltmp653:
.Ltmp654:
	.size	reset_occurances, .Ltmp654-reset_occurances
.Lfunc_end25:
	.cfi_endproc

	.globl	scalar_mul
	.align	16, 0x90
	.type	scalar_mul,@function
scalar_mul:                             # @scalar_mul
.Lfunc_begin26:
	.loc	3 1188 0                # matrix.c:1188:0
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp655:
	.cfi_def_cfa_offset 16
.Ltmp656:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp657:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
.Ltmp658:
	.cfi_offset %rbx, -56
.Ltmp659:
	.cfi_offset %r12, -48
.Ltmp660:
	.cfi_offset %r13, -40
.Ltmp661:
	.cfi_offset %r14, -32
.Ltmp662:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: scalar_mul:matrix_obj <- RDI
	#DEBUG_VALUE: scalar_mul:scalar <- ESI
	movl	%esi, %r12d
.Ltmp663:
	#DEBUG_VALUE: scalar_mul:scalar <- R12D
	movq	%rdi, %r15
.Ltmp664:
	#DEBUG_VALUE: scalar_mul:matrix_obj <- R15
	.loc	3 1189 5 prologue_end   # matrix.c:1189:5
	cmpl	$1, %r12d
	jne	.LBB26_1
.Ltmp665:
# BB#3:
	#DEBUG_VALUE: scalar_mul:matrix_obj <- R15
	.loc	3 1195 10               # matrix.c:1195:10
	movq	%r15, %rdi
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
.Ltmp666:
	popq	%rbp
	jmp	cloned                  # TAILCALL
.Ltmp667:
.LBB26_1:
	#DEBUG_VALUE: scalar_mul:matrix_obj <- R15
	#DEBUG_VALUE: scalar_mul:scalar <- R12D
	testl	%r12d, %r12d
	jne	.LBB26_4
.Ltmp668:
# BB#2:
	.loc	3 1191 10               # matrix.c:1191:10
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	new_matrix              # TAILCALL
.Ltmp669:
.LBB26_4:
	#DEBUG_VALUE: scalar_mul:matrix_obj <- R15
	#DEBUG_VALUE: scalar_mul:scalar <- R12D
	.loc	3 1198 34               # matrix.c:1198:34
	callq	new_matrix
	movq	%rax, %r13
.Ltmp670:
	#DEBUG_VALUE: scalar_mul:result_obj <- R13
	.loc	3 1200 2                # matrix.c:1200:2
	movq	%rsp, -88(%rbp)         # 8-byte Spill
	movq	g_nthreads(%rip), %rax
	movq	%rsp, %rcx
	leaq	15(,%rax,8), %rax
	andq	$-16, %rax
	subq	%rax, %rcx
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	movq	%rcx, %rsp
	.loc	3 1202 28               # matrix.c:1202:28
	movq	g_nthreads(%rip), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, -48(%rbp)         # 8-byte Spill
	.loc	3 1203 29               # matrix.c:1203:29
	movq	g_nthreads(%rip), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, %rbx
	.loc	3 1204 28               # matrix.c:1204:28
	movq	g_nthreads(%rip), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, %r14
	.loc	3 1206 37               # matrix.c:1206:37
	imulq	$56, g_nthreads(%rip), %rdi
	callq	malloc
	movq	%rbx, %r9
	movq	-48(%rbp), %r8          # 8-byte Reload
	movq	%rax, -72(%rbp)         # 8-byte Spill
.Ltmp671:
	#DEBUG_VALUE: scalar_mul:start_row <- 0
	.loc	3 1208 6                # matrix.c:1208:6
	movq	g_nthreads(%rip), %rcx
.Ltmp672:
	#DEBUG_VALUE: i <- ECX
	.loc	3 1208 6 discriminator 1 # matrix.c:1208:6
	testl	%ecx, %ecx
	je	.LBB26_7
.Ltmp673:
# BB#5:                                 # %.lr.ph13
	#DEBUG_VALUE: scalar_mul:matrix_obj <- R15
	#DEBUG_VALUE: scalar_mul:scalar <- R12D
	#DEBUG_VALUE: scalar_mul:result_obj <- R13
	#DEBUG_VALUE: scalar_mul:start_row <- 0
	#DEBUG_VALUE: i <- ECX
	.loc	3 1210 3                # matrix.c:1210:3
	movq	g_height(%rip), %rax
	cqto
	idivq	g_nthreads(%rip)
.Ltmp674:
	.loc	3 1208 6 discriminator 1 # matrix.c:1208:6
	decl	%ecx
.Ltmp675:
	imulq	$56, %rcx, %rsi
	movq	-72(%rbp), %rdi         # 8-byte Reload
	leaq	52(%rsi,%rdi), %rsi
	subq	%rcx, %rdx
	xorl	%edi, %edi
.Ltmp676:
	.align	16, 0x90
.LBB26_6:                               # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: scalar_mul:matrix_obj <- R15
	#DEBUG_VALUE: scalar_mul:scalar <- R12D
	#DEBUG_VALUE: scalar_mul:result_obj <- R13
	#DEBUG_VALUE: scalar_mul:start_row <- 0
	.loc	3 1210 3                # matrix.c:1210:3
	testq	%rdx, %rdx
	setg	%bl
	movzbl	%bl, %ebx
	addl	%eax, %ebx
.Ltmp677:
	#DEBUG_VALUE: this_rows <- EDI
	.loc	3 1211 9                # matrix.c:1211:9
	movq	%r15, -52(%rsi)
	movq	%r13, -44(%rsi)
	movq	%r8, -36(%rsi)
	movq	%r9, -28(%rsi)
	movq	%r14, -20(%rsi)
	movl	%r12d, -12(%rsi)
	movl	%ebx, -8(%rsi)
	movl	%edi, -4(%rsi)
	movl	%ecx, (%rsi)
	.loc	3 1223 3                # matrix.c:1223:3
	addl	%ebx, %edi
.Ltmp678:
	#DEBUG_VALUE: scalar_mul:start_row <- EDI
	.loc	3 1208 6 discriminator 1 # matrix.c:1208:6
	decl	%ecx
	addq	$-56, %rsi
	incq	%rdx
	cmpl	$-1, %ecx
	jne	.LBB26_6
.Ltmp679:
.LBB26_7:                               # %._crit_edge14
	#DEBUG_VALUE: scalar_mul:scalar <- R12D
	#DEBUG_VALUE: scalar_mul:result_obj <- R13
	#DEBUG_VALUE: scalar_mul:start_row <- 0
	movq	%r9, -64(%rbp)          # 8-byte Spill
	movq	%r13, -80(%rbp)         # 8-byte Spill
.Ltmp680:
	#DEBUG_VALUE: scalar_mul:result_obj <- [RBP+-80]
	.loc	3 1226 6                # matrix.c:1226:6
	movq	g_nthreads(%rip), %r13
.Ltmp681:
	#DEBUG_VALUE: i <- R13D
	.loc	3 1226 6 discriminator 1 # matrix.c:1226:6
	testl	%r13d, %r13d
	je	.LBB26_10
.Ltmp682:
# BB#8:                                 # %.lr.ph9.preheader
	#DEBUG_VALUE: scalar_mul:scalar <- R12D
	#DEBUG_VALUE: scalar_mul:result_obj <- [RBP+-80]
	#DEBUG_VALUE: scalar_mul:start_row <- 0
	#DEBUG_VALUE: i <- R13D
	leal	-1(%r13), %eax
	imulq	$56, %rax, %r15
	addq	-72(%rbp), %r15         # 8-byte Folded Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %rbx
	negl	%r13d
.Ltmp683:
	.align	16, 0x90
.LBB26_9:                               # %.lr.ph9
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: scalar_mul:scalar <- R12D
	#DEBUG_VALUE: scalar_mul:result_obj <- [RBP+-80]
	#DEBUG_VALUE: scalar_mul:start_row <- 0
	xorl	%esi, %esi
	.loc	3 1228 9                # matrix.c:1228:9
.Ltmp684:
	movl	$scalar_mul_worker, %edx
	movq	%rbx, %rdi
	movq	%r15, %rcx
	callq	pthread_create
.Ltmp685:
	.loc	3 1226 6 discriminator 1 # matrix.c:1226:6
	addq	$-56, %r15
	addq	$-8, %rbx
	incl	%r13d
	jne	.LBB26_9
.Ltmp686:
.LBB26_10:                              # %._crit_edge10
	#DEBUG_VALUE: scalar_mul:scalar <- R12D
	#DEBUG_VALUE: scalar_mul:result_obj <- [RBP+-80]
	#DEBUG_VALUE: scalar_mul:start_row <- 0
	#DEBUG_VALUE: scalar_mul:min <- -1
	#DEBUG_VALUE: scalar_mul:max <- 0
	#DEBUG_VALUE: scalar_mul:sum <- 0
	.loc	3 1235 5                # matrix.c:1235:5
	testb	$1, %r12b
	movq	-80(%rbp), %rax         # 8-byte Reload
.Ltmp687:
	#DEBUG_VALUE: scalar_mul:result_obj <- RAX
	jne	.LBB26_12
.Ltmp688:
# BB#11:
	#DEBUG_VALUE: scalar_mul:result_obj <- RAX
	#DEBUG_VALUE: scalar_mul:start_row <- 0
	#DEBUG_VALUE: scalar_mul:min <- -1
	#DEBUG_VALUE: scalar_mul:max <- 0
	#DEBUG_VALUE: scalar_mul:sum <- 0
	.loc	3 1237 3                # matrix.c:1237:3
	movq	24(%rax), %rax
.Ltmp689:
	movb	$5, 8(%rax)
.Ltmp690:
.LBB26_12:
	#DEBUG_VALUE: scalar_mul:result_obj <- RAX
	#DEBUG_VALUE: scalar_mul:result_obj <- [RBP+-80]
	#DEBUG_VALUE: scalar_mul:start_row <- 0
	#DEBUG_VALUE: scalar_mul:min <- -1
	#DEBUG_VALUE: scalar_mul:max <- 0
	#DEBUG_VALUE: scalar_mul:sum <- 0
	.loc	3 1240 6                # matrix.c:1240:6
	movq	g_nthreads(%rip), %rsi
.Ltmp691:
	#DEBUG_VALUE: i <- ESI
	.loc	3 1240 6 discriminator 1 # matrix.c:1240:6
	testl	%esi, %esi
	movq	-48(%rbp), %rcx         # 8-byte Reload
	movq	-64(%rbp), %rdx         # 8-byte Reload
	je	.LBB26_13
.Ltmp692:
# BB#14:                                # %.lr.ph.preheader
	#DEBUG_VALUE: scalar_mul:result_obj <- [RBP+-80]
	#DEBUG_VALUE: scalar_mul:start_row <- 0
	#DEBUG_VALUE: scalar_mul:min <- -1
	#DEBUG_VALUE: scalar_mul:max <- 0
	#DEBUG_VALUE: scalar_mul:sum <- 0
	#DEBUG_VALUE: i <- ESI
	leal	-1(%rsi), %eax
	leaq	(%rdx,%rax,4), %rdi
	leaq	(%rcx,%rax,4), %rbx
	leaq	(%r14,%rax,4), %r15
	movq	-56(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %r14
	negl	%esi
.Ltmp693:
	movl	$-1, %edx
	xorl	%ecx, %ecx
	xorl	%r12d, %r12d
.Ltmp694:
	.align	16, 0x90
.LBB26_15:                              # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: scalar_mul:result_obj <- [RBP+-80]
	#DEBUG_VALUE: scalar_mul:start_row <- 0
	#DEBUG_VALUE: scalar_mul:min <- -1
	#DEBUG_VALUE: scalar_mul:max <- 0
	#DEBUG_VALUE: scalar_mul:sum <- 0
	.loc	3 1242 3                # matrix.c:1242:3
	movq	%rdi, -64(%rbp)         # 8-byte Spill
	movl	%edx, -56(%rbp)         # 4-byte Spill
	movq	%rsi, -48(%rbp)         # 8-byte Spill
	movq	(%r14), %rdi
	xorl	%esi, %esi
	movq	%rcx, %r13
	callq	pthread_join
	movq	-64(%rbp), %rdi         # 8-byte Reload
	movl	-56(%rbp), %edx         # 4-byte Reload
	movq	%r13, %rcx
	movq	-48(%rbp), %rsi         # 8-byte Reload
	.loc	3 1243 3                # matrix.c:1243:3
	addl	(%r15), %ecx
.Ltmp695:
	#DEBUG_VALUE: scalar_mul:sum <- ECX
	.loc	3 1244 6                # matrix.c:1244:6
	movl	(%rbx), %eax
.Ltmp696:
	#DEBUG_VALUE: scalar_mul:min <- EAX
	cmpl	%edx, %eax
	cmovbl	%eax, %edx
.Ltmp697:
	.loc	3 1245 6                # matrix.c:1245:6
	movl	(%rdi), %eax
.Ltmp698:
	#DEBUG_VALUE: scalar_mul:max <- EAX
	cmpl	%r12d, %eax
	cmoval	%eax, %r12d
.Ltmp699:
	.loc	3 1240 6 discriminator 1 # matrix.c:1240:6
	addq	$-4, %rdi
	addq	$-4, %rbx
	addq	$-4, %r15
	addq	$-8, %r14
	incl	%esi
	jne	.LBB26_15
	jmp	.LBB26_16
.Ltmp700:
.LBB26_13:
	#DEBUG_VALUE: scalar_mul:result_obj <- [RBP+-80]
	#DEBUG_VALUE: scalar_mul:start_row <- 0
	#DEBUG_VALUE: scalar_mul:min <- -1
	#DEBUG_VALUE: scalar_mul:max <- 0
	#DEBUG_VALUE: scalar_mul:sum <- 0
	xorl	%ecx, %ecx
	movl	$-1, %edx
	xorl	%r12d, %r12d
.LBB26_16:
	#DEBUG_VALUE: scalar_mul:result_obj <- [RBP+-80]
	#DEBUG_VALUE: scalar_mul:start_row <- 0
	#DEBUG_VALUE: scalar_mul:min <- -1
	#DEBUG_VALUE: scalar_mul:max <- 0
	#DEBUG_VALUE: scalar_mul:sum <- 0
	movq	-80(%rbp), %rbx         # 8-byte Reload
.Ltmp701:
	#DEBUG_VALUE: scalar_mul:result_obj <- RBX
	.loc	3 1248 2                # matrix.c:1248:2
	movl	%edx, 8(%rbx)
	.loc	3 1249 2                # matrix.c:1249:2
	movl	%r12d, 12(%rbx)
	.loc	3 1250 2                # matrix.c:1250:2
	movl	%ecx, 16(%rbx)
	.loc	3 1252 2                # matrix.c:1252:2
	movq	-72(%rbp), %rdi         # 8-byte Reload
	callq	free
	.loc	3 1255 1                # matrix.c:1255:1
	movq	-88(%rbp), %rsp         # 8-byte Reload
	movq	%rbx, %rax
	leaq	-40(%rbp), %rsp
	popq	%rbx
.Ltmp702:
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp703:
.Ltmp704:
	.size	scalar_mul, .Ltmp704-scalar_mul
.Lfunc_end26:
	.cfi_endproc

	.align	16, 0x90
	.type	scalar_mul_worker,@function
scalar_mul_worker:                      # @scalar_mul_worker
.Lfunc_begin27:
	.loc	3 1152 0                # matrix.c:1152:0
	.cfi_startproc
# BB#0:
	.loc	3 1165 6 prologue_end   # matrix.c:1165:6
	pushq	%rbp
.Ltmp705:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp706:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp707:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp708:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp709:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp710:
	.cfi_def_cfa_offset 56
.Ltmp711:
	.cfi_offset %rbx, -56
.Ltmp712:
	.cfi_offset %r12, -48
.Ltmp713:
	.cfi_offset %r13, -40
.Ltmp714:
	.cfi_offset %r14, -32
.Ltmp715:
	.cfi_offset %r15, -24
.Ltmp716:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: scalar_mul_worker:arg <- RDI
.Ltmp717:
	#DEBUG_VALUE: scalar_mul_worker:min <- -1
	#DEBUG_VALUE: scalar_mul_worker:max <- 0
	#DEBUG_VALUE: scalar_mul_worker:sum <- 0
	movl	44(%rdi), %r8d
.Ltmp718:
	#DEBUG_VALUE: y <- R8D
	.loc	3 1158 2                # matrix.c:1158:2
	movl	48(%rdi), %r9d
	.loc	3 1165 6 discriminator 1 # matrix.c:1165:6
.Ltmp719:
	testl	%r8d, %r8d
	je	.LBB27_1
.Ltmp720:
# BB#2:                                 # %.lr.ph17
	#DEBUG_VALUE: scalar_mul_worker:arg <- RDI
	#DEBUG_VALUE: scalar_mul_worker:min <- -1
	#DEBUG_VALUE: scalar_mul_worker:max <- 0
	#DEBUG_VALUE: scalar_mul_worker:sum <- 0
	#DEBUG_VALUE: y <- R8D
	.loc	3 1156 2                # matrix.c:1156:2
	movl	40(%rdi), %r13d
.Ltmp721:
	#DEBUG_VALUE: scalar_mul_worker:scalar <- R13D
	.loc	3 1158 2                # matrix.c:1158:2
	imulq	g_hard_width(%rip), %r9
	.loc	3 1154 2                # matrix.c:1154:2
	movq	(%rdi), %rax
	.loc	3 1155 2                # matrix.c:1155:2
	movq	%rdi, -8(%rsp)          # 8-byte Spill
	movq	8(%rdi), %rcx
.Ltmp722:
	#DEBUG_VALUE: scalar_mul_worker:arg <- [RSP+-8]
	.loc	3 1159 2                # matrix.c:1159:2
	shlq	$2, %r9
	movq	(%rcx), %rbp
	addq	%r9, %rbp
.Ltmp723:
	#DEBUG_VALUE: scalar_mul_worker:result <- RBP
	.loc	3 1158 2                # matrix.c:1158:2
	addq	(%rax), %r9
.Ltmp724:
	#DEBUG_VALUE: scalar_mul_worker:matrix <- R9
	.loc	3 1167 7                # matrix.c:1167:7
	movl	g_soft_width(%rip), %r10d
.Ltmp725:
	#DEBUG_VALUE: x <- R10D
	.loc	3 1175 3                # matrix.c:1175:3
	movq	g_padding(%rip), %r11
.Ltmp726:
	.loc	3 1165 6 discriminator 1 # matrix.c:1165:6
	leal	-1(%r10), %r15d
	incq	%r15
	movl	%r10d, %edi
	negl	%edi
	movl	$-1, %eax
	xorl	%esi, %esi
	xorl	%ecx, %ecx
.Ltmp727:
	.align	16, 0x90
.LBB27_3:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB27_6 Depth 2
	#DEBUG_VALUE: scalar_mul_worker:arg <- [RSP+-8]
	#DEBUG_VALUE: scalar_mul_worker:min <- -1
	#DEBUG_VALUE: scalar_mul_worker:max <- 0
	#DEBUG_VALUE: scalar_mul_worker:sum <- 0
	#DEBUG_VALUE: scalar_mul_worker:scalar <- R13D
	testl	%r10d, %r10d
	je	.LBB27_4
.Ltmp728:
# BB#5:                                 # %.lr.ph
                                        #   in Loop: Header=BB27_3 Depth=1
	#DEBUG_VALUE: scalar_mul_worker:arg <- [RSP+-8]
	#DEBUG_VALUE: scalar_mul_worker:min <- -1
	#DEBUG_VALUE: scalar_mul_worker:max <- 0
	#DEBUG_VALUE: scalar_mul_worker:sum <- 0
	#DEBUG_VALUE: scalar_mul_worker:scalar <- R13D
	leaq	(%rbp,%r15,4), %r12
.Ltmp729:
	#DEBUG_VALUE: scalar_mul_worker:result <- R12
	movl	%edi, %ebx
	movq	%r9, %rdx
.Ltmp730:
	.align	16, 0x90
.LBB27_6:                               #   Parent Loop BB27_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: scalar_mul_worker:arg <- [RSP+-8]
	#DEBUG_VALUE: scalar_mul_worker:min <- -1
	#DEBUG_VALUE: scalar_mul_worker:max <- 0
	#DEBUG_VALUE: scalar_mul_worker:sum <- 0
	#DEBUG_VALUE: scalar_mul_worker:scalar <- R13D
	#DEBUG_VALUE: scalar_mul_worker:result <- R12
	movl	%esi, %r14d
	movl	(%rdx), %esi
	.loc	3 1169 4                # matrix.c:1169:4
.Ltmp731:
	imull	%r13d, %esi
	addq	$4, %rdx
.Ltmp732:
	#DEBUG_VALUE: scalar_mul_worker:max <- ESI
	#DEBUG_VALUE: scalar_mul_worker:min <- ESI
	movl	%esi, (%rbp)
	.loc	3 1170 7                # matrix.c:1170:7
.Ltmp733:
	cmpl	%eax, %esi
	cmovbl	%esi, %eax
.Ltmp734:
	.loc	3 1171 7                # matrix.c:1171:7
	cmpl	%ecx, %esi
	cmoval	%esi, %ecx
.Ltmp735:
	.loc	3 1172 4                # matrix.c:1172:4
	addl	%r14d, %esi
.Ltmp736:
	#DEBUG_VALUE: scalar_mul_worker:sum <- ESI
	.loc	3 1173 4                # matrix.c:1173:4
	addq	$4, %rbp
.Ltmp737:
	.loc	3 1167 7 discriminator 1 # matrix.c:1167:7
	incl	%ebx
	jne	.LBB27_6
.Ltmp738:
# BB#7:                                 # %._crit_edge
                                        #   in Loop: Header=BB27_3 Depth=1
	#DEBUG_VALUE: scalar_mul_worker:arg <- [RSP+-8]
	#DEBUG_VALUE: scalar_mul_worker:sum <- ESI
	#DEBUG_VALUE: scalar_mul_worker:scalar <- R13D
	#DEBUG_VALUE: scalar_mul_worker:result <- R12
	leaq	(%r9,%r15,4), %r9
.Ltmp739:
	#DEBUG_VALUE: scalar_mul_worker:matrix <- R9
	jmp	.LBB27_8
.Ltmp740:
	.align	16, 0x90
.LBB27_4:                               #   in Loop: Header=BB27_3 Depth=1
	#DEBUG_VALUE: scalar_mul_worker:arg <- [RSP+-8]
	#DEBUG_VALUE: scalar_mul_worker:min <- -1
	#DEBUG_VALUE: scalar_mul_worker:max <- 0
	#DEBUG_VALUE: scalar_mul_worker:sum <- 0
	#DEBUG_VALUE: scalar_mul_worker:scalar <- R13D
	movq	%rbp, %r12
.Ltmp741:
.LBB27_8:                               #   in Loop: Header=BB27_3 Depth=1
	#DEBUG_VALUE: scalar_mul_worker:arg <- [RSP+-8]
	#DEBUG_VALUE: scalar_mul_worker:min <- -1
	#DEBUG_VALUE: scalar_mul_worker:max <- 0
	#DEBUG_VALUE: scalar_mul_worker:sum <- 0
	#DEBUG_VALUE: scalar_mul_worker:scalar <- R13D
	.loc	3 1175 3                # matrix.c:1175:3
	leaq	(%r9,%r11,4), %r9
.Ltmp742:
	#DEBUG_VALUE: scalar_mul_worker:matrix <- R9
	.loc	3 1176 3                # matrix.c:1176:3
	leaq	(%r12,%r11,4), %rbp
.Ltmp743:
	#DEBUG_VALUE: scalar_mul_worker:result <- RBP
	.loc	3 1165 6 discriminator 1 # matrix.c:1165:6
	decl	%r8d
.Ltmp744:
	#DEBUG_VALUE: y <- R8D
	jne	.LBB27_3
	jmp	.LBB27_9
.Ltmp745:
.LBB27_1:
	#DEBUG_VALUE: scalar_mul_worker:arg <- RDI
	#DEBUG_VALUE: scalar_mul_worker:min <- -1
	#DEBUG_VALUE: scalar_mul_worker:max <- 0
	#DEBUG_VALUE: scalar_mul_worker:sum <- 0
	movq	%rdi, -8(%rsp)          # 8-byte Spill
.Ltmp746:
	#DEBUG_VALUE: scalar_mul_worker:arg <- [RSP+-8]
	xorl	%esi, %esi
	movl	$-1, %eax
	xorl	%ecx, %ecx
.LBB27_9:                               # %._crit_edge18
	#DEBUG_VALUE: scalar_mul_worker:arg <- [RSP+-8]
	#DEBUG_VALUE: scalar_mul_worker:min <- -1
	#DEBUG_VALUE: scalar_mul_worker:max <- 0
	#DEBUG_VALUE: scalar_mul_worker:sum <- 0
	movq	-8(%rsp), %rbp          # 8-byte Reload
.Ltmp747:
	#DEBUG_VALUE: scalar_mul_worker:arg <- RBP
	.loc	3 1179 2                # matrix.c:1179:2
	movq	16(%rbp), %rdx
	movl	52(%rbp), %edi
	movl	%eax, (%rdx,%rdi,4)
	.loc	3 1180 2                # matrix.c:1180:2
	movq	24(%rbp), %rax
	movl	52(%rbp), %edx
	movl	%ecx, (%rax,%rdx,4)
	.loc	3 1181 2                # matrix.c:1181:2
	movq	32(%rbp), %rax
	movl	52(%rbp), %ecx
	movl	%esi, (%rax,%rcx,4)
	xorl	%eax, %eax
	.loc	3 1184 2                # matrix.c:1184:2
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
.Ltmp748:
	retq
.Ltmp749:
.Ltmp750:
	.size	scalar_mul_worker, .Ltmp750-scalar_mul_worker
.Lfunc_end27:
	.cfi_endproc

	.globl	matrix_add
	.align	16, 0x90
	.type	matrix_add,@function
matrix_add:                             # @matrix_add
.Lfunc_begin28:
	.loc	3 1386 0                # matrix.c:1386:0
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp751:
	.cfi_def_cfa_offset 16
.Ltmp752:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp753:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$72, %rsp
.Ltmp754:
	.cfi_offset %rbx, -56
.Ltmp755:
	.cfi_offset %r12, -48
.Ltmp756:
	.cfi_offset %r13, -40
.Ltmp757:
	.cfi_offset %r14, -32
.Ltmp758:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: matrix_add:matrix_a_obj <- RDI
	#DEBUG_VALUE: matrix_add:matrix_b_obj <- RSI
	movq	%rsi, %r13
.Ltmp759:
	#DEBUG_VALUE: matrix_add:matrix_b_obj <- R13
	movq	%rdi, %r14
.Ltmp760:
	#DEBUG_VALUE: matrix_add:matrix_a_obj <- R14
	.loc	3 1387 5 prologue_end   # matrix.c:1387:5
	movq	24(%r14), %rax
	movzbl	8(%rax), %ecx
	cmpl	$2, %ecx
	jne	.LBB28_2
.Ltmp761:
# BB#1:
	#DEBUG_VALUE: matrix_add:matrix_a_obj <- R14
	#DEBUG_VALUE: matrix_add:matrix_b_obj <- R13
	.loc	3 1387 5 discriminator 1 # matrix.c:1387:5
	movq	(%rax), %rax
	cmpl	$0, (%rax)
	je	.LBB28_18
.Ltmp762:
.LBB28_2:
	#DEBUG_VALUE: matrix_add:matrix_a_obj <- R14
	#DEBUG_VALUE: matrix_add:matrix_b_obj <- R13
	.loc	3 1392 5                # matrix.c:1392:5
	movq	24(%r13), %rax
	movzbl	8(%rax), %ecx
	cmpl	$2, %ecx
	jne	.LBB28_4
.Ltmp763:
# BB#3:
	#DEBUG_VALUE: matrix_add:matrix_a_obj <- R14
	#DEBUG_VALUE: matrix_add:matrix_b_obj <- R13
	.loc	3 1392 5 discriminator 1 # matrix.c:1392:5
	movq	(%rax), %rax
	cmpl	$0, (%rax)
	je	.LBB28_18
.Ltmp764:
.LBB28_4:
	#DEBUG_VALUE: matrix_add:matrix_a_obj <- R14
	#DEBUG_VALUE: matrix_add:matrix_b_obj <- R13
	.loc	3 1399 5                # matrix.c:1399:5
	movq	24(%r14), %rax
	movzbl	8(%rax), %eax
	cmpl	$3, %eax
	jne	.LBB28_6
.Ltmp765:
# BB#5:
	#DEBUG_VALUE: matrix_add:matrix_a_obj <- R14
	#DEBUG_VALUE: matrix_add:matrix_b_obj <- R13
	#DEBUG_VALUE: matrix_add:is_identity <- 1
	.loc	3 1402 16               # matrix.c:1402:16
	movq	%r13, %rdi
	callq	cloned
	movq	%rax, %r12
.Ltmp766:
	#DEBUG_VALUE: matrix_add:result_obj <- R12
	movl	$1, %r15d
	jmp	.LBB28_7
.Ltmp767:
.LBB28_18:
	#DEBUG_VALUE: matrix_add:matrix_b_obj <- R13
	.loc	3 1389 10               # matrix.c:1389:10
	movq	%r13, %rdi
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
.Ltmp768:
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	cloned                  # TAILCALL
.Ltmp769:
.LBB28_6:
	#DEBUG_VALUE: matrix_add:matrix_a_obj <- R14
	#DEBUG_VALUE: matrix_add:matrix_b_obj <- R13
	#DEBUG_VALUE: matrix_add:is_identity <- 0
	.loc	3 1412 16               # matrix.c:1412:16
	callq	new_matrix
	movq	%rax, %r12
.Ltmp770:
	#DEBUG_VALUE: matrix_add:result_obj <- R12
	xorl	%r15d, %r15d
.Ltmp771:
.LBB28_7:
	#DEBUG_VALUE: matrix_add:matrix_a_obj <- R14
	#DEBUG_VALUE: matrix_add:matrix_b_obj <- R13
	.loc	3 1415 2                # matrix.c:1415:2
	movq	%rsp, -104(%rbp)        # 8-byte Spill
	movq	g_nthreads(%rip), %rax
	movq	%rsp, %rcx
	leaq	15(,%rax,8), %rax
	andq	$-16, %rax
	subq	%rax, %rcx
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	movq	%rcx, %rsp
	.loc	3 1417 28               # matrix.c:1417:28
	movq	g_nthreads(%rip), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, -72(%rbp)         # 8-byte Spill
	.loc	3 1418 29               # matrix.c:1418:29
	movq	g_nthreads(%rip), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, -80(%rbp)         # 8-byte Spill
	.loc	3 1419 28               # matrix.c:1419:28
	movq	g_nthreads(%rip), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, %rbx
	.loc	3 1421 37               # matrix.c:1421:37
	movq	g_nthreads(%rip), %rdi
	shlq	$6, %rdi
	callq	malloc
	movq	%rbx, %r10
	movq	-80(%rbp), %r9          # 8-byte Reload
	movq	-72(%rbp), %r8          # 8-byte Reload
	movq	%rax, -88(%rbp)         # 8-byte Spill
.Ltmp772:
	#DEBUG_VALUE: matrix_add:start_row <- 0
	.loc	3 1424 6                # matrix.c:1424:6
	movq	g_nthreads(%rip), %rcx
.Ltmp773:
	#DEBUG_VALUE: i <- ECX
	.loc	3 1424 6 discriminator 1 # matrix.c:1424:6
	testl	%ecx, %ecx
	je	.LBB28_10
.Ltmp774:
# BB#8:                                 # %.lr.ph13
	#DEBUG_VALUE: matrix_add:matrix_a_obj <- R14
	#DEBUG_VALUE: matrix_add:matrix_b_obj <- R13
	#DEBUG_VALUE: matrix_add:start_row <- 0
	#DEBUG_VALUE: i <- ECX
	.loc	3 1426 3                # matrix.c:1426:3
	movq	g_height(%rip), %rax
	cqto
	idivq	g_nthreads(%rip)
.Ltmp775:
	.loc	3 1424 6 discriminator 1 # matrix.c:1424:6
	decl	%ecx
.Ltmp776:
	subq	%rcx, %rdx
	movq	%rcx, %rsi
	shlq	$6, %rsi
	movq	-88(%rbp), %rdi         # 8-byte Reload
	leaq	60(%rsi,%rdi), %rsi
	xorl	%edi, %edi
.Ltmp777:
	.align	16, 0x90
.LBB28_9:                               # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: matrix_add:matrix_a_obj <- R14
	#DEBUG_VALUE: matrix_add:matrix_b_obj <- R13
	#DEBUG_VALUE: matrix_add:start_row <- 0
	.loc	3 1426 3                # matrix.c:1426:3
	testq	%rdx, %rdx
	setg	%bl
	movzbl	%bl, %ebx
	addl	%eax, %ebx
.Ltmp778:
	#DEBUG_VALUE: this_rows <- EDI
	.loc	3 1427 9                # matrix.c:1427:9
	movq	%r14, -60(%rsi)
	movq	%r13, -52(%rsi)
	movq	%r12, -44(%rsi)
	movq	%r8, -36(%rsi)
	movq	%r9, -28(%rsi)
	movq	%r10, -20(%rsi)
	movl	%ebx, -12(%rsi)
	movl	%edi, -8(%rsi)
	movl	%ecx, -4(%rsi)
	movl	%r15d, (%rsi)
	.loc	3 1440 3                # matrix.c:1440:3
	addl	%ebx, %edi
.Ltmp779:
	#DEBUG_VALUE: matrix_add:start_row <- EDI
	.loc	3 1424 6 discriminator 1 # matrix.c:1424:6
	decl	%ecx
	addq	$-64, %rsi
	incq	%rdx
	cmpl	$-1, %ecx
	jne	.LBB28_9
.Ltmp780:
.LBB28_10:                              # %._crit_edge14
	#DEBUG_VALUE: matrix_add:start_row <- 0
	movq	%r10, -96(%rbp)         # 8-byte Spill
	.loc	3 1443 6                # matrix.c:1443:6
.Ltmp781:
	movq	g_nthreads(%rip), %r15
.Ltmp782:
	#DEBUG_VALUE: i <- R15D
	.loc	3 1443 6 discriminator 1 # matrix.c:1443:6
	testl	%r15d, %r15d
	movq	-48(%rbp), %r13         # 8-byte Reload
	je	.LBB28_13
.Ltmp783:
# BB#11:                                # %.lr.ph9.preheader
	#DEBUG_VALUE: matrix_add:start_row <- 0
	#DEBUG_VALUE: i <- R15D
	leal	-1(%r15), %r14d
	leaq	(%r13,%r14,8), %rbx
	shlq	$6, %r14
	addq	-88(%rbp), %r14         # 8-byte Folded Reload
	negl	%r15d
.Ltmp784:
	.align	16, 0x90
.LBB28_12:                              # %.lr.ph9
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: matrix_add:start_row <- 0
	xorl	%esi, %esi
	.loc	3 1445 9                # matrix.c:1445:9
.Ltmp785:
	movl	$matrix_add_worker, %edx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	pthread_create
.Ltmp786:
	.loc	3 1443 6 discriminator 1 # matrix.c:1443:6
	addq	$-64, %r14
	addq	$-8, %rbx
	incl	%r15d
	jne	.LBB28_12
.Ltmp787:
.LBB28_13:                              # %._crit_edge10
	#DEBUG_VALUE: matrix_add:start_row <- 0
	#DEBUG_VALUE: matrix_add:min <- -1
	#DEBUG_VALUE: matrix_add:max <- 0
	#DEBUG_VALUE: matrix_add:sum <- 0
	.loc	3 1452 2                # matrix.c:1452:2
	movq	%r12, %rdi
	callq	reset_occurances
	.loc	3 1454 6                # matrix.c:1454:6
.Ltmp788:
	movq	g_nthreads(%rip), %rdx
.Ltmp789:
	#DEBUG_VALUE: i <- EDX
	.loc	3 1454 6 discriminator 1 # matrix.c:1454:6
	testl	%edx, %edx
	je	.LBB28_14
.Ltmp790:
# BB#15:                                # %.lr.ph.preheader
	#DEBUG_VALUE: matrix_add:start_row <- 0
	#DEBUG_VALUE: matrix_add:min <- -1
	#DEBUG_VALUE: matrix_add:max <- 0
	#DEBUG_VALUE: matrix_add:sum <- 0
	#DEBUG_VALUE: i <- EDX
	movq	%r12, -112(%rbp)        # 8-byte Spill
	leal	-1(%rdx), %eax
	movq	-80(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,4), %rdi
	movq	-72(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,4), %r15
	movq	-96(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,4), %r14
	leaq	(%r13,%rax,8), %r13
	negl	%edx
.Ltmp791:
	movl	$-1, %esi
	xorl	%ecx, %ecx
	xorl	%ebx, %ebx
.Ltmp792:
	.align	16, 0x90
.LBB28_16:                              # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: matrix_add:start_row <- 0
	#DEBUG_VALUE: matrix_add:min <- -1
	#DEBUG_VALUE: matrix_add:max <- 0
	#DEBUG_VALUE: matrix_add:sum <- 0
	.loc	3 1456 9                # matrix.c:1456:9
	movq	%rdi, -64(%rbp)         # 8-byte Spill
	movl	%esi, -52(%rbp)         # 4-byte Spill
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	movq	(%r13), %rdi
	xorl	%esi, %esi
	movq	%rdx, %r12
	callq	pthread_join
	movq	-64(%rbp), %rdi         # 8-byte Reload
	movl	-52(%rbp), %esi         # 4-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	movq	%r12, %rdx
	.loc	3 1457 3                # matrix.c:1457:3
	addl	(%r14), %ecx
.Ltmp793:
	#DEBUG_VALUE: matrix_add:sum <- ECX
	.loc	3 1458 6                # matrix.c:1458:6
	movl	(%r15), %eax
.Ltmp794:
	#DEBUG_VALUE: matrix_add:min <- EAX
	cmpl	%esi, %eax
	cmovbl	%eax, %esi
.Ltmp795:
	.loc	3 1459 6                # matrix.c:1459:6
	movl	(%rdi), %eax
.Ltmp796:
	#DEBUG_VALUE: matrix_add:max <- EAX
	cmpl	%ebx, %eax
	cmoval	%eax, %ebx
.Ltmp797:
	.loc	3 1454 6 discriminator 1 # matrix.c:1454:6
	addq	$-4, %rdi
	addq	$-4, %r15
	addq	$-4, %r14
	addq	$-8, %r13
	incl	%edx
	jne	.LBB28_16
	jmp	.LBB28_17
.Ltmp798:
.LBB28_14:
	#DEBUG_VALUE: matrix_add:start_row <- 0
	#DEBUG_VALUE: matrix_add:min <- -1
	#DEBUG_VALUE: matrix_add:max <- 0
	#DEBUG_VALUE: matrix_add:sum <- 0
	movq	%r12, -112(%rbp)        # 8-byte Spill
	xorl	%ecx, %ecx
	movl	$-1, %esi
	xorl	%ebx, %ebx
.LBB28_17:
	#DEBUG_VALUE: matrix_add:start_row <- 0
	#DEBUG_VALUE: matrix_add:min <- -1
	#DEBUG_VALUE: matrix_add:max <- 0
	#DEBUG_VALUE: matrix_add:sum <- 0
	movq	-112(%rbp), %r14        # 8-byte Reload
	.loc	3 1462 2                # matrix.c:1462:2
	movl	%esi, 8(%r14)
	.loc	3 1463 2                # matrix.c:1463:2
	movl	%ebx, 12(%r14)
	.loc	3 1464 2                # matrix.c:1464:2
	movl	%ecx, 16(%r14)
	.loc	3 1466 2                # matrix.c:1466:2
	movq	-72(%rbp), %rdi         # 8-byte Reload
	callq	free
	.loc	3 1467 2                # matrix.c:1467:2
	movq	-80(%rbp), %rdi         # 8-byte Reload
	callq	free
	.loc	3 1468 2                # matrix.c:1468:2
	movq	-96(%rbp), %rdi         # 8-byte Reload
	callq	free
	.loc	3 1470 2                # matrix.c:1470:2
	movq	-88(%rbp), %rdi         # 8-byte Reload
	callq	free
	.loc	3 1473 1                # matrix.c:1473:1
	movq	-104(%rbp), %rsp        # 8-byte Reload
	movq	%r14, %rax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp799:
.Ltmp800:
	.size	matrix_add, .Ltmp800-matrix_add
.Lfunc_end28:
	.cfi_endproc

	.align	16, 0x90
	.type	matrix_add_worker,@function
matrix_add_worker:                      # @matrix_add_worker
.Lfunc_begin29:
	.loc	3 1275 0                # matrix.c:1275:0
	.cfi_startproc
# BB#0:
	.loc	3 1279 2 prologue_end   # matrix.c:1279:2
	pushq	%r15
.Ltmp801:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp802:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp803:
	.cfi_def_cfa_offset 32
.Ltmp804:
	.cfi_offset %rbx, -32
.Ltmp805:
	.cfi_offset %r14, -24
.Ltmp806:
	.cfi_offset %r15, -16
	#DEBUG_VALUE: matrix_add_worker:arg <- RDI
	movq	16(%rdi), %rax
	movq	(%rax), %rcx
.Ltmp807:
	#DEBUG_VALUE: matrix_add_worker:result <- RCX
	movl	52(%rdi), %esi
	.loc	3 1281 2                # matrix.c:1281:2
	movq	g_hard_width(%rip), %rdx
	.loc	3 1285 5                # matrix.c:1285:5
.Ltmp808:
	cmpl	$0, 60(%rdi)
	je	.LBB29_5
.Ltmp809:
# BB#1:
	#DEBUG_VALUE: matrix_add_worker:arg <- RDI
	#DEBUG_VALUE: matrix_add_worker:result <- RCX
	.loc	3 1290 7                # matrix.c:1290:7
	movl	48(%rdi), %eax
.Ltmp810:
	#DEBUG_VALUE: i <- EAX
	.loc	3 1290 7 discriminator 1 # matrix.c:1290:7
	testl	%eax, %eax
	je	.LBB29_4
.Ltmp811:
# BB#2:                                 # %.lr.ph30
	#DEBUG_VALUE: matrix_add_worker:result <- RCX
	#DEBUG_VALUE: i <- EAX
	.loc	3 1288 3                # matrix.c:1288:3
	incq	%rdx
	.loc	3 1290 7 discriminator 1 # matrix.c:1290:7
.Ltmp812:
	imulq	%rdx, %rsi
	leaq	(%rcx,%rsi,4), %rcx
.Ltmp813:
	movl	%edx, %edx
	shlq	$2, %rdx
.Ltmp814:
	.align	16, 0x90
.LBB29_3:                               # =>This Inner Loop Header: Depth=1
	.loc	3 1292 4                # matrix.c:1292:4
	incl	(%rcx)
.Ltmp815:
	.loc	3 1290 7 discriminator 1 # matrix.c:1290:7
	addq	%rdx, %rcx
	decl	%eax
	jne	.LBB29_3
	jmp	.LBB29_4
.Ltmp816:
.LBB29_5:
	#DEBUG_VALUE: matrix_add_worker:arg <- RDI
	#DEBUG_VALUE: matrix_add_worker:result <- RCX
	.loc	3 1312 6                # matrix.c:1312:6
	movl	48(%rdi), %eax
.Ltmp817:
	#DEBUG_VALUE: y <- EAX
	.loc	3 1312 6 discriminator 1 # matrix.c:1312:6
	testl	%eax, %eax
	je	.LBB29_6
.Ltmp818:
# BB#8:                                 # %.preheader.lr.ph
	#DEBUG_VALUE: matrix_add_worker:arg <- RDI
	#DEBUG_VALUE: matrix_add_worker:result <- RCX
	#DEBUG_VALUE: y <- EAX
	.loc	3 1281 2                # matrix.c:1281:2
	imulq	%rdx, %rsi
	.loc	3 1310 2                # matrix.c:1310:2
	movq	%rdx, %r8
	sarq	$63, %r8
	shrq	$62, %r8
	addq	%rdx, %r8
	sarq	$2, %r8
.Ltmp819:
	#DEBUG_VALUE: matrix_add_worker:x_max <- R8D
	.loc	3 1281 2                # matrix.c:1281:2
	leaq	(,%rsi,4), %rdx
	.loc	3 1277 2                # matrix.c:1277:2
	movq	(%rdi), %rbx
	.loc	3 1278 2                # matrix.c:1278:2
	movq	8(%rdi), %r9
	movq	(%rbx), %r10
	.loc	3 1281 2                # matrix.c:1281:2
	addq	%rdx, %r10
.Ltmp820:
	#DEBUG_VALUE: matrix_add_worker:matrix_a <- R10
	.loc	3 1282 2                # matrix.c:1282:2
	addq	(%r9), %rdx
.Ltmp821:
	#DEBUG_VALUE: matrix_add_worker:matrix_b <- RDX
	.loc	3 1283 2                # matrix.c:1283:2
	leaq	(%rcx,%rsi,4), %r11
.Ltmp822:
	#DEBUG_VALUE: matrix_add_worker:result <- R11
	movabsq	$17179869180, %rcx      # imm = 0x3FFFFFFFC
	.loc	3 1312 6 discriminator 1 # matrix.c:1312:6
.Ltmp823:
	leaq	(%rcx,%r8,4), %r14
	andq	%rcx, %r14
	addq	$4, %r14
	movl	%r8d, %r9d
	negl	%r9d
	vpxor	%xmm0, %xmm0, %xmm0
	vpcmpeqd	%xmm1, %xmm1, %xmm1
.Ltmp824:
	.align	16, 0x90
.LBB29_11:                              # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB29_14 Depth 2
	#DEBUG_VALUE: matrix_add_worker:arg <- RDI
	#DEBUG_VALUE: matrix_add_worker:x_max <- R8D
	testl	%r8d, %r8d
	je	.LBB29_12
.Ltmp825:
# BB#13:                                # %.lr.ph
                                        #   in Loop: Header=BB29_11 Depth=1
	#DEBUG_VALUE: matrix_add_worker:arg <- RDI
	#DEBUG_VALUE: matrix_add_worker:x_max <- R8D
	leaq	(%rdx,%r14,4), %r15
.Ltmp826:
	#DEBUG_VALUE: matrix_add_worker:matrix_b <- R15
	movl	%r9d, %ebx
	movq	%r10, %rcx
	movq	%r11, %rsi
.Ltmp827:
	.align	16, 0x90
.LBB29_14:                              #   Parent Loop BB29_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: matrix_add_worker:arg <- RDI
	#DEBUG_VALUE: matrix_add_worker:x_max <- R8D
	#DEBUG_VALUE: matrix_add_worker:matrix_b <- R15
	.loc	3 1318 22               # matrix.c:1318:22
	vmovdqa	(%rcx), %xmm2
	vpaddd	(%rdx), %xmm2, %xmm2
	.loc	3 1319 4                # matrix.c:1319:4
	vmovdqa	%xmm2, (%rsi)
	.loc	3 1321 12               # matrix.c:1321:12
	vpminud	%xmm2, %xmm1, %xmm1
	.loc	3 1322 13               # matrix.c:1322:13
	vpmaxud	%xmm2, %xmm0, %xmm0
	.loc	3 1325 4                # matrix.c:1325:4
	addq	$16, %rcx
	.loc	3 1326 4                # matrix.c:1326:4
	addq	$16, %rdx
	.loc	3 1327 4                # matrix.c:1327:4
	addq	$16, %rsi
.Ltmp828:
	.loc	3 1314 7 discriminator 1 # matrix.c:1314:7
	incl	%ebx
	jne	.LBB29_14
.Ltmp829:
# BB#9:                                 # %..loopexit_crit_edge
                                        #   in Loop: Header=BB29_11 Depth=1
	#DEBUG_VALUE: matrix_add_worker:arg <- RDI
	#DEBUG_VALUE: matrix_add_worker:x_max <- R8D
	#DEBUG_VALUE: matrix_add_worker:matrix_b <- R15
	leaq	(%r11,%r14,4), %r11
.Ltmp830:
	#DEBUG_VALUE: matrix_add_worker:result <- R11
	leaq	(%r10,%r14,4), %r10
.Ltmp831:
	#DEBUG_VALUE: matrix_add_worker:matrix_a <- R10
	jmp	.LBB29_10
.Ltmp832:
	.align	16, 0x90
.LBB29_12:                              #   in Loop: Header=BB29_11 Depth=1
	#DEBUG_VALUE: matrix_add_worker:arg <- RDI
	#DEBUG_VALUE: matrix_add_worker:x_max <- R8D
	movq	%rdx, %r15
.Ltmp833:
.LBB29_10:                              # %.loopexit
                                        #   in Loop: Header=BB29_11 Depth=1
	#DEBUG_VALUE: matrix_add_worker:arg <- RDI
	#DEBUG_VALUE: matrix_add_worker:x_max <- R8D
	movq	%r15, %rdx
	.loc	3 1312 6 discriminator 1 # matrix.c:1312:6
.Ltmp834:
	decl	%eax
.Ltmp835:
	#DEBUG_VALUE: y <- EAX
	jne	.LBB29_11
	jmp	.LBB29_7
.Ltmp836:
.LBB29_6:
	#DEBUG_VALUE: matrix_add_worker:arg <- RDI
	vpcmpeqd	%xmm1, %xmm1, %xmm1
	vpxor	%xmm0, %xmm0, %xmm0
.LBB29_7:                               # %._crit_edge
	#DEBUG_VALUE: matrix_add_worker:arg <- RDI
.Ltmp837:
	#DEBUG_VALUE: __a <- XMM1
	.loc	3 1336 19               # matrix.c:1336:19
	vpshufd	$14, %xmm1, %xmm2       # xmm2 = xmm1[2,3,0,0]
.Ltmp838:
	.loc	3 1337 10               # matrix.c:1337:10
	vpminud	%xmm2, %xmm1, %xmm1
.Ltmp839:
	.loc	3 1338 11               # matrix.c:1338:11
	vpshufd	$1, %xmm1, %xmm2        # xmm2 = xmm1[1,0,0,0]
.Ltmp840:
	.loc	3 1339 10               # matrix.c:1339:10
	vpminud	%xmm2, %xmm1, %xmm1
	.loc	3 1342 19               # matrix.c:1342:19
.Ltmp841:
	vpshufd	$14, %xmm0, %xmm2       # xmm2 = xmm0[2,3,0,0]
.Ltmp842:
	.loc	3 1343 11               # matrix.c:1343:11
	vpmaxud	%xmm2, %xmm0, %xmm0
	.loc	3 1344 11               # matrix.c:1344:11
.Ltmp843:
	vpshufd	$1, %xmm0, %xmm2        # xmm2 = xmm0[1,0,0,0]
.Ltmp844:
	.loc	3 1345 11               # matrix.c:1345:11
	vpmaxud	%xmm2, %xmm0, %xmm0
	.loc	3 1378 2                # matrix.c:1378:2
	movq	24(%rdi), %rax
	movl	56(%rdi), %ecx
	vmovd	%xmm1, (%rax,%rcx,4)
	.loc	3 1379 2                # matrix.c:1379:2
	movq	32(%rdi), %rax
	movl	56(%rdi), %ecx
	vmovd	%xmm0, (%rax,%rcx,4)
	.loc	3 1380 2                # matrix.c:1380:2
	movq	40(%rdi), %rax
	movl	56(%rdi), %ecx
	movl	$0, (%rax,%rcx,4)
.Ltmp845:
	#DEBUG_VALUE: matrix_add_worker:sum <- 0
	#DEBUG_VALUE: __a <- XMM0
.LBB29_4:                               # %.loopexit6
	xorl	%eax, %eax
	.loc	3 1383 1                # matrix.c:1383:1
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Ltmp846:
.Ltmp847:
	.size	matrix_add_worker, .Ltmp847-matrix_add_worker
.Lfunc_end29:
	.cfi_endproc

	.globl	matrix_mul
	.align	16, 0x90
	.type	matrix_mul,@function
matrix_mul:                             # @matrix_mul
.Lfunc_begin30:
	.loc	3 1642 0                # matrix.c:1642:0
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp848:
	.cfi_def_cfa_offset 16
.Ltmp849:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp850:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$88, %rsp
.Ltmp851:
	.cfi_offset %rbx, -56
.Ltmp852:
	.cfi_offset %r12, -48
.Ltmp853:
	.cfi_offset %r13, -40
.Ltmp854:
	.cfi_offset %r14, -32
.Ltmp855:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: matrix_mul:matrix_a_obj <- RDI
	#DEBUG_VALUE: matrix_mul:matrix_b_obj <- RSI
	movq	%rsi, %rbx
.Ltmp856:
	#DEBUG_VALUE: matrix_mul:matrix_b_obj <- RBX
	movq	%rdi, %r14
.Ltmp857:
	#DEBUG_VALUE: matrix_mul:matrix_a_obj <- R14
	.loc	3 1643 5 prologue_end   # matrix.c:1643:5
	movq	24(%r14), %rax
	movzbl	8(%rax), %eax
	cmpl	$3, %eax
	jne	.LBB30_1
.Ltmp858:
# BB#18:
	#DEBUG_VALUE: matrix_mul:matrix_b_obj <- RBX
	.loc	3 1645 26               # matrix.c:1645:26
	movq	%rbx, %rdi
	leaq	-40(%rbp), %rsp
	popq	%rbx
.Ltmp859:
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	cloned                  # TAILCALL
.Ltmp860:
.LBB30_1:
	#DEBUG_VALUE: matrix_mul:matrix_a_obj <- R14
	#DEBUG_VALUE: matrix_mul:matrix_b_obj <- RBX
	.loc	3 1657 5                # matrix.c:1657:5
	movzbl	%al, %eax
	cmpl	$2, %eax
	jne	.LBB30_7
.Ltmp861:
# BB#2:
	#DEBUG_VALUE: matrix_mul:matrix_a_obj <- R14
	#DEBUG_VALUE: matrix_mul:matrix_b_obj <- RBX
	.loc	3 1655 2                # matrix.c:1655:2
	movq	24(%rbx), %rax
	movzbl	8(%rax), %eax
	cmpl	$2, %eax
	jne	.LBB30_7
.Ltmp862:
# BB#3:
	#DEBUG_VALUE: matrix_mul:matrix_a_obj <- R14
	#DEBUG_VALUE: matrix_mul:matrix_b_obj <- RBX
	#DEBUG_VALUE: total <- 0
	.loc	3 1660 7                # matrix.c:1660:7
	movq	g_soft_width(%rip), %rax
.Ltmp863:
	#DEBUG_VALUE: i <- EAX
	xorl	%edi, %edi
	.loc	3 1660 7 discriminator 1 # matrix.c:1660:7
.Ltmp864:
	testl	%eax, %eax
	je	.LBB30_6
.Ltmp865:
# BB#4:                                 # %.lr.ph
	#DEBUG_VALUE: matrix_mul:matrix_a_obj <- R14
	#DEBUG_VALUE: matrix_mul:matrix_b_obj <- RBX
	#DEBUG_VALUE: total <- 0
	#DEBUG_VALUE: i <- EAX
	.loc	3 1662 4                # matrix.c:1662:4
	movq	g_hard_width(%rip), %rcx
.Ltmp866:
	.loc	3 1660 7 discriminator 1 # matrix.c:1660:7
	leal	-1(%rax), %edx
	movq	%rcx, %rsi
	imulq	%rdx, %rsi
	shlq	$2, %rsi
	addq	(%rbx), %rsi
	shlq	$2, %rcx
	negq	%rcx
	shlq	$2, %rdx
	addq	(%r14), %rdx
	negl	%eax
.Ltmp867:
	xorl	%edi, %edi
.Ltmp868:
	.align	16, 0x90
.LBB30_5:                               # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: total <- 0
	.loc	3 1662 4                # matrix.c:1662:4
	movl	(%rsi), %ebx
	imull	(%rdx), %ebx
	addl	%ebx, %edi
.Ltmp869:
	#DEBUG_VALUE: total <- EDI
	.loc	3 1660 7 discriminator 1 # matrix.c:1660:7
	addq	%rcx, %rsi
	addq	$-4, %rdx
	incl	%eax
	jne	.LBB30_5
.Ltmp870:
.LBB30_6:                               # %._crit_edge
	leaq	-40(%rbp), %rsp
.Ltmp871:
	#DEBUG_VALUE: total <- 0
	.loc	3 1664 10               # matrix.c:1664:10
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	uniform_matrix          # TAILCALL
.Ltmp872:
.LBB30_7:
	#DEBUG_VALUE: matrix_mul:matrix_a_obj <- R14
	#DEBUG_VALUE: matrix_mul:matrix_b_obj <- RBX
	.loc	3 1667 25               # matrix.c:1667:25
	callq	new_matrix
	movq	%rax, %r12
.Ltmp873:
	#DEBUG_VALUE: matrix_mul:result_obj <- R12
	.loc	3 1668 29               # matrix.c:1668:29
	movq	%rbx, %rdi
	callq	transposed
	movq	%rax, %r15
.Ltmp874:
	#DEBUG_VALUE: matrix_mul:matrix_b_t_obj <- R15
	.loc	3 1670 28               # matrix.c:1670:28
	movq	g_nthreads(%rip), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, %r13
	.loc	3 1671 29               # matrix.c:1671:29
	movq	g_nthreads(%rip), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, -72(%rbp)         # 8-byte Spill
	.loc	3 1672 28               # matrix.c:1672:28
	movq	g_nthreads(%rip), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, %rbx
.Ltmp875:
	.loc	3 1674 2                # matrix.c:1674:2
	movq	%rsp, -120(%rbp)        # 8-byte Spill
	movq	g_nthreads(%rip), %rax
	movq	%rsp, %rcx
	leaq	15(,%rax,8), %rax
	andq	$-16, %rax
	subq	%rax, %rcx
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	movq	%rcx, %rsp
	.loc	3 1676 37               # matrix.c:1676:37
	movq	g_nthreads(%rip), %rdi
	shlq	$6, %rdi
	callq	malloc
	movq	%rbx, %r9
	movq	-72(%rbp), %r8          # 8-byte Reload
	movq	%rax, -80(%rbp)         # 8-byte Spill
.Ltmp876:
	#DEBUG_VALUE: matrix_mul:start_row <- 0
	.loc	3 1678 6                # matrix.c:1678:6
	movq	g_nthreads(%rip), %rcx
.Ltmp877:
	#DEBUG_VALUE: i <- ECX
	.loc	3 1678 6 discriminator 1 # matrix.c:1678:6
	testl	%ecx, %ecx
	je	.LBB30_10
.Ltmp878:
# BB#8:                                 # %.lr.ph22
	#DEBUG_VALUE: matrix_mul:matrix_a_obj <- R14
	#DEBUG_VALUE: matrix_mul:result_obj <- R12
	#DEBUG_VALUE: matrix_mul:matrix_b_t_obj <- R15
	#DEBUG_VALUE: matrix_mul:start_row <- 0
	#DEBUG_VALUE: i <- ECX
	.loc	3 1680 3                # matrix.c:1680:3
	movq	g_height(%rip), %rax
	cqto
	idivq	g_nthreads(%rip)
.Ltmp879:
	.loc	3 1678 6 discriminator 1 # matrix.c:1678:6
	decl	%ecx
.Ltmp880:
	subq	%rcx, %rdx
	movq	%rcx, %rsi
	shlq	$6, %rsi
	movq	-80(%rbp), %rdi         # 8-byte Reload
	leaq	56(%rsi,%rdi), %rsi
	xorl	%edi, %edi
.Ltmp881:
	.align	16, 0x90
.LBB30_9:                               # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: matrix_mul:matrix_a_obj <- R14
	#DEBUG_VALUE: matrix_mul:result_obj <- R12
	#DEBUG_VALUE: matrix_mul:matrix_b_t_obj <- R15
	#DEBUG_VALUE: matrix_mul:start_row <- 0
	.loc	3 1680 3                # matrix.c:1680:3
	testq	%rdx, %rdx
	setg	%bl
	movzbl	%bl, %ebx
	addl	%eax, %ebx
.Ltmp882:
	#DEBUG_VALUE: this_rows <- EDI
	.loc	3 1681 9                # matrix.c:1681:9
	movq	%r14, -56(%rsi)
	movq	%r15, -48(%rsi)
	movq	%r12, -40(%rsi)
	movq	%r13, -32(%rsi)
	movq	%r8, -24(%rsi)
	movq	%r9, -16(%rsi)
	movl	%ebx, -8(%rsi)
	movl	%edi, -4(%rsi)
	movl	%ecx, (%rsi)
	.loc	3 1692 3                # matrix.c:1692:3
	addl	%ebx, %edi
.Ltmp883:
	#DEBUG_VALUE: matrix_mul:start_row <- EDI
	.loc	3 1678 6 discriminator 1 # matrix.c:1678:6
	decl	%ecx
	addq	$-64, %rsi
	incq	%rdx
	cmpl	$-1, %ecx
	jne	.LBB30_9
.Ltmp884:
.LBB30_10:                              # %._crit_edge23
	#DEBUG_VALUE: matrix_mul:result_obj <- R12
	#DEBUG_VALUE: matrix_mul:matrix_b_t_obj <- R15
	#DEBUG_VALUE: matrix_mul:start_row <- 0
	movq	%r9, -96(%rbp)          # 8-byte Spill
	movq	%r13, -88(%rbp)         # 8-byte Spill
	movq	%r15, -112(%rbp)        # 8-byte Spill
.Ltmp885:
	#DEBUG_VALUE: matrix_mul:matrix_b_t_obj <- [RBP+-112]
	.loc	3 1695 6                # matrix.c:1695:6
	movq	g_nthreads(%rip), %r15
.Ltmp886:
	#DEBUG_VALUE: i <- R15D
	.loc	3 1695 6 discriminator 1 # matrix.c:1695:6
	testl	%r15d, %r15d
	je	.LBB30_13
.Ltmp887:
# BB#11:                                # %.lr.ph18.preheader
	#DEBUG_VALUE: matrix_mul:result_obj <- R12
	#DEBUG_VALUE: matrix_mul:matrix_b_t_obj <- [RBP+-112]
	#DEBUG_VALUE: matrix_mul:start_row <- 0
	#DEBUG_VALUE: i <- R15D
	leal	-1(%r15), %r14d
	movq	-48(%rbp), %rax         # 8-byte Reload
	leaq	(%rax,%r14,8), %rbx
	shlq	$6, %r14
	addq	-80(%rbp), %r14         # 8-byte Folded Reload
	negl	%r15d
.Ltmp888:
	.align	16, 0x90
.LBB30_12:                              # %.lr.ph18
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: matrix_mul:result_obj <- R12
	#DEBUG_VALUE: matrix_mul:matrix_b_t_obj <- [RBP+-112]
	#DEBUG_VALUE: matrix_mul:start_row <- 0
	xorl	%esi, %esi
	.loc	3 1697 9                # matrix.c:1697:9
.Ltmp889:
	movl	$matrix_mul_worker, %edx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	pthread_create
.Ltmp890:
	.loc	3 1695 6 discriminator 1 # matrix.c:1695:6
	addq	$-64, %r14
	addq	$-8, %rbx
	incl	%r15d
	jne	.LBB30_12
.Ltmp891:
.LBB30_13:                              # %._crit_edge19
	#DEBUG_VALUE: matrix_mul:result_obj <- R12
	#DEBUG_VALUE: matrix_mul:matrix_b_t_obj <- [RBP+-112]
	#DEBUG_VALUE: matrix_mul:start_row <- 0
	#DEBUG_VALUE: matrix_mul:min <- -1
	#DEBUG_VALUE: matrix_mul:max <- 0
	#DEBUG_VALUE: matrix_mul:sum <- 0
	.loc	3 1704 2                # matrix.c:1704:2
	movq	%r12, %rdi
	movq	%r12, -104(%rbp)        # 8-byte Spill
.Ltmp892:
	#DEBUG_VALUE: matrix_mul:result_obj <- [RBP+-104]
	callq	reset_occurances
	.loc	3 1706 6                # matrix.c:1706:6
.Ltmp893:
	movq	g_nthreads(%rip), %rdx
.Ltmp894:
	#DEBUG_VALUE: i <- EDX
	.loc	3 1706 6 discriminator 1 # matrix.c:1706:6
	testl	%edx, %edx
	je	.LBB30_14
.Ltmp895:
# BB#15:                                # %.lr.ph12.preheader
	#DEBUG_VALUE: matrix_mul:result_obj <- [RBP+-104]
	#DEBUG_VALUE: matrix_mul:matrix_b_t_obj <- [RBP+-112]
	#DEBUG_VALUE: matrix_mul:start_row <- 0
	#DEBUG_VALUE: matrix_mul:min <- -1
	#DEBUG_VALUE: matrix_mul:max <- 0
	#DEBUG_VALUE: matrix_mul:sum <- 0
	#DEBUG_VALUE: i <- EDX
	leal	-1(%rdx), %eax
	movq	-72(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,4), %rdi
	movq	-88(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,4), %r15
	movq	-96(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,4), %r14
	movq	-48(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %rbx
	negl	%edx
.Ltmp896:
	movl	$-1, %esi
	xorl	%ecx, %ecx
	xorl	%r12d, %r12d
.Ltmp897:
	.align	16, 0x90
.LBB30_16:                              # %.lr.ph12
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: matrix_mul:result_obj <- [RBP+-104]
	#DEBUG_VALUE: matrix_mul:matrix_b_t_obj <- [RBP+-112]
	#DEBUG_VALUE: matrix_mul:start_row <- 0
	#DEBUG_VALUE: matrix_mul:min <- -1
	#DEBUG_VALUE: matrix_mul:max <- 0
	#DEBUG_VALUE: matrix_mul:sum <- 0
	.loc	3 1708 9                # matrix.c:1708:9
	movq	%rdi, -64(%rbp)         # 8-byte Spill
	movl	%esi, -52(%rbp)         # 4-byte Spill
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	movq	(%rbx), %rdi
	xorl	%esi, %esi
	movq	%rdx, %r13
	callq	pthread_join
	movq	-64(%rbp), %rdi         # 8-byte Reload
	movl	-52(%rbp), %esi         # 4-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	movq	%r13, %rdx
	.loc	3 1709 3                # matrix.c:1709:3
	addl	(%r14), %ecx
.Ltmp898:
	#DEBUG_VALUE: matrix_mul:sum <- ECX
	.loc	3 1710 6                # matrix.c:1710:6
	movl	(%r15), %eax
.Ltmp899:
	#DEBUG_VALUE: matrix_mul:min <- EAX
	cmpl	%esi, %eax
	cmovbl	%eax, %esi
.Ltmp900:
	.loc	3 1711 6                # matrix.c:1711:6
	movl	(%rdi), %eax
.Ltmp901:
	#DEBUG_VALUE: matrix_mul:max <- EAX
	cmpl	%r12d, %eax
	cmoval	%eax, %r12d
.Ltmp902:
	.loc	3 1706 6 discriminator 1 # matrix.c:1706:6
	addq	$-4, %rdi
	addq	$-4, %r15
	addq	$-4, %r14
	addq	$-8, %rbx
	incl	%edx
	jne	.LBB30_16
	jmp	.LBB30_17
.Ltmp903:
.LBB30_14:
	#DEBUG_VALUE: matrix_mul:result_obj <- [RBP+-104]
	#DEBUG_VALUE: matrix_mul:matrix_b_t_obj <- [RBP+-112]
	#DEBUG_VALUE: matrix_mul:start_row <- 0
	#DEBUG_VALUE: matrix_mul:min <- -1
	#DEBUG_VALUE: matrix_mul:max <- 0
	#DEBUG_VALUE: matrix_mul:sum <- 0
	xorl	%ecx, %ecx
	movl	$-1, %esi
	xorl	%r12d, %r12d
.Ltmp904:
.LBB30_17:
	#DEBUG_VALUE: matrix_mul:result_obj <- [RBP+-104]
	#DEBUG_VALUE: matrix_mul:matrix_b_t_obj <- [RBP+-112]
	#DEBUG_VALUE: matrix_mul:start_row <- 0
	#DEBUG_VALUE: matrix_mul:min <- -1
	#DEBUG_VALUE: matrix_mul:max <- 0
	#DEBUG_VALUE: matrix_mul:sum <- 0
	movq	-104(%rbp), %rbx        # 8-byte Reload
.Ltmp905:
	#DEBUG_VALUE: matrix_mul:result_obj <- RBX
	.loc	3 1714 2                # matrix.c:1714:2
	movl	%esi, 8(%rbx)
	.loc	3 1715 2                # matrix.c:1715:2
	movl	%r12d, 12(%rbx)
	.loc	3 1716 2                # matrix.c:1716:2
	movl	%ecx, 16(%rbx)
	.loc	3 1718 2                # matrix.c:1718:2
	movq	-88(%rbp), %rdi         # 8-byte Reload
	callq	free
	.loc	3 1719 2                # matrix.c:1719:2
	movq	-72(%rbp), %rdi         # 8-byte Reload
	callq	free
	.loc	3 1720 2                # matrix.c:1720:2
	movq	-96(%rbp), %rdi         # 8-byte Reload
	callq	free
	.loc	3 1722 2                # matrix.c:1722:2
	movq	-112(%rbp), %rdi        # 8-byte Reload
	callq	release_matrix_obj
	.loc	3 1723 2                # matrix.c:1723:2
	movq	-80(%rbp), %rdi         # 8-byte Reload
	callq	free
	.loc	3 1727 1                # matrix.c:1727:1
	movq	-120(%rbp), %rsp        # 8-byte Reload
	movq	%rbx, %rax
	leaq	-40(%rbp), %rsp
	popq	%rbx
.Ltmp906:
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
.Ltmp907:
	retq
.Ltmp908:
.Ltmp909:
	.size	matrix_mul, .Ltmp909-matrix_mul
.Lfunc_end30:
	.cfi_endproc

	.align	16, 0x90
	.type	matrix_mul_worker,@function
matrix_mul_worker:                      # @matrix_mul_worker
.Lfunc_begin31:
	.loc	3 1494 0                # matrix.c:1494:0
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp910:
	.cfi_def_cfa_offset 16
.Ltmp911:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp912:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
.Ltmp913:
	.cfi_offset %rbx, -56
.Ltmp914:
	.cfi_offset %r12, -48
.Ltmp915:
	.cfi_offset %r13, -40
.Ltmp916:
	.cfi_offset %r14, -32
.Ltmp917:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: matrix_mul_worker:arg <- RDI
	movl	$4294967295, %r11d      # imm = 0xFFFFFFFF
	.loc	3 1496 2 prologue_end   # matrix.c:1496:2
.Ltmp918:
	movq	(%rdi), %rax
	.loc	3 1497 2                # matrix.c:1497:2
	movq	8(%rdi), %rsi
	.loc	3 1496 2                # matrix.c:1496:2
	movq	(%rax), %rcx
.Ltmp919:
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	.loc	3 1509 2                # matrix.c:1509:2
	movq	24(%rax), %rax
	.loc	3 1497 2                # matrix.c:1497:2
	movq	(%rsi), %r13
.Ltmp920:
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	.loc	3 1510 2                # matrix.c:1510:2
	movq	24(%rsi), %rbx
	.loc	3 1498 2                # matrix.c:1498:2
	movq	16(%rdi), %rsi
	movq	(%rsi), %rsi
.Ltmp921:
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	.loc	3 1512 5                # matrix.c:1512:5
	movq	%rsi, -56(%rbp)         # 8-byte Spill
	movzbl	8(%rax), %esi
	movzbl	8(%rbx), %r9d
	cmpl	$2, %r9d
	setne	%bl
	cmpl	$2, %esi
	je	.LBB31_13
.Ltmp922:
# BB#1:
	#DEBUG_VALUE: matrix_mul_worker:arg <- RDI
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	testb	%bl, %bl
	jne	.LBB31_13
.Ltmp923:
# BB#2:
	#DEBUG_VALUE: matrix_mul_worker:arg <- RDI
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 1
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	.loc	3 1539 3                # matrix.c:1539:3
	movl	52(%rdi), %r15d
.Ltmp924:
	#DEBUG_VALUE: curr_y <- R15D
	.loc	3 1540 3                # matrix.c:1540:3
	movq	g_hard_width(%rip), %rax
	movq	%rax, %rdx
	sarq	$63, %rdx
	shrq	$62, %rdx
	addq	%rax, %rdx
	sarq	$2, %rdx
.Ltmp925:
	#DEBUG_VALUE: max_x <- EDX
	movq	%rdx, -48(%rbp)         # 8-byte Spill
.Ltmp926:
	#DEBUG_VALUE: max_x <- [RBP+-48]
	.loc	3 1537 5                # matrix.c:1537:5
	movzbl	%r9b, %eax
	cmpl	$2, %eax
	jne	.LBB31_32
.Ltmp927:
# BB#3:
	#DEBUG_VALUE: matrix_mul_worker:arg <- RDI
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 1
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: curr_y <- R15D
	#DEBUG_VALUE: max_x <- [RBP+-48]
	.loc	3 1541 7                # matrix.c:1541:7
	movl	48(%rdi), %r14d
.Ltmp928:
	#DEBUG_VALUE: y <- R14D
	movq	%rdi, -96(%rbp)         # 8-byte Spill
.Ltmp929:
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	.loc	3 1541 7 discriminator 1 # matrix.c:1541:7
	testl	%r14d, %r14d
	je	.LBB31_4
.Ltmp930:
# BB#5:                                 # %.preheader33.lr.ph
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 1
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: curr_y <- R15D
	#DEBUG_VALUE: max_x <- [RBP+-48]
	#DEBUG_VALUE: y <- R14D
	.loc	3 1555 4                # matrix.c:1555:4
	movq	g_soft_width(%rip), %rsi
.Ltmp931:
	#DEBUG_VALUE: x <- ESI
	.loc	3 1560 8                # matrix.c:1560:8
	movq	g_hard_width(%rip), %rax
	movq	%rax, -64(%rbp)         # 8-byte Spill
	movq	-48(%rbp), %r8          # 8-byte Reload
.Ltmp932:
	#DEBUG_VALUE: max_x <- R8D
	.loc	3 1541 7 discriminator 1 # matrix.c:1541:7
	leal	-4(,%r8,4), %eax
	movl	%eax, -72(%rbp)         # 4-byte Spill
	movl	%r8d, %eax
.Ltmp933:
	#DEBUG_VALUE: max_x <- [RBP+-48]
	negl	%eax
	movl	%eax, -80(%rbp)         # 4-byte Spill
	movl	%esi, %eax
	negl	%eax
	movl	%eax, -84(%rbp)         # 4-byte Spill
	xorl	%edx, %edx
	movl	$-1, %r12d
	xorl	%r9d, %r9d
.Ltmp934:
	.align	16, 0x90
.LBB31_6:                               # %.preheader33
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB31_8 Depth 2
                                        #     Child Loop BB31_11 Depth 2
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 1
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: max_x <- [RBP+-48]
	movq	%r9, %r11
	movl	%r12d, %eax
	movl	%r15d, %r10d
	vpxor	%xmm0, %xmm0, %xmm0
	movq	-48(%rbp), %rdi         # 8-byte Reload
	testl	%edi, %edi
	je	.LBB31_9
.Ltmp935:
# BB#7:                                 # %.lr.ph73
                                        #   in Loop: Header=BB31_6 Depth=1
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 1
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: max_x <- [RBP+-48]
	.loc	3 1546 38               # matrix.c:1546:38
	movq	%r10, %r9
	imulq	-64(%rbp), %r9          # 8-byte Folded Reload
	vpxor	%xmm0, %xmm0, %xmm0
	movl	-80(%rbp), %ebx         # 4-byte Reload
	movl	-72(%rbp), %edi         # 4-byte Reload
.Ltmp936:
	.align	16, 0x90
.LBB31_8:                               #   Parent Loop BB31_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 1
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: max_x <- [RBP+-48]
	movl	%edi, %r8d
	leaq	(%r9,%r8), %r12
	vmovdqa	(%rcx,%r12,4), %xmm1
	vpmulld	(%r13,%r8,4), %xmm1, %xmm1
	.loc	3 1546 15               # matrix.c:1546:15
	vpaddd	%xmm1, %xmm0, %xmm0
.Ltmp937:
	.loc	3 1544 8 discriminator 1 # matrix.c:1544:8
	addl	$-4, %edi
	incl	%ebx
	jne	.LBB31_8
.Ltmp938:
.LBB31_9:                               # %._crit_edge74
                                        #   in Loop: Header=BB31_6 Depth=1
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 1
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: max_x <- [RBP+-48]
	.loc	3 1548 21               # matrix.c:1548:21
	vpshufd	$14, %xmm0, %xmm1       # xmm1 = xmm0[2,3,0,0]
.Ltmp939:
	.loc	3 1549 14               # matrix.c:1549:14
	vpaddd	%xmm1, %xmm0, %xmm0
	.loc	3 1551 14               # matrix.c:1551:14
	vphaddd	%xmm0, %xmm0, %xmm0
	.loc	3 1552 31               # matrix.c:1552:31
	vmovd	%xmm0, %r9d
.Ltmp940:
	#DEBUG_VALUE: x_same <- R9D
	#DEBUG_VALUE: matrix_mul_worker:max <- R9D
	#DEBUG_VALUE: matrix_mul_worker:min <- R9D
	movl	%eax, %r12d
	.loc	3 1553 7                # matrix.c:1553:7
.Ltmp941:
	cmpl	%r12d, %r9d
	cmovbl	%r9d, %r12d
.Ltmp942:
	.loc	3 1554 7                # matrix.c:1554:7
	cmpl	%edx, %r9d
	cmoval	%r9d, %edx
	testl	%esi, %esi
.Ltmp943:
	#DEBUG_VALUE: curr_x <- 0
	je	.LBB31_12
.Ltmp944:
# BB#10:                                #   in Loop: Header=BB31_6 Depth=1
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- R9D
	#DEBUG_VALUE: matrix_mul_worker:max <- R9D
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 1
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: max_x <- [RBP+-48]
	.loc	3 1541 7 discriminator 1 # matrix.c:1541:7
	movq	-64(%rbp), %rdi         # 8-byte Reload
	imulq	%r10, %rdi
	movq	-56(%rbp), %rax         # 8-byte Reload
	leaq	(%rax,%rdi,4), %rdi
	movl	-84(%rbp), %ebx         # 4-byte Reload
.Ltmp945:
	.align	16, 0x90
.LBB31_11:                              #   Parent Loop BB31_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- R9D
	#DEBUG_VALUE: matrix_mul_worker:max <- R9D
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 1
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: max_x <- [RBP+-48]
	.loc	3 1560 8                # matrix.c:1560:8
	movl	%r9d, (%rdi)
.Ltmp946:
	.loc	3 1558 8 discriminator 1 # matrix.c:1558:8
	addq	$4, %rdi
	incl	%ebx
	jne	.LBB31_11
.Ltmp947:
.LBB31_12:                              # %._crit_edge80
                                        #   in Loop: Header=BB31_6 Depth=1
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- R9D
	#DEBUG_VALUE: matrix_mul_worker:max <- R9D
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 1
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: max_x <- [RBP+-48]
	#DEBUG_VALUE: x_same <- R9D
	#DEBUG_VALUE: curr_x <- 0
	.loc	3 1541 7 discriminator 1 # matrix.c:1541:7
	decl	%r14d
.Ltmp948:
	#DEBUG_VALUE: y <- R14D
	.loc	3 1555 4                # matrix.c:1555:4
	movq	%rsi, %rdi
	imulq	%r9, %rdi
	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
	movq	%r11, %r9
.Ltmp949:
	andq	%rax, %r9
	addq	%rdi, %r9
.Ltmp950:
	#DEBUG_VALUE: matrix_mul_worker:sum <- R9D
	.loc	3 1563 4                # matrix.c:1563:4
	incl	%r15d
.Ltmp951:
	#DEBUG_VALUE: curr_y <- R15D
	.loc	3 1541 7 discriminator 1 # matrix.c:1541:7
	testl	%r14d, %r14d
	jne	.LBB31_6
	jmp	.LBB31_43
.Ltmp952:
.LBB31_13:
	#DEBUG_VALUE: matrix_mul_worker:arg <- RDI
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	movzbl	%sil, %eax
	.loc	3 1606 3                # matrix.c:1606:3
.Ltmp953:
	movq	g_hard_width(%rip), %rbx
	movq	%rbx, %rdx
	sarq	$63, %rdx
	shrq	$62, %rdx
	addq	%rbx, %rdx
	sarq	$2, %rdx
	movq	%rdx, -48(%rbp)         # 8-byte Spill
.Ltmp954:
	.loc	3 1568 3                # matrix.c:1568:3
	movl	52(%rdi), %r15d
	cmpl	$2, %eax
	je	.LBB31_15
.Ltmp955:
# BB#14:
	#DEBUG_VALUE: matrix_mul_worker:arg <- RDI
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	movzbl	%r9b, %eax
	cmpl	$2, %eax
	je	.LBB31_15
.Ltmp956:
.LBB31_32:                              # %.thread30
	#DEBUG_VALUE: matrix_mul_worker:arg <- RDI
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	.loc	3 1607 7                # matrix.c:1607:7
	movl	48(%rdi), %ebx
.Ltmp957:
	#DEBUG_VALUE: y <- EBX
	.loc	3 1607 7 discriminator 1 # matrix.c:1607:7
	testl	%ebx, %ebx
	je	.LBB31_33
.Ltmp958:
# BB#34:                                # %.lr.ph68
	#DEBUG_VALUE: matrix_mul_worker:arg <- RDI
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: y <- EBX
	movq	%rdi, -96(%rbp)         # 8-byte Spill
.Ltmp959:
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	.loc	3 1610 8                # matrix.c:1610:8
	movl	g_soft_width(%rip), %esi
.Ltmp960:
	#DEBUG_VALUE: x <- ESI
	#DEBUG_VALUE: max_x <- [RBP+-48]
	.loc	3 1625 5                # matrix.c:1625:5
	movl	%esi, -88(%rbp)         # 4-byte Spill
	movq	g_hard_width(%rip), %rax
.Ltmp961:
	.loc	3 1607 7 discriminator 1 # matrix.c:1607:7
	movq	%rax, -64(%rbp)         # 8-byte Spill
	movq	-48(%rbp), %rax         # 8-byte Reload
	leal	-4(,%rax,4), %eax
	movl	%eax, -72(%rbp)         # 4-byte Spill
	xorl	%edx, %edx
	movl	$-1, %r12d
	xorl	%r9d, %r9d
.Ltmp962:
	.align	16, 0x90
.LBB31_35:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB31_38 Depth 2
                                        #       Child Loop BB31_40 Depth 3
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: curr_x <- 0
	testl	%esi, %esi
	je	.LBB31_36
.Ltmp963:
# BB#37:                                # %.preheader31.lr.ph
                                        #   in Loop: Header=BB31_35 Depth=1
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: curr_x <- 0
	movl	%ebx, -84(%rbp)         # 4-byte Spill
	.loc	3 1625 5                # matrix.c:1625:5
.Ltmp964:
	movl	%r15d, %edi
	movq	%r15, -80(%rbp)         # 8-byte Spill
	imulq	-64(%rbp), %rdi         # 8-byte Folded Reload
	xorl	%ebx, %ebx
	movl	%esi, %r14d
.Ltmp965:
	.align	16, 0x90
.LBB31_38:                              # %.preheader31
                                        #   Parent Loop BB31_35 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB31_40 Depth 3
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: curr_x <- 0
	movq	%r9, %r8
	movl	%r12d, %esi
	vpxor	%xmm0, %xmm0, %xmm0
	movq	-48(%rbp), %rax         # 8-byte Reload
	testl	%eax, %eax
	je	.LBB31_41
.Ltmp966:
# BB#39:                                # %.lr.ph53
                                        #   in Loop: Header=BB31_38 Depth=2
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: curr_x <- 0
	.loc	3 1615 37               # matrix.c:1615:37
	movq	-64(%rbp), %r15         # 8-byte Reload
	imulq	%rbx, %r15
	vpxor	%xmm0, %xmm0, %xmm0
	movl	-72(%rbp), %r12d        # 4-byte Reload
	movq	-48(%rbp), %rax         # 8-byte Reload
	movl	%eax, %r9d
.Ltmp967:
	.align	16, 0x90
.LBB31_40:                              #   Parent Loop BB31_35 Depth=1
                                        #     Parent Loop BB31_38 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: curr_x <- 0
	movl	%r12d, %r10d
	leaq	(%rdi,%r10), %r11
	addq	%r15, %r10
.Ltmp968:
	.loc	3 1613 9 discriminator 1 # matrix.c:1613:9
	addl	$-4, %r12d
.Ltmp969:
	.loc	3 1615 37               # matrix.c:1615:37
	vmovdqa	(%rcx,%r11,4), %xmm1
	vpmulld	(%r13,%r10,4), %xmm1, %xmm1
	.loc	3 1615 15               # matrix.c:1615:15
	vpaddd	%xmm1, %xmm0, %xmm0
.Ltmp970:
	.loc	3 1613 9 discriminator 1 # matrix.c:1613:9
	decl	%r9d
	jne	.LBB31_40
.Ltmp971:
.LBB31_41:                              # %._crit_edge54
                                        #   in Loop: Header=BB31_38 Depth=2
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: curr_x <- 0
	.loc	3 1610 8 discriminator 1 # matrix.c:1610:8
	decl	%r14d
.Ltmp972:
	#DEBUG_VALUE: x <- R14D
	.loc	3 1617 22               # matrix.c:1617:22
	vpshufd	$14, %xmm0, %xmm1       # xmm1 = xmm0[2,3,0,0]
.Ltmp973:
	.loc	3 1618 14               # matrix.c:1618:14
	vpaddd	%xmm1, %xmm0, %xmm0
	.loc	3 1620 14               # matrix.c:1620:14
	vphaddd	%xmm0, %xmm0, %xmm0
	.loc	3 1621 31               # matrix.c:1621:31
	vmovd	%xmm0, %eax
.Ltmp974:
	#DEBUG_VALUE: total <- EAX
	#DEBUG_VALUE: matrix_mul_worker:max <- EAX
	#DEBUG_VALUE: matrix_mul_worker:min <- EAX
	movl	%esi, %r12d
	.loc	3 1622 8                # matrix.c:1622:8
.Ltmp975:
	cmpl	%r12d, %eax
	cmovbl	%eax, %r12d
.Ltmp976:
	.loc	3 1623 8                # matrix.c:1623:8
	cmpl	%edx, %eax
	cmoval	%eax, %edx
	movq	%r8, %r9
.Ltmp977:
	.loc	3 1624 5                # matrix.c:1624:5
	addl	%eax, %r9d
.Ltmp978:
	#DEBUG_VALUE: matrix_mul_worker:sum <- R9D
	.loc	3 1625 5                # matrix.c:1625:5
	leaq	(%rdi,%rbx), %rax
.Ltmp979:
	movq	-56(%rbp), %rsi         # 8-byte Reload
	vmovd	%xmm0, (%rsi,%rax,4)
.Ltmp980:
	.loc	3 1610 8 discriminator 1 # matrix.c:1610:8
	incq	%rbx
	testl	%r14d, %r14d
	jne	.LBB31_38
	jmp	.LBB31_42
.Ltmp981:
	.align	16, 0x90
.LBB31_36:                              #   in Loop: Header=BB31_35 Depth=1
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	movl	%ebx, -84(%rbp)         # 4-byte Spill
	movq	%r15, -80(%rbp)         # 8-byte Spill
.Ltmp982:
.LBB31_42:                              # %._crit_edge60
                                        #   in Loop: Header=BB31_35 Depth=1
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: curr_x <- 0
	movl	-84(%rbp), %ebx         # 4-byte Reload
	.loc	3 1607 7 discriminator 1 # matrix.c:1607:7
.Ltmp983:
	decl	%ebx
.Ltmp984:
	#DEBUG_VALUE: y <- EBX
	movq	-80(%rbp), %r15         # 8-byte Reload
.Ltmp985:
	.loc	3 1628 4                # matrix.c:1628:4
	incl	%r15d
.Ltmp986:
	#DEBUG_VALUE: curr_y <- R15D
	.loc	3 1607 7 discriminator 1 # matrix.c:1607:7
	testl	%ebx, %ebx
	movl	-88(%rbp), %esi         # 4-byte Reload
	jne	.LBB31_35
	jmp	.LBB31_43
.Ltmp987:
.LBB31_15:
	#DEBUG_VALUE: matrix_mul_worker:arg <- RDI
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	.loc	3 1570 3                # matrix.c:1570:3
	movq	%rsp, %r8
	movq	g_soft_width(%rip), %rax
	movq	%rsp, %r10
	leaq	15(,%rax,4), %rax
	andq	$-16, %rax
	subq	%rax, %r10
	movq	%r10, %rsp
.Ltmp988:
	#DEBUG_VALUE: curr_x <- 0
	.loc	3 1573 7                # matrix.c:1573:7
	movq	g_soft_width(%rip), %rdx
.Ltmp989:
	#DEBUG_VALUE: x <- EDX
	xorl	%ebx, %ebx
	.loc	3 1573 7 discriminator 1 # matrix.c:1573:7
.Ltmp990:
	testl	%edx, %edx
	je	.LBB31_22
.Ltmp991:
# BB#16:                                # %.preheader.lr.ph
	#DEBUG_VALUE: matrix_mul_worker:arg <- RDI
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: curr_x <- 0
	#DEBUG_VALUE: x <- EDX
	movq	%r8, -64(%rbp)          # 8-byte Spill
	movq	%r15, -80(%rbp)         # 8-byte Spill
	movq	%rdi, -96(%rbp)         # 8-byte Spill
.Ltmp992:
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	.loc	3 1578 36               # matrix.c:1578:36
	movq	g_hard_width(%rip), %r15
	movq	-48(%rbp), %rax         # 8-byte Reload
.Ltmp993:
	.loc	3 1573 7 discriminator 1 # matrix.c:1573:7
	leal	-4(,%rax,4), %r12d
	movl	%eax, %r8d
	movq	%rax, %r11
	negl	%r8d
	xorl	%edi, %edi
	movq	%rdx, -72(%rbp)         # 8-byte Spill
                                        # kill: EDX<def> EDX<kill> RDX<kill>
.Ltmp994:
	#DEBUG_VALUE: x <- [RBP+-72]
	.align	16, 0x90
.LBB31_17:                              # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB31_19 Depth 2
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: curr_x <- 0
	#DEBUG_VALUE: x <- [RBP+-72]
	vpxor	%xmm0, %xmm0, %xmm0
	testl	%r11d, %r11d
	je	.LBB31_20
.Ltmp995:
# BB#18:                                # %.lr.ph46
                                        #   in Loop: Header=BB31_17 Depth=1
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: curr_x <- 0
	#DEBUG_VALUE: x <- [RBP+-72]
	.loc	3 1578 36               # matrix.c:1578:36
	movq	%r15, %rsi
	imulq	%rdi, %rsi
	vpxor	%xmm0, %xmm0, %xmm0
	movl	%r8d, %eax
	movl	%r12d, %ebx
.Ltmp996:
	.align	16, 0x90
.LBB31_19:                              #   Parent Loop BB31_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: curr_x <- 0
	#DEBUG_VALUE: x <- [RBP+-72]
	movl	%ebx, %r14d
	leaq	(%rsi,%r14), %r9
	vmovdqa	(%rcx,%r14,4), %xmm1
	vpmulld	(%r13,%r9,4), %xmm1, %xmm1
	.loc	3 1578 14               # matrix.c:1578:14
	vpaddd	%xmm1, %xmm0, %xmm0
.Ltmp997:
	.loc	3 1576 8 discriminator 1 # matrix.c:1576:8
	addl	$-4, %ebx
	incl	%eax
	jne	.LBB31_19
.Ltmp998:
.LBB31_20:                              # %._crit_edge47
                                        #   in Loop: Header=BB31_17 Depth=1
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:matrix_a <- RCX
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:matrix_b <- R13
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: curr_x <- 0
	#DEBUG_VALUE: x <- [RBP+-72]
	.loc	3 1573 7 discriminator 1 # matrix.c:1573:7
	decl	%edx
.Ltmp999:
	#DEBUG_VALUE: x <- EDX
	.loc	3 1580 21               # matrix.c:1580:21
	vpshufd	$14, %xmm0, %xmm1       # xmm1 = xmm0[2,3,0,0]
.Ltmp1000:
	.loc	3 1581 13               # matrix.c:1581:13
	vpaddd	%xmm1, %xmm0, %xmm0
	.loc	3 1583 13               # matrix.c:1583:13
	vphaddd	%xmm0, %xmm0, %xmm0
	.loc	3 1585 4                # matrix.c:1585:4
	vmovd	%xmm0, (%r10,%rdi,4)
.Ltmp1001:
	.loc	3 1573 7 discriminator 1 # matrix.c:1573:7
	incq	%rdi
	testl	%edx, %edx
	jne	.LBB31_17
.Ltmp1002:
# BB#21:                                # %._crit_edge50
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: curr_x <- 0
	movl	$4294967295, %r11d      # imm = 0xFFFFFFFF
	movq	-72(%rbp), %rax         # 8-byte Reload
	andq	%r11, %rax
	movq	%rax, %rbx
	movq	-96(%rbp), %rdi         # 8-byte Reload
.Ltmp1003:
	#DEBUG_VALUE: matrix_mul_worker:arg <- RDI
	movq	-80(%rbp), %r15         # 8-byte Reload
	movq	-64(%rbp), %r8          # 8-byte Reload
.Ltmp1004:
.LBB31_22:
	#DEBUG_VALUE: matrix_mul_worker:arg <- RDI
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: curr_x <- 0
	.loc	3 1588 7                # matrix.c:1588:7
	movl	48(%rdi), %ecx
.Ltmp1005:
	#DEBUG_VALUE: y <- ECX
	.loc	3 1588 7 discriminator 1 # matrix.c:1588:7
	testl	%ecx, %ecx
	je	.LBB31_27
.Ltmp1006:
# BB#23:                                # %.lr.ph43
	#DEBUG_VALUE: matrix_mul_worker:arg <- RDI
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: curr_x <- 0
	#DEBUG_VALUE: y <- ECX
	#DEBUG_VALUE: x <- EDX
	.loc	3 1590 8                # matrix.c:1590:8
	movl	g_soft_width(%rip), %edx
.Ltmp1007:
	movq	g_hard_width(%rip), %rax
	.loc	3 1592 5                # matrix.c:1592:5
.Ltmp1008:
	imulq	%r15, %rax
	addq	%rbx, %rax
.Ltmp1009:
	.align	16, 0x90
.LBB31_26:                              # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: matrix_mul_worker:arg <- RDI
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: curr_x <- 0
	#DEBUG_VALUE: x <- EDX
	.loc	3 1588 7 discriminator 1 # matrix.c:1588:7
	decl	%ecx
.Ltmp1010:
	#DEBUG_VALUE: y <- ECX
	testl	%edx, %edx
	je	.LBB31_25
.Ltmp1011:
# BB#24:                                # %..loopexit_crit_edge
                                        #   in Loop: Header=BB31_26 Depth=1
	#DEBUG_VALUE: matrix_mul_worker:arg <- RDI
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: curr_x <- 0
	#DEBUG_VALUE: y <- ECX
	#DEBUG_VALUE: x <- EDX
	.loc	3 1592 5                # matrix.c:1592:5
	movl	(%r10), %esi
	movq	-56(%rbp), %rbx         # 8-byte Reload
	movl	%esi, (%rbx,%rax,4)
.Ltmp1012:
.LBB31_25:                              # %.loopexit
                                        #   in Loop: Header=BB31_26 Depth=1
	#DEBUG_VALUE: matrix_mul_worker:arg <- RDI
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:result <- [RBP+-56]
	#DEBUG_VALUE: curr_x <- 0
	#DEBUG_VALUE: y <- ECX
	.loc	3 1588 7 discriminator 1 # matrix.c:1588:7
	testl	%ecx, %ecx
	jne	.LBB31_26
.Ltmp1013:
.LBB31_27:                              # %._crit_edge44
	#DEBUG_VALUE: matrix_mul_worker:arg <- RDI
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: curr_x <- 0
	.loc	3 1596 7                # matrix.c:1596:7
	movq	g_height(%rip), %rcx
.Ltmp1014:
	#DEBUG_VALUE: i <- ECX
	.loc	3 1596 7 discriminator 1 # matrix.c:1596:7
	testl	%ecx, %ecx
	je	.LBB31_28
.Ltmp1015:
# BB#29:                                # %.lr.ph
	#DEBUG_VALUE: matrix_mul_worker:arg <- RDI
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: curr_x <- 0
	#DEBUG_VALUE: i <- ECX
	movq	%rdi, -96(%rbp)         # 8-byte Spill
.Ltmp1016:
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	.loc	3 1600 4                # matrix.c:1600:4
	movq	g_height(%rip), %rsi
.Ltmp1017:
	.loc	3 1596 7 discriminator 1 # matrix.c:1596:7
	leal	-1(%rcx), %eax
	leaq	(%r10,%rax,4), %rdi
	negl	%ecx
.Ltmp1018:
	xorl	%edx, %edx
	movl	$-1, %r12d
	xorl	%r9d, %r9d
.Ltmp1019:
	.align	16, 0x90
.LBB31_30:                              # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: curr_x <- 0
	.loc	3 1600 4                # matrix.c:1600:4
	movl	(%rdi), %ebx
	.loc	3 1598 7                # matrix.c:1598:7
.Ltmp1020:
	cmpl	%r12d, %ebx
	cmovbl	%ebx, %r12d
.Ltmp1021:
	.loc	3 1599 7                # matrix.c:1599:7
	cmpl	%edx, %ebx
	cmoval	%ebx, %edx
.Ltmp1022:
	.loc	3 1600 4                # matrix.c:1600:4
	imulq	%rsi, %rbx
	andq	%r11, %r9
	addq	%rbx, %r9
.Ltmp1023:
	.loc	3 1596 7 discriminator 1 # matrix.c:1596:7
	addq	$-4, %rdi
	incl	%ecx
	jne	.LBB31_30
.Ltmp1024:
# BB#31:
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: curr_x <- 0
	.loc	3 1602 2                # matrix.c:1602:2
	movq	%r8, %rsp
	jmp	.LBB31_43
.LBB31_33:
.Ltmp1025:
	#DEBUG_VALUE: matrix_mul_worker:arg <- RDI
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	movq	%rdi, -96(%rbp)         # 8-byte Spill
.Ltmp1026:
.LBB31_4:
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 1
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	xorl	%r9d, %r9d
	movl	$-1, %r12d
	xorl	%edx, %edx
	jmp	.LBB31_43
.LBB31_28:
.Ltmp1027:
	#DEBUG_VALUE: matrix_mul_worker:arg <- RDI
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	movq	%rdi, -96(%rbp)         # 8-byte Spill
.Ltmp1028:
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	movl	$-1, %r12d
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	#DEBUG_VALUE: curr_x <- 0
	movq	%r8, %rsp
.Ltmp1029:
.LBB31_43:                              # %.loopexit32
	#DEBUG_VALUE: matrix_mul_worker:arg <- [RBP+-96]
	#DEBUG_VALUE: matrix_mul_worker:min <- -1
	#DEBUG_VALUE: matrix_mul_worker:max <- 0
	#DEBUG_VALUE: matrix_mul_worker:sum <- 0
	#DEBUG_VALUE: matrix_mul_worker:x_share_num <- 0
	#DEBUG_VALUE: matrix_mul_worker:y_share_num <- 0
	movq	-96(%rbp), %rsi         # 8-byte Reload
.Ltmp1030:
	#DEBUG_VALUE: matrix_mul_worker:arg <- RSI
	.loc	3 1632 2                # matrix.c:1632:2
	movq	24(%rsi), %rax
	movl	56(%rsi), %ecx
	movl	%r12d, (%rax,%rcx,4)
	.loc	3 1633 2                # matrix.c:1633:2
	movq	32(%rsi), %rax
	movl	56(%rsi), %ecx
	movl	%edx, (%rax,%rcx,4)
	.loc	3 1634 2                # matrix.c:1634:2
	movq	40(%rsi), %rax
	movl	56(%rsi), %ecx
	movl	%r9d, (%rax,%rcx,4)
	xorl	%eax, %eax
	.loc	3 1636 2                # matrix.c:1636:2
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp1031:
.Ltmp1032:
	.size	matrix_mul_worker, .Ltmp1032-matrix_mul_worker
.Lfunc_end31:
	.cfi_endproc

	.align	16, 0x90
	.type	release_matrix_obj,@function
release_matrix_obj:                     # @release_matrix_obj
.Lfunc_begin32:
	.loc	3 197 0                 # matrix.c:197:0
	.cfi_startproc
# BB#0:
	pushq	%rbx
.Ltmp1033:
	.cfi_def_cfa_offset 16
.Ltmp1034:
	.cfi_offset %rbx, -16
	#DEBUG_VALUE: release_matrix_obj:matrix_obj <- RDI
	movq	%rdi, %rbx
.Ltmp1035:
	#DEBUG_VALUE: release_matrix_obj:matrix_obj <- RBX
	.loc	3 198 2 prologue_end    # matrix.c:198:2
	movq	24(%rbx), %rax
	movq	(%rax), %rdi
	callq	free
	.loc	3 199 2                 # matrix.c:199:2
	movq	24(%rbx), %rdi
	callq	free
	.loc	3 200 2                 # matrix.c:200:2
	movq	(%rbx), %rdi
	callq	free
	.loc	3 201 2                 # matrix.c:201:2
	movq	%rbx, %rdi
	popq	%rbx
.Ltmp1036:
	jmp	free                    # TAILCALL
.Ltmp1037:
.Ltmp1038:
	.size	release_matrix_obj, .Ltmp1038-release_matrix_obj
.Lfunc_end32:
	.cfi_endproc

	.globl	matrix_pow
	.align	16, 0x90
	.type	matrix_pow,@function
matrix_pow:                             # @matrix_pow
.Lfunc_begin33:
	.loc	3 1801 0                # matrix.c:1801:0
	.cfi_startproc
# BB#0:
	#DEBUG_VALUE: matrix_pow:matrix_obj <- RDI
	#DEBUG_VALUE: matrix_pow:exponent <- ESI
	.loc	3 1802 5 prologue_end   # matrix.c:1802:5
	testl	%esi, %esi
	jne	.LBB33_1
.Ltmp1039:
# BB#3:
	.loc	3 1809 10               # matrix.c:1809:10
	jmp	identity_matrix         # TAILCALL
.Ltmp1040:
.LBB33_1:
	#DEBUG_VALUE: matrix_pow:matrix_obj <- RDI
	#DEBUG_VALUE: matrix_pow:exponent <- ESI
	cmpl	$1, %esi
	jne	.LBB33_4
# BB#2:
	#DEBUG_VALUE: matrix_pow:matrix_obj <- RDI
	jmp	cloned                  # TAILCALL
.LBB33_4:
	#DEBUG_VALUE: matrix_pow:matrix_obj <- RDI
	#DEBUG_VALUE: matrix_pow:exponent <- ESI
	.loc	3 1812 5                # matrix.c:1812:5
.Ltmp1041:
	movq	24(%rdi), %rax
	movzbl	8(%rax), %eax
	cmpl	$3, %eax
	jne	.LBB33_6
.Ltmp1042:
# BB#5:
	#DEBUG_VALUE: matrix_pow:matrix_obj <- RDI
	jmp	cloned                  # TAILCALL
.LBB33_6:
	#DEBUG_VALUE: matrix_pow:matrix_obj <- RDI
	#DEBUG_VALUE: matrix_pow:exponent <- ESI
	jmp	m_pow                   # TAILCALL
.Ltmp1043:
	.size	matrix_pow, .Ltmp1043-matrix_pow
.Lfunc_end33:
	.cfi_endproc

	.align	16, 0x90
	.type	m_pow,@function
m_pow:                                  # @m_pow
.Lfunc_begin34:
	.loc	3 1761 0                # matrix.c:1761:0
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp1044:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp1045:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp1046:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp1047:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp1048:
	.cfi_def_cfa_offset 48
.Ltmp1049:
	.cfi_offset %rbx, -40
.Ltmp1050:
	.cfi_offset %r14, -32
.Ltmp1051:
	.cfi_offset %r15, -24
.Ltmp1052:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: m_pow:matrix_obj <- RDI
	#DEBUG_VALUE: m_pow:exponent <- ESI
	movl	%esi, %ebp
.Ltmp1053:
	#DEBUG_VALUE: m_pow:exponent <- EBP
	movq	%rdi, %rbx
.Ltmp1054:
	#DEBUG_VALUE: m_pow:matrix_obj <- RBX
	.loc	3 1762 5 prologue_end   # matrix.c:1762:5
	cmpl	$1, %ebp
	je	.LBB34_6
.Ltmp1055:
# BB#1:
	#DEBUG_VALUE: m_pow:matrix_obj <- RBX
	#DEBUG_VALUE: m_pow:exponent <- EBP
	.loc	3 1766 10               # matrix.c:1766:10
	movq	24(%rbx), %rax
	movzbl	8(%rax), %ecx
	cmpl	$3, %ecx
	jne	.LBB34_2
.Ltmp1056:
.LBB34_6:
	#DEBUG_VALUE: m_pow:matrix_obj <- RBX
	.loc	3 1764 10               # matrix.c:1764:10
	movq	%rbx, %rdi
	addq	$8, %rsp
	popq	%rbx
.Ltmp1057:
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	cloned                  # TAILCALL
.Ltmp1058:
.LBB34_2:
	#DEBUG_VALUE: m_pow:matrix_obj <- RBX
	#DEBUG_VALUE: m_pow:exponent <- EBP
	.loc	3 1770 10               # matrix.c:1770:10
	movl	%ebp, %ecx
	movq	16(%rax,%rcx,8), %rax
	testq	%rax, %rax
	jne	.LBB34_5
.Ltmp1059:
# BB#3:
	#DEBUG_VALUE: m_pow:matrix_obj <- RBX
	#DEBUG_VALUE: m_pow:exponent <- EBP
	.loc	3 1776 28               # matrix.c:1776:28
	movl	%ebp, %r14d
	shrl	%r14d
	movq	%rbx, %rdi
	movl	%r14d, %esi
	callq	m_pow
	movq	%rax, %r15
.Ltmp1060:
	#DEBUG_VALUE: ret <- R15
	.loc	3 1777 3                # matrix.c:1777:3
	movq	24(%rbx), %rax
	movq	%r15, 16(%rax,%r14,8)
	.loc	3 1784 31               # matrix.c:1784:31
	movq	%r15, %rdi
	movq	%r15, %rsi
	callq	matrix_mul
.Ltmp1061:
	#DEBUG_VALUE: passon <- RAX
	.loc	3 1785 3                # matrix.c:1785:3
	addl	%r14d, %r14d
	movq	24(%rbx), %rcx
	movq	%r15, 16(%rcx,%r14,8)
	.loc	3 1787 6                # matrix.c:1787:6
.Ltmp1062:
	testb	$1, %bpl
	je	.LBB34_5
.Ltmp1063:
# BB#4:
	#DEBUG_VALUE: m_pow:matrix_obj <- RBX
	#DEBUG_VALUE: ret <- R15
	#DEBUG_VALUE: passon <- RAX
	.loc	3 1789 36               # matrix.c:1789:36
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	matrix_mul
.Ltmp1064:
	#DEBUG_VALUE: passon_odd <- RAX
	.loc	3 1790 4                # matrix.c:1790:4
	orl	$1, %r14d
	movq	24(%rbx), %rcx
	movq	%r15, 16(%rcx,%r14,8)
.Ltmp1065:
.LBB34_5:
	.loc	3 1796 1                # matrix.c:1796:1
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp1066:
.Ltmp1067:
	.size	m_pow, .Ltmp1067-m_pow
.Lfunc_end34:
	.cfi_endproc

	.globl	get_sum
	.align	16, 0x90
	.type	get_sum,@function
get_sum:                                # @get_sum
.Lfunc_begin35:
	.loc	3 1833 0                # matrix.c:1833:0
	.cfi_startproc
# BB#0:
	#DEBUG_VALUE: get_sum:matrix_obj <- RDI
	.loc	3 1834 2 prologue_end   # matrix.c:1834:2
	movl	16(%rdi), %eax
	retq
.Ltmp1068:
.Ltmp1069:
	.size	get_sum, .Ltmp1069-get_sum
.Lfunc_end35:
	.cfi_endproc

	.globl	get_trace
	.align	16, 0x90
	.type	get_trace,@function
get_trace:                              # @get_trace
.Lfunc_begin36:
	.loc	3 1841 0                # matrix.c:1841:0
	.cfi_startproc
# BB#0:
	#DEBUG_VALUE: get_trace:matrix_obj <- RDI
	.loc	3 1842 5 prologue_end   # matrix.c:1842:5
	movq	24(%rdi), %rax
	movzbl	8(%rax), %ecx
	cmpl	$2, %ecx
	jne	.LBB36_1
.Ltmp1070:
# BB#3:
	.loc	3 1843 56 discriminator 1 # matrix.c:1843:56
	movq	(%rax), %rax
	movl	(%rax), %eax
	imull	g_height(%rip), %eax
.Ltmp1071:
	.loc	3 1856 1                # matrix.c:1856:1
	retq
.LBB36_1:
	#DEBUG_VALUE: get_trace:matrix_obj <- RDI
	movzbl	%cl, %eax
	cmpl	$3, %eax
	jne	.LBB36_4
# BB#2:
	.loc	3 1842 57 discriminator 1 # matrix.c:1842:57
.Ltmp1072:
	movl	g_height(%rip), %eax
.Ltmp1073:
	.loc	3 1856 1                # matrix.c:1856:1
	retq
.LBB36_4:
	#DEBUG_VALUE: get_trace:matrix_obj <- RDI
.Ltmp1074:
	#DEBUG_VALUE: get_trace:total <- 0
	.loc	3 1849 6                # matrix.c:1849:6
	movq	g_height(%rip), %rcx
.Ltmp1075:
	#DEBUG_VALUE: i <- ECX
	xorl	%eax, %eax
	.loc	3 1849 6 discriminator 1 # matrix.c:1849:6
.Ltmp1076:
	testl	%ecx, %ecx
	je	.LBB36_7
.Ltmp1077:
# BB#5:                                 # %.lr.ph
	#DEBUG_VALUE: get_trace:matrix_obj <- RDI
	#DEBUG_VALUE: get_trace:total <- 0
	#DEBUG_VALUE: i <- ECX
	.loc	3 1847 2                # matrix.c:1847:2
	movq	(%rdi), %rdx
.Ltmp1078:
	#DEBUG_VALUE: get_trace:matrix <- RDX
	.loc	3 1846 2                # matrix.c:1846:2
	movl	g_hard_width(%rip), %esi
	incl	%esi
	.loc	3 1849 6 discriminator 1 # matrix.c:1849:6
.Ltmp1079:
	negl	%ecx
.Ltmp1080:
	shlq	$2, %rsi
	xorl	%eax, %eax
.Ltmp1081:
	.align	16, 0x90
.LBB36_6:                               # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: get_trace:total <- 0
	.loc	3 1851 3                # matrix.c:1851:3
	addl	(%rdx), %eax
.Ltmp1082:
	#DEBUG_VALUE: get_trace:total <- EAX
	.loc	3 1849 6 discriminator 1 # matrix.c:1849:6
	addq	%rsi, %rdx
	incl	%ecx
	jne	.LBB36_6
.Ltmp1083:
.LBB36_7:                               # %.loopexit
	.loc	3 1856 1                # matrix.c:1856:1
	retq
.Ltmp1084:
.Ltmp1085:
	.size	get_trace, .Ltmp1085-get_trace
.Lfunc_end36:
	.cfi_endproc

	.globl	get_minimum
	.align	16, 0x90
	.type	get_minimum,@function
get_minimum:                            # @get_minimum
.Lfunc_begin37:
	.loc	3 1863 0                # matrix.c:1863:0
	.cfi_startproc
# BB#0:
	#DEBUG_VALUE: get_minimum:matrix_obj <- RDI
	.loc	3 1864 2 prologue_end   # matrix.c:1864:2
	movl	8(%rdi), %eax
	retq
.Ltmp1086:
.Ltmp1087:
	.size	get_minimum, .Ltmp1087-get_minimum
.Lfunc_end37:
	.cfi_endproc

	.globl	get_maximum
	.align	16, 0x90
	.type	get_maximum,@function
get_maximum:                            # @get_maximum
.Lfunc_begin38:
	.loc	3 1871 0                # matrix.c:1871:0
	.cfi_startproc
# BB#0:
	#DEBUG_VALUE: get_maximum:matrix_obj <- RDI
	.loc	3 1872 2 prologue_end   # matrix.c:1872:2
	movl	12(%rdi), %eax
	retq
.Ltmp1088:
.Ltmp1089:
	.size	get_maximum, .Ltmp1089-get_maximum
.Lfunc_end38:
	.cfi_endproc

	.globl	get_frequency
	.align	16, 0x90
	.type	get_frequency,@function
get_frequency:                          # @get_frequency
.Lfunc_begin39:
	.loc	3 1943 0                # matrix.c:1943:0
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp1090:
	.cfi_def_cfa_offset 16
.Ltmp1091:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp1092:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
.Ltmp1093:
	.cfi_offset %rbx, -56
.Ltmp1094:
	.cfi_offset %r12, -48
.Ltmp1095:
	.cfi_offset %r13, -40
.Ltmp1096:
	.cfi_offset %r14, -32
.Ltmp1097:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: get_frequency:matrix_obj <- RDI
	#DEBUG_VALUE: get_frequency:value <- ESI
	movl	%esi, %r15d
.Ltmp1098:
	#DEBUG_VALUE: get_frequency:value <- R15D
	movq	%rdi, %r12
.Ltmp1099:
	#DEBUG_VALUE: get_frequency:matrix_obj <- R12
	xorl	%r13d, %r13d
	.loc	3 1944 5 prologue_end   # matrix.c:1944:5
.Ltmp1100:
	cmpl	%r15d, 8(%r12)
	ja	.LBB39_26
.Ltmp1101:
# BB#1:
	#DEBUG_VALUE: get_frequency:matrix_obj <- R12
	#DEBUG_VALUE: get_frequency:value <- R15D
	.loc	3 1944 5 discriminator 1 # matrix.c:1944:5
	cmpl	%r15d, 12(%r12)
	jb	.LBB39_26
.Ltmp1102:
# BB#2:
	#DEBUG_VALUE: get_frequency:matrix_obj <- R12
	#DEBUG_VALUE: get_frequency:value <- R15D
	.loc	3 1949 5                # matrix.c:1949:5
	movq	24(%r12), %rax
	testq	%rax, %rax
	je	.LBB39_16
.Ltmp1103:
# BB#3:
	#DEBUG_VALUE: get_frequency:matrix_obj <- R12
	#DEBUG_VALUE: get_frequency:value <- R15D
	.loc	3 1951 3                # matrix.c:1951:3
	movsbl	8(%rax), %ecx
	decl	%ecx
	cmpl	$4, %ecx
	ja	.LBB39_16
.Ltmp1104:
# BB#4:
	#DEBUG_VALUE: get_frequency:matrix_obj <- R12
	#DEBUG_VALUE: get_frequency:value <- R15D
	jmpq	*.LJTI39_0(,%rcx,8)
.Ltmp1105:
.LBB39_7:
	#DEBUG_VALUE: get_frequency:value <- R15D
	.loc	3 1966 8                # matrix.c:1966:8
	movq	(%rax), %rcx
	movl	4(%rcx), %eax
	testl	%eax, %eax
	je	.LBB39_8
.Ltmp1106:
# BB#9:
	#DEBUG_VALUE: get_frequency:value <- R15D
	.loc	3 1970 8                # matrix.c:1970:8
	addl	%r15d, %eax
	xorl	%edx, %edx
	divl	(%rcx)
	testl	%edx, %edx
	sete	%al
.Ltmp1107:
	.loc	3 1974 5                # matrix.c:1974:5
	movzbl	%al, %r13d
	jmp	.LBB39_26
.Ltmp1108:
.LBB39_5:
	#DEBUG_VALUE: get_frequency:value <- R15D
	.loc	3 1960 8                # matrix.c:1960:8
	movq	(%rax), %rax
	cmpl	%r15d, (%rax)
	jne	.LBB39_26
.Ltmp1109:
# BB#6:
	.loc	3 1962 6                # matrix.c:1962:6
	movl	g_soft_elements(%rip), %r13d
	jmp	.LBB39_26
.Ltmp1110:
.LBB39_10:
	#DEBUG_VALUE: get_frequency:value <- R15D
	.loc	3 1976 8                # matrix.c:1976:8
	cmpl	$1, %r15d
	jne	.LBB39_11
.Ltmp1111:
# BB#13:
	.loc	3 1982 6                # matrix.c:1982:6
	movl	g_height(%rip), %r13d
	jmp	.LBB39_26
.Ltmp1112:
.LBB39_14:
	#DEBUG_VALUE: get_frequency:value <- R15D
	.loc	3 1986 5                # matrix.c:1986:5
	movq	(%rax), %rax
	movl	%r15d, %ecx
	movl	(%rax,%rcx,4), %r13d
	jmp	.LBB39_26
.Ltmp1113:
.LBB39_15:
	#DEBUG_VALUE: get_frequency:matrix_obj <- R12
	#DEBUG_VALUE: get_frequency:value <- R15D
	.loc	3 1954 8                # matrix.c:1954:8
	testb	$1, %r15b
	je	.LBB39_26
.Ltmp1114:
.LBB39_16:                              # %.loopexit
	#DEBUG_VALUE: get_frequency:matrix_obj <- R12
	#DEBUG_VALUE: get_frequency:value <- R15D
	.loc	3 1997 30               # matrix.c:1997:30
	movq	g_nthreads(%rip), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, %r14
	.loc	3 1999 2                # matrix.c:1999:2
	movq	%rsp, -56(%rbp)         # 8-byte Spill
	movq	g_nthreads(%rip), %rax
	movq	%rsp, %rcx
	leaq	15(,%rax,8), %rax
	andq	$-16, %rax
	subq	%rax, %rcx
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	movq	%rcx, %rsp
	.loc	3 2001 35               # matrix.c:2001:35
	movq	g_nthreads(%rip), %rdi
	shlq	$5, %rdi
	callq	malloc
	movq	%rax, %r13
.Ltmp1115:
	#DEBUG_VALUE: get_frequency:start_row <- 0
	.loc	3 2003 6                # matrix.c:2003:6
	movq	g_nthreads(%rip), %rcx
.Ltmp1116:
	#DEBUG_VALUE: i <- ECX
	.loc	3 2003 6 discriminator 1 # matrix.c:2003:6
	testl	%ecx, %ecx
	je	.LBB39_19
.Ltmp1117:
# BB#17:                                # %.lr.ph10
	#DEBUG_VALUE: get_frequency:matrix_obj <- R12
	#DEBUG_VALUE: get_frequency:value <- R15D
	#DEBUG_VALUE: get_frequency:start_row <- 0
	#DEBUG_VALUE: i <- ECX
	.loc	3 2005 3                # matrix.c:2005:3
	movq	g_height(%rip), %rax
	cqto
	idivq	g_nthreads(%rip)
.Ltmp1118:
	.loc	3 2003 6 discriminator 1 # matrix.c:2003:6
	decl	%ecx
.Ltmp1119:
	subq	%rcx, %rdx
	movq	%rcx, %rsi
	shlq	$5, %rsi
	leaq	28(%rsi,%r13), %rsi
	xorl	%edi, %edi
.Ltmp1120:
	.align	16, 0x90
.LBB39_18:                              # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: get_frequency:matrix_obj <- R12
	#DEBUG_VALUE: get_frequency:value <- R15D
	#DEBUG_VALUE: get_frequency:start_row <- 0
	.loc	3 2005 3                # matrix.c:2005:3
	testq	%rdx, %rdx
	setg	%bl
	movzbl	%bl, %ebx
	addl	%eax, %ebx
.Ltmp1121:
	#DEBUG_VALUE: this_rows <- EDI
	.loc	3 2006 9                # matrix.c:2006:9
	movq	%r12, -28(%rsi)
	movq	%r14, -20(%rsi)
	movl	%ebx, -12(%rsi)
	movl	%edi, -8(%rsi)
	movl	%ecx, -4(%rsi)
	movl	%r15d, (%rsi)
	.loc	3 2014 3                # matrix.c:2014:3
	addl	%ebx, %edi
.Ltmp1122:
	#DEBUG_VALUE: get_frequency:start_row <- EDI
	.loc	3 2003 6 discriminator 1 # matrix.c:2003:6
	decl	%ecx
	addq	$-32, %rsi
	incq	%rdx
	cmpl	$-1, %ecx
	jne	.LBB39_18
.Ltmp1123:
.LBB39_19:                              # %._crit_edge11
	#DEBUG_VALUE: get_frequency:start_row <- 0
	.loc	3 2017 6                # matrix.c:2017:6
	movq	g_nthreads(%rip), %r15
.Ltmp1124:
	#DEBUG_VALUE: i <- R15D
	.loc	3 2017 6 discriminator 1 # matrix.c:2017:6
	testl	%r15d, %r15d
	je	.LBB39_22
.Ltmp1125:
# BB#20:                                # %.lr.ph6.preheader
	#DEBUG_VALUE: get_frequency:start_row <- 0
	#DEBUG_VALUE: i <- R15D
	leal	-1(%r15), %eax
	movq	-48(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %rbx
	shlq	$5, %rax
	addq	%rax, %r13
	negl	%r15d
.Ltmp1126:
	.align	16, 0x90
.LBB39_21:                              # %.lr.ph6
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: get_frequency:start_row <- 0
	xorl	%esi, %esi
	.loc	3 2019 9                # matrix.c:2019:9
.Ltmp1127:
	movl	$get_cmpe_worker, %edx
	movq	%rbx, %rdi
	movq	%r13, %rcx
	callq	pthread_create
.Ltmp1128:
	.loc	3 2017 6 discriminator 1 # matrix.c:2017:6
	addq	$-32, %r13
	addq	$-8, %rbx
	incl	%r15d
	jne	.LBB39_21
.Ltmp1129:
.LBB39_22:                              # %._crit_edge7
	#DEBUG_VALUE: get_frequency:start_row <- 0
	#DEBUG_VALUE: get_frequency:count <- 0
	.loc	3 2024 6                # matrix.c:2024:6
	movq	g_nthreads(%rip), %r15
.Ltmp1130:
	#DEBUG_VALUE: i <- R15D
	xorl	%r13d, %r13d
	.loc	3 2024 6 discriminator 1 # matrix.c:2024:6
.Ltmp1131:
	testl	%r15d, %r15d
	je	.LBB39_25
.Ltmp1132:
# BB#23:                                # %.lr.ph.preheader
	#DEBUG_VALUE: get_frequency:start_row <- 0
	#DEBUG_VALUE: get_frequency:count <- 0
	#DEBUG_VALUE: i <- R15D
	leal	-1(%r15), %eax
	leaq	(%r14,%rax,4), %r12
	movq	-48(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %rbx
	negl	%r15d
.Ltmp1133:
	xorl	%r13d, %r13d
.Ltmp1134:
	.align	16, 0x90
.LBB39_24:                              # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: get_frequency:start_row <- 0
	#DEBUG_VALUE: get_frequency:count <- 0
	.loc	3 2026 9                # matrix.c:2026:9
	movq	(%rbx), %rdi
	xorl	%esi, %esi
	callq	pthread_join
	.loc	3 2027 3                # matrix.c:2027:3
	addl	(%r12), %r13d
.Ltmp1135:
	#DEBUG_VALUE: get_frequency:count <- R13D
	.loc	3 2024 6 discriminator 1 # matrix.c:2024:6
	addq	$-4, %r12
	addq	$-8, %rbx
	incl	%r15d
	jne	.LBB39_24
.Ltmp1136:
.LBB39_25:                              # %._crit_edge
	#DEBUG_VALUE: get_frequency:start_row <- 0
	#DEBUG_VALUE: get_frequency:count <- 0
	.loc	3 2030 2                # matrix.c:2030:2
	movq	%r14, %rdi
	callq	free
	.loc	3 2035 1                # matrix.c:2035:1
	movq	-56(%rbp), %rsp         # 8-byte Reload
.LBB39_26:
	movl	%r13d, %eax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB39_11:
.Ltmp1137:
	#DEBUG_VALUE: get_frequency:value <- R15D
	testl	%r15d, %r15d
	jne	.LBB39_26
.Ltmp1138:
# BB#12:
	.loc	3 1978 6                # matrix.c:1978:6
	movl	g_soft_width(%rip), %r13d
	decl	%r13d
	imull	g_height(%rip), %r13d
	jmp	.LBB39_26
.Ltmp1139:
.LBB39_8:
	.loc	3 1968 6                # matrix.c:1968:6
	movl	g_soft_elements(%rip), %r13d
	jmp	.LBB39_26
.Ltmp1140:
.Ltmp1141:
	.size	get_frequency, .Ltmp1141-get_frequency
.Lfunc_end39:
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.align	8
.LJTI39_0:
	.quad	.LBB39_7
	.quad	.LBB39_5
	.quad	.LBB39_10
	.quad	.LBB39_14
	.quad	.LBB39_15

	.text
	.align	16, 0x90
	.type	get_cmpe_worker,@function
get_cmpe_worker:                        # @get_cmpe_worker
.Lfunc_begin40:
	.loc	3 1890 0                # matrix.c:1890:0
	.cfi_startproc
# BB#0:
	#DEBUG_VALUE: get_cmpe_worker:arg <- RDI
	.loc	3 1893 2 prologue_end   # matrix.c:1893:2
	movq	g_hard_width(%rip), %r10
.Ltmp1142:
	#DEBUG_VALUE: get_cmpe_worker:count <- 0
	.loc	3 1923 2                # matrix.c:1923:2
	movq	%r10, %rax
	sarq	$63, %rax
	shrq	$62, %rax
	addq	%r10, %rax
	sarq	$2, %rax
	movl	16(%rdi), %r8d
	movl	%eax, %esi
	imull	%r8d, %esi
.Ltmp1143:
	#DEBUG_VALUE: i <- ESI
	#DEBUG_VALUE: get_cmpe_worker:total_4s <- ESI
	xorl	%ecx, %ecx
	movl	$0, %edx
	movl	$0, %r9d
	movl	$0, %r11d
	.loc	3 1925 6 discriminator 1 # matrix.c:1925:6
.Ltmp1144:
	testl	%esi, %esi
	je	.LBB40_4
.Ltmp1145:
# BB#1:                                 # %.lr.ph
	#DEBUG_VALUE: get_cmpe_worker:arg <- RDI
	#DEBUG_VALUE: get_cmpe_worker:count <- 0
	.loc	3 1921 19               # matrix.c:1921:19
	vpbroadcastd	28(%rdi), %xmm0
	.loc	3 1892 2                # matrix.c:1892:2
	movq	(%rdi), %rdx
	.loc	3 1893 2                # matrix.c:1893:2
	movl	20(%rdi), %ecx
	imulq	%r10, %rcx
	shlq	$2, %rcx
	addq	(%rdx), %rcx
.Ltmp1146:
	#DEBUG_VALUE: get_cmpe_worker:matrix <- RCX
	.loc	3 1925 6 discriminator 1 # matrix.c:1925:6
	imull	%r8d, %eax
	negl	%eax
	vpxor	%xmm1, %xmm1, %xmm1
.Ltmp1147:
	.align	16, 0x90
.LBB40_2:                               # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: get_cmpe_worker:arg <- RDI
	#DEBUG_VALUE: get_cmpe_worker:count <- 0
	.loc	3 1928 18               # matrix.c:1928:18
	vpcmpeqd	(%rcx), %xmm0, %xmm2
	.loc	3 1929 10               # matrix.c:1929:10
	vpsrld	$31, %xmm2, %xmm2
	.loc	3 1930 10               # matrix.c:1930:10
	vpaddd	%xmm1, %xmm2, %xmm1
	.loc	3 1931 3                # matrix.c:1931:3
	addq	$16, %rcx
.Ltmp1148:
	#DEBUG_VALUE: get_cmpe_worker:matrix <- RCX
	.loc	3 1925 6 discriminator 1 # matrix.c:1925:6
	incl	%eax
	jne	.LBB40_2
.Ltmp1149:
# BB#3:                                 # %._crit_edge
	#DEBUG_VALUE: get_cmpe_worker:arg <- RDI
	#DEBUG_VALUE: get_cmpe_worker:count <- 0
	vpextrq	$1, %xmm1, %r9
	vmovq	%xmm1, %rcx
	movq	%r9, %r11
	shrq	$32, %r11
	movq	%rcx, %rdx
	shrq	$32, %rdx
.Ltmp1150:
.LBB40_4:
	#DEBUG_VALUE: get_cmpe_worker:arg <- RDI
	#DEBUG_VALUE: get_cmpe_worker:count <- 0
	.loc	3 1936 2                # matrix.c:1936:2
	addl	%edx, %ecx
	addl	%r9d, %ecx
	addl	%r11d, %ecx
.Ltmp1151:
	#DEBUG_VALUE: get_cmpe_worker:count <- ECX
	.loc	3 1937 2                # matrix.c:1937:2
	movl	24(%rdi), %eax
	movq	8(%rdi), %rdx
	movl	%ecx, (%rdx,%rax,4)
	xorl	%eax, %eax
	.loc	3 1938 2                # matrix.c:1938:2
	retq
.Ltmp1152:
.Ltmp1153:
	.size	get_cmpe_worker, .Ltmp1153-get_cmpe_worker
.Lfunc_end40:
	.cfi_endproc

	.type	g_seed,@object          # @g_seed
	.local	g_seed
	.comm	g_seed,4,4
	.type	g_nthreads,@object      # @g_nthreads
	.data
	.align	8
g_nthreads:
	.quad	1                       # 0x1
	.size	g_nthreads, 8

	.type	g_padding,@object       # @g_padding
	.local	g_padding
	.comm	g_padding,8,8
	.type	g_soft_width,@object    # @g_soft_width
	.local	g_soft_width
	.comm	g_soft_width,8,8
	.type	g_hard_width,@object    # @g_hard_width
	.local	g_hard_width
	.comm	g_hard_width,8,8
	.type	g_height,@object        # @g_height
	.local	g_height
	.comm	g_height,8,8
	.type	g_soft_elements,@object # @g_soft_elements
	.local	g_soft_elements
	.comm	g_soft_elements,8,8
	.type	g_hard_elements,@object # @g_hard_elements
	.local	g_hard_elements
	.comm	g_hard_elements,8,8
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%u"
	.size	.L.str, 3

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	" %u"
	.size	.L.str1, 4

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	"\n"
	.size	.L.str2, 2

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	"%u "
	.size	.L.str3, 4

	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	"%u\n"
	.size	.L.str4, 4

	.data
.Ldebug_end1:
	.text
.Ldebug_end2:
	.file	5 "." "matrix.h"
	.file	6 "/usr/include/bits" "pthreadtypes.h"
	.file	7 "/usr/bin/../lib/clang/3.5.0/include" "emmintrin.h"
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.5.0 (tags/RELEASE_350/final)"
.Linfo_string1:
	.asciz	"matrix.c"
.Linfo_string2:
	.asciz	"/home/jexah/comp2129/comp2129-assignment3"
.Linfo_string3:
	.asciz	"g_hard_elements"
.Linfo_string4:
	.asciz	"long int"
.Linfo_string5:
	.asciz	"__ssize_t"
.Linfo_string6:
	.asciz	"ssize_t"
.Linfo_string7:
	.asciz	"g_soft_elements"
.Linfo_string8:
	.asciz	"g_height"
.Linfo_string9:
	.asciz	"g_hard_width"
.Linfo_string10:
	.asciz	"g_soft_width"
.Linfo_string11:
	.asciz	"g_padding"
.Linfo_string12:
	.asciz	"g_nthreads"
.Linfo_string13:
	.asciz	"g_seed"
.Linfo_string14:
	.asciz	"unsigned int"
.Linfo_string15:
	.asciz	"uint32_t"
.Linfo_string16:
	.asciz	"NOP"
.Linfo_string17:
	.asciz	"SEQUENCE"
.Linfo_string18:
	.asciz	"UNIFORM"
.Linfo_string19:
	.asciz	"IDENTITY"
.Linfo_string20:
	.asciz	"RANDOM"
.Linfo_string21:
	.asciz	"SCALAR_MUL_2"
.Linfo_string22:
	.asciz	"SOLVED"
.Linfo_string23:
	.asciz	"set_seed"
.Linfo_string24:
	.asciz	"set_nthreads"
.Linfo_string25:
	.asciz	"set_dimensions"
.Linfo_string26:
	.asciz	"display"
.Linfo_string27:
	.asciz	"display_row"
.Linfo_string28:
	.asciz	"display_column"
.Linfo_string29:
	.asciz	"display_element"
.Linfo_string30:
	.asciz	"identity_matrix"
.Linfo_string31:
	.asciz	"data"
.Linfo_string32:
	.asciz	"min"
.Linfo_string33:
	.asciz	"max"
.Linfo_string34:
	.asciz	"sum"
.Linfo_string35:
	.asciz	"occurances"
.Linfo_string36:
	.asciz	"prev_operation"
.Linfo_string37:
	.asciz	"char"
.Linfo_string38:
	.asciz	"pow"
.Linfo_string39:
	.asciz	"matrix_t"
.Linfo_string40:
	.asciz	"sizetype"
.Linfo_string41:
	.asciz	"occurances_t"
.Linfo_string42:
	.asciz	"random_matrix"
.Linfo_string43:
	.asciz	"uniform_matrix"
.Linfo_string44:
	.asciz	"sequence_matrix"
.Linfo_string45:
	.asciz	"cloned"
.Linfo_string46:
	.asciz	"reversed"
.Linfo_string47:
	.asciz	"transposed"
.Linfo_string48:
	.asciz	"scalar_add"
.Linfo_string49:
	.asciz	"scalar_mul"
.Linfo_string50:
	.asciz	"matrix_add"
.Linfo_string51:
	.asciz	"matrix_mul"
.Linfo_string52:
	.asciz	"matrix_pow"
.Linfo_string53:
	.asciz	"get_sum"
.Linfo_string54:
	.asciz	"get_trace"
.Linfo_string55:
	.asciz	"get_minimum"
.Linfo_string56:
	.asciz	"get_maximum"
.Linfo_string57:
	.asciz	"get_frequency"
.Linfo_string58:
	.asciz	"get_cmpe_worker"
.Linfo_string59:
	.asciz	"m_pow"
.Linfo_string60:
	.asciz	"release_matrix_obj"
.Linfo_string61:
	.asciz	"matrix_mul_worker"
.Linfo_string62:
	.asciz	"matrix_add_worker"
.Linfo_string63:
	.asciz	"scalar_mul_worker"
.Linfo_string64:
	.asciz	"reset_occurances"
.Linfo_string65:
	.asciz	"scalar_add_worker"
.Linfo_string66:
	.asciz	"transpose_worker"
.Linfo_string67:
	.asciz	"reverse_worker"
.Linfo_string68:
	.asciz	"copy_occurances"
.Linfo_string69:
	.asciz	"clone_worker"
.Linfo_string70:
	.asciz	"sequence_worker"
.Linfo_string71:
	.asciz	"uniform_worker"
.Linfo_string72:
	.asciz	"fast_rand"
.Linfo_string73:
	.asciz	"identity_worker"
.Linfo_string74:
	.asciz	"new_matrix"
.Linfo_string75:
	.asciz	"seed"
.Linfo_string76:
	.asciz	"count"
.Linfo_string77:
	.asciz	"order"
.Linfo_string78:
	.asciz	"matrix_obj"
.Linfo_string79:
	.asciz	"rows_remaining"
.Linfo_string80:
	.asciz	"matrix"
.Linfo_string81:
	.asciz	"i"
.Linfo_string82:
	.asciz	"row"
.Linfo_string83:
	.asciz	"column"
.Linfo_string84:
	.asciz	"start_row"
.Linfo_string85:
	.asciz	"this_rows"
.Linfo_string86:
	.asciz	"thread_ids"
.Linfo_string87:
	.asciz	"long unsigned int"
.Linfo_string88:
	.asciz	"pthread_t"
.Linfo_string89:
	.asciz	"args"
.Linfo_string90:
	.asciz	"num_rows"
.Linfo_string91:
	.asciz	"identity_argument"
.Linfo_string92:
	.asciz	"arg"
.Linfo_string93:
	.asciz	"arguments"
.Linfo_string94:
	.asciz	"matrix_cpy"
.Linfo_string95:
	.asciz	"y"
.Linfo_string96:
	.asciz	"x"
.Linfo_string97:
	.asciz	"value"
.Linfo_string98:
	.asciz	"uniform_argument"
.Linfo_string99:
	.asciz	"fill"
.Linfo_string100:
	.asciz	"long long int"
.Linfo_string101:
	.asciz	"__m128i"
.Linfo_string102:
	.asciz	"start"
.Linfo_string103:
	.asciz	"step"
.Linfo_string104:
	.asciz	"start_value"
.Linfo_string105:
	.asciz	"increment"
.Linfo_string106:
	.asciz	"mins"
.Linfo_string107:
	.asciz	"maxes"
.Linfo_string108:
	.asciz	"sums"
.Linfo_string109:
	.asciz	"id"
.Linfo_string110:
	.asciz	"sequence_argument"
.Linfo_string111:
	.asciz	"m_max"
.Linfo_string112:
	.asciz	"__a"
.Linfo_string113:
	.asciz	"vmins"
.Linfo_string114:
	.asciz	"vmaxes"
.Linfo_string115:
	.asciz	"vsum"
.Linfo_string116:
	.asciz	"vcurr"
.Linfo_string117:
	.asciz	"vinc"
.Linfo_string118:
	.asciz	"vpad"
.Linfo_string119:
	.asciz	"ret"
.Linfo_string120:
	.asciz	"vmin_s"
.Linfo_string121:
	.asciz	"vmax_s"
.Linfo_string122:
	.asciz	"vsum_s"
.Linfo_string123:
	.asciz	"result_obj"
.Linfo_string124:
	.asciz	"clone_argument"
.Linfo_string125:
	.asciz	"result"
.Linfo_string126:
	.asciz	"vput"
.Linfo_string127:
	.asciz	"target_obj"
.Linfo_string128:
	.asciz	"source_obj"
.Linfo_string129:
	.asciz	"reverse_argument"
.Linfo_string130:
	.asciz	"transpose_argument"
.Linfo_string131:
	.asciz	"tile_width"
.Linfo_string132:
	.asciz	"curr_y"
.Linfo_string133:
	.asciz	"row1"
.Linfo_string134:
	.asciz	"row2"
.Linfo_string135:
	.asciz	"row3"
.Linfo_string136:
	.asciz	"row4"
.Linfo_string137:
	.asciz	"curr_x"
.Linfo_string138:
	.asciz	"t1"
.Linfo_string139:
	.asciz	"t2"
.Linfo_string140:
	.asciz	"t3"
.Linfo_string141:
	.asciz	"t4"
.Linfo_string142:
	.asciz	"scalar"
.Linfo_string143:
	.asciz	"do_min_max_sum"
.Linfo_string144:
	.asciz	"scalar_add_argument"
.Linfo_string145:
	.asciz	"scalar_mul_argument"
.Linfo_string146:
	.asciz	"matrix_a_obj"
.Linfo_string147:
	.asciz	"matrix_b_obj"
.Linfo_string148:
	.asciz	"is_identity"
.Linfo_string149:
	.asciz	"matrix_add_argument"
.Linfo_string150:
	.asciz	"x_max"
.Linfo_string151:
	.asciz	"matrix_a"
.Linfo_string152:
	.asciz	"matrix_b"
.Linfo_string153:
	.asciz	"gap"
.Linfo_string154:
	.asciz	"vsums"
.Linfo_string155:
	.asciz	"vma"
.Linfo_string156:
	.asciz	"vmb"
.Linfo_string157:
	.asciz	"vresult"
.Linfo_string158:
	.asciz	"total"
.Linfo_string159:
	.asciz	"matrix_b_t_obj"
.Linfo_string160:
	.asciz	"a"
.Linfo_string161:
	.asciz	"b"
.Linfo_string162:
	.asciz	"matrix_mul_argument"
.Linfo_string163:
	.asciz	"y_share_num"
.Linfo_string164:
	.asciz	"x_share_num"
.Linfo_string165:
	.asciz	"max_x"
.Linfo_string166:
	.asciz	"x_same"
.Linfo_string167:
	.asciz	"vx_same"
.Linfo_string168:
	.asciz	"z"
.Linfo_string169:
	.asciz	"y_nums"
.Linfo_string170:
	.asciz	"vtotal"
.Linfo_string171:
	.asciz	"exponent"
.Linfo_string172:
	.asciz	"passon"
.Linfo_string173:
	.asciz	"passon_odd"
.Linfo_string174:
	.asciz	"get_cmpe_argument"
.Linfo_string175:
	.asciz	"total_4s"
.Linfo_string176:
	.asciz	"vvalue"
.Linfo_string177:
	.asciz	"vcmp"
.Linfo_string178:
	.asciz	"vres"
.Linfo_string179:
	.asciz	"res"
	.section	.debug_info,"",@progbits
.L.debug_info_begin0:
	.long	9624                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x2591 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
.Lset0 = .Lfunc_end40-.Lfunc_begin0     # DW_AT_high_pc
	.long	.Lset0
	.byte	2                       # Abbrev [2] 0x2a:0x15 DW_TAG_variable
	.long	.Linfo_string3          # DW_AT_name
	.long	63                      # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	g_hard_elements
	.byte	3                       # Abbrev [3] 0x3f:0xb DW_TAG_typedef
	.long	74                      # DW_AT_type
	.long	.Linfo_string6          # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	102                     # DW_AT_decl_line
	.byte	3                       # Abbrev [3] 0x4a:0xb DW_TAG_typedef
	.long	85                      # DW_AT_type
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	172                     # DW_AT_decl_line
	.byte	4                       # Abbrev [4] 0x55:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	2                       # Abbrev [2] 0x5c:0x15 DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.long	63                      # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.byte	28                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	g_soft_elements
	.byte	2                       # Abbrev [2] 0x71:0x15 DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.long	63                      # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	g_height
	.byte	2                       # Abbrev [2] 0x86:0x15 DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.long	63                      # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.byte	24                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	g_hard_width
	.byte	2                       # Abbrev [2] 0x9b:0x15 DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.long	63                      # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.byte	25                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	g_soft_width
	.byte	2                       # Abbrev [2] 0xb0:0x15 DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.long	63                      # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	g_padding
	.byte	2                       # Abbrev [2] 0xc5:0x15 DW_TAG_variable
	.long	.Linfo_string12         # DW_AT_name
	.long	63                      # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	g_nthreads
	.byte	2                       # Abbrev [2] 0xda:0x15 DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	g_seed
	.byte	3                       # Abbrev [3] 0xef:0xb DW_TAG_typedef
	.long	250                     # DW_AT_type
	.long	.Linfo_string15         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.byte	4                       # Abbrev [4] 0xfa:0x7 DW_TAG_base_type
	.long	.Linfo_string14         # DW_AT_name
	.byte	7                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	5                       # Abbrev [5] 0x101:0x2f DW_TAG_enumeration_type
	.byte	4                       # DW_AT_byte_size
	.byte	3                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
	.byte	6                       # Abbrev [6] 0x105:0x6 DW_TAG_enumerator
	.long	.Linfo_string16         # DW_AT_name
	.byte	0                       # DW_AT_const_value
	.byte	6                       # Abbrev [6] 0x10b:0x6 DW_TAG_enumerator
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_const_value
	.byte	6                       # Abbrev [6] 0x111:0x6 DW_TAG_enumerator
	.long	.Linfo_string18         # DW_AT_name
	.byte	2                       # DW_AT_const_value
	.byte	6                       # Abbrev [6] 0x117:0x6 DW_TAG_enumerator
	.long	.Linfo_string19         # DW_AT_name
	.byte	3                       # DW_AT_const_value
	.byte	6                       # Abbrev [6] 0x11d:0x6 DW_TAG_enumerator
	.long	.Linfo_string20         # DW_AT_name
	.byte	4                       # DW_AT_const_value
	.byte	6                       # Abbrev [6] 0x123:0x6 DW_TAG_enumerator
	.long	.Linfo_string21         # DW_AT_name
	.byte	5                       # DW_AT_const_value
	.byte	6                       # Abbrev [6] 0x129:0x6 DW_TAG_enumerator
	.long	.Linfo_string22         # DW_AT_name
	.byte	6                       # DW_AT_const_value
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x130:0x26 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
.Lset1 = .Lfunc_end0-.Lfunc_begin0      # DW_AT_high_pc
	.long	.Lset1
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string23         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	83                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	8                       # Abbrev [8] 0x146:0xf DW_TAG_formal_parameter
	.byte	3                       # DW_AT_location
	.byte	85
	.byte	147
	.byte	4
	.long	.Linfo_string75         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	83                      # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x156:0x24 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
.Lset2 = .Lfunc_end1-.Lfunc_begin1      # DW_AT_high_pc
	.long	.Lset2
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string24         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	91                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	8                       # Abbrev [8] 0x16c:0xd DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	85
	.long	.Linfo_string76         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	91                      # DW_AT_decl_line
	.long	63                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x17a:0x26 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
.Lset3 = .Lfunc_end2-.Lfunc_begin2      # DW_AT_high_pc
	.long	.Lset3
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string25         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	99                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	9                       # Abbrev [9] 0x190:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string77         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	99                      # DW_AT_decl_line
	.long	63                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x1a0:0x63 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
.Lset4 = .Lfunc_end3-.Lfunc_begin3      # DW_AT_high_pc
	.long	.Lset4
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string26         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	113                     # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	9                       # Abbrev [9] 0x1b6:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	113                     # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1c5:0xf DW_TAG_variable
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string79         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	116                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1d4:0xf DW_TAG_variable
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string80         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	115                     # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1e3:0x1f DW_TAG_lexical_block
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	12                      # Abbrev [12] 0x1e8:0x19 DW_TAG_lexical_block
	.quad	.Ltmp28                 # DW_AT_low_pc
.Lset5 = .Ltmp32-.Ltmp28                # DW_AT_high_pc
	.long	.Lset5
	.byte	13                      # Abbrev [13] 0x1f5:0xb DW_TAG_variable
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	120                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x203:0x55 DW_TAG_subprogram
	.quad	.Lfunc_begin4           # DW_AT_low_pc
.Lset6 = .Lfunc_end4-.Lfunc_begin4      # DW_AT_high_pc
	.long	.Lset6
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string27         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	132                     # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	9                       # Abbrev [9] 0x219:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	132                     # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x228:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc5            # DW_AT_location
	.long	.Linfo_string82         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	132                     # DW_AT_decl_line
	.long	8356                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x237:0xf DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string80         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	134                     # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x246:0x11 DW_TAG_lexical_block
	.long	.Ldebug_ranges1         # DW_AT_ranges
	.byte	13                      # Abbrev [13] 0x24b:0xb DW_TAG_variable
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	137                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x258:0x59 DW_TAG_subprogram
	.quad	.Lfunc_begin5           # DW_AT_low_pc
.Lset7 = .Lfunc_end5-.Lfunc_begin5      # DW_AT_high_pc
	.long	.Lset7
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string28         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	147                     # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	9                       # Abbrev [9] 0x26e:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	147                     # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x27d:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string83         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	147                     # DW_AT_decl_line
	.long	8356                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x28c:0xf DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string80         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	149                     # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x29b:0x15 DW_TAG_lexical_block
	.long	.Ldebug_ranges2         # DW_AT_ranges
	.byte	10                      # Abbrev [10] 0x2a0:0xf DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string79         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	151                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x2b1:0x42 DW_TAG_subprogram
	.quad	.Lfunc_begin6           # DW_AT_low_pc
.Lset8 = .Lfunc_end6-.Lfunc_begin6      # DW_AT_high_pc
	.long	.Lset8
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string29         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	161                     # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	9                       # Abbrev [9] 0x2c7:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	161                     # DW_AT_decl_line
	.long	8361                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x2d6:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string82         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	161                     # DW_AT_decl_line
	.long	8356                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x2e5:0xd DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	81
	.long	.Linfo_string83         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	161                     # DW_AT_decl_line
	.long	8356                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	14                      # Abbrev [14] 0x2f3:0xbe DW_TAG_subprogram
	.quad	.Lfunc_begin7           # DW_AT_low_pc
.Lset9 = .Lfunc_end7-.Lfunc_begin7      # DW_AT_high_pc
	.long	.Lset9
	.byte	1                       # DW_AT_frame_base
	.byte	86
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string30         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	247                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8154                    # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	10                      # Abbrev [10] 0x30d:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	249                     # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x31c:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	254                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x32b:0xb DW_TAG_variable
	.long	.Linfo_string86         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	251                     # DW_AT_decl_line
	.long	8371                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x336:0xb DW_TAG_variable
	.long	.Linfo_string89         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	253                     # DW_AT_decl_line
	.long	8400                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x341:0x33 DW_TAG_lexical_block
	.quad	.Ltmp93                 # DW_AT_low_pc
.Lset10 = .Ltmp101-.Ltmp93              # DW_AT_high_pc
	.long	.Lset10
	.byte	10                      # Abbrev [10] 0x34e:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	255                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x35d:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges3         # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x362:0x10 DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string85         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	257                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x374:0x1e DW_TAG_lexical_block
	.quad	.Ltmp101                # DW_AT_low_pc
.Lset11 = .Ltmp107-.Ltmp101             # DW_AT_high_pc
	.long	.Lset11
	.byte	15                      # Abbrev [15] 0x381:0x10 DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	267                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x392:0x1e DW_TAG_lexical_block
	.quad	.Ltmp108                # DW_AT_low_pc
.Lset12 = .Ltmp113-.Ltmp108             # DW_AT_high_pc
	.long	.Lset12
	.byte	15                      # Abbrev [15] 0x39f:0x10 DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	278                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	16                      # Abbrev [16] 0x3b1:0x2a DW_TAG_subprogram
	.quad	.Lfunc_begin8           # DW_AT_low_pc
.Lset13 = .Lfunc_end8-.Lfunc_begin8     # DW_AT_high_pc
	.long	.Lset13
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string74         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	211                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8154                    # DW_AT_type
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	10                      # Abbrev [10] 0x3cb:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	213                     # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	16                      # Abbrev [16] 0x3db:0x55 DW_TAG_subprogram
	.quad	.Lfunc_begin9           # DW_AT_low_pc
.Lset14 = .Lfunc_end9-.Lfunc_begin9     # DW_AT_high_pc
	.long	.Lset14
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string73         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	233                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8355                    # DW_AT_type
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	9                       # Abbrev [9] 0x3f5:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string92         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	233                     # DW_AT_decl_line
	.long	8355                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x404:0xb DW_TAG_variable
	.long	.Linfo_string93         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	235                     # DW_AT_decl_line
	.long	8400                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x40f:0xb DW_TAG_variable
	.long	.Linfo_string80         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	236                     # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x41a:0x15 DW_TAG_lexical_block
	.long	.Ldebug_ranges4         # DW_AT_ranges
	.byte	10                      # Abbrev [10] 0x41f:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	239                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x430:0xd6 DW_TAG_subprogram
	.quad	.Lfunc_begin10          # DW_AT_low_pc
.Lset15 = .Lfunc_end10-.Lfunc_begin10   # DW_AT_high_pc
	.long	.Lset15
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string42         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	293                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8154                    # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	18                      # Abbrev [18] 0x44b:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string75         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	293                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x45b:0x10 DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	296                     # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x46b:0x10 DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string94         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	297                     # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x47b:0x10 DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	299                     # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x48b:0x10 DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	305                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x49b:0x10 DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	304                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x4ab:0x10 DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	303                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x4bb:0x4a DW_TAG_lexical_block
	.quad	.Ltmp152                # DW_AT_low_pc
.Lset16 = .Ltmp172-.Ltmp152             # DW_AT_high_pc
	.long	.Lset16
	.byte	15                      # Abbrev [15] 0x4c8:0x10 DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string95         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	309                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x4d8:0x2c DW_TAG_lexical_block
	.quad	.Ltmp155                # DW_AT_low_pc
.Lset17 = .Ltmp170-.Ltmp155             # DW_AT_high_pc
	.long	.Lset17
	.byte	12                      # Abbrev [12] 0x4e5:0x1e DW_TAG_lexical_block
	.quad	.Ltmp155                # DW_AT_low_pc
.Lset18 = .Ltmp167-.Ltmp155             # DW_AT_high_pc
	.long	.Lset18
	.byte	15                      # Abbrev [15] 0x4f2:0x10 DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string96         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	311                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	19                      # Abbrev [19] 0x506:0x1a DW_TAG_subprogram
	.quad	.Lfunc_begin11          # DW_AT_low_pc
.Lset19 = .Lfunc_end11-.Lfunc_begin11   # DW_AT_high_pc
	.long	.Lset19
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string72         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	45                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	239                     # DW_AT_type
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	17                      # Abbrev [17] 0x520:0xf0 DW_TAG_subprogram
	.quad	.Lfunc_begin12          # DW_AT_low_pc
.Lset20 = .Lfunc_end12-.Lfunc_begin12   # DW_AT_high_pc
	.long	.Lset20
	.byte	1                       # DW_AT_frame_base
	.byte	86
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string43         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	467                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8154                    # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	18                      # Abbrev [18] 0x53b:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc31           # DW_AT_location
	.long	.Linfo_string97         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	467                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x54b:0x10 DW_TAG_variable
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	478                     # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x55b:0x10 DW_TAG_variable
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	484                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x56b:0xc DW_TAG_variable
	.long	.Linfo_string86         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	480                     # DW_AT_decl_line
	.long	8371                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x577:0xc DW_TAG_variable
	.long	.Linfo_string89         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	482                     # DW_AT_decl_line
	.long	8453                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x583:0x1c DW_TAG_lexical_block
	.long	.Ldebug_ranges6         # DW_AT_ranges
	.byte	11                      # Abbrev [11] 0x588:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges5         # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x58d:0x10 DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	471                     # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x59f:0x34 DW_TAG_lexical_block
	.quad	.Ltmp189                # DW_AT_low_pc
.Lset21 = .Ltmp197-.Ltmp189             # DW_AT_high_pc
	.long	.Lset21
	.byte	15                      # Abbrev [15] 0x5ac:0x10 DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	485                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x5bc:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges7         # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x5c1:0x10 DW_TAG_variable
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string85         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	487                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x5d3:0x1e DW_TAG_lexical_block
	.quad	.Ltmp197                # DW_AT_low_pc
.Lset22 = .Ltmp203-.Ltmp197             # DW_AT_high_pc
	.long	.Lset22
	.byte	15                      # Abbrev [15] 0x5e0:0x10 DW_TAG_variable
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	498                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x5f1:0x1e DW_TAG_lexical_block
	.quad	.Ltmp205                # DW_AT_low_pc
.Lset23 = .Ltmp210-.Ltmp205             # DW_AT_high_pc
	.long	.Lset23
	.byte	15                      # Abbrev [15] 0x5fe:0x10 DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	511                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	21                      # Abbrev [21] 0x610:0x74 DW_TAG_subprogram
	.quad	.Lfunc_begin13          # DW_AT_low_pc
.Lset24 = .Lfunc_end13-.Lfunc_begin13   # DW_AT_high_pc
	.long	.Lset24
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string71         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	449                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8355                    # DW_AT_type
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	22                      # Abbrev [22] 0x62b:0xe DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	85
	.long	.Linfo_string92         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	449                     # DW_AT_decl_line
	.long	8355                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x639:0x10 DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string80         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	452                     # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x649:0xc DW_TAG_variable
	.long	.Linfo_string93         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	451                     # DW_AT_decl_line
	.long	8453                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x655:0xc DW_TAG_variable
	.long	.Linfo_string97         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	453                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x661:0xc DW_TAG_variable
	.long	.Linfo_string99         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	456                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x66d:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges8         # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x672:0x10 DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	458                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x684:0x138 DW_TAG_subprogram
	.quad	.Lfunc_begin14          # DW_AT_low_pc
.Lset25 = .Lfunc_end14-.Lfunc_begin14   # DW_AT_high_pc
	.long	.Lset25
	.byte	1                       # DW_AT_frame_base
	.byte	86
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string44         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	622                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8154                    # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	18                      # Abbrev [18] 0x69f:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string102        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	622                     # DW_AT_decl_line
	.long	8554                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x6af:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc42           # DW_AT_location
	.long	.Linfo_string103        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	622                     # DW_AT_decl_line
	.long	8554                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x6bf:0x10 DW_TAG_variable
	.long	.Ldebug_loc43           # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	630                     # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x6cf:0x10 DW_TAG_variable
	.long	.Ldebug_loc44           # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	638                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x6df:0x10 DW_TAG_variable
	.long	.Ldebug_loc48           # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	669                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x6ef:0x10 DW_TAG_variable
	.long	.Ldebug_loc49           # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	668                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x6ff:0x10 DW_TAG_variable
	.long	.Ldebug_loc50           # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	667                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x70f:0xc DW_TAG_variable
	.long	.Linfo_string89         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	629                     # DW_AT_decl_line
	.long	8559                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x71b:0xc DW_TAG_variable
	.long	.Linfo_string106        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	632                     # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x727:0xc DW_TAG_variable
	.long	.Linfo_string107        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	633                     # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x733:0xc DW_TAG_variable
	.long	.Linfo_string108        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	634                     # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x73f:0xc DW_TAG_variable
	.long	.Linfo_string86         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	636                     # DW_AT_decl_line
	.long	8371                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x74b:0x34 DW_TAG_lexical_block
	.quad	.Ltmp239                # DW_AT_low_pc
.Lset26 = .Ltmp247-.Ltmp239             # DW_AT_high_pc
	.long	.Lset26
	.byte	15                      # Abbrev [15] 0x758:0x10 DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	639                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x768:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges9         # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x76d:0x10 DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	.Linfo_string85         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	641                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x77f:0x1e DW_TAG_lexical_block
	.quad	.Ltmp250                # DW_AT_low_pc
.Lset27 = .Ltmp256-.Ltmp250             # DW_AT_high_pc
	.long	.Lset27
	.byte	15                      # Abbrev [15] 0x78c:0x10 DW_TAG_variable
	.long	.Ldebug_loc47           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	657                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x79d:0x1e DW_TAG_lexical_block
	.quad	.Ltmp259                # DW_AT_low_pc
.Lset28 = .Ltmp269-.Ltmp259             # DW_AT_high_pc
	.long	.Lset28
	.byte	15                      # Abbrev [15] 0x7aa:0x10 DW_TAG_variable
	.long	.Ldebug_loc51           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	671                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	21                      # Abbrev [21] 0x7bc:0x1d0 DW_TAG_subprogram
	.quad	.Lfunc_begin15          # DW_AT_low_pc
.Lset29 = .Lfunc_end15-.Lfunc_begin15   # DW_AT_high_pc
	.long	.Lset29
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string70         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	537                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8355                    # DW_AT_type
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	22                      # Abbrev [22] 0x7d7:0xe DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	85
	.long	.Linfo_string92         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	537                     # DW_AT_decl_line
	.long	8355                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x7e5:0x16 DW_TAG_variable
	.ascii	"\377\377\377\377\377\377\377\377\377\001" # DW_AT_const_value
	.long	.Linfo_string32         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	545                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	23                      # Abbrev [23] 0x7fb:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string33         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	546                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	23                      # Abbrev [23] 0x808:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string34         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	547                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x815:0x10 DW_TAG_variable
	.long	.Ldebug_loc53           # DW_AT_location
	.long	.Linfo_string111        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	562                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x825:0x10 DW_TAG_variable
	.long	.Ldebug_loc54           # DW_AT_location
	.long	.Linfo_string80         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	540                     # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x835:0xc DW_TAG_variable
	.long	.Linfo_string93         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	539                     # DW_AT_decl_line
	.long	8559                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x841:0xc DW_TAG_variable
	.long	.Linfo_string105        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	541                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x84d:0xc DW_TAG_variable
	.long	.Linfo_string113        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	549                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x859:0xc DW_TAG_variable
	.long	.Linfo_string114        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	550                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x865:0xc DW_TAG_variable
	.long	.Linfo_string115        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	551                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x871:0xc DW_TAG_variable
	.long	.Linfo_string116        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	553                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x87d:0xc DW_TAG_variable
	.long	.Linfo_string117        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	559                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x889:0xc DW_TAG_variable
	.long	.Linfo_string118        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	560                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x895:0xc DW_TAG_variable
	.long	.Linfo_string120        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	582                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x8a1:0xc DW_TAG_variable
	.long	.Linfo_string121        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	588                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x8ad:0xc DW_TAG_variable
	.long	.Linfo_string122        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	594                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x8b9:0x4a DW_TAG_lexical_block
	.long	.Ldebug_ranges10        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x8be:0x10 DW_TAG_variable
	.long	.Ldebug_loc52           # DW_AT_location
	.long	.Linfo_string95         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	564                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x8ce:0x34 DW_TAG_lexical_block
	.quad	.Ltmp287                # DW_AT_low_pc
.Lset30 = .Ltmp291-.Ltmp287             # DW_AT_high_pc
	.long	.Lset30
	.byte	20                      # Abbrev [20] 0x8db:0xc DW_TAG_variable
	.long	.Linfo_string119        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	566                     # DW_AT_decl_line
	.long	8700                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x8e7:0x1a DW_TAG_lexical_block
	.quad	.Ltmp287                # DW_AT_low_pc
.Lset31 = .Ltmp289-.Ltmp287             # DW_AT_high_pc
	.long	.Lset31
	.byte	20                      # Abbrev [20] 0x8f4:0xc DW_TAG_variable
	.long	.Linfo_string96         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	567                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x903:0x1c DW_TAG_lexical_block
	.quad	.Ltmp294                # DW_AT_low_pc
.Lset32 = .Ltmp295-.Ltmp294             # DW_AT_high_pc
	.long	.Lset32
	.byte	24                      # Abbrev [24] 0x910:0xe DW_TAG_variable
	.byte	1                       # DW_AT_location
	.byte	101
	.long	.Linfo_string112        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	582                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x91f:0x1a DW_TAG_lexical_block
	.quad	.Ltmp296                # DW_AT_low_pc
.Lset33 = .Ltmp297-.Ltmp296             # DW_AT_high_pc
	.long	.Lset33
	.byte	20                      # Abbrev [20] 0x92c:0xc DW_TAG_variable
	.long	.Linfo_string112        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	584                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x939:0x1c DW_TAG_lexical_block
	.quad	.Ltmp298                # DW_AT_low_pc
.Lset34 = .Ltmp299-.Ltmp298             # DW_AT_high_pc
	.long	.Lset34
	.byte	24                      # Abbrev [24] 0x946:0xe DW_TAG_variable
	.byte	1                       # DW_AT_location
	.byte	100
	.long	.Linfo_string112        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	588                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x955:0x1a DW_TAG_lexical_block
	.quad	.Ltmp300                # DW_AT_low_pc
.Lset35 = .Ltmp301-.Ltmp300             # DW_AT_high_pc
	.long	.Lset35
	.byte	20                      # Abbrev [20] 0x962:0xc DW_TAG_variable
	.long	.Linfo_string112        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	590                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x96f:0x1c DW_TAG_lexical_block
	.quad	.Ltmp302                # DW_AT_low_pc
.Lset36 = .Ltmp303-.Ltmp302             # DW_AT_high_pc
	.long	.Lset36
	.byte	24                      # Abbrev [24] 0x97c:0xe DW_TAG_variable
	.byte	1                       # DW_AT_location
	.byte	102
	.long	.Linfo_string112        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	594                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x98c:0xd4 DW_TAG_subprogram
	.quad	.Lfunc_begin16          # DW_AT_low_pc
.Lset37 = .Lfunc_end16-.Lfunc_begin16   # DW_AT_high_pc
	.long	.Lset37
	.byte	1                       # DW_AT_frame_base
	.byte	86
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string45         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	724                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8154                    # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	18                      # Abbrev [18] 0x9a7:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc55           # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	724                     # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x9b7:0x10 DW_TAG_variable
	.long	.Ldebug_loc56           # DW_AT_location
	.long	.Linfo_string123        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	731                     # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x9c7:0x10 DW_TAG_variable
	.long	.Ldebug_loc57           # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	736                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x9d7:0xc DW_TAG_variable
	.long	.Linfo_string86         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	733                     # DW_AT_decl_line
	.long	8371                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x9e3:0xc DW_TAG_variable
	.long	.Linfo_string89         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	735                     # DW_AT_decl_line
	.long	8712                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x9ef:0x34 DW_TAG_lexical_block
	.quad	.Ltmp319                # DW_AT_low_pc
.Lset38 = .Ltmp327-.Ltmp319             # DW_AT_high_pc
	.long	.Lset38
	.byte	15                      # Abbrev [15] 0x9fc:0x10 DW_TAG_variable
	.long	.Ldebug_loc58           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	737                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0xa0c:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges11        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0xa11:0x10 DW_TAG_variable
	.long	.Ldebug_loc59           # DW_AT_location
	.long	.Linfo_string85         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	739                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0xa23:0x1e DW_TAG_lexical_block
	.quad	.Ltmp327                # DW_AT_low_pc
.Lset39 = .Ltmp333-.Ltmp327             # DW_AT_high_pc
	.long	.Lset39
	.byte	15                      # Abbrev [15] 0xa30:0x10 DW_TAG_variable
	.long	.Ldebug_loc60           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	750                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0xa41:0x1e DW_TAG_lexical_block
	.quad	.Ltmp334                # DW_AT_low_pc
.Lset40 = .Ltmp339-.Ltmp334             # DW_AT_high_pc
	.long	.Lset40
	.byte	15                      # Abbrev [15] 0xa4e:0x10 DW_TAG_variable
	.long	.Ldebug_loc61           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	761                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	21                      # Abbrev [21] 0xa60:0x8a DW_TAG_subprogram
	.quad	.Lfunc_begin17          # DW_AT_low_pc
.Lset41 = .Lfunc_end17-.Lfunc_begin17   # DW_AT_high_pc
	.long	.Lset41
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string69         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	704                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8355                    # DW_AT_type
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	22                      # Abbrev [22] 0xa7b:0xe DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	85
	.long	.Linfo_string92         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	704                     # DW_AT_decl_line
	.long	8355                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0xa89:0x10 DW_TAG_variable
	.long	.Ldebug_loc63           # DW_AT_location
	.long	.Linfo_string125        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	708                     # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0xa99:0x10 DW_TAG_variable
	.long	.Ldebug_loc64           # DW_AT_location
	.long	.Linfo_string80         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	707                     # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0xaa9:0xc DW_TAG_variable
	.long	.Linfo_string93         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	706                     # DW_AT_decl_line
	.long	8712                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0xab5:0x34 DW_TAG_lexical_block
	.long	.Ldebug_ranges12        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0xaba:0x10 DW_TAG_variable
	.long	.Ldebug_loc62           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	713                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0xaca:0x1e DW_TAG_lexical_block
	.quad	.Ltmp350                # DW_AT_low_pc
.Lset42 = .Ltmp353-.Ltmp350             # DW_AT_high_pc
	.long	.Lset42
	.byte	15                      # Abbrev [15] 0xad7:0x10 DW_TAG_variable
	.long	.Ldebug_loc65           # DW_AT_location
	.long	.Linfo_string126        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	715                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	25                      # Abbrev [25] 0xaea:0x4f DW_TAG_subprogram
	.quad	.Lfunc_begin18          # DW_AT_low_pc
.Lset43 = .Lfunc_end18-.Lfunc_begin18   # DW_AT_high_pc
	.long	.Lset43
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string68         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	182                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	9                       # Abbrev [9] 0xb00:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc66           # DW_AT_location
	.long	.Linfo_string127        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	182                     # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0xb0f:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc67           # DW_AT_location
	.long	.Linfo_string128        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	182                     # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0xb1e:0x1a DW_TAG_lexical_block
	.quad	.Ltmp366                # DW_AT_low_pc
.Lset44 = .Ltmp369-.Ltmp366             # DW_AT_high_pc
	.long	.Lset44
	.byte	26                      # Abbrev [26] 0xb2b:0xc DW_TAG_variable
	.byte	19                      # DW_AT_const_value
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	187                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0xb39:0xd4 DW_TAG_subprogram
	.quad	.Lfunc_begin19          # DW_AT_low_pc
.Lset45 = .Lfunc_end19-.Lfunc_begin19   # DW_AT_high_pc
	.long	.Lset45
	.byte	1                       # DW_AT_frame_base
	.byte	86
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string46         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	805                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8154                    # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	18                      # Abbrev [18] 0xb54:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc68           # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	805                     # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0xb64:0x10 DW_TAG_variable
	.long	.Ldebug_loc69           # DW_AT_location
	.long	.Linfo_string123        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	812                     # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0xb74:0x10 DW_TAG_variable
	.long	.Ldebug_loc70           # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	817                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0xb84:0xc DW_TAG_variable
	.long	.Linfo_string86         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	814                     # DW_AT_decl_line
	.long	8371                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0xb90:0xc DW_TAG_variable
	.long	.Linfo_string89         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	816                     # DW_AT_decl_line
	.long	8783                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0xb9c:0x34 DW_TAG_lexical_block
	.quad	.Ltmp385                # DW_AT_low_pc
.Lset46 = .Ltmp393-.Ltmp385             # DW_AT_high_pc
	.long	.Lset46
	.byte	15                      # Abbrev [15] 0xba9:0x10 DW_TAG_variable
	.long	.Ldebug_loc71           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	818                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0xbb9:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges13        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0xbbe:0x10 DW_TAG_variable
	.long	.Ldebug_loc72           # DW_AT_location
	.long	.Linfo_string85         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	820                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0xbd0:0x1e DW_TAG_lexical_block
	.quad	.Ltmp393                # DW_AT_low_pc
.Lset47 = .Ltmp399-.Ltmp393             # DW_AT_high_pc
	.long	.Lset47
	.byte	15                      # Abbrev [15] 0xbdd:0x10 DW_TAG_variable
	.long	.Ldebug_loc73           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	831                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0xbee:0x1e DW_TAG_lexical_block
	.quad	.Ltmp399                # DW_AT_low_pc
.Lset48 = .Ltmp404-.Ltmp399             # DW_AT_high_pc
	.long	.Lset48
	.byte	15                      # Abbrev [15] 0xbfb:0x10 DW_TAG_variable
	.long	.Ldebug_loc74           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	836                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	21                      # Abbrev [21] 0xc0d:0x8a DW_TAG_subprogram
	.quad	.Lfunc_begin20          # DW_AT_low_pc
.Lset49 = .Lfunc_end20-.Lfunc_begin20   # DW_AT_high_pc
	.long	.Lset49
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string67         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	783                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8355                    # DW_AT_type
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	18                      # Abbrev [18] 0xc28:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc75           # DW_AT_location
	.long	.Linfo_string92         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	783                     # DW_AT_decl_line
	.long	8355                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0xc38:0x10 DW_TAG_variable
	.long	.Ldebug_loc77           # DW_AT_location
	.long	.Linfo_string80         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	786                     # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0xc48:0x10 DW_TAG_variable
	.long	.Ldebug_loc78           # DW_AT_location
	.long	.Linfo_string125        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	787                     # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0xc58:0xc DW_TAG_variable
	.long	.Linfo_string93         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	785                     # DW_AT_decl_line
	.long	8783                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0xc64:0x32 DW_TAG_lexical_block
	.long	.Ldebug_ranges16        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0xc69:0x10 DW_TAG_variable
	.long	.Ldebug_loc76           # DW_AT_location
	.long	.Linfo_string95         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	792                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0xc79:0x1c DW_TAG_lexical_block
	.long	.Ldebug_ranges15        # DW_AT_ranges
	.byte	11                      # Abbrev [11] 0xc7e:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges14        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0xc83:0x10 DW_TAG_variable
	.long	.Ldebug_loc79           # DW_AT_location
	.long	.Linfo_string96         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	794                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0xc97:0xd4 DW_TAG_subprogram
	.quad	.Lfunc_begin21          # DW_AT_low_pc
.Lset50 = .Lfunc_end21-.Lfunc_begin21   # DW_AT_high_pc
	.long	.Lset50
	.byte	1                       # DW_AT_frame_base
	.byte	86
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string47         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	918                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8154                    # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	18                      # Abbrev [18] 0xcb2:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc80           # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	918                     # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0xcc2:0x10 DW_TAG_variable
	.long	.Ldebug_loc81           # DW_AT_location
	.long	.Linfo_string123        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	925                     # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0xcd2:0x10 DW_TAG_variable
	.long	.Ldebug_loc82           # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	929                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0xce2:0xc DW_TAG_variable
	.long	.Linfo_string86         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	926                     # DW_AT_decl_line
	.long	8371                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0xcee:0xc DW_TAG_variable
	.long	.Linfo_string89         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	928                     # DW_AT_decl_line
	.long	8854                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0xcfa:0x34 DW_TAG_lexical_block
	.quad	.Ltmp451                # DW_AT_low_pc
.Lset51 = .Ltmp459-.Ltmp451             # DW_AT_high_pc
	.long	.Lset51
	.byte	15                      # Abbrev [15] 0xd07:0x10 DW_TAG_variable
	.long	.Ldebug_loc83           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	930                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0xd17:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges17        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0xd1c:0x10 DW_TAG_variable
	.long	.Ldebug_loc84           # DW_AT_location
	.long	.Linfo_string85         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	932                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0xd2e:0x1e DW_TAG_lexical_block
	.quad	.Ltmp459                # DW_AT_low_pc
.Lset52 = .Ltmp465-.Ltmp459             # DW_AT_high_pc
	.long	.Lset52
	.byte	15                      # Abbrev [15] 0xd3b:0x10 DW_TAG_variable
	.long	.Ldebug_loc85           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	943                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0xd4c:0x1e DW_TAG_lexical_block
	.quad	.Ltmp466                # DW_AT_low_pc
.Lset53 = .Ltmp471-.Ltmp466             # DW_AT_high_pc
	.long	.Lset53
	.byte	15                      # Abbrev [15] 0xd59:0x10 DW_TAG_variable
	.long	.Ldebug_loc86           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	954                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	21                      # Abbrev [21] 0xd6b:0x126 DW_TAG_subprogram
	.quad	.Lfunc_begin22          # DW_AT_low_pc
.Lset54 = .Lfunc_end22-.Lfunc_begin22   # DW_AT_high_pc
	.long	.Lset54
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string66         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	864                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8355                    # DW_AT_type
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	18                      # Abbrev [18] 0xd86:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc87           # DW_AT_location
	.long	.Linfo_string92         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	864                     # DW_AT_decl_line
	.long	8355                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0xd96:0x10 DW_TAG_variable
	.long	.Ldebug_loc89           # DW_AT_location
	.long	.Linfo_string131        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	869                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0xda6:0x10 DW_TAG_variable
	.long	.Ldebug_loc90           # DW_AT_location
	.long	.Linfo_string132        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	871                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0xdb6:0xf DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	104
	.long	.Linfo_string125        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	868                     # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	24                      # Abbrev [24] 0xdc5:0xf DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	96
	.long	.Linfo_string80         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	867                     # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0xdd4:0xc DW_TAG_variable
	.long	.Linfo_string93         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	866                     # DW_AT_decl_line
	.long	8854                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0xde0:0xb0 DW_TAG_lexical_block
	.long	.Ldebug_ranges21        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0xde5:0x10 DW_TAG_variable
	.long	.Ldebug_loc88           # DW_AT_location
	.long	.Linfo_string95         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	872                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0xdf5:0x9a DW_TAG_lexical_block
	.long	.Ldebug_ranges20        # DW_AT_ranges
	.byte	20                      # Abbrev [20] 0xdfa:0xc DW_TAG_variable
	.long	.Linfo_string137        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	874                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0xe06:0x88 DW_TAG_lexical_block
	.long	.Ldebug_ranges19        # DW_AT_ranges
	.byte	20                      # Abbrev [20] 0xe0b:0xc DW_TAG_variable
	.long	.Linfo_string96         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	875                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0xe17:0x76 DW_TAG_lexical_block
	.long	.Ldebug_ranges18        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0xe1c:0x10 DW_TAG_variable
	.long	.Ldebug_loc91           # DW_AT_location
	.long	.Linfo_string133        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	878                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0xe2c:0x10 DW_TAG_variable
	.long	.Ldebug_loc92           # DW_AT_location
	.long	.Linfo_string134        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	879                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0xe3c:0x10 DW_TAG_variable
	.long	.Ldebug_loc93           # DW_AT_location
	.long	.Linfo_string135        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	880                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0xe4c:0x10 DW_TAG_variable
	.long	.Ldebug_loc94           # DW_AT_location
	.long	.Linfo_string136        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	881                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0xe5c:0xc DW_TAG_variable
	.long	.Linfo_string138        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	883                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0xe68:0xc DW_TAG_variable
	.long	.Linfo_string139        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	884                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0xe74:0xc DW_TAG_variable
	.long	.Linfo_string140        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	885                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0xe80:0xc DW_TAG_variable
	.long	.Linfo_string141        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	886                     # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0xe91:0x194 DW_TAG_subprogram
	.quad	.Lfunc_begin23          # DW_AT_low_pc
.Lset55 = .Lfunc_end23-.Lfunc_begin23   # DW_AT_high_pc
	.long	.Lset55
	.byte	1                       # DW_AT_frame_base
	.byte	86
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string48         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1033                    # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8154                    # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	18                      # Abbrev [18] 0xeac:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc95           # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1033                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0xebc:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc96           # DW_AT_location
	.long	.Linfo_string142        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1033                    # DW_AT_decl_line
	.long	8554                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0xecc:0x10 DW_TAG_variable
	.long	.Ldebug_loc97           # DW_AT_location
	.long	.Linfo_string123        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1040                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0xedc:0x10 DW_TAG_variable
	.long	.Ldebug_loc98           # DW_AT_location
	.long	.Linfo_string143        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1044                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0xeec:0x10 DW_TAG_variable
	.long	.Ldebug_loc99           # DW_AT_location
	.long	.Linfo_string106        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1061                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0xefc:0x10 DW_TAG_variable
	.long	.Ldebug_loc100          # DW_AT_location
	.long	.Linfo_string107        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1062                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0xf0c:0x10 DW_TAG_variable
	.long	.Ldebug_loc101          # DW_AT_location
	.long	.Linfo_string108        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1063                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0xf1c:0x10 DW_TAG_variable
	.long	.Ldebug_loc102          # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1073                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0xf2c:0x10 DW_TAG_variable
	.long	.Ldebug_loc106          # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1098                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0xf3c:0x10 DW_TAG_variable
	.long	.Ldebug_loc107          # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1099                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0xf4c:0x10 DW_TAG_variable
	.long	.Ldebug_loc108          # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1100                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0xf5c:0xc DW_TAG_variable
	.long	.Linfo_string86         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1042                    # DW_AT_decl_line
	.long	8371                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0xf68:0xc DW_TAG_variable
	.long	.Linfo_string89         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1072                    # DW_AT_decl_line
	.long	8925                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0xf74:0x34 DW_TAG_lexical_block
	.quad	.Ltmp531                # DW_AT_low_pc
.Lset56 = .Ltmp540-.Ltmp531             # DW_AT_high_pc
	.long	.Lset56
	.byte	15                      # Abbrev [15] 0xf81:0x10 DW_TAG_variable
	.long	.Ldebug_loc103          # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1074                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0xf91:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges22        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0xf96:0x10 DW_TAG_variable
	.long	.Ldebug_loc104          # DW_AT_location
	.long	.Linfo_string85         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1076                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0xfa8:0x1e DW_TAG_lexical_block
	.quad	.Ltmp543                # DW_AT_low_pc
.Lset57 = .Ltmp549-.Ltmp543             # DW_AT_high_pc
	.long	.Lset57
	.byte	15                      # Abbrev [15] 0xfb5:0x10 DW_TAG_variable
	.long	.Ldebug_loc105          # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1093                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	11                      # Abbrev [11] 0xfc6:0x5e DW_TAG_lexical_block
	.long	.Ldebug_ranges23        # DW_AT_ranges
	.byte	12                      # Abbrev [12] 0xfcb:0x2c DW_TAG_lexical_block
	.quad	.Ltmp553                # DW_AT_low_pc
.Lset58 = .Ltmp563-.Ltmp553             # DW_AT_high_pc
	.long	.Lset58
	.byte	12                      # Abbrev [12] 0xfd8:0x1e DW_TAG_lexical_block
	.quad	.Ltmp553                # DW_AT_low_pc
.Lset59 = .Ltmp563-.Ltmp553             # DW_AT_high_pc
	.long	.Lset59
	.byte	15                      # Abbrev [15] 0xfe5:0x10 DW_TAG_variable
	.long	.Ldebug_loc109          # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1105                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0xff7:0x2c DW_TAG_lexical_block
	.quad	.Ltmp568                # DW_AT_low_pc
.Lset60 = .Ltmp580-.Ltmp568             # DW_AT_high_pc
	.long	.Lset60
	.byte	12                      # Abbrev [12] 0x1004:0x1e DW_TAG_lexical_block
	.quad	.Ltmp572                # DW_AT_low_pc
.Lset61 = .Ltmp580-.Ltmp572             # DW_AT_high_pc
	.long	.Lset61
	.byte	15                      # Abbrev [15] 0x1011:0x10 DW_TAG_variable
	.long	.Ldebug_loc110          # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1118                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	21                      # Abbrev [21] 0x1025:0x11e DW_TAG_subprogram
	.quad	.Lfunc_begin24          # DW_AT_low_pc
.Lset62 = .Lfunc_end24-.Lfunc_begin24   # DW_AT_high_pc
	.long	.Lset62
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string65         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	982                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8355                    # DW_AT_type
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	18                      # Abbrev [18] 0x1040:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc111          # DW_AT_location
	.long	.Linfo_string92         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	982                     # DW_AT_decl_line
	.long	8355                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1050:0x10 DW_TAG_variable
	.long	.Ldebug_loc112          # DW_AT_location
	.long	.Linfo_string142        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	987                     # DW_AT_decl_line
	.long	8554                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1060:0x10 DW_TAG_variable
	.long	.Ldebug_loc113          # DW_AT_location
	.long	.Linfo_string80         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	985                     # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1070:0x10 DW_TAG_variable
	.long	.Ldebug_loc114          # DW_AT_location
	.long	.Linfo_string125        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	986                     # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1080:0xc DW_TAG_variable
	.long	.Linfo_string93         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	984                     # DW_AT_decl_line
	.long	8925                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x108c:0xb6 DW_TAG_lexical_block
	.quad	.Ltmp605                # DW_AT_low_pc
.Lset63 = .Ltmp650-.Ltmp605             # DW_AT_high_pc
	.long	.Lset63
	.byte	11                      # Abbrev [11] 0x1099:0x38 DW_TAG_lexical_block
	.long	.Ldebug_ranges27        # DW_AT_ranges
	.byte	11                      # Abbrev [11] 0x109e:0x32 DW_TAG_lexical_block
	.long	.Ldebug_ranges26        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x10a3:0x10 DW_TAG_variable
	.long	.Ldebug_loc121          # DW_AT_location
	.long	.Linfo_string95         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1018                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x10b3:0x1c DW_TAG_lexical_block
	.long	.Ldebug_ranges25        # DW_AT_ranges
	.byte	11                      # Abbrev [11] 0x10b8:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges24        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x10bd:0x10 DW_TAG_variable
	.long	.Ldebug_loc120          # DW_AT_location
	.long	.Linfo_string96         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1020                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	11                      # Abbrev [11] 0x10d1:0x70 DW_TAG_lexical_block
	.long	.Ldebug_ranges30        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x10d6:0x10 DW_TAG_variable
	.long	.Ldebug_loc116          # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	994                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x10e6:0x10 DW_TAG_variable
	.long	.Ldebug_loc117          # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	995                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x10f6:0x10 DW_TAG_variable
	.long	.Ldebug_loc118          # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	996                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1106:0x3a DW_TAG_lexical_block
	.quad	.Ltmp610                # DW_AT_low_pc
.Lset64 = .Ltmp631-.Ltmp610             # DW_AT_high_pc
	.long	.Lset64
	.byte	15                      # Abbrev [15] 0x1113:0x10 DW_TAG_variable
	.long	.Ldebug_loc119          # DW_AT_location
	.long	.Linfo_string95         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	998                     # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1123:0x1c DW_TAG_lexical_block
	.long	.Ldebug_ranges29        # DW_AT_ranges
	.byte	11                      # Abbrev [11] 0x1128:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges28        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x112d:0x10 DW_TAG_variable
	.long	.Ldebug_loc115          # DW_AT_location
	.long	.Linfo_string96         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1000                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	25                      # Abbrev [25] 0x1143:0x24 DW_TAG_subprogram
	.quad	.Lfunc_begin25          # DW_AT_low_pc
.Lset65 = .Lfunc_end25-.Lfunc_begin25   # DW_AT_high_pc
	.long	.Lset65
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string64         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	169                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	8                       # Abbrev [8] 0x1159:0xd DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	85
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	169                     # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x1167:0x138 DW_TAG_subprogram
	.quad	.Lfunc_begin26          # DW_AT_low_pc
.Lset66 = .Lfunc_end26-.Lfunc_begin26   # DW_AT_high_pc
	.long	.Lset66
	.byte	1                       # DW_AT_frame_base
	.byte	86
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string49         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1187                    # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8154                    # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	18                      # Abbrev [18] 0x1182:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc122          # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1187                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x1192:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc123          # DW_AT_location
	.long	.Linfo_string142        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1187                    # DW_AT_decl_line
	.long	8554                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x11a2:0x10 DW_TAG_variable
	.long	.Ldebug_loc124          # DW_AT_location
	.long	.Linfo_string123        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1198                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x11b2:0x10 DW_TAG_variable
	.long	.Ldebug_loc125          # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1207                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x11c2:0x10 DW_TAG_variable
	.long	.Ldebug_loc129          # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1231                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x11d2:0x10 DW_TAG_variable
	.long	.Ldebug_loc130          # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1232                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x11e2:0x10 DW_TAG_variable
	.long	.Ldebug_loc131          # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1233                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x11f2:0xc DW_TAG_variable
	.long	.Linfo_string86         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1200                    # DW_AT_decl_line
	.long	8371                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x11fe:0xc DW_TAG_variable
	.long	.Linfo_string106        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1202                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x120a:0xc DW_TAG_variable
	.long	.Linfo_string107        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1203                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1216:0xc DW_TAG_variable
	.long	.Linfo_string108        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1204                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1222:0xc DW_TAG_variable
	.long	.Linfo_string89         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1206                    # DW_AT_decl_line
	.long	9080                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x122e:0x34 DW_TAG_lexical_block
	.quad	.Ltmp671                # DW_AT_low_pc
.Lset67 = .Ltmp679-.Ltmp671             # DW_AT_high_pc
	.long	.Lset67
	.byte	15                      # Abbrev [15] 0x123b:0x10 DW_TAG_variable
	.long	.Ldebug_loc126          # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1208                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x124b:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges31        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x1250:0x10 DW_TAG_variable
	.long	.Ldebug_loc127          # DW_AT_location
	.long	.Linfo_string85         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1210                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x1262:0x1e DW_TAG_lexical_block
	.quad	.Ltmp680                # DW_AT_low_pc
.Lset68 = .Ltmp686-.Ltmp680             # DW_AT_high_pc
	.long	.Lset68
	.byte	15                      # Abbrev [15] 0x126f:0x10 DW_TAG_variable
	.long	.Ldebug_loc128          # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1226                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x1280:0x1e DW_TAG_lexical_block
	.quad	.Ltmp690                # DW_AT_low_pc
.Lset69 = .Ltmp700-.Ltmp690             # DW_AT_high_pc
	.long	.Lset69
	.byte	15                      # Abbrev [15] 0x128d:0x10 DW_TAG_variable
	.long	.Ldebug_loc132          # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1240                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	21                      # Abbrev [21] 0x129f:0xca DW_TAG_subprogram
	.quad	.Lfunc_begin27          # DW_AT_low_pc
.Lset70 = .Lfunc_end27-.Lfunc_begin27   # DW_AT_high_pc
	.long	.Lset70
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string63         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1151                    # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8355                    # DW_AT_type
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	18                      # Abbrev [18] 0x12ba:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc133          # DW_AT_location
	.long	.Linfo_string92         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1151                    # DW_AT_decl_line
	.long	8355                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x12ca:0x10 DW_TAG_variable
	.long	.Ldebug_loc134          # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1161                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x12da:0x10 DW_TAG_variable
	.long	.Ldebug_loc135          # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1162                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x12ea:0x10 DW_TAG_variable
	.long	.Ldebug_loc136          # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1163                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x12fa:0x10 DW_TAG_variable
	.long	.Ldebug_loc138          # DW_AT_location
	.long	.Linfo_string142        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1156                    # DW_AT_decl_line
	.long	8554                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x130a:0x10 DW_TAG_variable
	.long	.Ldebug_loc139          # DW_AT_location
	.long	.Linfo_string125        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1155                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x131a:0x10 DW_TAG_variable
	.long	.Ldebug_loc140          # DW_AT_location
	.long	.Linfo_string80         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1154                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x132a:0xc DW_TAG_variable
	.long	.Linfo_string93         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1153                    # DW_AT_decl_line
	.long	9080                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1336:0x32 DW_TAG_lexical_block
	.long	.Ldebug_ranges34        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x133b:0x10 DW_TAG_variable
	.long	.Ldebug_loc137          # DW_AT_location
	.long	.Linfo_string95         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1165                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x134b:0x1c DW_TAG_lexical_block
	.long	.Ldebug_ranges33        # DW_AT_ranges
	.byte	11                      # Abbrev [11] 0x1350:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges32        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x1355:0x10 DW_TAG_variable
	.long	.Ldebug_loc141          # DW_AT_location
	.long	.Linfo_string96         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1167                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x1369:0x148 DW_TAG_subprogram
	.quad	.Lfunc_begin28          # DW_AT_low_pc
.Lset71 = .Lfunc_end28-.Lfunc_begin28   # DW_AT_high_pc
	.long	.Lset71
	.byte	1                       # DW_AT_frame_base
	.byte	86
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string50         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1385                    # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8154                    # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	18                      # Abbrev [18] 0x1384:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc142          # DW_AT_location
	.long	.Linfo_string146        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1385                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x1394:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc143          # DW_AT_location
	.long	.Linfo_string147        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1385                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x13a4:0x10 DW_TAG_variable
	.long	.Ldebug_loc144          # DW_AT_location
	.long	.Linfo_string148        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1397                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x13b4:0x10 DW_TAG_variable
	.long	.Ldebug_loc145          # DW_AT_location
	.long	.Linfo_string123        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1398                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x13c4:0x10 DW_TAG_variable
	.long	.Ldebug_loc146          # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1422                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x13d4:0x10 DW_TAG_variable
	.long	.Ldebug_loc150          # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1448                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x13e4:0x10 DW_TAG_variable
	.long	.Ldebug_loc151          # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1449                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x13f4:0x10 DW_TAG_variable
	.long	.Ldebug_loc152          # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1450                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1404:0xc DW_TAG_variable
	.long	.Linfo_string86         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1415                    # DW_AT_decl_line
	.long	8371                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1410:0xc DW_TAG_variable
	.long	.Linfo_string106        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1417                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x141c:0xc DW_TAG_variable
	.long	.Linfo_string107        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1418                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1428:0xc DW_TAG_variable
	.long	.Linfo_string108        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1419                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1434:0xc DW_TAG_variable
	.long	.Linfo_string89         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1421                    # DW_AT_decl_line
	.long	9221                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1440:0x34 DW_TAG_lexical_block
	.quad	.Ltmp772                # DW_AT_low_pc
.Lset72 = .Ltmp780-.Ltmp772             # DW_AT_high_pc
	.long	.Lset72
	.byte	15                      # Abbrev [15] 0x144d:0x10 DW_TAG_variable
	.long	.Ldebug_loc147          # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1424                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x145d:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges35        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x1462:0x10 DW_TAG_variable
	.long	.Ldebug_loc148          # DW_AT_location
	.long	.Linfo_string85         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1426                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x1474:0x1e DW_TAG_lexical_block
	.quad	.Ltmp781                # DW_AT_low_pc
.Lset73 = .Ltmp787-.Ltmp781             # DW_AT_high_pc
	.long	.Lset73
	.byte	15                      # Abbrev [15] 0x1481:0x10 DW_TAG_variable
	.long	.Ldebug_loc149          # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1443                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x1492:0x1e DW_TAG_lexical_block
	.quad	.Ltmp788                # DW_AT_low_pc
.Lset74 = .Ltmp798-.Ltmp788             # DW_AT_high_pc
	.long	.Lset74
	.byte	15                      # Abbrev [15] 0x149f:0x10 DW_TAG_variable
	.long	.Ldebug_loc153          # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1454                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	21                      # Abbrev [21] 0x14b1:0x20d DW_TAG_subprogram
	.quad	.Lfunc_begin29          # DW_AT_low_pc
.Lset75 = .Lfunc_end29-.Lfunc_begin29   # DW_AT_high_pc
	.long	.Lset75
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string62         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1274                    # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8355                    # DW_AT_type
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	22                      # Abbrev [22] 0x14cc:0xe DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	85
	.long	.Linfo_string92         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1274                    # DW_AT_decl_line
	.long	8355                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x14da:0x10 DW_TAG_variable
	.long	.Ldebug_loc154          # DW_AT_location
	.long	.Linfo_string125        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1279                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x14ea:0x10 DW_TAG_variable
	.long	.Ldebug_loc157          # DW_AT_location
	.long	.Linfo_string150        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1310                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x14fa:0x10 DW_TAG_variable
	.long	.Ldebug_loc158          # DW_AT_location
	.long	.Linfo_string151        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1277                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x150a:0x10 DW_TAG_variable
	.long	.Ldebug_loc159          # DW_AT_location
	.long	.Linfo_string152        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1278                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x151a:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string34         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1303                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1527:0xc DW_TAG_variable
	.long	.Linfo_string93         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1276                    # DW_AT_decl_line
	.long	9221                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1533:0xc DW_TAG_variable
	.long	.Linfo_string32         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1301                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x153f:0xc DW_TAG_variable
	.long	.Linfo_string33         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1302                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x154b:0xc DW_TAG_variable
	.long	.Linfo_string115        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1305                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1557:0xc DW_TAG_variable
	.long	.Linfo_string113        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1306                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1563:0xc DW_TAG_variable
	.long	.Linfo_string114        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1307                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x156f:0xc DW_TAG_variable
	.long	.Linfo_string154        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1308                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x157b:0xc DW_TAG_variable
	.long	.Linfo_string120        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1336                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1587:0xc DW_TAG_variable
	.long	.Linfo_string121        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1342                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1593:0xc DW_TAG_variable
	.long	.Linfo_string122        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1348                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x159f:0x3e DW_TAG_lexical_block
	.quad	.Ltmp808                # DW_AT_low_pc
.Lset76 = .Ltmp816-.Ltmp808             # DW_AT_high_pc
	.long	.Lset76
	.byte	12                      # Abbrev [12] 0x15ac:0x30 DW_TAG_lexical_block
	.quad	.Ltmp809                # DW_AT_low_pc
.Lset77 = .Ltmp816-.Ltmp809             # DW_AT_high_pc
	.long	.Lset77
	.byte	20                      # Abbrev [20] 0x15b9:0xc DW_TAG_variable
	.long	.Linfo_string153        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1288                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x15c5:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges36        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x15ca:0x10 DW_TAG_variable
	.long	.Ldebug_loc155          # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1290                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	11                      # Abbrev [11] 0x15dd:0x70 DW_TAG_lexical_block
	.long	.Ldebug_ranges37        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x15e2:0x10 DW_TAG_variable
	.long	.Ldebug_loc156          # DW_AT_location
	.long	.Linfo_string95         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1312                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x15f2:0x5a DW_TAG_lexical_block
	.quad	.Ltmp827                # DW_AT_low_pc
.Lset78 = .Ltmp829-.Ltmp827             # DW_AT_high_pc
	.long	.Lset78
	.byte	12                      # Abbrev [12] 0x15ff:0x4c DW_TAG_lexical_block
	.quad	.Ltmp827                # DW_AT_low_pc
.Lset79 = .Ltmp829-.Ltmp827             # DW_AT_high_pc
	.long	.Lset79
	.byte	20                      # Abbrev [20] 0x160c:0xc DW_TAG_variable
	.long	.Linfo_string96         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1314                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1618:0x32 DW_TAG_lexical_block
	.quad	.Ltmp827                # DW_AT_low_pc
.Lset80 = .Ltmp828-.Ltmp827             # DW_AT_high_pc
	.long	.Lset80
	.byte	20                      # Abbrev [20] 0x1625:0xc DW_TAG_variable
	.long	.Linfo_string155        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1316                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1631:0xc DW_TAG_variable
	.long	.Linfo_string156        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1317                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x163d:0xc DW_TAG_variable
	.long	.Linfo_string157        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1318                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x164d:0x1e DW_TAG_lexical_block
	.quad	.Ltmp837                # DW_AT_low_pc
.Lset81 = .Ltmp838-.Ltmp837             # DW_AT_high_pc
	.long	.Lset81
	.byte	15                      # Abbrev [15] 0x165a:0x10 DW_TAG_variable
	.long	.Ldebug_loc160          # DW_AT_location
	.long	.Linfo_string112        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1336                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x166b:0x1a DW_TAG_lexical_block
	.quad	.Ltmp839                # DW_AT_low_pc
.Lset82 = .Ltmp840-.Ltmp839             # DW_AT_high_pc
	.long	.Lset82
	.byte	20                      # Abbrev [20] 0x1678:0xc DW_TAG_variable
	.long	.Linfo_string112        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1338                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x1685:0x1e DW_TAG_lexical_block
	.quad	.Ltmp841                # DW_AT_low_pc
.Lset83 = .Ltmp842-.Ltmp841             # DW_AT_high_pc
	.long	.Lset83
	.byte	15                      # Abbrev [15] 0x1692:0x10 DW_TAG_variable
	.long	.Ldebug_loc161          # DW_AT_location
	.long	.Linfo_string112        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1342                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x16a3:0x1a DW_TAG_lexical_block
	.quad	.Ltmp843                # DW_AT_low_pc
.Lset84 = .Ltmp844-.Ltmp843             # DW_AT_high_pc
	.long	.Lset84
	.byte	20                      # Abbrev [20] 0x16b0:0xc DW_TAG_variable
	.long	.Linfo_string112        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1344                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x16be:0x1ca DW_TAG_subprogram
	.quad	.Lfunc_begin30          # DW_AT_low_pc
.Lset85 = .Lfunc_end30-.Lfunc_begin30   # DW_AT_high_pc
	.long	.Lset85
	.byte	1                       # DW_AT_frame_base
	.byte	86
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string51         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1641                    # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8154                    # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	18                      # Abbrev [18] 0x16d9:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc162          # DW_AT_location
	.long	.Linfo_string146        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1641                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x16e9:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc163          # DW_AT_location
	.long	.Linfo_string147        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1641                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x16f9:0x10 DW_TAG_variable
	.long	.Ldebug_loc166          # DW_AT_location
	.long	.Linfo_string123        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1667                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1709:0x10 DW_TAG_variable
	.long	.Ldebug_loc167          # DW_AT_location
	.long	.Linfo_string159        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1668                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1719:0x10 DW_TAG_variable
	.long	.Ldebug_loc168          # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1677                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1729:0x10 DW_TAG_variable
	.long	.Ldebug_loc172          # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1700                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1739:0x10 DW_TAG_variable
	.long	.Ldebug_loc173          # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1701                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1749:0x10 DW_TAG_variable
	.long	.Ldebug_loc174          # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1702                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1759:0xc DW_TAG_variable
	.long	.Linfo_string160        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1654                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1765:0xc DW_TAG_variable
	.long	.Linfo_string161        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1655                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1771:0xc DW_TAG_variable
	.long	.Linfo_string106        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1670                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x177d:0xc DW_TAG_variable
	.long	.Linfo_string107        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1671                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1789:0xc DW_TAG_variable
	.long	.Linfo_string108        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1672                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1795:0xc DW_TAG_variable
	.long	.Linfo_string86         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1674                    # DW_AT_decl_line
	.long	8371                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x17a1:0xc DW_TAG_variable
	.long	.Linfo_string89         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1676                    # DW_AT_decl_line
	.long	9376                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x17ad:0x28 DW_TAG_lexical_block
	.quad	.Ltmp857                # DW_AT_low_pc
.Lset86 = .Ltmp860-.Ltmp857             # DW_AT_high_pc
	.long	.Lset86
	.byte	12                      # Abbrev [12] 0x17ba:0x1a DW_TAG_lexical_block
	.quad	.Ltmp858                # DW_AT_low_pc
.Lset87 = .Ltmp860-.Ltmp858             # DW_AT_high_pc
	.long	.Lset87
	.byte	20                      # Abbrev [20] 0x17c7:0xc DW_TAG_variable
	.long	.Linfo_string123        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1645                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	11                      # Abbrev [11] 0x17d5:0x42 DW_TAG_lexical_block
	.long	.Ldebug_ranges38        # DW_AT_ranges
	.byte	12                      # Abbrev [12] 0x17da:0x3c DW_TAG_lexical_block
	.quad	.Ltmp862                # DW_AT_low_pc
.Lset88 = .Ltmp872-.Ltmp862             # DW_AT_high_pc
	.long	.Lset88
	.byte	15                      # Abbrev [15] 0x17e7:0x10 DW_TAG_variable
	.long	.Ldebug_loc164          # DW_AT_location
	.long	.Linfo_string158        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1659                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x17f7:0x1e DW_TAG_lexical_block
	.quad	.Ltmp862                # DW_AT_low_pc
.Lset89 = .Ltmp870-.Ltmp862             # DW_AT_high_pc
	.long	.Lset89
	.byte	15                      # Abbrev [15] 0x1804:0x10 DW_TAG_variable
	.long	.Ldebug_loc165          # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1660                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x1817:0x34 DW_TAG_lexical_block
	.quad	.Ltmp876                # DW_AT_low_pc
.Lset90 = .Ltmp884-.Ltmp876             # DW_AT_high_pc
	.long	.Lset90
	.byte	15                      # Abbrev [15] 0x1824:0x10 DW_TAG_variable
	.long	.Ldebug_loc169          # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1678                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1834:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges39        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x1839:0x10 DW_TAG_variable
	.long	.Ldebug_loc170          # DW_AT_location
	.long	.Linfo_string85         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1680                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x184b:0x1e DW_TAG_lexical_block
	.quad	.Ltmp885                # DW_AT_low_pc
.Lset91 = .Ltmp891-.Ltmp885             # DW_AT_high_pc
	.long	.Lset91
	.byte	15                      # Abbrev [15] 0x1858:0x10 DW_TAG_variable
	.long	.Ldebug_loc171          # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1695                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x1869:0x1e DW_TAG_lexical_block
	.quad	.Ltmp893                # DW_AT_low_pc
.Lset92 = .Ltmp903-.Ltmp893             # DW_AT_high_pc
	.long	.Lset92
	.byte	15                      # Abbrev [15] 0x1876:0x10 DW_TAG_variable
	.long	.Ldebug_loc175          # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1706                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	21                      # Abbrev [21] 0x1888:0x382 DW_TAG_subprogram
	.quad	.Lfunc_begin31          # DW_AT_low_pc
.Lset93 = .Lfunc_end31-.Lfunc_begin31   # DW_AT_high_pc
	.long	.Lset93
	.byte	1                       # DW_AT_frame_base
	.byte	86
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string61         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1493                    # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8355                    # DW_AT_type
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	18                      # Abbrev [18] 0x18a3:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc176          # DW_AT_location
	.long	.Linfo_string92         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1493                    # DW_AT_decl_line
	.long	8355                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x18b3:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string163        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1505                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x18c0:0x10 DW_TAG_variable
	.long	.Ldebug_loc177          # DW_AT_location
	.long	.Linfo_string164        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1504                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x18d0:0x10 DW_TAG_variable
	.long	.Ldebug_loc178          # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1502                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x18e0:0x10 DW_TAG_variable
	.long	.Ldebug_loc179          # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1501                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x18f0:0x10 DW_TAG_variable
	.long	.Ldebug_loc180          # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1500                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1900:0x10 DW_TAG_variable
	.long	.Ldebug_loc181          # DW_AT_location
	.long	.Linfo_string151        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1496                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1910:0x10 DW_TAG_variable
	.long	.Ldebug_loc182          # DW_AT_location
	.long	.Linfo_string152        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1497                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	24                      # Abbrev [24] 0x1920:0xf DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	72
	.long	.Linfo_string125        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1498                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x192f:0xc DW_TAG_variable
	.long	.Linfo_string93         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1495                    # DW_AT_decl_line
	.long	9376                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x193b:0xc DW_TAG_variable
	.long	.Linfo_string160        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1509                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1947:0xc DW_TAG_variable
	.long	.Linfo_string161        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1510                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1953:0x2b6 DW_TAG_lexical_block
	.quad	.Ltmp923                # DW_AT_low_pc
.Lset94 = .Ltmp1029-.Ltmp923            # DW_AT_high_pc
	.long	.Lset94
	.byte	11                      # Abbrev [11] 0x1960:0xc9 DW_TAG_lexical_block
	.long	.Ldebug_ranges42        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x1965:0x10 DW_TAG_variable
	.long	.Ldebug_loc183          # DW_AT_location
	.long	.Linfo_string132        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1539                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1975:0x10 DW_TAG_variable
	.long	.Ldebug_loc184          # DW_AT_location
	.long	.Linfo_string165        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1540                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1985:0xa3 DW_TAG_lexical_block
	.quad	.Ltmp927                # DW_AT_low_pc
.Lset95 = .Ltmp952-.Ltmp927             # DW_AT_high_pc
	.long	.Lset95
	.byte	15                      # Abbrev [15] 0x1992:0x10 DW_TAG_variable
	.long	.Ldebug_loc185          # DW_AT_location
	.long	.Linfo_string95         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1541                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x19a2:0x85 DW_TAG_lexical_block
	.long	.Ldebug_ranges41        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x19a7:0x10 DW_TAG_variable
	.long	.Ldebug_loc187          # DW_AT_location
	.long	.Linfo_string166        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1552                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	23                      # Abbrev [23] 0x19b7:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string137        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1557                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x19c4:0xc DW_TAG_variable
	.long	.Linfo_string167        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1543                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x19d0:0xc DW_TAG_variable
	.long	.Linfo_string122        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1548                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x19dc:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges40        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x19e1:0x10 DW_TAG_variable
	.long	.Ldebug_loc186          # DW_AT_location
	.long	.Linfo_string96         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1558                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x19f2:0x1a DW_TAG_lexical_block
	.quad	.Ltmp935                # DW_AT_low_pc
.Lset96 = .Ltmp938-.Ltmp935             # DW_AT_high_pc
	.long	.Lset96
	.byte	20                      # Abbrev [20] 0x19ff:0xc DW_TAG_variable
	.long	.Linfo_string168        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1544                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x1a0c:0x1a DW_TAG_lexical_block
	.quad	.Ltmp938                # DW_AT_low_pc
.Lset97 = .Ltmp939-.Ltmp938             # DW_AT_high_pc
	.long	.Lset97
	.byte	20                      # Abbrev [20] 0x1a19:0xc DW_TAG_variable
	.long	.Linfo_string112        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1548                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x1a29:0x1df DW_TAG_lexical_block
	.quad	.Ltmp953                # DW_AT_low_pc
.Lset98 = .Ltmp1029-.Ltmp953            # DW_AT_high_pc
	.long	.Lset98
	.byte	11                      # Abbrev [11] 0x1a36:0xcb DW_TAG_lexical_block
	.long	.Ldebug_ranges46        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x1a3b:0x10 DW_TAG_variable
	.long	.Ldebug_loc191          # DW_AT_location
	.long	.Linfo_string132        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1605                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1a4b:0xc DW_TAG_variable
	.long	.Linfo_string165        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1606                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1a57:0xa9 DW_TAG_lexical_block
	.quad	.Ltmp956                # DW_AT_low_pc
.Lset99 = .Ltmp987-.Ltmp956             # DW_AT_high_pc
	.long	.Lset99
	.byte	15                      # Abbrev [15] 0x1a64:0x10 DW_TAG_variable
	.long	.Ldebug_loc188          # DW_AT_location
	.long	.Linfo_string95         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1607                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1a74:0x8b DW_TAG_lexical_block
	.long	.Ldebug_ranges45        # DW_AT_ranges
	.byte	23                      # Abbrev [23] 0x1a79:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string137        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1609                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1a86:0x78 DW_TAG_lexical_block
	.long	.Ldebug_ranges44        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x1a8b:0x10 DW_TAG_variable
	.long	.Ldebug_loc189          # DW_AT_location
	.long	.Linfo_string96         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1610                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1a9b:0x62 DW_TAG_lexical_block
	.long	.Ldebug_ranges43        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x1aa0:0x10 DW_TAG_variable
	.long	.Ldebug_loc190          # DW_AT_location
	.long	.Linfo_string158        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1621                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1ab0:0xc DW_TAG_variable
	.long	.Linfo_string170        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1612                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1abc:0xc DW_TAG_variable
	.long	.Linfo_string122        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1617                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1ac8:0x1a DW_TAG_lexical_block
	.quad	.Ltmp966                # DW_AT_low_pc
.Lset100 = .Ltmp971-.Ltmp966            # DW_AT_high_pc
	.long	.Lset100
	.byte	20                      # Abbrev [20] 0x1ad5:0xc DW_TAG_variable
	.long	.Linfo_string168        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1613                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x1ae2:0x1a DW_TAG_lexical_block
	.quad	.Ltmp972                # DW_AT_low_pc
.Lset101 = .Ltmp973-.Ltmp972            # DW_AT_high_pc
	.long	.Lset101
	.byte	20                      # Abbrev [20] 0x1aef:0xc DW_TAG_variable
	.long	.Linfo_string112        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1617                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	11                      # Abbrev [11] 0x1b01:0x106 DW_TAG_lexical_block
	.long	.Ldebug_ranges51        # DW_AT_ranges
	.byte	24                      # Abbrev [24] 0x1b06:0xf DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	80
	.long	.Linfo_string165        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1569                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	23                      # Abbrev [23] 0x1b15:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string137        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1572                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1b22:0xc DW_TAG_variable
	.long	.Linfo_string132        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1568                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1b2e:0xc DW_TAG_variable
	.long	.Linfo_string169        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1570                    # DW_AT_decl_line
	.long	9517                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1b3a:0x74 DW_TAG_lexical_block
	.quad	.Ltmp988                # DW_AT_low_pc
.Lset102 = .Ltmp1004-.Ltmp988           # DW_AT_high_pc
	.long	.Lset102
	.byte	15                      # Abbrev [15] 0x1b47:0x10 DW_TAG_variable
	.long	.Ldebug_loc192          # DW_AT_location
	.long	.Linfo_string96         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1573                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1b57:0x56 DW_TAG_lexical_block
	.long	.Ldebug_ranges48        # DW_AT_ranges
	.byte	20                      # Abbrev [20] 0x1b5c:0xc DW_TAG_variable
	.long	.Linfo_string170        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1575                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1b68:0xc DW_TAG_variable
	.long	.Linfo_string122        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1580                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1b74:0xc DW_TAG_variable
	.long	.Linfo_string158        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1584                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1b80:0x12 DW_TAG_lexical_block
	.long	.Ldebug_ranges47        # DW_AT_ranges
	.byte	20                      # Abbrev [20] 0x1b85:0xc DW_TAG_variable
	.long	.Linfo_string168        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1576                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x1b92:0x1a DW_TAG_lexical_block
	.quad	.Ltmp999                # DW_AT_low_pc
.Lset103 = .Ltmp1000-.Ltmp999           # DW_AT_high_pc
	.long	.Lset103
	.byte	20                      # Abbrev [20] 0x1b9f:0xc DW_TAG_variable
	.long	.Linfo_string112        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1580                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x1bae:0x3a DW_TAG_lexical_block
	.quad	.Ltmp1004               # DW_AT_low_pc
.Lset104 = .Ltmp1013-.Ltmp1004          # DW_AT_high_pc
	.long	.Lset104
	.byte	15                      # Abbrev [15] 0x1bbb:0x10 DW_TAG_variable
	.long	.Ldebug_loc193          # DW_AT_location
	.long	.Linfo_string95         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1588                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1bcb:0x1c DW_TAG_lexical_block
	.long	.Ldebug_ranges50        # DW_AT_ranges
	.byte	11                      # Abbrev [11] 0x1bd0:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges49        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x1bd5:0x10 DW_TAG_variable
	.long	.Ldebug_loc194          # DW_AT_location
	.long	.Linfo_string96         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1590                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x1be8:0x1e DW_TAG_lexical_block
	.quad	.Ltmp1013               # DW_AT_low_pc
.Lset105 = .Ltmp1024-.Ltmp1013          # DW_AT_high_pc
	.long	.Lset105
	.byte	15                      # Abbrev [15] 0x1bf5:0x10 DW_TAG_variable
	.long	.Ldebug_loc195          # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1596                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	25                      # Abbrev [25] 0x1c0a:0x26 DW_TAG_subprogram
	.quad	.Lfunc_begin32          # DW_AT_low_pc
.Lset106 = .Lfunc_end32-.Lfunc_begin32  # DW_AT_high_pc
	.long	.Lset106
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string60         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	196                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	9                       # Abbrev [9] 0x1c20:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc196          # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	196                     # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x1c30:0x46 DW_TAG_subprogram
	.quad	.Lfunc_begin33          # DW_AT_low_pc
.Lset107 = .Lfunc_end33-.Lfunc_begin33  # DW_AT_high_pc
	.long	.Lset107
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string52         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1800                    # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8154                    # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	22                      # Abbrev [22] 0x1c4b:0xe DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	85
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1800                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x1c59:0x10 DW_TAG_formal_parameter
	.byte	3                       # DW_AT_location
	.byte	84
	.byte	147
	.byte	4
	.long	.Linfo_string171        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1800                    # DW_AT_decl_line
	.long	8554                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1c69:0xc DW_TAG_variable
	.long	.Linfo_string119        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1818                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	21                      # Abbrev [21] 0x1c76:0xb8 DW_TAG_subprogram
	.quad	.Lfunc_begin34          # DW_AT_low_pc
.Lset108 = .Lfunc_end34-.Lfunc_begin34  # DW_AT_high_pc
	.long	.Lset108
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string59         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1760                    # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8154                    # DW_AT_type
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	18                      # Abbrev [18] 0x1c91:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc197          # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1760                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x1ca1:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc198          # DW_AT_location
	.long	.Linfo_string171        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1760                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1cb1:0x7c DW_TAG_lexical_block
	.quad	.Ltmp1054               # DW_AT_low_pc
.Lset109 = .Ltmp1065-.Ltmp1054          # DW_AT_high_pc
	.long	.Lset109
	.byte	11                      # Abbrev [11] 0x1cbe:0x6e DW_TAG_lexical_block
	.long	.Ldebug_ranges52        # DW_AT_ranges
	.byte	12                      # Abbrev [12] 0x1cc3:0x68 DW_TAG_lexical_block
	.quad	.Ltmp1058               # DW_AT_low_pc
.Lset110 = .Ltmp1065-.Ltmp1058          # DW_AT_high_pc
	.long	.Lset110
	.byte	12                      # Abbrev [12] 0x1cd0:0x5a DW_TAG_lexical_block
	.quad	.Ltmp1059               # DW_AT_low_pc
.Lset111 = .Ltmp1065-.Ltmp1059          # DW_AT_high_pc
	.long	.Lset111
	.byte	15                      # Abbrev [15] 0x1cdd:0x10 DW_TAG_variable
	.long	.Ldebug_loc199          # DW_AT_location
	.long	.Linfo_string119        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1776                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1ced:0x10 DW_TAG_variable
	.long	.Ldebug_loc200          # DW_AT_location
	.long	.Linfo_string172        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1784                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1cfd:0x2c DW_TAG_lexical_block
	.quad	.Ltmp1062               # DW_AT_low_pc
.Lset112 = .Ltmp1065-.Ltmp1062          # DW_AT_high_pc
	.long	.Lset112
	.byte	12                      # Abbrev [12] 0x1d0a:0x1e DW_TAG_lexical_block
	.quad	.Ltmp1063               # DW_AT_low_pc
.Lset113 = .Ltmp1065-.Ltmp1063          # DW_AT_high_pc
	.long	.Lset113
	.byte	15                      # Abbrev [15] 0x1d17:0x10 DW_TAG_variable
	.long	.Ldebug_loc201          # DW_AT_location
	.long	.Linfo_string173        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1789                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x1d2e:0x2a DW_TAG_subprogram
	.quad	.Lfunc_begin35          # DW_AT_low_pc
.Lset114 = .Lfunc_end35-.Lfunc_begin35  # DW_AT_high_pc
	.long	.Lset114
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string53         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1832                    # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	239                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	22                      # Abbrev [22] 0x1d49:0xe DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	85
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1832                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x1d58:0x6c DW_TAG_subprogram
	.quad	.Lfunc_begin36          # DW_AT_low_pc
.Lset115 = .Lfunc_end36-.Lfunc_begin36  # DW_AT_high_pc
	.long	.Lset115
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string54         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1840                    # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	239                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	22                      # Abbrev [22] 0x1d73:0xe DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	85
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1840                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1d81:0x10 DW_TAG_variable
	.long	.Ldebug_loc202          # DW_AT_location
	.long	.Linfo_string158        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1845                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1d91:0x10 DW_TAG_variable
	.long	.Ldebug_loc204          # DW_AT_location
	.long	.Linfo_string80         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1847                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1da1:0xc DW_TAG_variable
	.long	.Linfo_string153        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1846                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1dad:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges53        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x1db2:0x10 DW_TAG_variable
	.long	.Ldebug_loc203          # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1849                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x1dc4:0x2a DW_TAG_subprogram
	.quad	.Lfunc_begin37          # DW_AT_low_pc
.Lset116 = .Lfunc_end37-.Lfunc_begin37  # DW_AT_high_pc
	.long	.Lset116
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string55         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1862                    # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	239                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	22                      # Abbrev [22] 0x1ddf:0xe DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	85
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1862                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x1dee:0x2a DW_TAG_subprogram
	.quad	.Lfunc_begin38          # DW_AT_low_pc
.Lset117 = .Lfunc_end38-.Lfunc_begin38  # DW_AT_high_pc
	.long	.Lset117
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string56         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1870                    # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	239                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	22                      # Abbrev [22] 0x1e09:0xe DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	85
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1870                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x1e18:0xf0 DW_TAG_subprogram
	.quad	.Lfunc_begin39          # DW_AT_low_pc
.Lset118 = .Lfunc_end39-.Lfunc_begin39  # DW_AT_high_pc
	.long	.Lset118
	.byte	1                       # DW_AT_frame_base
	.byte	86
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string57         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1942                    # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	239                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	18                      # Abbrev [18] 0x1e33:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc205          # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1942                    # DW_AT_decl_line
	.long	8154                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x1e43:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc206          # DW_AT_location
	.long	.Linfo_string97         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1942                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1e53:0x10 DW_TAG_variable
	.long	.Ldebug_loc207          # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	2002                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1e63:0x10 DW_TAG_variable
	.long	.Ldebug_loc211          # DW_AT_location
	.long	.Linfo_string76         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	2022                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1e73:0xc DW_TAG_variable
	.long	.Linfo_string125        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1997                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1e7f:0xc DW_TAG_variable
	.long	.Linfo_string86         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1999                    # DW_AT_decl_line
	.long	8371                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1e8b:0xc DW_TAG_variable
	.long	.Linfo_string89         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	2001                    # DW_AT_decl_line
	.long	9528                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1e97:0x34 DW_TAG_lexical_block
	.quad	.Ltmp1115               # DW_AT_low_pc
.Lset119 = .Ltmp1123-.Ltmp1115          # DW_AT_high_pc
	.long	.Lset119
	.byte	15                      # Abbrev [15] 0x1ea4:0x10 DW_TAG_variable
	.long	.Ldebug_loc208          # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	2003                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1eb4:0x16 DW_TAG_lexical_block
	.long	.Ldebug_ranges54        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x1eb9:0x10 DW_TAG_variable
	.long	.Ldebug_loc209          # DW_AT_location
	.long	.Linfo_string85         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	2005                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x1ecb:0x1e DW_TAG_lexical_block
	.quad	.Ltmp1123               # DW_AT_low_pc
.Lset120 = .Ltmp1129-.Ltmp1123          # DW_AT_high_pc
	.long	.Lset120
	.byte	15                      # Abbrev [15] 0x1ed8:0x10 DW_TAG_variable
	.long	.Ldebug_loc210          # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	2017                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x1ee9:0x1e DW_TAG_lexical_block
	.quad	.Ltmp1129               # DW_AT_low_pc
.Lset121 = .Ltmp1136-.Ltmp1129          # DW_AT_high_pc
	.long	.Lset121
	.byte	15                      # Abbrev [15] 0x1ef6:0x10 DW_TAG_variable
	.long	.Ldebug_loc212          # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	2024                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	21                      # Abbrev [21] 0x1f08:0xd2 DW_TAG_subprogram
	.quad	.Lfunc_begin40          # DW_AT_low_pc
.Lset122 = .Lfunc_end40-.Lfunc_begin40  # DW_AT_high_pc
	.long	.Lset122
	.byte	1                       # DW_AT_frame_base
	.byte	87
                                        # DW_AT_APPLE_omit_frame_ptr
	.long	.Linfo_string58         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1889                    # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	8355                    # DW_AT_type
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	22                      # Abbrev [22] 0x1f23:0xe DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	85
	.long	.Linfo_string92         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1889                    # DW_AT_decl_line
	.long	8355                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1f31:0x10 DW_TAG_variable
	.long	.Ldebug_loc213          # DW_AT_location
	.long	.Linfo_string76         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1895                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1f41:0x10 DW_TAG_variable
	.long	.Ldebug_loc215          # DW_AT_location
	.long	.Linfo_string175        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1923                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1f51:0x10 DW_TAG_variable
	.long	.Ldebug_loc216          # DW_AT_location
	.long	.Linfo_string80         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1892                    # DW_AT_decl_line
	.long	8244                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1f61:0xc DW_TAG_variable
	.long	.Linfo_string93         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1891                    # DW_AT_decl_line
	.long	9528                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1f6d:0xc DW_TAG_variable
	.long	.Linfo_string97         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1894                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1f79:0xc DW_TAG_variable
	.long	.Linfo_string176        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1921                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1f85:0xc DW_TAG_variable
	.long	.Linfo_string115        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1922                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1f91:0xc DW_TAG_variable
	.long	.Linfo_string179        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1934                    # DW_AT_decl_line
	.long	8700                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1f9d:0x3c DW_TAG_lexical_block
	.long	.Ldebug_ranges55        # DW_AT_ranges
	.byte	15                      # Abbrev [15] 0x1fa2:0x10 DW_TAG_variable
	.long	.Ldebug_loc214          # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1925                    # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1fb2:0x26 DW_TAG_lexical_block
	.quad	.Ltmp1147               # DW_AT_low_pc
.Lset123 = .Ltmp1148-.Ltmp1147          # DW_AT_high_pc
	.long	.Lset123
	.byte	20                      # Abbrev [20] 0x1fbf:0xc DW_TAG_variable
	.long	.Linfo_string177        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1927                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x1fcb:0xc DW_TAG_variable
	.long	.Linfo_string178        # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.short	1928                    # DW_AT_decl_line
	.long	8524                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	27                      # Abbrev [27] 0x1fda:0x5 DW_TAG_pointer_type
	.long	8159                    # DW_AT_type
	.byte	3                       # Abbrev [3] 0x1fdf:0xb DW_TAG_typedef
	.long	8170                    # DW_AT_type
	.long	.Linfo_string39         # DW_AT_name
	.byte	5                       # DW_AT_decl_file
	.byte	25                      # DW_AT_decl_line
	.byte	28                      # Abbrev [28] 0x1fea:0x4a DW_TAG_structure_type
	.long	.Linfo_string39         # DW_AT_name
	.byte	32                      # DW_AT_byte_size
	.byte	5                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
	.byte	29                      # Abbrev [29] 0x1ff2:0xd DW_TAG_member
	.long	.Linfo_string31         # DW_AT_name
	.long	8244                    # DW_AT_type
	.byte	5                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	29                      # Abbrev [29] 0x1fff:0xd DW_TAG_member
	.long	.Linfo_string32         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	5                       # DW_AT_decl_file
	.byte	21                      # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	29                      # Abbrev [29] 0x200c:0xd DW_TAG_member
	.long	.Linfo_string33         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	5                       # DW_AT_decl_file
	.byte	22                      # DW_AT_decl_line
	.byte	12                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	29                      # Abbrev [29] 0x2019:0xd DW_TAG_member
	.long	.Linfo_string34         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	5                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
	.byte	16                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	29                      # Abbrev [29] 0x2026:0xd DW_TAG_member
	.long	.Linfo_string35         # DW_AT_name
	.long	8249                    # DW_AT_type
	.byte	5                       # DW_AT_decl_file
	.byte	24                      # DW_AT_decl_line
	.byte	24                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	0                       # End Of Children Mark
	.byte	27                      # Abbrev [27] 0x2034:0x5 DW_TAG_pointer_type
	.long	239                     # DW_AT_type
	.byte	27                      # Abbrev [27] 0x2039:0x5 DW_TAG_pointer_type
	.long	8254                    # DW_AT_type
	.byte	3                       # Abbrev [3] 0x203e:0xb DW_TAG_typedef
	.long	8265                    # DW_AT_type
	.long	.Linfo_string41         # DW_AT_name
	.byte	5                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.byte	28                      # Abbrev [28] 0x2049:0x30 DW_TAG_structure_type
	.long	.Linfo_string41         # DW_AT_name
	.byte	176                     # DW_AT_byte_size
	.byte	5                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.byte	29                      # Abbrev [29] 0x2051:0xd DW_TAG_member
	.long	.Linfo_string31         # DW_AT_name
	.long	8244                    # DW_AT_type
	.byte	5                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	29                      # Abbrev [29] 0x205e:0xd DW_TAG_member
	.long	.Linfo_string36         # DW_AT_name
	.long	8313                    # DW_AT_type
	.byte	5                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	29                      # Abbrev [29] 0x206b:0xd DW_TAG_member
	.long	.Linfo_string38         # DW_AT_name
	.long	8320                    # DW_AT_type
	.byte	5                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.byte	16                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	0                       # End Of Children Mark
	.byte	4                       # Abbrev [4] 0x2079:0x7 DW_TAG_base_type
	.long	.Linfo_string37         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	30                      # Abbrev [30] 0x2080:0xc DW_TAG_array_type
	.long	8332                    # DW_AT_type
	.byte	31                      # Abbrev [31] 0x2085:0x6 DW_TAG_subrange_type
	.long	8348                    # DW_AT_type
	.byte	19                      # DW_AT_upper_bound
	.byte	0                       # End Of Children Mark
	.byte	27                      # Abbrev [27] 0x208c:0x5 DW_TAG_pointer_type
	.long	8337                    # DW_AT_type
	.byte	3                       # Abbrev [3] 0x2091:0xb DW_TAG_typedef
	.long	8170                    # DW_AT_type
	.long	.Linfo_string39         # DW_AT_name
	.byte	5                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.byte	32                      # Abbrev [32] 0x209c:0x7 DW_TAG_base_type
	.long	.Linfo_string40         # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	33                      # Abbrev [33] 0x20a3:0x1 DW_TAG_pointer_type
	.byte	34                      # Abbrev [34] 0x20a4:0x5 DW_TAG_const_type
	.long	63                      # DW_AT_type
	.byte	27                      # Abbrev [27] 0x20a9:0x5 DW_TAG_pointer_type
	.long	8366                    # DW_AT_type
	.byte	34                      # Abbrev [34] 0x20ae:0x5 DW_TAG_const_type
	.long	8159                    # DW_AT_type
	.byte	30                      # Abbrev [30] 0x20b3:0xb DW_TAG_array_type
	.long	8382                    # DW_AT_type
	.byte	35                      # Abbrev [35] 0x20b8:0x5 DW_TAG_subrange_type
	.long	8348                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	3                       # Abbrev [3] 0x20be:0xb DW_TAG_typedef
	.long	8393                    # DW_AT_type
	.long	.Linfo_string88         # DW_AT_name
	.byte	6                       # DW_AT_decl_file
	.byte	60                      # DW_AT_decl_line
	.byte	4                       # Abbrev [4] 0x20c9:0x7 DW_TAG_base_type
	.long	.Linfo_string87         # DW_AT_name
	.byte	7                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	27                      # Abbrev [27] 0x20d0:0x5 DW_TAG_pointer_type
	.long	8405                    # DW_AT_type
	.byte	28                      # Abbrev [28] 0x20d5:0x30 DW_TAG_structure_type
	.long	.Linfo_string91         # DW_AT_name
	.byte	16                      # DW_AT_byte_size
	.byte	3                       # DW_AT_decl_file
	.byte	226                     # DW_AT_decl_line
	.byte	29                      # Abbrev [29] 0x20dd:0xd DW_TAG_member
	.long	.Linfo_string78         # DW_AT_name
	.long	8154                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.byte	228                     # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	29                      # Abbrev [29] 0x20ea:0xd DW_TAG_member
	.long	.Linfo_string84         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.byte	229                     # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	29                      # Abbrev [29] 0x20f7:0xd DW_TAG_member
	.long	.Linfo_string90         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.byte	230                     # DW_AT_decl_line
	.byte	12                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	0                       # End Of Children Mark
	.byte	27                      # Abbrev [27] 0x2105:0x5 DW_TAG_pointer_type
	.long	8458                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0x210a:0x42 DW_TAG_structure_type
	.long	.Linfo_string98         # DW_AT_name
	.byte	24                      # DW_AT_byte_size
	.byte	3                       # DW_AT_decl_file
	.short	441                     # DW_AT_decl_line
	.byte	37                      # Abbrev [37] 0x2113:0xe DW_TAG_member
	.long	.Linfo_string78         # DW_AT_name
	.long	8154                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	443                     # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2121:0xe DW_TAG_member
	.long	.Linfo_string97         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	444                     # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x212f:0xe DW_TAG_member
	.long	.Linfo_string84         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	445                     # DW_AT_decl_line
	.byte	12                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x213d:0xe DW_TAG_member
	.long	.Linfo_string90         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	446                     # DW_AT_decl_line
	.byte	16                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	0                       # End Of Children Mark
	.byte	3                       # Abbrev [3] 0x214c:0xb DW_TAG_typedef
	.long	8535                    # DW_AT_type
	.long	.Linfo_string101        # DW_AT_name
	.byte	7                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.byte	38                      # Abbrev [38] 0x2157:0xc DW_TAG_array_type
                                        # DW_AT_GNU_vector
	.long	8547                    # DW_AT_type
	.byte	31                      # Abbrev [31] 0x215c:0x6 DW_TAG_subrange_type
	.long	8348                    # DW_AT_type
	.byte	1                       # DW_AT_upper_bound
	.byte	0                       # End Of Children Mark
	.byte	4                       # Abbrev [4] 0x2163:0x7 DW_TAG_base_type
	.long	.Linfo_string100        # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	34                      # Abbrev [34] 0x216a:0x5 DW_TAG_const_type
	.long	239                     # DW_AT_type
	.byte	27                      # Abbrev [27] 0x216f:0x5 DW_TAG_pointer_type
	.long	8564                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0x2174:0x88 DW_TAG_structure_type
	.long	.Linfo_string110        # DW_AT_name
	.byte	56                      # DW_AT_byte_size
	.byte	3                       # DW_AT_decl_file
	.short	524                     # DW_AT_decl_line
	.byte	37                      # Abbrev [37] 0x217d:0xe DW_TAG_member
	.long	.Linfo_string78         # DW_AT_name
	.long	8154                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	526                     # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x218b:0xe DW_TAG_member
	.long	.Linfo_string104        # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	527                     # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2199:0xe DW_TAG_member
	.long	.Linfo_string105        # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	528                     # DW_AT_decl_line
	.byte	12                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x21a7:0xe DW_TAG_member
	.long	.Linfo_string84         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	529                     # DW_AT_decl_line
	.byte	16                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x21b5:0xe DW_TAG_member
	.long	.Linfo_string90         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	530                     # DW_AT_decl_line
	.byte	20                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x21c3:0xe DW_TAG_member
	.long	.Linfo_string106        # DW_AT_name
	.long	8244                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	531                     # DW_AT_decl_line
	.byte	24                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x21d1:0xe DW_TAG_member
	.long	.Linfo_string107        # DW_AT_name
	.long	8244                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	532                     # DW_AT_decl_line
	.byte	32                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x21df:0xe DW_TAG_member
	.long	.Linfo_string108        # DW_AT_name
	.long	8244                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	533                     # DW_AT_decl_line
	.byte	40                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x21ed:0xe DW_TAG_member
	.long	.Linfo_string109        # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	534                     # DW_AT_decl_line
	.byte	48                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	0                       # End Of Children Mark
	.byte	30                      # Abbrev [30] 0x21fc:0xc DW_TAG_array_type
	.long	239                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x2201:0x6 DW_TAG_subrange_type
	.long	8348                    # DW_AT_type
	.byte	3                       # DW_AT_upper_bound
	.byte	0                       # End Of Children Mark
	.byte	27                      # Abbrev [27] 0x2208:0x5 DW_TAG_pointer_type
	.long	8717                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0x220d:0x42 DW_TAG_structure_type
	.long	.Linfo_string124        # DW_AT_name
	.byte	24                      # DW_AT_byte_size
	.byte	3                       # DW_AT_decl_file
	.short	696                     # DW_AT_decl_line
	.byte	37                      # Abbrev [37] 0x2216:0xe DW_TAG_member
	.long	.Linfo_string78         # DW_AT_name
	.long	8154                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	698                     # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2224:0xe DW_TAG_member
	.long	.Linfo_string123        # DW_AT_name
	.long	8154                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	699                     # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2232:0xe DW_TAG_member
	.long	.Linfo_string84         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	700                     # DW_AT_decl_line
	.byte	16                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2240:0xe DW_TAG_member
	.long	.Linfo_string90         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	701                     # DW_AT_decl_line
	.byte	20                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	0                       # End Of Children Mark
	.byte	27                      # Abbrev [27] 0x224f:0x5 DW_TAG_pointer_type
	.long	8788                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0x2254:0x42 DW_TAG_structure_type
	.long	.Linfo_string129        # DW_AT_name
	.byte	24                      # DW_AT_byte_size
	.byte	3                       # DW_AT_decl_file
	.short	775                     # DW_AT_decl_line
	.byte	37                      # Abbrev [37] 0x225d:0xe DW_TAG_member
	.long	.Linfo_string123        # DW_AT_name
	.long	8154                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	777                     # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x226b:0xe DW_TAG_member
	.long	.Linfo_string78         # DW_AT_name
	.long	8154                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	778                     # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2279:0xe DW_TAG_member
	.long	.Linfo_string90         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	779                     # DW_AT_decl_line
	.byte	16                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2287:0xe DW_TAG_member
	.long	.Linfo_string84         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	780                     # DW_AT_decl_line
	.byte	20                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	0                       # End Of Children Mark
	.byte	27                      # Abbrev [27] 0x2296:0x5 DW_TAG_pointer_type
	.long	8859                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0x229b:0x42 DW_TAG_structure_type
	.long	.Linfo_string130        # DW_AT_name
	.byte	24                      # DW_AT_byte_size
	.byte	3                       # DW_AT_decl_file
	.short	856                     # DW_AT_decl_line
	.byte	37                      # Abbrev [37] 0x22a4:0xe DW_TAG_member
	.long	.Linfo_string78         # DW_AT_name
	.long	8154                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	858                     # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x22b2:0xe DW_TAG_member
	.long	.Linfo_string123        # DW_AT_name
	.long	8154                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	859                     # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x22c0:0xe DW_TAG_member
	.long	.Linfo_string90         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	860                     # DW_AT_decl_line
	.byte	16                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x22ce:0xe DW_TAG_member
	.long	.Linfo_string84         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	861                     # DW_AT_decl_line
	.byte	20                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	0                       # End Of Children Mark
	.byte	27                      # Abbrev [27] 0x22dd:0x5 DW_TAG_pointer_type
	.long	8930                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0x22e2:0x96 DW_TAG_structure_type
	.long	.Linfo_string144        # DW_AT_name
	.byte	64                      # DW_AT_byte_size
	.byte	3                       # DW_AT_decl_file
	.short	968                     # DW_AT_decl_line
	.byte	37                      # Abbrev [37] 0x22eb:0xe DW_TAG_member
	.long	.Linfo_string78         # DW_AT_name
	.long	8154                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	970                     # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x22f9:0xe DW_TAG_member
	.long	.Linfo_string123        # DW_AT_name
	.long	8154                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	971                     # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2307:0xe DW_TAG_member
	.long	.Linfo_string106        # DW_AT_name
	.long	8244                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	972                     # DW_AT_decl_line
	.byte	16                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2315:0xe DW_TAG_member
	.long	.Linfo_string107        # DW_AT_name
	.long	8244                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	973                     # DW_AT_decl_line
	.byte	24                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2323:0xe DW_TAG_member
	.long	.Linfo_string108        # DW_AT_name
	.long	8244                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	974                     # DW_AT_decl_line
	.byte	32                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2331:0xe DW_TAG_member
	.long	.Linfo_string142        # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	975                     # DW_AT_decl_line
	.byte	40                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x233f:0xe DW_TAG_member
	.long	.Linfo_string90         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	976                     # DW_AT_decl_line
	.byte	44                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x234d:0xe DW_TAG_member
	.long	.Linfo_string84         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	977                     # DW_AT_decl_line
	.byte	48                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x235b:0xe DW_TAG_member
	.long	.Linfo_string109        # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	978                     # DW_AT_decl_line
	.byte	52                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2369:0xe DW_TAG_member
	.long	.Linfo_string143        # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	979                     # DW_AT_decl_line
	.byte	56                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	0                       # End Of Children Mark
	.byte	27                      # Abbrev [27] 0x2378:0x5 DW_TAG_pointer_type
	.long	9085                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0x237d:0x88 DW_TAG_structure_type
	.long	.Linfo_string145        # DW_AT_name
	.byte	56                      # DW_AT_byte_size
	.byte	3                       # DW_AT_decl_file
	.short	1138                    # DW_AT_decl_line
	.byte	37                      # Abbrev [37] 0x2386:0xe DW_TAG_member
	.long	.Linfo_string78         # DW_AT_name
	.long	8154                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1140                    # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2394:0xe DW_TAG_member
	.long	.Linfo_string123        # DW_AT_name
	.long	8154                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1141                    # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x23a2:0xe DW_TAG_member
	.long	.Linfo_string106        # DW_AT_name
	.long	8244                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1142                    # DW_AT_decl_line
	.byte	16                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x23b0:0xe DW_TAG_member
	.long	.Linfo_string107        # DW_AT_name
	.long	8244                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1143                    # DW_AT_decl_line
	.byte	24                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x23be:0xe DW_TAG_member
	.long	.Linfo_string108        # DW_AT_name
	.long	8244                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1144                    # DW_AT_decl_line
	.byte	32                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x23cc:0xe DW_TAG_member
	.long	.Linfo_string142        # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1145                    # DW_AT_decl_line
	.byte	40                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x23da:0xe DW_TAG_member
	.long	.Linfo_string90         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1146                    # DW_AT_decl_line
	.byte	44                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x23e8:0xe DW_TAG_member
	.long	.Linfo_string84         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1147                    # DW_AT_decl_line
	.byte	48                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x23f6:0xe DW_TAG_member
	.long	.Linfo_string109        # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1148                    # DW_AT_decl_line
	.byte	52                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	0                       # End Of Children Mark
	.byte	27                      # Abbrev [27] 0x2405:0x5 DW_TAG_pointer_type
	.long	9226                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0x240a:0x96 DW_TAG_structure_type
	.long	.Linfo_string149        # DW_AT_name
	.byte	64                      # DW_AT_byte_size
	.byte	3                       # DW_AT_decl_file
	.short	1260                    # DW_AT_decl_line
	.byte	37                      # Abbrev [37] 0x2413:0xe DW_TAG_member
	.long	.Linfo_string146        # DW_AT_name
	.long	8154                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1262                    # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2421:0xe DW_TAG_member
	.long	.Linfo_string147        # DW_AT_name
	.long	8154                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1263                    # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x242f:0xe DW_TAG_member
	.long	.Linfo_string123        # DW_AT_name
	.long	8154                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1264                    # DW_AT_decl_line
	.byte	16                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x243d:0xe DW_TAG_member
	.long	.Linfo_string106        # DW_AT_name
	.long	8244                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1265                    # DW_AT_decl_line
	.byte	24                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x244b:0xe DW_TAG_member
	.long	.Linfo_string107        # DW_AT_name
	.long	8244                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1266                    # DW_AT_decl_line
	.byte	32                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2459:0xe DW_TAG_member
	.long	.Linfo_string108        # DW_AT_name
	.long	8244                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1267                    # DW_AT_decl_line
	.byte	40                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2467:0xe DW_TAG_member
	.long	.Linfo_string90         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1268                    # DW_AT_decl_line
	.byte	48                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2475:0xe DW_TAG_member
	.long	.Linfo_string84         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1269                    # DW_AT_decl_line
	.byte	52                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2483:0xe DW_TAG_member
	.long	.Linfo_string109        # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1270                    # DW_AT_decl_line
	.byte	56                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2491:0xe DW_TAG_member
	.long	.Linfo_string148        # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1271                    # DW_AT_decl_line
	.byte	60                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	0                       # End Of Children Mark
	.byte	27                      # Abbrev [27] 0x24a0:0x5 DW_TAG_pointer_type
	.long	9381                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0x24a5:0x88 DW_TAG_structure_type
	.long	.Linfo_string162        # DW_AT_name
	.byte	64                      # DW_AT_byte_size
	.byte	3                       # DW_AT_decl_file
	.short	1479                    # DW_AT_decl_line
	.byte	37                      # Abbrev [37] 0x24ae:0xe DW_TAG_member
	.long	.Linfo_string146        # DW_AT_name
	.long	8154                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1481                    # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x24bc:0xe DW_TAG_member
	.long	.Linfo_string147        # DW_AT_name
	.long	8154                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1482                    # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x24ca:0xe DW_TAG_member
	.long	.Linfo_string123        # DW_AT_name
	.long	8154                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1483                    # DW_AT_decl_line
	.byte	16                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x24d8:0xe DW_TAG_member
	.long	.Linfo_string106        # DW_AT_name
	.long	8244                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1484                    # DW_AT_decl_line
	.byte	24                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x24e6:0xe DW_TAG_member
	.long	.Linfo_string107        # DW_AT_name
	.long	8244                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1485                    # DW_AT_decl_line
	.byte	32                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x24f4:0xe DW_TAG_member
	.long	.Linfo_string108        # DW_AT_name
	.long	8244                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1486                    # DW_AT_decl_line
	.byte	40                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2502:0xe DW_TAG_member
	.long	.Linfo_string90         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1487                    # DW_AT_decl_line
	.byte	48                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2510:0xe DW_TAG_member
	.long	.Linfo_string84         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1488                    # DW_AT_decl_line
	.byte	52                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x251e:0xe DW_TAG_member
	.long	.Linfo_string109        # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1489                    # DW_AT_decl_line
	.byte	56                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	0                       # End Of Children Mark
	.byte	30                      # Abbrev [30] 0x252d:0xb DW_TAG_array_type
	.long	239                     # DW_AT_type
	.byte	35                      # Abbrev [35] 0x2532:0x5 DW_TAG_subrange_type
	.long	8348                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	27                      # Abbrev [27] 0x2538:0x5 DW_TAG_pointer_type
	.long	9533                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0x253d:0x5e DW_TAG_structure_type
	.long	.Linfo_string174        # DW_AT_name
	.byte	32                      # DW_AT_byte_size
	.byte	3                       # DW_AT_decl_file
	.short	1879                    # DW_AT_decl_line
	.byte	37                      # Abbrev [37] 0x2546:0xe DW_TAG_member
	.long	.Linfo_string78         # DW_AT_name
	.long	8154                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1881                    # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2554:0xe DW_TAG_member
	.long	.Linfo_string125        # DW_AT_name
	.long	8244                    # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1882                    # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2562:0xe DW_TAG_member
	.long	.Linfo_string90         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1883                    # DW_AT_decl_line
	.byte	16                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x2570:0xe DW_TAG_member
	.long	.Linfo_string84         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1884                    # DW_AT_decl_line
	.byte	20                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x257e:0xe DW_TAG_member
	.long	.Linfo_string109        # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1885                    # DW_AT_decl_line
	.byte	24                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	37                      # Abbrev [37] 0x258c:0xe DW_TAG_member
	.long	.Linfo_string97         # DW_AT_name
	.long	239                     # DW_AT_type
	.byte	3                       # DW_AT_decl_file
	.short	1886                    # DW_AT_decl_line
	.byte	28                      # DW_AT_data_member_location
	.byte	1                       # DW_AT_accessibility
                                        # DW_ACCESS_public
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
.L.debug_info_end0:
	.section	.debug_abbrev,"",@progbits
	.byte	1                       # Abbreviation Code
	.byte	17                      # DW_TAG_compile_unit
	.byte	1                       # DW_CHILDREN_yes
	.byte	37                      # DW_AT_producer
	.byte	14                      # DW_FORM_strp
	.byte	19                      # DW_AT_language
	.byte	5                       # DW_FORM_data2
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	16                      # DW_AT_stmt_list
	.byte	23                      # DW_FORM_sec_offset
	.byte	27                      # DW_AT_comp_dir
	.byte	14                      # DW_FORM_strp
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	2                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	3                       # Abbreviation Code
	.byte	22                      # DW_TAG_typedef
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	4                       # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	5                       # Abbreviation Code
	.byte	4                       # DW_TAG_enumeration_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	6                       # Abbreviation Code
	.byte	40                      # DW_TAG_enumerator
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	7                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.ascii	"\347\177"              # DW_AT_APPLE_omit_frame_ptr
	.byte	25                      # DW_FORM_flag_present
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	50                      # DW_AT_accessibility
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	10                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	85                      # DW_AT_ranges
	.byte	23                      # DW_FORM_sec_offset
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	13                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	14                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.ascii	"\347\177"              # DW_AT_APPLE_omit_frame_ptr
	.byte	25                      # DW_FORM_flag_present
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	50                      # DW_AT_accessibility
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	15                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	16                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.ascii	"\347\177"              # DW_AT_APPLE_omit_frame_ptr
	.byte	25                      # DW_FORM_flag_present
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	50                      # DW_AT_accessibility
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	17                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.ascii	"\347\177"              # DW_AT_APPLE_omit_frame_ptr
	.byte	25                      # DW_FORM_flag_present
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	50                      # DW_AT_accessibility
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	18                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	19                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	0                       # DW_CHILDREN_no
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.ascii	"\347\177"              # DW_AT_APPLE_omit_frame_ptr
	.byte	25                      # DW_FORM_flag_present
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	50                      # DW_AT_accessibility
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	20                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	21                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.ascii	"\347\177"              # DW_AT_APPLE_omit_frame_ptr
	.byte	25                      # DW_FORM_flag_present
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	50                      # DW_AT_accessibility
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	22                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	23                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	15                      # DW_FORM_udata
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	24                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	25                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.ascii	"\347\177"              # DW_AT_APPLE_omit_frame_ptr
	.byte	25                      # DW_FORM_flag_present
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	50                      # DW_AT_accessibility
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	26                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	15                      # DW_FORM_udata
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	27                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	28                      # Abbreviation Code
	.byte	19                      # DW_TAG_structure_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	29                      # Abbreviation Code
	.byte	13                      # DW_TAG_member
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	56                      # DW_AT_data_member_location
	.byte	11                      # DW_FORM_data1
	.byte	50                      # DW_AT_accessibility
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	30                      # Abbreviation Code
	.byte	1                       # DW_TAG_array_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	31                      # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	47                      # DW_AT_upper_bound
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	32                      # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	33                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	34                      # Abbreviation Code
	.byte	38                      # DW_TAG_const_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	35                      # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	36                      # Abbreviation Code
	.byte	19                      # DW_TAG_structure_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	37                      # Abbreviation Code
	.byte	13                      # DW_TAG_member
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	56                      # DW_AT_data_member_location
	.byte	11                      # DW_FORM_data1
	.byte	50                      # DW_AT_accessibility
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	38                      # Abbreviation Code
	.byte	1                       # DW_TAG_array_type
	.byte	1                       # DW_CHILDREN_yes
	.ascii	"\207B"                 # DW_AT_GNU_vector
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
.Lset124 = .Ltmp27-.Lfunc_begin0
	.quad	.Lset124
.Lset125 = .Ltmp32-.Lfunc_begin0
	.quad	.Lset125
.Lset126 = .Ltmp34-.Lfunc_begin0
	.quad	.Lset126
.Lset127 = .Ltmp36-.Lfunc_begin0
	.quad	.Lset127
	.quad	0
	.quad	0
.Ldebug_ranges1:
.Lset128 = .Ltmp54-.Lfunc_begin0
	.quad	.Lset128
.Lset129 = .Ltmp56-.Lfunc_begin0
	.quad	.Lset129
.Lset130 = .Ltmp57-.Lfunc_begin0
	.quad	.Lset130
.Lset131 = .Ltmp61-.Lfunc_begin0
	.quad	.Lset131
	.quad	0
	.quad	0
.Ldebug_ranges2:
.Lset132 = .Ltmp69-.Lfunc_begin0
	.quad	.Lset132
.Lset133 = .Ltmp71-.Lfunc_begin0
	.quad	.Lset133
.Lset134 = .Ltmp73-.Lfunc_begin0
	.quad	.Lset134
.Lset135 = .Ltmp76-.Lfunc_begin0
	.quad	.Lset135
	.quad	0
	.quad	0
.Ldebug_ranges3:
.Lset136 = .Ltmp95-.Lfunc_begin0
	.quad	.Lset136
.Lset137 = .Ltmp96-.Lfunc_begin0
	.quad	.Lset137
.Lset138 = .Ltmp98-.Lfunc_begin0
	.quad	.Lset138
.Lset139 = .Ltmp100-.Lfunc_begin0
	.quad	.Lset139
	.quad	0
	.quad	0
.Ldebug_ranges4:
.Lset140 = .Ltmp124-.Lfunc_begin0
	.quad	.Lset140
.Lset141 = .Ltmp126-.Lfunc_begin0
	.quad	.Lset141
.Lset142 = .Ltmp127-.Lfunc_begin0
	.quad	.Lset142
.Lset143 = .Ltmp131-.Lfunc_begin0
	.quad	.Lset143
	.quad	0
	.quad	0
.Ldebug_ranges5:
.Lset144 = .Ltmp186-.Lfunc_begin0
	.quad	.Lset144
.Lset145 = .Ltmp187-.Lfunc_begin0
	.quad	.Lset145
.Lset146 = .Ltmp211-.Lfunc_begin0
	.quad	.Lset146
.Lset147 = .Ltmp212-.Lfunc_begin0
	.quad	.Lset147
	.quad	0
	.quad	0
.Ldebug_ranges6:
.Lset148 = .Ltmp186-.Lfunc_begin0
	.quad	.Lset148
.Lset149 = .Ltmp188-.Lfunc_begin0
	.quad	.Lset149
.Lset150 = .Ltmp211-.Lfunc_begin0
	.quad	.Lset150
.Lset151 = .Ltmp212-.Lfunc_begin0
	.quad	.Lset151
	.quad	0
	.quad	0
.Ldebug_ranges7:
.Lset152 = .Ltmp191-.Lfunc_begin0
	.quad	.Lset152
.Lset153 = .Ltmp192-.Lfunc_begin0
	.quad	.Lset153
.Lset154 = .Ltmp194-.Lfunc_begin0
	.quad	.Lset154
.Lset155 = .Ltmp196-.Lfunc_begin0
	.quad	.Lset155
	.quad	0
	.quad	0
.Ldebug_ranges8:
.Lset156 = .Ltmp216-.Lfunc_begin0
	.quad	.Lset156
.Lset157 = .Ltmp218-.Lfunc_begin0
	.quad	.Lset157
.Lset158 = .Ltmp219-.Lfunc_begin0
	.quad	.Lset158
.Lset159 = .Ltmp222-.Lfunc_begin0
	.quad	.Lset159
	.quad	0
	.quad	0
.Ldebug_ranges9:
.Lset160 = .Ltmp241-.Lfunc_begin0
	.quad	.Lset160
.Lset161 = .Ltmp242-.Lfunc_begin0
	.quad	.Lset161
.Lset162 = .Ltmp244-.Lfunc_begin0
	.quad	.Lset162
.Lset163 = .Ltmp246-.Lfunc_begin0
	.quad	.Lset163
	.quad	0
	.quad	0
.Ldebug_ranges10:
.Lset164 = .Ltmp280-.Lfunc_begin0
	.quad	.Lset164
.Lset165 = .Ltmp282-.Lfunc_begin0
	.quad	.Lset165
.Lset166 = .Ltmp285-.Lfunc_begin0
	.quad	.Lset166
.Lset167 = .Ltmp293-.Lfunc_begin0
	.quad	.Lset167
	.quad	0
	.quad	0
.Ldebug_ranges11:
.Lset168 = .Ltmp321-.Lfunc_begin0
	.quad	.Lset168
.Lset169 = .Ltmp322-.Lfunc_begin0
	.quad	.Lset169
.Lset170 = .Ltmp324-.Lfunc_begin0
	.quad	.Lset170
.Lset171 = .Ltmp326-.Lfunc_begin0
	.quad	.Lset171
	.quad	0
	.quad	0
.Ldebug_ranges12:
.Lset172 = .Ltmp343-.Lfunc_begin0
	.quad	.Lset172
.Lset173 = .Ltmp344-.Lfunc_begin0
	.quad	.Lset173
.Lset174 = .Ltmp345-.Lfunc_begin0
	.quad	.Lset174
.Lset175 = .Ltmp347-.Lfunc_begin0
	.quad	.Lset175
.Lset176 = .Ltmp349-.Lfunc_begin0
	.quad	.Lset176
.Lset177 = .Ltmp354-.Lfunc_begin0
	.quad	.Lset177
	.quad	0
	.quad	0
.Ldebug_ranges13:
.Lset178 = .Ltmp387-.Lfunc_begin0
	.quad	.Lset178
.Lset179 = .Ltmp388-.Lfunc_begin0
	.quad	.Lset179
.Lset180 = .Ltmp390-.Lfunc_begin0
	.quad	.Lset180
.Lset181 = .Ltmp392-.Lfunc_begin0
	.quad	.Lset181
	.quad	0
	.quad	0
.Ldebug_ranges14:
.Lset182 = .Ltmp422-.Lfunc_begin0
	.quad	.Lset182
.Lset183 = .Ltmp423-.Lfunc_begin0
	.quad	.Lset183
.Lset184 = .Ltmp427-.Lfunc_begin0
	.quad	.Lset184
.Lset185 = .Ltmp429-.Lfunc_begin0
	.quad	.Lset185
	.quad	0
	.quad	0
.Ldebug_ranges15:
.Lset186 = .Ltmp422-.Lfunc_begin0
	.quad	.Lset186
.Lset187 = .Ltmp424-.Lfunc_begin0
	.quad	.Lset187
.Lset188 = .Ltmp427-.Lfunc_begin0
	.quad	.Lset188
.Lset189 = .Ltmp433-.Lfunc_begin0
	.quad	.Lset189
	.quad	0
	.quad	0
.Ldebug_ranges16:
.Lset190 = .Lfunc_begin20-.Lfunc_begin0
	.quad	.Lset190
.Lset191 = .Ltmp417-.Lfunc_begin0
	.quad	.Lset191
.Lset192 = .Ltmp418-.Lfunc_begin0
	.quad	.Lset192
.Lset193 = .Ltmp419-.Lfunc_begin0
	.quad	.Lset193
.Lset194 = .Ltmp422-.Lfunc_begin0
	.quad	.Lset194
.Lset195 = .Ltmp435-.Lfunc_begin0
	.quad	.Lset195
	.quad	0
	.quad	0
.Ldebug_ranges17:
.Lset196 = .Ltmp453-.Lfunc_begin0
	.quad	.Lset196
.Lset197 = .Ltmp454-.Lfunc_begin0
	.quad	.Lset197
.Lset198 = .Ltmp456-.Lfunc_begin0
	.quad	.Lset198
.Lset199 = .Ltmp458-.Lfunc_begin0
	.quad	.Lset199
	.quad	0
	.quad	0
.Ldebug_ranges18:
.Lset200 = .Ltmp492-.Lfunc_begin0
	.quad	.Lset200
.Lset201 = .Ltmp493-.Lfunc_begin0
	.quad	.Lset201
.Lset202 = .Ltmp498-.Lfunc_begin0
	.quad	.Lset202
.Lset203 = .Ltmp503-.Lfunc_begin0
	.quad	.Lset203
	.quad	0
	.quad	0
.Ldebug_ranges19:
.Lset204 = .Ltmp492-.Lfunc_begin0
	.quad	.Lset204
.Lset205 = .Ltmp493-.Lfunc_begin0
	.quad	.Lset205
.Lset206 = .Ltmp497-.Lfunc_begin0
	.quad	.Lset206
.Lset207 = .Ltmp504-.Lfunc_begin0
	.quad	.Lset207
	.quad	0
	.quad	0
.Ldebug_ranges20:
.Lset208 = .Ltmp492-.Lfunc_begin0
	.quad	.Lset208
.Lset209 = .Ltmp493-.Lfunc_begin0
	.quad	.Lset209
.Lset210 = .Ltmp497-.Lfunc_begin0
	.quad	.Lset210
.Lset211 = .Ltmp504-.Lfunc_begin0
	.quad	.Lset211
.Lset212 = .Ltmp505-.Lfunc_begin0
	.quad	.Lset212
.Lset213 = .Ltmp506-.Lfunc_begin0
	.quad	.Lset213
	.quad	0
	.quad	0
.Ldebug_ranges21:
.Lset214 = .Lfunc_begin22-.Lfunc_begin0
	.quad	.Lset214
.Lset215 = .Ltmp488-.Lfunc_begin0
	.quad	.Lset215
.Lset216 = .Ltmp492-.Lfunc_begin0
	.quad	.Lset216
.Lset217 = .Ltmp507-.Lfunc_begin0
	.quad	.Lset217
	.quad	0
	.quad	0
.Ldebug_ranges22:
.Lset218 = .Ltmp534-.Lfunc_begin0
	.quad	.Lset218
.Lset219 = .Ltmp535-.Lfunc_begin0
	.quad	.Lset219
.Lset220 = .Ltmp537-.Lfunc_begin0
	.quad	.Lset220
.Lset221 = .Ltmp539-.Lfunc_begin0
	.quad	.Lset221
	.quad	0
	.quad	0
.Ldebug_ranges23:
.Lset222 = .Ltmp551-.Lfunc_begin0
	.quad	.Lset222
.Lset223 = .Ltmp563-.Lfunc_begin0
	.quad	.Lset223
.Lset224 = .Ltmp568-.Lfunc_begin0
	.quad	.Lset224
.Lset225 = .Ltmp580-.Lfunc_begin0
	.quad	.Lset225
	.quad	0
	.quad	0
.Ldebug_ranges24:
.Lset226 = .Ltmp632-.Lfunc_begin0
	.quad	.Lset226
.Lset227 = .Ltmp633-.Lfunc_begin0
	.quad	.Lset227
.Lset228 = .Ltmp639-.Lfunc_begin0
	.quad	.Lset228
.Lset229 = .Ltmp641-.Lfunc_begin0
	.quad	.Lset229
	.quad	0
	.quad	0
.Ldebug_ranges25:
.Lset230 = .Ltmp632-.Lfunc_begin0
	.quad	.Lset230
.Lset231 = .Ltmp634-.Lfunc_begin0
	.quad	.Lset231
.Lset232 = .Ltmp639-.Lfunc_begin0
	.quad	.Lset232
.Lset233 = .Ltmp646-.Lfunc_begin0
	.quad	.Lset233
	.quad	0
	.quad	0
.Ldebug_ranges26:
.Lset234 = .Ltmp606-.Lfunc_begin0
	.quad	.Lset234
.Lset235 = .Ltmp607-.Lfunc_begin0
	.quad	.Lset235
.Lset236 = .Ltmp632-.Lfunc_begin0
	.quad	.Lset236
.Lset237 = .Ltmp648-.Lfunc_begin0
	.quad	.Lset237
	.quad	0
	.quad	0
.Ldebug_ranges27:
.Lset238 = .Ltmp606-.Lfunc_begin0
	.quad	.Lset238
.Lset239 = .Ltmp607-.Lfunc_begin0
	.quad	.Lset239
.Lset240 = .Ltmp632-.Lfunc_begin0
	.quad	.Lset240
.Lset241 = .Ltmp648-.Lfunc_begin0
	.quad	.Lset241
	.quad	0
	.quad	0
.Ldebug_ranges28:
.Lset242 = .Ltmp610-.Lfunc_begin0
	.quad	.Lset242
.Lset243 = .Ltmp611-.Lfunc_begin0
	.quad	.Lset243
.Lset244 = .Ltmp617-.Lfunc_begin0
	.quad	.Lset244
.Lset245 = .Ltmp624-.Lfunc_begin0
	.quad	.Lset245
	.quad	0
	.quad	0
.Ldebug_ranges29:
.Lset246 = .Ltmp610-.Lfunc_begin0
	.quad	.Lset246
.Lset247 = .Ltmp612-.Lfunc_begin0
	.quad	.Lset247
.Lset248 = .Ltmp617-.Lfunc_begin0
	.quad	.Lset248
.Lset249 = .Ltmp629-.Lfunc_begin0
	.quad	.Lset249
	.quad	0
	.quad	0
.Ldebug_ranges30:
.Lset250 = .Ltmp610-.Lfunc_begin0
	.quad	.Lset250
.Lset251 = .Ltmp631-.Lfunc_begin0
	.quad	.Lset251
.Lset252 = .Ltmp649-.Lfunc_begin0
	.quad	.Lset252
.Lset253 = .Ltmp650-.Lfunc_begin0
	.quad	.Lset253
	.quad	0
	.quad	0
.Ldebug_ranges31:
.Lset254 = .Ltmp673-.Lfunc_begin0
	.quad	.Lset254
.Lset255 = .Ltmp674-.Lfunc_begin0
	.quad	.Lset255
.Lset256 = .Ltmp676-.Lfunc_begin0
	.quad	.Lset256
.Lset257 = .Ltmp678-.Lfunc_begin0
	.quad	.Lset257
	.quad	0
	.quad	0
.Ldebug_ranges32:
.Lset258 = .Ltmp724-.Lfunc_begin0
	.quad	.Lset258
.Lset259 = .Ltmp725-.Lfunc_begin0
	.quad	.Lset259
.Lset260 = .Ltmp731-.Lfunc_begin0
	.quad	.Lset260
.Lset261 = .Ltmp738-.Lfunc_begin0
	.quad	.Lset261
	.quad	0
	.quad	0
.Ldebug_ranges33:
.Lset262 = .Ltmp724-.Lfunc_begin0
	.quad	.Lset262
.Lset263 = .Ltmp726-.Lfunc_begin0
	.quad	.Lset263
.Lset264 = .Ltmp731-.Lfunc_begin0
	.quad	.Lset264
.Lset265 = .Ltmp743-.Lfunc_begin0
	.quad	.Lset265
	.quad	0
	.quad	0
.Ldebug_ranges34:
.Lset266 = .Lfunc_begin27-.Lfunc_begin0
	.quad	.Lset266
.Lset267 = .Ltmp718-.Lfunc_begin0
	.quad	.Lset267
.Lset268 = .Ltmp719-.Lfunc_begin0
	.quad	.Lset268
.Lset269 = .Ltmp720-.Lfunc_begin0
	.quad	.Lset269
.Lset270 = .Ltmp724-.Lfunc_begin0
	.quad	.Lset270
.Lset271 = .Ltmp745-.Lfunc_begin0
	.quad	.Lset271
	.quad	0
	.quad	0
.Ldebug_ranges35:
.Lset272 = .Ltmp774-.Lfunc_begin0
	.quad	.Lset272
.Lset273 = .Ltmp775-.Lfunc_begin0
	.quad	.Lset273
.Lset274 = .Ltmp777-.Lfunc_begin0
	.quad	.Lset274
.Lset275 = .Ltmp779-.Lfunc_begin0
	.quad	.Lset275
	.quad	0
	.quad	0
.Ldebug_ranges36:
.Lset276 = .Ltmp809-.Lfunc_begin0
	.quad	.Lset276
.Lset277 = .Ltmp811-.Lfunc_begin0
	.quad	.Lset277
.Lset278 = .Ltmp812-.Lfunc_begin0
	.quad	.Lset278
.Lset279 = .Ltmp816-.Lfunc_begin0
	.quad	.Lset279
	.quad	0
	.quad	0
.Ldebug_ranges37:
.Lset280 = .Ltmp816-.Lfunc_begin0
	.quad	.Lset280
.Lset281 = .Ltmp818-.Lfunc_begin0
	.quad	.Lset281
.Lset282 = .Ltmp823-.Lfunc_begin0
	.quad	.Lset282
.Lset283 = .Ltmp836-.Lfunc_begin0
	.quad	.Lset283
	.quad	0
	.quad	0
.Ldebug_ranges38:
.Lset284 = .Ltmp860-.Lfunc_begin0
	.quad	.Lset284
.Lset285 = .Ltmp861-.Lfunc_begin0
	.quad	.Lset285
.Lset286 = .Ltmp862-.Lfunc_begin0
	.quad	.Lset286
.Lset287 = .Ltmp872-.Lfunc_begin0
	.quad	.Lset287
	.quad	0
	.quad	0
.Ldebug_ranges39:
.Lset288 = .Ltmp878-.Lfunc_begin0
	.quad	.Lset288
.Lset289 = .Ltmp879-.Lfunc_begin0
	.quad	.Lset289
.Lset290 = .Ltmp881-.Lfunc_begin0
	.quad	.Lset290
.Lset291 = .Ltmp883-.Lfunc_begin0
	.quad	.Lset291
	.quad	0
	.quad	0
.Ldebug_ranges40:
.Lset292 = .Ltmp931-.Lfunc_begin0
	.quad	.Lset292
.Lset293 = .Ltmp932-.Lfunc_begin0
	.quad	.Lset293
.Lset294 = .Ltmp945-.Lfunc_begin0
	.quad	.Lset294
.Lset295 = .Ltmp947-.Lfunc_begin0
	.quad	.Lset295
	.quad	0
	.quad	0
.Ldebug_ranges41:
.Lset296 = .Ltmp930-.Lfunc_begin0
	.quad	.Lset296
.Lset297 = .Ltmp932-.Lfunc_begin0
	.quad	.Lset297
.Lset298 = .Ltmp935-.Lfunc_begin0
	.quad	.Lset298
.Lset299 = .Ltmp944-.Lfunc_begin0
	.quad	.Lset299
.Lset300 = .Ltmp945-.Lfunc_begin0
	.quad	.Lset300
.Lset301 = .Ltmp947-.Lfunc_begin0
	.quad	.Lset301
.Lset302 = .Ltmp948-.Lfunc_begin0
	.quad	.Lset302
.Lset303 = .Ltmp951-.Lfunc_begin0
	.quad	.Lset303
	.quad	0
	.quad	0
.Ldebug_ranges42:
.Lset304 = .Ltmp923-.Lfunc_begin0
	.quad	.Lset304
.Lset305 = .Ltmp926-.Lfunc_begin0
	.quad	.Lset305
.Lset306 = .Ltmp927-.Lfunc_begin0
	.quad	.Lset306
.Lset307 = .Ltmp952-.Lfunc_begin0
	.quad	.Lset307
	.quad	0
	.quad	0
.Ldebug_ranges43:
.Lset308 = .Ltmp960-.Lfunc_begin0
	.quad	.Lset308
.Lset309 = .Ltmp961-.Lfunc_begin0
	.quad	.Lset309
.Lset310 = .Ltmp964-.Lfunc_begin0
	.quad	.Lset310
.Lset311 = .Ltmp971-.Lfunc_begin0
	.quad	.Lset311
.Lset312 = .Ltmp972-.Lfunc_begin0
	.quad	.Lset312
.Lset313 = .Ltmp980-.Lfunc_begin0
	.quad	.Lset313
	.quad	0
	.quad	0
.Ldebug_ranges44:
.Lset314 = .Ltmp959-.Lfunc_begin0
	.quad	.Lset314
.Lset315 = .Ltmp961-.Lfunc_begin0
	.quad	.Lset315
.Lset316 = .Ltmp964-.Lfunc_begin0
	.quad	.Lset316
.Lset317 = .Ltmp981-.Lfunc_begin0
	.quad	.Lset317
	.quad	0
	.quad	0
.Ldebug_ranges45:
.Lset318 = .Ltmp959-.Lfunc_begin0
	.quad	.Lset318
.Lset319 = .Ltmp961-.Lfunc_begin0
	.quad	.Lset319
.Lset320 = .Ltmp964-.Lfunc_begin0
	.quad	.Lset320
.Lset321 = .Ltmp981-.Lfunc_begin0
	.quad	.Lset321
.Lset322 = .Ltmp985-.Lfunc_begin0
	.quad	.Lset322
.Lset323 = .Ltmp986-.Lfunc_begin0
	.quad	.Lset323
	.quad	0
	.quad	0
.Ldebug_ranges46:
.Lset324 = .Ltmp953-.Lfunc_begin0
	.quad	.Lset324
.Lset325 = .Ltmp954-.Lfunc_begin0
	.quad	.Lset325
.Lset326 = .Ltmp956-.Lfunc_begin0
	.quad	.Lset326
.Lset327 = .Ltmp987-.Lfunc_begin0
	.quad	.Lset327
	.quad	0
	.quad	0
.Ldebug_ranges47:
.Lset328 = .Ltmp992-.Lfunc_begin0
	.quad	.Lset328
.Lset329 = .Ltmp993-.Lfunc_begin0
	.quad	.Lset329
.Lset330 = .Ltmp995-.Lfunc_begin0
	.quad	.Lset330
.Lset331 = .Ltmp998-.Lfunc_begin0
	.quad	.Lset331
	.quad	0
	.quad	0
.Ldebug_ranges48:
.Lset332 = .Ltmp992-.Lfunc_begin0
	.quad	.Lset332
.Lset333 = .Ltmp993-.Lfunc_begin0
	.quad	.Lset333
.Lset334 = .Ltmp995-.Lfunc_begin0
	.quad	.Lset334
.Lset335 = .Ltmp998-.Lfunc_begin0
	.quad	.Lset335
.Lset336 = .Ltmp999-.Lfunc_begin0
	.quad	.Lset336
.Lset337 = .Ltmp1001-.Lfunc_begin0
	.quad	.Lset337
	.quad	0
	.quad	0
.Ldebug_ranges49:
.Lset338 = .Ltmp1006-.Lfunc_begin0
	.quad	.Lset338
.Lset339 = .Ltmp1009-.Lfunc_begin0
	.quad	.Lset339
.Lset340 = .Ltmp1011-.Lfunc_begin0
	.quad	.Lset340
.Lset341 = .Ltmp1012-.Lfunc_begin0
	.quad	.Lset341
	.quad	0
	.quad	0
.Ldebug_ranges50:
.Lset342 = .Ltmp1006-.Lfunc_begin0
	.quad	.Lset342
.Lset343 = .Ltmp1009-.Lfunc_begin0
	.quad	.Lset343
.Lset344 = .Ltmp1011-.Lfunc_begin0
	.quad	.Lset344
.Lset345 = .Ltmp1012-.Lfunc_begin0
	.quad	.Lset345
	.quad	0
	.quad	0
.Ldebug_ranges51:
.Lset346 = .Ltmp954-.Lfunc_begin0
	.quad	.Lset346
.Lset347 = .Ltmp955-.Lfunc_begin0
	.quad	.Lset347
.Lset348 = .Ltmp987-.Lfunc_begin0
	.quad	.Lset348
.Lset349 = .Ltmp1029-.Lfunc_begin0
	.quad	.Lset349
	.quad	0
	.quad	0
.Ldebug_ranges52:
.Lset350 = .Ltmp1055-.Lfunc_begin0
	.quad	.Lset350
.Lset351 = .Ltmp1056-.Lfunc_begin0
	.quad	.Lset351
.Lset352 = .Ltmp1058-.Lfunc_begin0
	.quad	.Lset352
.Lset353 = .Ltmp1065-.Lfunc_begin0
	.quad	.Lset353
	.quad	0
	.quad	0
.Ldebug_ranges53:
.Lset354 = .Ltmp1074-.Lfunc_begin0
	.quad	.Lset354
.Lset355 = .Ltmp1077-.Lfunc_begin0
	.quad	.Lset355
.Lset356 = .Ltmp1079-.Lfunc_begin0
	.quad	.Lset356
.Lset357 = .Ltmp1083-.Lfunc_begin0
	.quad	.Lset357
	.quad	0
	.quad	0
.Ldebug_ranges54:
.Lset358 = .Ltmp1117-.Lfunc_begin0
	.quad	.Lset358
.Lset359 = .Ltmp1118-.Lfunc_begin0
	.quad	.Lset359
.Lset360 = .Ltmp1120-.Lfunc_begin0
	.quad	.Lset360
.Lset361 = .Ltmp1122-.Lfunc_begin0
	.quad	.Lset361
	.quad	0
	.quad	0
.Ldebug_ranges55:
.Lset362 = .Ltmp1144-.Lfunc_begin0
	.quad	.Lset362
.Lset363 = .Ltmp1145-.Lfunc_begin0
	.quad	.Lset363
.Lset364 = .Ltmp1146-.Lfunc_begin0
	.quad	.Lset364
.Lset365 = .Ltmp1150-.Lfunc_begin0
	.quad	.Lset365
	.quad	0
	.quad	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.Lset366 = .Lfunc_begin2-.Lfunc_begin0
	.quad	.Lset366
.Lset367 = .Ltmp8-.Lfunc_begin0
	.quad	.Lset367
.Lset368 = .Ltmp1155-.Ltmp1154          # Loc expr size
	.short	.Lset368
.Ltmp1154:
	.byte	85                      # DW_OP_reg5
.Ltmp1155:
	.quad	0
	.quad	0
.Ldebug_loc1:
.Lset369 = .Lfunc_begin3-.Lfunc_begin0
	.quad	.Lset369
.Lset370 = .Ltmp27-.Lfunc_begin0
	.quad	.Lset370
.Lset371 = .Ltmp1157-.Ltmp1156          # Loc expr size
	.short	.Lset371
.Ltmp1156:
	.byte	85                      # DW_OP_reg5
.Ltmp1157:
	.quad	0
	.quad	0
.Ldebug_loc2:
.Lset372 = .Ltmp24-.Lfunc_begin0
	.quad	.Lset372
.Lset373 = .Ltmp27-.Lfunc_begin0
	.quad	.Lset373
.Lset374 = .Ltmp1159-.Ltmp1158          # Loc expr size
	.short	.Lset374
.Ltmp1158:
	.byte	95                      # super-register
                                        # DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1159:
.Lset375 = .Ltmp34-.Lfunc_begin0
	.quad	.Lset375
.Lset376 = .Ltmp37-.Lfunc_begin0
	.quad	.Lset376
.Lset377 = .Ltmp1161-.Ltmp1160          # Loc expr size
	.short	.Lset377
.Ltmp1160:
	.byte	95                      # super-register
                                        # DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1161:
	.quad	0
	.quad	0
.Ldebug_loc3:
.Lset378 = .Ltmp26-.Lfunc_begin0
	.quad	.Lset378
.Lset379 = .Ltmp27-.Lfunc_begin0
	.quad	.Lset379
.Lset380 = .Ltmp1163-.Ltmp1162          # Loc expr size
	.short	.Lset380
.Ltmp1162:
	.byte	93                      # DW_OP_reg13
.Ltmp1163:
.Lset381 = .Ltmp35-.Lfunc_begin0
	.quad	.Lset381
.Lset382 = .Ltmp37-.Lfunc_begin0
	.quad	.Lset382
.Lset383 = .Ltmp1165-.Ltmp1164          # Loc expr size
	.short	.Lset383
.Ltmp1164:
	.byte	93                      # DW_OP_reg13
.Ltmp1165:
	.quad	0
	.quad	0
.Ldebug_loc4:
.Lset384 = .Lfunc_begin4-.Lfunc_begin0
	.quad	.Lset384
.Lset385 = .Ltmp53-.Lfunc_begin0
	.quad	.Lset385
.Lset386 = .Ltmp1167-.Ltmp1166          # Loc expr size
	.short	.Lset386
.Ltmp1166:
	.byte	85                      # DW_OP_reg5
.Ltmp1167:
	.quad	0
	.quad	0
.Ldebug_loc5:
.Lset387 = .Lfunc_begin4-.Lfunc_begin0
	.quad	.Lset387
.Lset388 = .Ltmp49-.Lfunc_begin0
	.quad	.Lset388
.Lset389 = .Ltmp1169-.Ltmp1168          # Loc expr size
	.short	.Lset389
.Ltmp1168:
	.byte	84                      # DW_OP_reg4
.Ltmp1169:
.Lset390 = .Ltmp49-.Lfunc_begin0
	.quad	.Lset390
.Lset391 = .Ltmp52-.Lfunc_begin0
	.quad	.Lset391
.Lset392 = .Ltmp1171-.Ltmp1170          # Loc expr size
	.short	.Lset392
.Ltmp1170:
	.byte	94                      # DW_OP_reg14
.Ltmp1171:
	.quad	0
	.quad	0
.Ldebug_loc6:
.Lset393 = .Ltmp51-.Lfunc_begin0
	.quad	.Lset393
.Lset394 = .Ltmp57-.Lfunc_begin0
	.quad	.Lset394
.Lset395 = .Ltmp1173-.Ltmp1172          # Loc expr size
	.short	.Lset395
.Ltmp1172:
	.byte	83                      # DW_OP_reg3
.Ltmp1173:
.Lset396 = .Ltmp58-.Lfunc_begin0
	.quad	.Lset396
.Lset397 = .Ltmp59-.Lfunc_begin0
	.quad	.Lset397
.Lset398 = .Ltmp1175-.Ltmp1174          # Loc expr size
	.short	.Lset398
.Ltmp1174:
	.byte	83                      # DW_OP_reg3
.Ltmp1175:
	.quad	0
	.quad	0
.Ldebug_loc7:
.Lset399 = .Lfunc_begin5-.Lfunc_begin0
	.quad	.Lset399
.Lset400 = .Ltmp74-.Lfunc_begin0
	.quad	.Lset400
.Lset401 = .Ltmp1177-.Ltmp1176          # Loc expr size
	.short	.Lset401
.Ltmp1176:
	.byte	85                      # DW_OP_reg5
.Ltmp1177:
	.quad	0
	.quad	0
.Ldebug_loc8:
.Lset402 = .Lfunc_begin5-.Lfunc_begin0
	.quad	.Lset402
.Lset403 = .Ltmp69-.Lfunc_begin0
	.quad	.Lset403
.Lset404 = .Ltmp1179-.Ltmp1178          # Loc expr size
	.short	.Lset404
.Ltmp1178:
	.byte	84                      # DW_OP_reg4
.Ltmp1179:
.Lset405 = .Ltmp69-.Lfunc_begin0
	.quad	.Lset405
.Lset406 = .Ltmp72-.Lfunc_begin0
	.quad	.Lset406
.Lset407 = .Ltmp1181-.Ltmp1180          # Loc expr size
	.short	.Lset407
.Ltmp1180:
	.byte	83                      # DW_OP_reg3
.Ltmp1181:
	.quad	0
	.quad	0
.Ldebug_loc9:
.Lset408 = .Ltmp70-.Lfunc_begin0
	.quad	.Lset408
.Lset409 = .Ltmp74-.Lfunc_begin0
	.quad	.Lset409
.Lset410 = .Ltmp1183-.Ltmp1182          # Loc expr size
	.short	.Lset410
.Ltmp1182:
	.byte	94                      # super-register
                                        # DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1183:
	.quad	0
	.quad	0
.Ldebug_loc10:
.Lset411 = .Ltmp73-.Lfunc_begin0
	.quad	.Lset411
.Lset412 = .Ltmp74-.Lfunc_begin0
	.quad	.Lset412
.Lset413 = .Ltmp1185-.Ltmp1184          # Loc expr size
	.short	.Lset413
.Ltmp1184:
	.byte	83                      # DW_OP_reg3
.Ltmp1185:
.Lset414 = .Ltmp75-.Lfunc_begin0
	.quad	.Lset414
.Lset415 = .Ltmp76-.Lfunc_begin0
	.quad	.Lset415
.Lset416 = .Ltmp1187-.Ltmp1186          # Loc expr size
	.short	.Lset416
.Ltmp1186:
	.byte	83                      # DW_OP_reg3
.Ltmp1187:
	.quad	0
	.quad	0
.Ldebug_loc11:
.Lset417 = .Lfunc_begin6-.Lfunc_begin0
	.quad	.Lset417
.Lset418 = .Ltmp80-.Lfunc_begin0
	.quad	.Lset418
.Lset419 = .Ltmp1189-.Ltmp1188          # Loc expr size
	.short	.Lset419
.Ltmp1188:
	.byte	85                      # DW_OP_reg5
.Ltmp1189:
	.quad	0
	.quad	0
.Ldebug_loc12:
.Lset420 = .Lfunc_begin6-.Lfunc_begin0
	.quad	.Lset420
.Lset421 = .Ltmp79-.Lfunc_begin0
	.quad	.Lset421
.Lset422 = .Ltmp1191-.Ltmp1190          # Loc expr size
	.short	.Lset422
.Ltmp1190:
	.byte	84                      # DW_OP_reg4
.Ltmp1191:
	.quad	0
	.quad	0
.Ldebug_loc13:
.Lset423 = .Ltmp92-.Lfunc_begin0
	.quad	.Lset423
.Lset424 = .Ltmp114-.Lfunc_begin0
	.quad	.Lset424
.Lset425 = .Ltmp1193-.Ltmp1192          # Loc expr size
	.short	.Lset425
.Ltmp1192:
	.byte	95                      # DW_OP_reg15
.Ltmp1193:
	.quad	0
	.quad	0
.Ldebug_loc14:
.Lset426 = .Ltmp93-.Lfunc_begin0
	.quad	.Lset426
.Lset427 = .Ltmp100-.Lfunc_begin0
	.quad	.Lset427
.Lset428 = .Ltmp1195-.Ltmp1194          # Loc expr size
	.short	.Lset428
.Ltmp1194:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1195:
.Lset429 = .Ltmp100-.Lfunc_begin0
	.quad	.Lset429
.Lset430 = .Ltmp101-.Lfunc_begin0
	.quad	.Lset430
.Lset431 = .Ltmp1197-.Ltmp1196          # Loc expr size
	.short	.Lset431
.Ltmp1196:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1197:
.Lset432 = .Ltmp101-.Lfunc_begin0
	.quad	.Lset432
.Lset433 = .Lfunc_end7-.Lfunc_begin0
	.quad	.Lset433
.Lset434 = .Ltmp1199-.Ltmp1198          # Loc expr size
	.short	.Lset434
.Ltmp1198:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1199:
	.quad	0
	.quad	0
.Ldebug_loc15:
.Lset435 = .Ltmp94-.Lfunc_begin0
	.quad	.Lset435
.Lset436 = .Ltmp97-.Lfunc_begin0
	.quad	.Lset436
.Lset437 = .Ltmp1201-.Ltmp1200          # Loc expr size
	.short	.Lset437
.Ltmp1200:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1201:
	.quad	0
	.quad	0
.Ldebug_loc16:
.Lset438 = .Ltmp99-.Lfunc_begin0
	.quad	.Lset438
.Lset439 = .Ltmp100-.Lfunc_begin0
	.quad	.Lset439
.Lset440 = .Ltmp1203-.Ltmp1202          # Loc expr size
	.short	.Lset440
.Ltmp1202:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1203:
	.quad	0
	.quad	0
.Ldebug_loc17:
.Lset441 = .Ltmp102-.Lfunc_begin0
	.quad	.Lset441
.Lset442 = .Ltmp104-.Lfunc_begin0
	.quad	.Lset442
.Lset443 = .Ltmp1205-.Ltmp1204          # Loc expr size
	.short	.Lset443
.Ltmp1204:
	.byte	94                      # super-register
                                        # DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1205:
	.quad	0
	.quad	0
.Ldebug_loc18:
.Lset444 = .Ltmp109-.Lfunc_begin0
	.quad	.Lset444
.Lset445 = .Ltmp111-.Lfunc_begin0
	.quad	.Lset445
.Lset446 = .Ltmp1207-.Ltmp1206          # Loc expr size
	.short	.Lset446
.Ltmp1206:
	.byte	94                      # super-register
                                        # DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1207:
	.quad	0
	.quad	0
.Ldebug_loc19:
.Lset447 = .Ltmp120-.Lfunc_begin0
	.quad	.Lset447
.Lset448 = .Ltmp121-.Lfunc_begin0
	.quad	.Lset448
.Lset449 = .Ltmp1209-.Ltmp1208          # Loc expr size
	.short	.Lset449
.Ltmp1208:
	.byte	83                      # DW_OP_reg3
.Ltmp1209:
	.quad	0
	.quad	0
.Ldebug_loc20:
.Lset450 = .Lfunc_begin9-.Lfunc_begin0
	.quad	.Lset450
.Lset451 = .Ltmp127-.Lfunc_begin0
	.quad	.Lset451
.Lset452 = .Ltmp1211-.Ltmp1210          # Loc expr size
	.short	.Lset452
.Ltmp1210:
	.byte	85                      # DW_OP_reg5
.Ltmp1211:
	.quad	0
	.quad	0
.Ldebug_loc21:
.Lset453 = .Ltmp125-.Lfunc_begin0
	.quad	.Lset453
.Lset454 = .Ltmp129-.Lfunc_begin0
	.quad	.Lset454
.Lset455 = .Ltmp1213-.Ltmp1212          # Loc expr size
	.short	.Lset455
.Ltmp1212:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1213:
	.quad	0
	.quad	0
.Ldebug_loc22:
.Lset456 = .Lfunc_begin10-.Lfunc_begin0
	.quad	.Lset456
.Lset457 = .Ltmp147-.Lfunc_begin0
	.quad	.Lset457
.Lset458 = .Ltmp1215-.Ltmp1214          # Loc expr size
	.short	.Lset458
.Ltmp1214:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1215:
.Lset459 = .Ltmp147-.Lfunc_begin0
	.quad	.Lset459
.Lset460 = .Ltmp154-.Lfunc_begin0
	.quad	.Lset460
.Lset461 = .Ltmp1217-.Ltmp1216          # Loc expr size
	.short	.Lset461
.Ltmp1216:
	.byte	86                      # super-register
                                        # DW_OP_reg6
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1217:
	.quad	0
	.quad	0
.Ldebug_loc23:
.Lset462 = .Ltmp148-.Lfunc_begin0
	.quad	.Lset462
.Lset463 = .Ltmp150-.Lfunc_begin0
	.quad	.Lset463
.Lset464 = .Ltmp1219-.Ltmp1218          # Loc expr size
	.short	.Lset464
.Ltmp1218:
	.byte	80                      # DW_OP_reg0
.Ltmp1219:
.Lset465 = .Ltmp150-.Lfunc_begin0
	.quad	.Lset465
.Lset466 = .Ltmp160-.Lfunc_begin0
	.quad	.Lset466
.Lset467 = .Ltmp1221-.Ltmp1220          # Loc expr size
	.short	.Lset467
.Ltmp1220:
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 
.Ltmp1221:
.Lset468 = .Ltmp167-.Lfunc_begin0
	.quad	.Lset468
.Lset469 = .Ltmp173-.Lfunc_begin0
	.quad	.Lset469
.Lset470 = .Ltmp1223-.Ltmp1222          # Loc expr size
	.short	.Lset470
.Ltmp1222:
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 
.Ltmp1223:
.Lset471 = .Ltmp173-.Lfunc_begin0
	.quad	.Lset471
.Lset472 = .Lfunc_end10-.Lfunc_begin0
	.quad	.Lset472
.Lset473 = .Ltmp1225-.Ltmp1224          # Loc expr size
	.short	.Lset473
.Ltmp1224:
	.byte	80                      # DW_OP_reg0
.Ltmp1225:
	.quad	0
	.quad	0
.Ldebug_loc24:
.Lset474 = .Ltmp149-.Lfunc_begin0
	.quad	.Lset474
.Lset475 = .Ltmp155-.Lfunc_begin0
	.quad	.Lset475
.Lset476 = .Ltmp1227-.Ltmp1226          # Loc expr size
	.short	.Lset476
.Ltmp1226:
	.byte	82                      # DW_OP_reg2
.Ltmp1227:
.Lset477 = .Ltmp168-.Lfunc_begin0
	.quad	.Lset477
.Lset478 = .Ltmp169-.Lfunc_begin0
	.quad	.Lset478
.Lset479 = .Ltmp1229-.Ltmp1228          # Loc expr size
	.short	.Lset479
.Ltmp1228:
	.byte	82                      # DW_OP_reg2
.Ltmp1229:
.Lset480 = .Ltmp170-.Lfunc_begin0
	.quad	.Lset480
.Lset481 = .Ltmp172-.Lfunc_begin0
	.quad	.Lset481
.Lset482 = .Ltmp1231-.Ltmp1230          # Loc expr size
	.short	.Lset482
.Ltmp1230:
	.byte	82                      # DW_OP_reg2
.Ltmp1231:
	.quad	0
	.quad	0
.Ldebug_loc25:
.Lset483 = .Ltmp151-.Lfunc_begin0
	.quad	.Lset483
.Lset484 = .Ltmp172-.Lfunc_begin0
	.quad	.Lset484
.Lset485 = .Ltmp1233-.Ltmp1232          # Loc expr size
	.short	.Lset485
.Ltmp1232:
	.byte	93                      # DW_OP_reg13
.Ltmp1233:
	.quad	0
	.quad	0
.Ldebug_loc26:
.Lset486 = .Ltmp152-.Lfunc_begin0
	.quad	.Lset486
.Lset487 = .Ltmp164-.Lfunc_begin0
	.quad	.Lset487
.Lset488 = .Ltmp1235-.Ltmp1234          # Loc expr size
	.short	.Lset488
.Ltmp1234:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1235:
.Lset489 = .Ltmp164-.Lfunc_begin0
	.quad	.Lset489
.Lset490 = .Ltmp169-.Lfunc_begin0
	.quad	.Lset490
.Lset491 = .Ltmp1237-.Ltmp1236          # Loc expr size
	.short	.Lset491
.Ltmp1236:
	.byte	92                      # super-register
                                        # DW_OP_reg12
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1237:
.Lset492 = .Ltmp169-.Lfunc_begin0
	.quad	.Lset492
.Lset493 = .Lfunc_end10-.Lfunc_begin0
	.quad	.Lset493
.Lset494 = .Ltmp1239-.Ltmp1238          # Loc expr size
	.short	.Lset494
.Ltmp1238:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1239:
	.quad	0
	.quad	0
.Ldebug_loc27:
.Lset495 = .Ltmp152-.Lfunc_begin0
	.quad	.Lset495
.Lset496 = .Ltmp160-.Lfunc_begin0
	.quad	.Lset496
.Lset497 = .Ltmp1241-.Ltmp1240          # Loc expr size
	.short	.Lset497
.Ltmp1240:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1241:
.Lset498 = .Ltmp160-.Lfunc_begin0
	.quad	.Lset498
.Lset499 = .Ltmp165-.Lfunc_begin0
	.quad	.Lset499
.Lset500 = .Ltmp1243-.Ltmp1242          # Loc expr size
	.short	.Lset500
.Ltmp1242:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1243:
.Lset501 = .Ltmp169-.Lfunc_begin0
	.quad	.Lset501
.Lset502 = .Lfunc_end10-.Lfunc_begin0
	.quad	.Lset502
.Lset503 = .Ltmp1245-.Ltmp1244          # Loc expr size
	.short	.Lset503
.Ltmp1244:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1245:
	.quad	0
	.quad	0
.Ldebug_loc28:
.Lset504 = .Ltmp152-.Lfunc_begin0
	.quad	.Lset504
.Lset505 = .Ltmp160-.Lfunc_begin0
	.quad	.Lset505
.Lset506 = .Ltmp1247-.Ltmp1246          # Loc expr size
	.short	.Lset506
.Ltmp1246:
	.byte	16                      # DW_OP_constu
	.ascii	"\377\377\377\377\377\377\377\377\377\001" # 
.Ltmp1247:
.Lset507 = .Ltmp160-.Lfunc_begin0
	.quad	.Lset507
.Lset508 = .Ltmp165-.Lfunc_begin0
	.quad	.Lset508
.Lset509 = .Ltmp1249-.Ltmp1248          # Loc expr size
	.short	.Lset509
.Ltmp1248:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1249:
.Lset510 = .Ltmp169-.Lfunc_begin0
	.quad	.Lset510
.Lset511 = .Lfunc_end10-.Lfunc_begin0
	.quad	.Lset511
.Lset512 = .Ltmp1251-.Ltmp1250          # Loc expr size
	.short	.Lset512
.Ltmp1250:
	.byte	16                      # DW_OP_constu
	.ascii	"\377\377\377\377\377\377\377\377\377\001" # 
.Ltmp1251:
	.quad	0
	.quad	0
.Ldebug_loc29:
.Lset513 = .Ltmp153-.Lfunc_begin0
	.quad	.Lset513
.Lset514 = .Ltmp155-.Lfunc_begin0
	.quad	.Lset514
.Lset515 = .Ltmp1253-.Ltmp1252          # Loc expr size
	.short	.Lset515
.Ltmp1252:
	.byte	81                      # super-register
                                        # DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1253:
.Lset516 = .Ltmp171-.Lfunc_begin0
	.quad	.Lset516
.Lset517 = .Ltmp172-.Lfunc_begin0
	.quad	.Lset517
.Lset518 = .Ltmp1255-.Ltmp1254          # Loc expr size
	.short	.Lset518
.Ltmp1254:
	.byte	81                      # super-register
                                        # DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1255:
	.quad	0
	.quad	0
.Ldebug_loc30:
.Lset519 = .Ltmp156-.Lfunc_begin0
	.quad	.Lset519
.Lset520 = .Ltmp158-.Lfunc_begin0
	.quad	.Lset520
.Lset521 = .Ltmp1257-.Ltmp1256          # Loc expr size
	.short	.Lset521
.Ltmp1256:
	.byte	94                      # super-register
                                        # DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1257:
	.quad	0
	.quad	0
.Ldebug_loc31:
.Lset522 = .Lfunc_begin12-.Lfunc_begin0
	.quad	.Lset522
.Lset523 = .Ltmp186-.Lfunc_begin0
	.quad	.Lset523
.Lset524 = .Ltmp1259-.Ltmp1258          # Loc expr size
	.short	.Lset524
.Ltmp1258:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1259:
.Lset525 = .Ltmp186-.Lfunc_begin0
	.quad	.Lset525
.Lset526 = .Ltmp204-.Lfunc_begin0
	.quad	.Lset526
.Lset527 = .Ltmp1261-.Ltmp1260          # Loc expr size
	.short	.Lset527
.Ltmp1260:
	.byte	95                      # super-register
                                        # DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1261:
	.quad	0
	.quad	0
.Ldebug_loc32:
.Lset528 = .Ltmp187-.Lfunc_begin0
	.quad	.Lset528
.Lset529 = .Ltmp188-.Lfunc_begin0
	.quad	.Lset529
.Lset530 = .Ltmp1263-.Ltmp1262          # Loc expr size
	.short	.Lset530
.Ltmp1262:
	.byte	94                      # DW_OP_reg14
.Ltmp1263:
.Lset531 = .Ltmp211-.Lfunc_begin0
	.quad	.Lset531
.Lset532 = .Ltmp212-.Lfunc_begin0
	.quad	.Lset532
.Lset533 = .Ltmp1265-.Ltmp1264          # Loc expr size
	.short	.Lset533
.Ltmp1264:
	.byte	94                      # DW_OP_reg14
.Ltmp1265:
	.quad	0
	.quad	0
.Ldebug_loc33:
.Lset534 = .Ltmp187-.Lfunc_begin0
	.quad	.Lset534
.Lset535 = .Ltmp213-.Lfunc_begin0
	.quad	.Lset535
.Lset536 = .Ltmp1267-.Ltmp1266          # Loc expr size
	.short	.Lset536
.Ltmp1266:
	.byte	94                      # DW_OP_reg14
.Ltmp1267:
	.quad	0
	.quad	0
.Ldebug_loc34:
.Lset537 = .Ltmp189-.Lfunc_begin0
	.quad	.Lset537
.Lset538 = .Ltmp196-.Lfunc_begin0
	.quad	.Lset538
.Lset539 = .Ltmp1269-.Ltmp1268          # Loc expr size
	.short	.Lset539
.Ltmp1268:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1269:
.Lset540 = .Ltmp196-.Lfunc_begin0
	.quad	.Lset540
.Lset541 = .Ltmp197-.Lfunc_begin0
	.quad	.Lset541
.Lset542 = .Ltmp1271-.Ltmp1270          # Loc expr size
	.short	.Lset542
.Ltmp1270:
	.byte	83                      # super-register
                                        # DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1271:
.Lset543 = .Ltmp197-.Lfunc_begin0
	.quad	.Lset543
.Lset544 = .Lfunc_end12-.Lfunc_begin0
	.quad	.Lset544
.Lset545 = .Ltmp1273-.Ltmp1272          # Loc expr size
	.short	.Lset545
.Ltmp1272:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1273:
	.quad	0
	.quad	0
.Ldebug_loc35:
.Lset546 = .Ltmp190-.Lfunc_begin0
	.quad	.Lset546
.Lset547 = .Ltmp193-.Lfunc_begin0
	.quad	.Lset547
.Lset548 = .Ltmp1275-.Ltmp1274          # Loc expr size
	.short	.Lset548
.Ltmp1274:
	.byte	84                      # super-register
                                        # DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1275:
	.quad	0
	.quad	0
.Ldebug_loc36:
.Lset549 = .Ltmp195-.Lfunc_begin0
	.quad	.Lset549
.Lset550 = .Ltmp196-.Lfunc_begin0
	.quad	.Lset550
.Lset551 = .Ltmp1277-.Ltmp1276          # Loc expr size
	.short	.Lset551
.Ltmp1276:
	.byte	83                      # super-register
                                        # DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1277:
	.quad	0
	.quad	0
.Ldebug_loc37:
.Lset552 = .Ltmp198-.Lfunc_begin0
	.quad	.Lset552
.Lset553 = .Ltmp200-.Lfunc_begin0
	.quad	.Lset553
.Lset554 = .Ltmp1279-.Ltmp1278          # Loc expr size
	.short	.Lset554
.Ltmp1278:
	.byte	93                      # super-register
                                        # DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1279:
	.quad	0
	.quad	0
.Ldebug_loc38:
.Lset555 = .Ltmp206-.Lfunc_begin0
	.quad	.Lset555
.Lset556 = .Ltmp208-.Lfunc_begin0
	.quad	.Lset556
.Lset557 = .Ltmp1281-.Ltmp1280          # Loc expr size
	.short	.Lset557
.Ltmp1280:
	.byte	95                      # super-register
                                        # DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1281:
	.quad	0
	.quad	0
.Ldebug_loc39:
.Lset558 = .Ltmp217-.Lfunc_begin0
	.quad	.Lset558
.Lset559 = .Ltmp220-.Lfunc_begin0
	.quad	.Lset559
.Lset560 = .Ltmp1283-.Ltmp1282          # Loc expr size
	.short	.Lset560
.Ltmp1282:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1283:
	.quad	0
	.quad	0
.Ldebug_loc40:
.Lset561 = .Ltmp219-.Lfunc_begin0
	.quad	.Lset561
.Lset562 = .Ltmp220-.Lfunc_begin0
	.quad	.Lset562
.Lset563 = .Ltmp1285-.Ltmp1284          # Loc expr size
	.short	.Lset563
.Ltmp1284:
	.byte	82                      # DW_OP_reg2
.Ltmp1285:
.Lset564 = .Ltmp221-.Lfunc_begin0
	.quad	.Lset564
.Lset565 = .Ltmp222-.Lfunc_begin0
	.quad	.Lset565
.Lset566 = .Ltmp1287-.Ltmp1286          # Loc expr size
	.short	.Lset566
.Ltmp1286:
	.byte	82                      # DW_OP_reg2
.Ltmp1287:
	.quad	0
	.quad	0
.Ldebug_loc41:
.Lset567 = .Lfunc_begin14-.Lfunc_begin0
	.quad	.Lset567
.Lset568 = .Ltmp234-.Lfunc_begin0
	.quad	.Lset568
.Lset569 = .Ltmp1289-.Ltmp1288          # Loc expr size
	.short	.Lset569
.Ltmp1288:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1289:
.Lset570 = .Ltmp234-.Lfunc_begin0
	.quad	.Lset570
.Lset571 = .Ltmp236-.Lfunc_begin0
	.quad	.Lset571
.Lset572 = .Ltmp1291-.Ltmp1290          # Loc expr size
	.short	.Lset572
.Ltmp1290:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1291:
.Lset573 = .Ltmp236-.Lfunc_begin0
	.quad	.Lset573
.Lset574 = .Ltmp238-.Lfunc_begin0
	.quad	.Lset574
.Lset575 = .Ltmp1293-.Ltmp1292          # Loc expr size
	.short	.Lset575
.Ltmp1292:
	.byte	95                      # super-register
                                        # DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1293:
.Lset576 = .Ltmp238-.Lfunc_begin0
	.quad	.Lset576
.Lset577 = .Ltmp248-.Lfunc_begin0
	.quad	.Lset577
.Lset578 = .Ltmp1295-.Ltmp1294          # Loc expr size
	.short	.Lset578
.Ltmp1294:
	.byte	88                      # super-register
                                        # DW_OP_reg8
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1295:
.Lset579 = .Ltmp248-.Lfunc_begin0
	.quad	.Lset579
.Lset580 = .Ltmp269-.Lfunc_begin0
	.quad	.Lset580
.Lset581 = .Ltmp1297-.Ltmp1296          # Loc expr size
	.short	.Lset581
.Ltmp1296:
	.byte	118                     # DW_OP_breg6
	.byte	64                      # 
.Ltmp1297:
.Lset582 = .Ltmp269-.Lfunc_begin0
	.quad	.Lset582
.Lset583 = .Ltmp270-.Lfunc_begin0
	.quad	.Lset583
.Lset584 = .Ltmp1299-.Ltmp1298          # Loc expr size
	.short	.Lset584
.Ltmp1298:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1299:
	.quad	0
	.quad	0
.Ldebug_loc42:
.Lset585 = .Lfunc_begin14-.Lfunc_begin0
	.quad	.Lset585
.Lset586 = .Ltmp233-.Lfunc_begin0
	.quad	.Lset586
.Lset587 = .Ltmp1301-.Ltmp1300          # Loc expr size
	.short	.Lset587
.Ltmp1300:
	.byte	84                      # super-register
                                        # DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1301:
.Lset588 = .Ltmp233-.Lfunc_begin0
	.quad	.Lset588
.Lset589 = .Ltmp249-.Lfunc_begin0
	.quad	.Lset589
.Lset590 = .Ltmp1303-.Ltmp1302          # Loc expr size
	.short	.Lset590
.Ltmp1302:
	.byte	93                      # super-register
                                        # DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1303:
.Lset591 = .Ltmp249-.Lfunc_begin0
	.quad	.Lset591
.Lset592 = .Lfunc_end14-.Lfunc_begin0
	.quad	.Lset592
.Lset593 = .Ltmp1305-.Ltmp1304          # Loc expr size
	.short	.Lset593
.Ltmp1304:
	.byte	118                     # DW_OP_breg6
	.byte	76                      # 
.Ltmp1305:
	.quad	0
	.quad	0
.Ldebug_loc43:
.Lset594 = .Ltmp237-.Lfunc_begin0
	.quad	.Lset594
.Lset595 = .Ltmp250-.Lfunc_begin0
	.quad	.Lset595
.Lset596 = .Ltmp1307-.Ltmp1306          # Loc expr size
	.short	.Lset596
.Ltmp1306:
	.byte	92                      # DW_OP_reg12
.Ltmp1307:
.Lset597 = .Ltmp250-.Lfunc_begin0
	.quad	.Lset597
.Lset598 = .Ltmp257-.Lfunc_begin0
	.quad	.Lset598
.Lset599 = .Ltmp1309-.Ltmp1308          # Loc expr size
	.short	.Lset599
.Ltmp1308:
	.byte	118                     # DW_OP_breg6
	.ascii	"\260\177"              # 
.Ltmp1309:
.Lset600 = .Ltmp257-.Lfunc_begin0
	.quad	.Lset600
.Lset601 = .Ltmp258-.Lfunc_begin0
	.quad	.Lset601
.Lset602 = .Ltmp1311-.Ltmp1310          # Loc expr size
	.short	.Lset602
.Ltmp1310:
	.byte	82                      # DW_OP_reg2
.Ltmp1311:
.Lset603 = .Ltmp258-.Lfunc_begin0
	.quad	.Lset603
.Lset604 = .Ltmp271-.Lfunc_begin0
	.quad	.Lset604
.Lset605 = .Ltmp1313-.Ltmp1312          # Loc expr size
	.short	.Lset605
.Ltmp1312:
	.byte	118                     # DW_OP_breg6
	.ascii	"\260\177"              # 
.Ltmp1313:
.Lset606 = .Ltmp271-.Lfunc_begin0
	.quad	.Lset606
.Lset607 = .Ltmp272-.Lfunc_begin0
	.quad	.Lset607
.Lset608 = .Ltmp1315-.Ltmp1314          # Loc expr size
	.short	.Lset608
.Ltmp1314:
	.byte	83                      # DW_OP_reg3
.Ltmp1315:
	.quad	0
	.quad	0
.Ldebug_loc44:
.Lset609 = .Ltmp239-.Lfunc_begin0
	.quad	.Lset609
.Lset610 = .Ltmp246-.Lfunc_begin0
	.quad	.Lset610
.Lset611 = .Ltmp1317-.Ltmp1316          # Loc expr size
	.short	.Lset611
.Ltmp1316:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1317:
.Lset612 = .Ltmp246-.Lfunc_begin0
	.quad	.Lset612
.Lset613 = .Ltmp247-.Lfunc_begin0
	.quad	.Lset613
.Lset614 = .Ltmp1319-.Ltmp1318          # Loc expr size
	.short	.Lset614
.Ltmp1318:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1319:
.Lset615 = .Ltmp247-.Lfunc_begin0
	.quad	.Lset615
.Lset616 = .Lfunc_end14-.Lfunc_begin0
	.quad	.Lset616
.Lset617 = .Ltmp1321-.Ltmp1320          # Loc expr size
	.short	.Lset617
.Ltmp1320:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1321:
	.quad	0
	.quad	0
.Ldebug_loc45:
.Lset618 = .Ltmp240-.Lfunc_begin0
	.quad	.Lset618
.Lset619 = .Ltmp243-.Lfunc_begin0
	.quad	.Lset619
.Lset620 = .Ltmp1323-.Ltmp1322          # Loc expr size
	.short	.Lset620
.Ltmp1322:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1323:
	.quad	0
	.quad	0
.Ldebug_loc46:
.Lset621 = .Ltmp245-.Lfunc_begin0
	.quad	.Lset621
.Lset622 = .Ltmp246-.Lfunc_begin0
	.quad	.Lset622
.Lset623 = .Ltmp1325-.Ltmp1324          # Loc expr size
	.short	.Lset623
.Ltmp1324:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1325:
	.quad	0
	.quad	0
.Ldebug_loc47:
.Lset624 = .Ltmp251-.Lfunc_begin0
	.quad	.Lset624
.Lset625 = .Ltmp253-.Lfunc_begin0
	.quad	.Lset625
.Lset626 = .Ltmp1327-.Ltmp1326          # Loc expr size
	.short	.Lset626
.Ltmp1326:
	.byte	83                      # super-register
                                        # DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1327:
	.quad	0
	.quad	0
.Ldebug_loc48:
.Lset627 = .Ltmp259-.Lfunc_begin0
	.quad	.Lset627
.Lset628 = .Ltmp264-.Lfunc_begin0
	.quad	.Lset628
.Lset629 = .Ltmp1329-.Ltmp1328          # Loc expr size
	.short	.Lset629
.Ltmp1328:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1329:
.Lset630 = .Ltmp264-.Lfunc_begin0
	.quad	.Lset630
.Lset631 = .Ltmp269-.Lfunc_begin0
	.quad	.Lset631
.Lset632 = .Ltmp1331-.Ltmp1330          # Loc expr size
	.short	.Lset632
.Ltmp1330:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1331:
.Lset633 = .Ltmp270-.Lfunc_begin0
	.quad	.Lset633
.Lset634 = .Lfunc_end14-.Lfunc_begin0
	.quad	.Lset634
.Lset635 = .Ltmp1333-.Ltmp1332          # Loc expr size
	.short	.Lset635
.Ltmp1332:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1333:
	.quad	0
	.quad	0
.Ldebug_loc49:
.Lset636 = .Ltmp259-.Lfunc_begin0
	.quad	.Lset636
.Lset637 = .Ltmp267-.Lfunc_begin0
	.quad	.Lset637
.Lset638 = .Ltmp1335-.Ltmp1334          # Loc expr size
	.short	.Lset638
.Ltmp1334:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1335:
.Lset639 = .Ltmp267-.Lfunc_begin0
	.quad	.Lset639
.Lset640 = .Ltmp269-.Lfunc_begin0
	.quad	.Lset640
.Lset641 = .Ltmp1337-.Ltmp1336          # Loc expr size
	.short	.Lset641
.Ltmp1336:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1337:
.Lset642 = .Ltmp270-.Lfunc_begin0
	.quad	.Lset642
.Lset643 = .Lfunc_end14-.Lfunc_begin0
	.quad	.Lset643
.Lset644 = .Ltmp1339-.Ltmp1338          # Loc expr size
	.short	.Lset644
.Ltmp1338:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1339:
	.quad	0
	.quad	0
.Ldebug_loc50:
.Lset645 = .Ltmp259-.Lfunc_begin0
	.quad	.Lset645
.Lset646 = .Ltmp265-.Lfunc_begin0
	.quad	.Lset646
.Lset647 = .Ltmp1341-.Ltmp1340          # Loc expr size
	.short	.Lset647
.Ltmp1340:
	.byte	16                      # DW_OP_constu
	.ascii	"\377\377\377\377\377\377\377\377\377\001" # 
.Ltmp1341:
.Lset648 = .Ltmp265-.Lfunc_begin0
	.quad	.Lset648
.Lset649 = .Ltmp267-.Lfunc_begin0
	.quad	.Lset649
.Lset650 = .Ltmp1343-.Ltmp1342          # Loc expr size
	.short	.Lset650
.Ltmp1342:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1343:
.Lset651 = .Ltmp270-.Lfunc_begin0
	.quad	.Lset651
.Lset652 = .Lfunc_end14-.Lfunc_begin0
	.quad	.Lset652
.Lset653 = .Ltmp1345-.Ltmp1344          # Loc expr size
	.short	.Lset653
.Ltmp1344:
	.byte	16                      # DW_OP_constu
	.ascii	"\377\377\377\377\377\377\377\377\377\001" # 
.Ltmp1345:
	.quad	0
	.quad	0
.Ldebug_loc51:
.Lset654 = .Ltmp260-.Lfunc_begin0
	.quad	.Lset654
.Lset655 = .Ltmp262-.Lfunc_begin0
	.quad	.Lset655
.Lset656 = .Ltmp1347-.Ltmp1346          # Loc expr size
	.short	.Lset656
.Ltmp1346:
	.byte	81                      # super-register
                                        # DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1347:
	.quad	0
	.quad	0
.Ldebug_loc52:
.Lset657 = .Ltmp281-.Lfunc_begin0
	.quad	.Lset657
.Lset658 = .Ltmp286-.Lfunc_begin0
	.quad	.Lset658
.Lset659 = .Ltmp1349-.Ltmp1348          # Loc expr size
	.short	.Lset659
.Ltmp1348:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1349:
.Lset660 = .Ltmp292-.Lfunc_begin0
	.quad	.Lset660
.Lset661 = .Ltmp293-.Lfunc_begin0
	.quad	.Lset661
.Lset662 = .Ltmp1351-.Ltmp1350          # Loc expr size
	.short	.Lset662
.Ltmp1350:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1351:
	.quad	0
	.quad	0
.Ldebug_loc53:
.Lset663 = .Ltmp283-.Lfunc_begin0
	.quad	.Lset663
.Lset664 = .Ltmp293-.Lfunc_begin0
	.quad	.Lset664
.Lset665 = .Ltmp1353-.Ltmp1352          # Loc expr size
	.short	.Lset665
.Ltmp1352:
	.byte	94                      # super-register
                                        # DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1353:
	.quad	0
	.quad	0
.Ldebug_loc54:
.Lset666 = .Ltmp284-.Lfunc_begin0
	.quad	.Lset666
.Lset667 = .Ltmp286-.Lfunc_begin0
	.quad	.Lset667
.Lset668 = .Ltmp1355-.Ltmp1354          # Loc expr size
	.short	.Lset668
.Ltmp1354:
	.byte	83                      # DW_OP_reg3
.Ltmp1355:
.Lset669 = .Ltmp290-.Lfunc_begin0
	.quad	.Lset669
.Lset670 = .Ltmp290-.Lfunc_begin0
	.quad	.Lset670
.Lset671 = .Ltmp1357-.Ltmp1356          # Loc expr size
	.short	.Lset671
.Ltmp1356:
	.byte	83                      # DW_OP_reg3
.Ltmp1357:
	.quad	0
	.quad	0
.Ldebug_loc55:
.Lset672 = .Lfunc_begin16-.Lfunc_begin0
	.quad	.Lset672
.Lset673 = .Ltmp315-.Lfunc_begin0
	.quad	.Lset673
.Lset674 = .Ltmp1359-.Ltmp1358          # Loc expr size
	.short	.Lset674
.Ltmp1358:
	.byte	85                      # DW_OP_reg5
.Ltmp1359:
.Lset675 = .Ltmp315-.Lfunc_begin0
	.quad	.Lset675
.Lset676 = .Ltmp316-.Lfunc_begin0
	.quad	.Lset676
.Lset677 = .Ltmp1361-.Ltmp1360          # Loc expr size
	.short	.Lset677
.Ltmp1360:
	.byte	92                      # DW_OP_reg12
.Ltmp1361:
.Lset678 = .Ltmp317-.Lfunc_begin0
	.quad	.Lset678
.Lset679 = .Ltmp336-.Lfunc_begin0
	.quad	.Lset679
.Lset680 = .Ltmp1363-.Ltmp1362          # Loc expr size
	.short	.Lset680
.Ltmp1362:
	.byte	92                      # DW_OP_reg12
.Ltmp1363:
	.quad	0
	.quad	0
.Ldebug_loc56:
.Lset681 = .Ltmp318-.Lfunc_begin0
	.quad	.Lset681
.Lset682 = .Ltmp340-.Lfunc_begin0
	.quad	.Lset682
.Lset683 = .Ltmp1365-.Ltmp1364          # Loc expr size
	.short	.Lset683
.Ltmp1364:
	.byte	95                      # DW_OP_reg15
.Ltmp1365:
	.quad	0
	.quad	0
.Ldebug_loc57:
.Lset684 = .Ltmp319-.Lfunc_begin0
	.quad	.Lset684
.Lset685 = .Ltmp326-.Lfunc_begin0
	.quad	.Lset685
.Lset686 = .Ltmp1367-.Ltmp1366          # Loc expr size
	.short	.Lset686
.Ltmp1366:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1367:
.Lset687 = .Ltmp326-.Lfunc_begin0
	.quad	.Lset687
.Lset688 = .Ltmp327-.Lfunc_begin0
	.quad	.Lset688
.Lset689 = .Ltmp1369-.Ltmp1368          # Loc expr size
	.short	.Lset689
.Ltmp1368:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1369:
.Lset690 = .Ltmp327-.Lfunc_begin0
	.quad	.Lset690
.Lset691 = .Lfunc_end16-.Lfunc_begin0
	.quad	.Lset691
.Lset692 = .Ltmp1371-.Ltmp1370          # Loc expr size
	.short	.Lset692
.Ltmp1370:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1371:
	.quad	0
	.quad	0
.Ldebug_loc58:
.Lset693 = .Ltmp320-.Lfunc_begin0
	.quad	.Lset693
.Lset694 = .Ltmp323-.Lfunc_begin0
	.quad	.Lset694
.Lset695 = .Ltmp1373-.Ltmp1372          # Loc expr size
	.short	.Lset695
.Ltmp1372:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1373:
	.quad	0
	.quad	0
.Ldebug_loc59:
.Lset696 = .Ltmp325-.Lfunc_begin0
	.quad	.Lset696
.Lset697 = .Ltmp326-.Lfunc_begin0
	.quad	.Lset697
.Lset698 = .Ltmp1375-.Ltmp1374          # Loc expr size
	.short	.Lset698
.Ltmp1374:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1375:
	.quad	0
	.quad	0
.Ldebug_loc60:
.Lset699 = .Ltmp328-.Lfunc_begin0
	.quad	.Lset699
.Lset700 = .Ltmp330-.Lfunc_begin0
	.quad	.Lset700
.Lset701 = .Ltmp1377-.Ltmp1376          # Loc expr size
	.short	.Lset701
.Ltmp1376:
	.byte	94                      # super-register
                                        # DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1377:
	.quad	0
	.quad	0
.Ldebug_loc61:
.Lset702 = .Ltmp335-.Lfunc_begin0
	.quad	.Lset702
.Lset703 = .Ltmp337-.Lfunc_begin0
	.quad	.Lset703
.Lset704 = .Ltmp1379-.Ltmp1378          # Loc expr size
	.short	.Lset704
.Ltmp1378:
	.byte	94                      # super-register
                                        # DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1379:
	.quad	0
	.quad	0
.Ldebug_loc62:
.Lset705 = .Ltmp346-.Lfunc_begin0
	.quad	.Lset705
.Lset706 = .Ltmp350-.Lfunc_begin0
	.quad	.Lset706
.Lset707 = .Ltmp1381-.Ltmp1380          # Loc expr size
	.short	.Lset707
.Ltmp1380:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1381:
	.quad	0
	.quad	0
.Ldebug_loc63:
.Lset708 = .Ltmp348-.Lfunc_begin0
	.quad	.Lset708
.Lset709 = .Ltmp350-.Lfunc_begin0
	.quad	.Lset709
.Lset710 = .Ltmp1383-.Ltmp1382          # Loc expr size
	.short	.Lset710
.Ltmp1382:
	.byte	81                      # DW_OP_reg1
.Ltmp1383:
.Lset711 = .Ltmp353-.Lfunc_begin0
	.quad	.Lset711
.Lset712 = .Ltmp354-.Lfunc_begin0
	.quad	.Lset712
.Lset713 = .Ltmp1385-.Ltmp1384          # Loc expr size
	.short	.Lset713
.Ltmp1384:
	.byte	81                      # DW_OP_reg1
.Ltmp1385:
	.quad	0
	.quad	0
.Ldebug_loc64:
.Lset714 = .Ltmp349-.Lfunc_begin0
	.quad	.Lset714
.Lset715 = .Ltmp350-.Lfunc_begin0
	.quad	.Lset715
.Lset716 = .Ltmp1387-.Ltmp1386          # Loc expr size
	.short	.Lset716
.Ltmp1386:
	.byte	80                      # DW_OP_reg0
.Ltmp1387:
.Lset717 = .Ltmp352-.Lfunc_begin0
	.quad	.Lset717
.Lset718 = .Ltmp354-.Lfunc_begin0
	.quad	.Lset718
.Lset719 = .Ltmp1389-.Ltmp1388          # Loc expr size
	.short	.Lset719
.Ltmp1388:
	.byte	80                      # DW_OP_reg0
.Ltmp1389:
	.quad	0
	.quad	0
.Ldebug_loc65:
.Lset720 = .Ltmp351-.Lfunc_begin0
	.quad	.Lset720
.Lset721 = .Ltmp354-.Lfunc_begin0
	.quad	.Lset721
.Lset722 = .Ltmp1391-.Ltmp1390          # Loc expr size
	.short	.Lset722
.Ltmp1390:
	.byte	97                      # DW_OP_reg17
.Ltmp1391:
	.quad	0
	.quad	0
.Ldebug_loc66:
.Lset723 = .Lfunc_begin18-.Lfunc_begin0
	.quad	.Lset723
.Lset724 = .Ltmp364-.Lfunc_begin0
	.quad	.Lset724
.Lset725 = .Ltmp1393-.Ltmp1392          # Loc expr size
	.short	.Lset725
.Ltmp1392:
	.byte	85                      # DW_OP_reg5
.Ltmp1393:
.Lset726 = .Ltmp364-.Lfunc_begin0
	.quad	.Lset726
.Lset727 = .Ltmp369-.Lfunc_begin0
	.quad	.Lset727
.Lset728 = .Ltmp1395-.Ltmp1394          # Loc expr size
	.short	.Lset728
.Ltmp1394:
	.byte	94                      # DW_OP_reg14
.Ltmp1395:
	.quad	0
	.quad	0
.Ldebug_loc67:
.Lset729 = .Lfunc_begin18-.Lfunc_begin0
	.quad	.Lset729
.Lset730 = .Ltmp363-.Lfunc_begin0
	.quad	.Lset730
.Lset731 = .Ltmp1397-.Ltmp1396          # Loc expr size
	.short	.Lset731
.Ltmp1396:
	.byte	84                      # DW_OP_reg4
.Ltmp1397:
.Lset732 = .Ltmp363-.Lfunc_begin0
	.quad	.Lset732
.Lset733 = .Ltmp369-.Lfunc_begin0
	.quad	.Lset733
.Lset734 = .Ltmp1399-.Ltmp1398          # Loc expr size
	.short	.Lset734
.Ltmp1398:
	.byte	95                      # DW_OP_reg15
.Ltmp1399:
	.quad	0
	.quad	0
.Ldebug_loc68:
.Lset735 = .Lfunc_begin19-.Lfunc_begin0
	.quad	.Lset735
.Lset736 = .Ltmp380-.Lfunc_begin0
	.quad	.Lset736
.Lset737 = .Ltmp1401-.Ltmp1400          # Loc expr size
	.short	.Lset737
.Ltmp1400:
	.byte	85                      # DW_OP_reg5
.Ltmp1401:
.Lset738 = .Ltmp380-.Lfunc_begin0
	.quad	.Lset738
.Lset739 = .Ltmp382-.Lfunc_begin0
	.quad	.Lset739
.Lset740 = .Ltmp1403-.Ltmp1402          # Loc expr size
	.short	.Lset740
.Ltmp1402:
	.byte	92                      # DW_OP_reg12
.Ltmp1403:
.Lset741 = .Ltmp383-.Lfunc_begin0
	.quad	.Lset741
.Lset742 = .Ltmp405-.Lfunc_begin0
	.quad	.Lset742
.Lset743 = .Ltmp1405-.Ltmp1404          # Loc expr size
	.short	.Lset743
.Ltmp1404:
	.byte	92                      # DW_OP_reg12
.Ltmp1405:
	.quad	0
	.quad	0
.Ldebug_loc69:
.Lset744 = .Ltmp384-.Lfunc_begin0
	.quad	.Lset744
.Lset745 = .Ltmp406-.Lfunc_begin0
	.quad	.Lset745
.Lset746 = .Ltmp1407-.Ltmp1406          # Loc expr size
	.short	.Lset746
.Ltmp1406:
	.byte	94                      # DW_OP_reg14
.Ltmp1407:
	.quad	0
	.quad	0
.Ldebug_loc70:
.Lset747 = .Ltmp385-.Lfunc_begin0
	.quad	.Lset747
.Lset748 = .Ltmp392-.Lfunc_begin0
	.quad	.Lset748
.Lset749 = .Ltmp1409-.Ltmp1408          # Loc expr size
	.short	.Lset749
.Ltmp1408:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1409:
.Lset750 = .Ltmp392-.Lfunc_begin0
	.quad	.Lset750
.Lset751 = .Ltmp393-.Lfunc_begin0
	.quad	.Lset751
.Lset752 = .Ltmp1411-.Ltmp1410          # Loc expr size
	.short	.Lset752
.Ltmp1410:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1411:
.Lset753 = .Ltmp393-.Lfunc_begin0
	.quad	.Lset753
.Lset754 = .Lfunc_end19-.Lfunc_begin0
	.quad	.Lset754
.Lset755 = .Ltmp1413-.Ltmp1412          # Loc expr size
	.short	.Lset755
.Ltmp1412:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1413:
	.quad	0
	.quad	0
.Ldebug_loc71:
.Lset756 = .Ltmp386-.Lfunc_begin0
	.quad	.Lset756
.Lset757 = .Ltmp389-.Lfunc_begin0
	.quad	.Lset757
.Lset758 = .Ltmp1415-.Ltmp1414          # Loc expr size
	.short	.Lset758
.Ltmp1414:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1415:
	.quad	0
	.quad	0
.Ldebug_loc72:
.Lset759 = .Ltmp391-.Lfunc_begin0
	.quad	.Lset759
.Lset760 = .Ltmp392-.Lfunc_begin0
	.quad	.Lset760
.Lset761 = .Ltmp1417-.Ltmp1416          # Loc expr size
	.short	.Lset761
.Ltmp1416:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1417:
	.quad	0
	.quad	0
.Ldebug_loc73:
.Lset762 = .Ltmp394-.Lfunc_begin0
	.quad	.Lset762
.Lset763 = .Ltmp396-.Lfunc_begin0
	.quad	.Lset763
.Lset764 = .Ltmp1419-.Ltmp1418          # Loc expr size
	.short	.Lset764
.Ltmp1418:
	.byte	95                      # super-register
                                        # DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1419:
	.quad	0
	.quad	0
.Ldebug_loc74:
.Lset765 = .Ltmp400-.Lfunc_begin0
	.quad	.Lset765
.Lset766 = .Ltmp402-.Lfunc_begin0
	.quad	.Lset766
.Lset767 = .Ltmp1421-.Ltmp1420          # Loc expr size
	.short	.Lset767
.Ltmp1420:
	.byte	95                      # super-register
                                        # DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1421:
	.quad	0
	.quad	0
.Ldebug_loc75:
.Lset768 = .Lfunc_begin20-.Lfunc_begin0
	.quad	.Lset768
.Lset769 = .Ltmp420-.Lfunc_begin0
	.quad	.Lset769
.Lset770 = .Ltmp1423-.Ltmp1422          # Loc expr size
	.short	.Lset770
.Ltmp1422:
	.byte	85                      # DW_OP_reg5
.Ltmp1423:
	.quad	0
	.quad	0
.Ldebug_loc76:
.Lset771 = .Ltmp417-.Lfunc_begin0
	.quad	.Lset771
.Lset772 = .Ltmp425-.Lfunc_begin0
	.quad	.Lset772
.Lset773 = .Ltmp1425-.Ltmp1424          # Loc expr size
	.short	.Lset773
.Ltmp1424:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1425:
.Lset774 = .Ltmp434-.Lfunc_begin0
	.quad	.Lset774
.Lset775 = .Ltmp435-.Lfunc_begin0
	.quad	.Lset775
.Lset776 = .Ltmp1427-.Ltmp1426          # Loc expr size
	.short	.Lset776
.Ltmp1426:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1427:
	.quad	0
	.quad	0
.Ldebug_loc77:
.Lset777 = .Ltmp421-.Lfunc_begin0
	.quad	.Lset777
.Lset778 = .Ltmp425-.Lfunc_begin0
	.quad	.Lset778
.Lset779 = .Ltmp1429-.Ltmp1428          # Loc expr size
	.short	.Lset779
.Ltmp1428:
	.byte	84                      # DW_OP_reg4
.Ltmp1429:
.Lset780 = .Ltmp430-.Lfunc_begin0
	.quad	.Lset780
.Lset781 = .Ltmp431-.Lfunc_begin0
	.quad	.Lset781
.Lset782 = .Ltmp1431-.Ltmp1430          # Loc expr size
	.short	.Lset782
.Ltmp1430:
	.byte	84                      # DW_OP_reg4
.Ltmp1431:
.Lset783 = .Ltmp433-.Lfunc_begin0
	.quad	.Lset783
.Lset784 = .Ltmp435-.Lfunc_begin0
	.quad	.Lset784
.Lset785 = .Ltmp1433-.Ltmp1432          # Loc expr size
	.short	.Lset785
.Ltmp1432:
	.byte	84                      # DW_OP_reg4
.Ltmp1433:
	.quad	0
	.quad	0
.Ldebug_loc78:
.Lset786 = .Ltmp422-.Lfunc_begin0
	.quad	.Lset786
.Lset787 = .Ltmp425-.Lfunc_begin0
	.quad	.Lset787
.Lset788 = .Ltmp1435-.Ltmp1434          # Loc expr size
	.short	.Lset788
.Ltmp1434:
	.byte	81                      # DW_OP_reg1
.Ltmp1435:
.Lset789 = .Ltmp426-.Lfunc_begin0
	.quad	.Lset789
.Lset790 = .Ltmp431-.Lfunc_begin0
	.quad	.Lset790
.Lset791 = .Ltmp1437-.Ltmp1436          # Loc expr size
	.short	.Lset791
.Ltmp1436:
	.byte	83                      # DW_OP_reg3
.Ltmp1437:
.Lset792 = .Ltmp432-.Lfunc_begin0
	.quad	.Lset792
.Lset793 = .Ltmp435-.Lfunc_begin0
	.quad	.Lset793
.Lset794 = .Ltmp1439-.Ltmp1438          # Loc expr size
	.short	.Lset794
.Ltmp1438:
	.byte	81                      # DW_OP_reg1
.Ltmp1439:
	.quad	0
	.quad	0
.Ldebug_loc79:
.Lset795 = .Ltmp423-.Lfunc_begin0
	.quad	.Lset795
.Lset796 = .Ltmp425-.Lfunc_begin0
	.quad	.Lset796
.Lset797 = .Ltmp1441-.Ltmp1440          # Loc expr size
	.short	.Lset797
.Ltmp1440:
	.byte	94                      # super-register
                                        # DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1441:
	.quad	0
	.quad	0
.Ldebug_loc80:
.Lset798 = .Lfunc_begin21-.Lfunc_begin0
	.quad	.Lset798
.Lset799 = .Ltmp446-.Lfunc_begin0
	.quad	.Lset799
.Lset800 = .Ltmp1443-.Ltmp1442          # Loc expr size
	.short	.Lset800
.Ltmp1442:
	.byte	85                      # DW_OP_reg5
.Ltmp1443:
.Lset801 = .Ltmp446-.Lfunc_begin0
	.quad	.Lset801
.Lset802 = .Ltmp448-.Lfunc_begin0
	.quad	.Lset802
.Lset803 = .Ltmp1445-.Ltmp1444          # Loc expr size
	.short	.Lset803
.Ltmp1444:
	.byte	92                      # DW_OP_reg12
.Ltmp1445:
.Lset804 = .Ltmp449-.Lfunc_begin0
	.quad	.Lset804
.Lset805 = .Ltmp468-.Lfunc_begin0
	.quad	.Lset805
.Lset806 = .Ltmp1447-.Ltmp1446          # Loc expr size
	.short	.Lset806
.Ltmp1446:
	.byte	92                      # DW_OP_reg12
.Ltmp1447:
	.quad	0
	.quad	0
.Ldebug_loc81:
.Lset807 = .Ltmp450-.Lfunc_begin0
	.quad	.Lset807
.Lset808 = .Ltmp472-.Lfunc_begin0
	.quad	.Lset808
.Lset809 = .Ltmp1449-.Ltmp1448          # Loc expr size
	.short	.Lset809
.Ltmp1448:
	.byte	95                      # DW_OP_reg15
.Ltmp1449:
	.quad	0
	.quad	0
.Ldebug_loc82:
.Lset810 = .Ltmp451-.Lfunc_begin0
	.quad	.Lset810
.Lset811 = .Ltmp458-.Lfunc_begin0
	.quad	.Lset811
.Lset812 = .Ltmp1451-.Ltmp1450          # Loc expr size
	.short	.Lset812
.Ltmp1450:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1451:
.Lset813 = .Ltmp458-.Lfunc_begin0
	.quad	.Lset813
.Lset814 = .Ltmp459-.Lfunc_begin0
	.quad	.Lset814
.Lset815 = .Ltmp1453-.Ltmp1452          # Loc expr size
	.short	.Lset815
.Ltmp1452:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1453:
.Lset816 = .Ltmp459-.Lfunc_begin0
	.quad	.Lset816
.Lset817 = .Lfunc_end21-.Lfunc_begin0
	.quad	.Lset817
.Lset818 = .Ltmp1455-.Ltmp1454          # Loc expr size
	.short	.Lset818
.Ltmp1454:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1455:
	.quad	0
	.quad	0
.Ldebug_loc83:
.Lset819 = .Ltmp452-.Lfunc_begin0
	.quad	.Lset819
.Lset820 = .Ltmp455-.Lfunc_begin0
	.quad	.Lset820
.Lset821 = .Ltmp1457-.Ltmp1456          # Loc expr size
	.short	.Lset821
.Ltmp1456:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1457:
	.quad	0
	.quad	0
.Ldebug_loc84:
.Lset822 = .Ltmp457-.Lfunc_begin0
	.quad	.Lset822
.Lset823 = .Ltmp458-.Lfunc_begin0
	.quad	.Lset823
.Lset824 = .Ltmp1459-.Ltmp1458          # Loc expr size
	.short	.Lset824
.Ltmp1458:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1459:
	.quad	0
	.quad	0
.Ldebug_loc85:
.Lset825 = .Ltmp460-.Lfunc_begin0
	.quad	.Lset825
.Lset826 = .Ltmp462-.Lfunc_begin0
	.quad	.Lset826
.Lset827 = .Ltmp1461-.Ltmp1460          # Loc expr size
	.short	.Lset827
.Ltmp1460:
	.byte	94                      # super-register
                                        # DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1461:
	.quad	0
	.quad	0
.Ldebug_loc86:
.Lset828 = .Ltmp467-.Lfunc_begin0
	.quad	.Lset828
.Lset829 = .Ltmp469-.Lfunc_begin0
	.quad	.Lset829
.Lset830 = .Ltmp1463-.Ltmp1462          # Loc expr size
	.short	.Lset830
.Ltmp1462:
	.byte	94                      # super-register
                                        # DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1463:
	.quad	0
	.quad	0
.Ldebug_loc87:
.Lset831 = .Lfunc_begin22-.Lfunc_begin0
	.quad	.Lset831
.Lset832 = .Ltmp494-.Lfunc_begin0
	.quad	.Lset832
.Lset833 = .Ltmp1465-.Ltmp1464          # Loc expr size
	.short	.Lset833
.Ltmp1464:
	.byte	85                      # DW_OP_reg5
.Ltmp1465:
	.quad	0
	.quad	0
.Ldebug_loc88:
.Lset834 = .Ltmp487-.Lfunc_begin0
	.quad	.Lset834
.Lset835 = .Ltmp496-.Lfunc_begin0
	.quad	.Lset835
.Lset836 = .Ltmp1467-.Ltmp1466          # Loc expr size
	.short	.Lset836
.Ltmp1466:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1467:
.Lset837 = .Ltmp505-.Lfunc_begin0
	.quad	.Lset837
.Lset838 = .Ltmp507-.Lfunc_begin0
	.quad	.Lset838
.Lset839 = .Ltmp1469-.Ltmp1468          # Loc expr size
	.short	.Lset839
.Ltmp1468:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1469:
	.quad	0
	.quad	0
.Ldebug_loc89:
.Lset840 = .Ltmp489-.Lfunc_begin0
	.quad	.Lset840
.Lset841 = .Ltmp495-.Lfunc_begin0
	.quad	.Lset841
.Lset842 = .Ltmp1471-.Ltmp1470          # Loc expr size
	.short	.Lset842
.Ltmp1470:
	.byte	86                      # super-register
                                        # DW_OP_reg6
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1471:
.Lset843 = .Ltmp495-.Lfunc_begin0
	.quad	.Lset843
.Lset844 = .Lfunc_end22-.Lfunc_begin0
	.quad	.Lset844
.Lset845 = .Ltmp1473-.Ltmp1472          # Loc expr size
	.short	.Lset845
.Ltmp1472:
	.byte	119                     # DW_OP_breg7
	.byte	120                     # 
.Ltmp1473:
	.quad	0
	.quad	0
.Ldebug_loc90:
.Lset846 = .Ltmp490-.Lfunc_begin0
	.quad	.Lset846
.Lset847 = .Ltmp496-.Lfunc_begin0
	.quad	.Lset847
.Lset848 = .Ltmp1475-.Ltmp1474          # Loc expr size
	.short	.Lset848
.Ltmp1474:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1475:
.Lset849 = .Ltmp506-.Lfunc_begin0
	.quad	.Lset849
.Lset850 = .Ltmp507-.Lfunc_begin0
	.quad	.Lset850
.Lset851 = .Ltmp1477-.Ltmp1476          # Loc expr size
	.short	.Lset851
.Ltmp1476:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1477:
	.quad	0
	.quad	0
.Ldebug_loc91:
.Lset852 = .Ltmp499-.Lfunc_begin0
	.quad	.Lset852
.Lset853 = .Ltmp504-.Lfunc_begin0
	.quad	.Lset853
.Lset854 = .Ltmp1479-.Ltmp1478          # Loc expr size
	.short	.Lset854
.Ltmp1478:
	.byte	100                     # DW_OP_reg20
.Ltmp1479:
	.quad	0
	.quad	0
.Ldebug_loc92:
.Lset855 = .Ltmp500-.Lfunc_begin0
	.quad	.Lset855
.Lset856 = .Ltmp504-.Lfunc_begin0
	.quad	.Lset856
.Lset857 = .Ltmp1481-.Ltmp1480          # Loc expr size
	.short	.Lset857
.Ltmp1480:
	.byte	99                      # DW_OP_reg19
.Ltmp1481:
	.quad	0
	.quad	0
.Ldebug_loc93:
.Lset858 = .Ltmp501-.Lfunc_begin0
	.quad	.Lset858
.Lset859 = .Ltmp504-.Lfunc_begin0
	.quad	.Lset859
.Lset860 = .Ltmp1483-.Ltmp1482          # Loc expr size
	.short	.Lset860
.Ltmp1482:
	.byte	101                     # DW_OP_reg21
.Ltmp1483:
	.quad	0
	.quad	0
.Ldebug_loc94:
.Lset861 = .Ltmp502-.Lfunc_begin0
	.quad	.Lset861
.Lset862 = .Ltmp504-.Lfunc_begin0
	.quad	.Lset862
.Lset863 = .Ltmp1485-.Ltmp1484          # Loc expr size
	.short	.Lset863
.Ltmp1484:
	.byte	97                      # DW_OP_reg17
.Ltmp1485:
	.quad	0
	.quad	0
.Ldebug_loc95:
.Lset864 = .Lfunc_begin23-.Lfunc_begin0
	.quad	.Lset864
.Lset865 = .Ltmp520-.Lfunc_begin0
	.quad	.Lset865
.Lset866 = .Ltmp1487-.Ltmp1486          # Loc expr size
	.short	.Lset866
.Ltmp1486:
	.byte	85                      # DW_OP_reg5
.Ltmp1487:
.Lset867 = .Ltmp520-.Lfunc_begin0
	.quad	.Lset867
.Lset868 = .Ltmp523-.Lfunc_begin0
	.quad	.Lset868
.Lset869 = .Ltmp1489-.Ltmp1488          # Loc expr size
	.short	.Lset869
.Ltmp1488:
	.byte	83                      # DW_OP_reg3
.Ltmp1489:
.Lset870 = .Ltmp523-.Lfunc_begin0
	.quad	.Lset870
.Lset871 = .Ltmp533-.Lfunc_begin0
	.quad	.Lset871
.Lset872 = .Ltmp1491-.Ltmp1490          # Loc expr size
	.short	.Lset872
.Ltmp1490:
	.byte	118                     # DW_OP_breg6
	.byte	80                      # 
.Ltmp1491:
.Lset873 = .Ltmp533-.Lfunc_begin0
	.quad	.Lset873
.Lset874 = .Ltmp541-.Lfunc_begin0
	.quad	.Lset874
.Lset875 = .Ltmp1493-.Ltmp1492          # Loc expr size
	.short	.Lset875
.Ltmp1492:
	.byte	88                      # DW_OP_reg8
.Ltmp1493:
.Lset876 = .Ltmp541-.Lfunc_begin0
	.quad	.Lset876
.Lset877 = .Ltmp552-.Lfunc_begin0
	.quad	.Lset877
.Lset878 = .Ltmp1495-.Ltmp1494          # Loc expr size
	.short	.Lset878
.Ltmp1494:
	.byte	118                     # DW_OP_breg6
	.byte	80                      # 
.Ltmp1495:
.Lset879 = .Ltmp564-.Lfunc_begin0
	.quad	.Lset879
.Lset880 = .Ltmp565-.Lfunc_begin0
	.quad	.Lset880
.Lset881 = .Ltmp1497-.Ltmp1496          # Loc expr size
	.short	.Lset881
.Ltmp1496:
	.byte	85                      # DW_OP_reg5
.Ltmp1497:
.Lset882 = .Ltmp565-.Lfunc_begin0
	.quad	.Lset882
.Lset883 = .Ltmp567-.Lfunc_begin0
	.quad	.Lset883
.Lset884 = .Ltmp1499-.Ltmp1498          # Loc expr size
	.short	.Lset884
.Ltmp1498:
	.byte	118                     # DW_OP_breg6
	.byte	80                      # 
.Ltmp1499:
.Lset885 = .Ltmp567-.Lfunc_begin0
	.quad	.Lset885
.Lset886 = .Ltmp575-.Lfunc_begin0
	.quad	.Lset886
.Lset887 = .Ltmp1501-.Ltmp1500          # Loc expr size
	.short	.Lset887
.Ltmp1500:
	.byte	82                      # DW_OP_reg2
.Ltmp1501:
	.quad	0
	.quad	0
.Ldebug_loc96:
.Lset888 = .Lfunc_begin23-.Lfunc_begin0
	.quad	.Lset888
.Lset889 = .Ltmp518-.Lfunc_begin0
	.quad	.Lset889
.Lset890 = .Ltmp1503-.Ltmp1502          # Loc expr size
	.short	.Lset890
.Ltmp1502:
	.byte	84                      # super-register
                                        # DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1503:
.Lset891 = .Ltmp518-.Lfunc_begin0
	.quad	.Lset891
.Lset892 = .Ltmp542-.Lfunc_begin0
	.quad	.Lset892
.Lset893 = .Ltmp1505-.Ltmp1504          # Loc expr size
	.short	.Lset893
.Ltmp1504:
	.byte	93                      # super-register
                                        # DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1505:
.Lset894 = .Ltmp542-.Lfunc_begin0
	.quad	.Lset894
.Lset895 = .Ltmp552-.Lfunc_begin0
	.quad	.Lset895
.Lset896 = .Ltmp1507-.Ltmp1506          # Loc expr size
	.short	.Lset896
.Ltmp1506:
	.byte	118                     # DW_OP_breg6
	.ascii	"\240\177"              # 
.Ltmp1507:
.Lset897 = .Ltmp565-.Lfunc_begin0
	.quad	.Lset897
.Lset898 = .Ltmp568-.Lfunc_begin0
	.quad	.Lset898
.Lset899 = .Ltmp1509-.Ltmp1508          # Loc expr size
	.short	.Lset899
.Ltmp1508:
	.byte	118                     # DW_OP_breg6
	.ascii	"\240\177"              # 
.Ltmp1509:
.Lset900 = .Ltmp568-.Lfunc_begin0
	.quad	.Lset900
.Lset901 = .Ltmp571-.Lfunc_begin0
	.quad	.Lset901
.Lset902 = .Ltmp1511-.Ltmp1510          # Loc expr size
	.short	.Lset902
.Ltmp1510:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1511:
	.quad	0
	.quad	0
.Ldebug_loc97:
.Lset903 = .Ltmp521-.Lfunc_begin0
	.quad	.Lset903
.Lset904 = .Ltmp543-.Lfunc_begin0
	.quad	.Lset904
.Lset905 = .Ltmp1513-.Ltmp1512          # Loc expr size
	.short	.Lset905
.Ltmp1512:
	.byte	92                      # DW_OP_reg12
.Ltmp1513:
.Lset906 = .Ltmp543-.Lfunc_begin0
	.quad	.Lset906
.Lset907 = .Ltmp550-.Lfunc_begin0
	.quad	.Lset907
.Lset908 = .Ltmp1515-.Ltmp1514          # Loc expr size
	.short	.Lset908
.Ltmp1514:
	.byte	95                      # DW_OP_reg15
.Ltmp1515:
.Lset909 = .Ltmp550-.Lfunc_begin0
	.quad	.Lset909
.Lset910 = .Ltmp553-.Lfunc_begin0
	.quad	.Lset910
.Lset911 = .Ltmp1517-.Ltmp1516          # Loc expr size
	.short	.Lset911
.Ltmp1516:
	.byte	83                      # DW_OP_reg3
.Ltmp1517:
.Lset912 = .Ltmp553-.Lfunc_begin0
	.quad	.Lset912
.Lset913 = .Ltmp563-.Lfunc_begin0
	.quad	.Lset913
.Lset914 = .Ltmp1519-.Ltmp1518          # Loc expr size
	.short	.Lset914
.Ltmp1518:
	.byte	118                     # DW_OP_breg6
	.ascii	"\260\177"              # 
.Ltmp1519:
.Lset915 = .Ltmp565-.Lfunc_begin0
	.quad	.Lset915
.Lset916 = .Ltmp566-.Lfunc_begin0
	.quad	.Lset916
.Lset917 = .Ltmp1521-.Ltmp1520          # Loc expr size
	.short	.Lset917
.Ltmp1520:
	.byte	83                      # DW_OP_reg3
.Ltmp1521:
.Lset918 = .Ltmp566-.Lfunc_begin0
	.quad	.Lset918
.Lset919 = .Ltmp586-.Lfunc_begin0
	.quad	.Lset919
.Lset920 = .Ltmp1523-.Ltmp1522          # Loc expr size
	.short	.Lset920
.Ltmp1522:
	.byte	118                     # DW_OP_breg6
	.ascii	"\260\177"              # 
.Ltmp1523:
.Lset921 = .Ltmp586-.Lfunc_begin0
	.quad	.Lset921
.Lset922 = .Ltmp587-.Lfunc_begin0
	.quad	.Lset922
.Lset923 = .Ltmp1525-.Ltmp1524          # Loc expr size
	.short	.Lset923
.Ltmp1524:
	.byte	83                      # DW_OP_reg3
.Ltmp1525:
	.quad	0
	.quad	0
.Ldebug_loc98:
.Lset924 = .Ltmp522-.Lfunc_begin0
	.quad	.Lset924
.Lset925 = .Ltmp525-.Lfunc_begin0
	.quad	.Lset925
.Lset926 = .Ltmp1527-.Ltmp1526          # Loc expr size
	.short	.Lset926
.Ltmp1526:
	.byte	16                      # DW_OP_constu
	.byte	1                       # 
.Ltmp1527:
.Lset927 = .Ltmp525-.Lfunc_begin0
	.quad	.Lset927
.Lset928 = .Ltmp526-.Lfunc_begin0
	.quad	.Lset928
.Lset929 = .Ltmp1529-.Ltmp1528          # Loc expr size
	.short	.Lset929
.Ltmp1528:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1529:
.Lset930 = .Ltmp526-.Lfunc_begin0
	.quad	.Lset930
.Lset931 = .Lfunc_end23-.Lfunc_begin0
	.quad	.Lset931
.Lset932 = .Ltmp1531-.Ltmp1530          # Loc expr size
	.short	.Lset932
.Ltmp1530:
	.byte	16                      # DW_OP_constu
	.byte	1                       # 
.Ltmp1531:
	.quad	0
	.quad	0
.Ldebug_loc99:
.Lset933 = .Ltmp527-.Lfunc_begin0
	.quad	.Lset933
.Lset934 = .Ltmp530-.Lfunc_begin0
	.quad	.Lset934
.Lset935 = .Ltmp1533-.Ltmp1532          # Loc expr size
	.short	.Lset935
.Ltmp1532:
	.byte	118                     # DW_OP_breg6
	.byte	72                      # 
.Ltmp1533:
	.quad	0
	.quad	0
.Ldebug_loc100:
.Lset936 = .Ltmp528-.Lfunc_begin0
	.quad	.Lset936
.Lset937 = .Ltmp530-.Lfunc_begin0
	.quad	.Lset937
.Lset938 = .Ltmp1535-.Ltmp1534          # Loc expr size
	.short	.Lset938
.Ltmp1534:
	.byte	83                      # DW_OP_reg3
.Ltmp1535:
	.quad	0
	.quad	0
.Ldebug_loc101:
.Lset939 = .Ltmp529-.Lfunc_begin0
	.quad	.Lset939
.Lset940 = .Ltmp530-.Lfunc_begin0
	.quad	.Lset940
.Lset941 = .Ltmp1537-.Ltmp1536          # Loc expr size
	.short	.Lset941
.Ltmp1536:
	.byte	94                      # DW_OP_reg14
.Ltmp1537:
	.quad	0
	.quad	0
.Ldebug_loc102:
.Lset942 = .Ltmp531-.Lfunc_begin0
	.quad	.Lset942
.Lset943 = .Ltmp539-.Lfunc_begin0
	.quad	.Lset943
.Lset944 = .Ltmp1539-.Ltmp1538          # Loc expr size
	.short	.Lset944
.Ltmp1538:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1539:
.Lset945 = .Ltmp539-.Lfunc_begin0
	.quad	.Lset945
.Lset946 = .Ltmp540-.Lfunc_begin0
	.quad	.Lset946
.Lset947 = .Ltmp1541-.Ltmp1540          # Loc expr size
	.short	.Lset947
.Ltmp1540:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1541:
.Lset948 = .Ltmp540-.Lfunc_begin0
	.quad	.Lset948
.Lset949 = .Lfunc_end23-.Lfunc_begin0
	.quad	.Lset949
.Lset950 = .Ltmp1543-.Ltmp1542          # Loc expr size
	.short	.Lset950
.Ltmp1542:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1543:
	.quad	0
	.quad	0
.Ldebug_loc103:
.Lset951 = .Ltmp532-.Lfunc_begin0
	.quad	.Lset951
.Lset952 = .Ltmp536-.Lfunc_begin0
	.quad	.Lset952
.Lset953 = .Ltmp1545-.Ltmp1544          # Loc expr size
	.short	.Lset953
.Ltmp1544:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1545:
	.quad	0
	.quad	0
.Ldebug_loc104:
.Lset954 = .Ltmp538-.Lfunc_begin0
	.quad	.Lset954
.Lset955 = .Ltmp539-.Lfunc_begin0
	.quad	.Lset955
.Lset956 = .Ltmp1547-.Ltmp1546          # Loc expr size
	.short	.Lset956
.Ltmp1546:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1547:
	.quad	0
	.quad	0
.Ldebug_loc105:
.Lset957 = .Ltmp544-.Lfunc_begin0
	.quad	.Lset957
.Lset958 = .Ltmp546-.Lfunc_begin0
	.quad	.Lset958
.Lset959 = .Ltmp1549-.Ltmp1548          # Loc expr size
	.short	.Lset959
.Ltmp1548:
	.byte	83                      # super-register
                                        # DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1549:
	.quad	0
	.quad	0
.Ldebug_loc106:
.Lset960 = .Ltmp549-.Lfunc_begin0
	.quad	.Lset960
.Lset961 = .Ltmp559-.Lfunc_begin0
	.quad	.Lset961
.Lset962 = .Ltmp1551-.Ltmp1550          # Loc expr size
	.short	.Lset962
.Ltmp1550:
	.byte	16                      # DW_OP_constu
	.ascii	"\377\377\377\377\377\377\377\377\377\001" # 
.Ltmp1551:
.Lset963 = .Ltmp559-.Lfunc_begin0
	.quad	.Lset963
.Lset964 = .Ltmp561-.Lfunc_begin0
	.quad	.Lset964
.Lset965 = .Ltmp1553-.Ltmp1552          # Loc expr size
	.short	.Lset965
.Ltmp1552:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1553:
.Lset966 = .Ltmp565-.Lfunc_begin0
	.quad	.Lset966
.Lset967 = .Ltmp569-.Lfunc_begin0
	.quad	.Lset967
.Lset968 = .Ltmp1555-.Ltmp1554          # Loc expr size
	.short	.Lset968
.Ltmp1554:
	.byte	16                      # DW_OP_constu
	.ascii	"\377\377\377\377\377\377\377\377\377\001" # 
.Ltmp1555:
.Lset969 = .Ltmp569-.Lfunc_begin0
	.quad	.Lset969
.Lset970 = .Ltmp576-.Lfunc_begin0
	.quad	.Lset970
.Lset971 = .Ltmp1557-.Ltmp1556          # Loc expr size
	.short	.Lset971
.Ltmp1556:
	.byte	81                      # super-register
                                        # DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1557:
.Lset972 = .Ltmp576-.Lfunc_begin0
	.quad	.Lset972
.Lset973 = .Ltmp582-.Lfunc_begin0
	.quad	.Lset973
.Lset974 = .Ltmp1559-.Ltmp1558          # Loc expr size
	.short	.Lset974
.Ltmp1558:
	.byte	92                      # super-register
                                        # DW_OP_reg12
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1559:
.Lset975 = .Ltmp582-.Lfunc_begin0
	.quad	.Lset975
.Lset976 = .Ltmp583-.Lfunc_begin0
	.quad	.Lset976
.Lset977 = .Ltmp1561-.Ltmp1560          # Loc expr size
	.short	.Lset977
.Ltmp1560:
	.byte	81                      # super-register
                                        # DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1561:
.Lset978 = .Ltmp583-.Lfunc_begin0
	.quad	.Lset978
.Lset979 = .Ltmp584-.Lfunc_begin0
	.quad	.Lset979
.Lset980 = .Ltmp1563-.Ltmp1562          # Loc expr size
	.short	.Lset980
.Ltmp1562:
	.byte	16                      # DW_OP_constu
	.ascii	"\377\377\377\377\377\377\377\377\377\001" # 
.Ltmp1563:
.Lset981 = .Ltmp584-.Lfunc_begin0
	.quad	.Lset981
.Lset982 = .Ltmp585-.Lfunc_begin0
	.quad	.Lset982
.Lset983 = .Ltmp1565-.Ltmp1564          # Loc expr size
	.short	.Lset983
.Ltmp1564:
	.byte	81                      # super-register
                                        # DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1565:
.Lset984 = .Ltmp585-.Lfunc_begin0
	.quad	.Lset984
.Lset985 = .Lfunc_end23-.Lfunc_begin0
	.quad	.Lset985
.Lset986 = .Ltmp1567-.Ltmp1566          # Loc expr size
	.short	.Lset986
.Ltmp1566:
	.byte	16                      # DW_OP_constu
	.ascii	"\377\377\377\377\377\377\377\377\377\001" # 
.Ltmp1567:
	.quad	0
	.quad	0
.Ldebug_loc107:
.Lset987 = .Ltmp549-.Lfunc_begin0
	.quad	.Lset987
.Lset988 = .Ltmp561-.Lfunc_begin0
	.quad	.Lset988
.Lset989 = .Ltmp1569-.Ltmp1568          # Loc expr size
	.short	.Lset989
.Ltmp1568:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1569:
.Lset990 = .Ltmp561-.Lfunc_begin0
	.quad	.Lset990
.Lset991 = .Ltmp563-.Lfunc_begin0
	.quad	.Lset991
.Lset992 = .Ltmp1571-.Ltmp1570          # Loc expr size
	.short	.Lset992
.Ltmp1570:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1571:
.Lset993 = .Ltmp565-.Lfunc_begin0
	.quad	.Lset993
.Lset994 = .Ltmp570-.Lfunc_begin0
	.quad	.Lset994
.Lset995 = .Ltmp1573-.Ltmp1572          # Loc expr size
	.short	.Lset995
.Ltmp1572:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1573:
.Lset996 = .Ltmp570-.Lfunc_begin0
	.quad	.Lset996
.Lset997 = .Ltmp583-.Lfunc_begin0
	.quad	.Lset997
.Lset998 = .Ltmp1575-.Ltmp1574          # Loc expr size
	.short	.Lset998
.Ltmp1574:
	.byte	93                      # super-register
                                        # DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1575:
.Lset999 = .Ltmp583-.Lfunc_begin0
	.quad	.Lset999
.Lset1000 = .Ltmp584-.Lfunc_begin0
	.quad	.Lset1000
.Lset1001 = .Ltmp1577-.Ltmp1576         # Loc expr size
	.short	.Lset1001
.Ltmp1576:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1577:
.Lset1002 = .Ltmp584-.Lfunc_begin0
	.quad	.Lset1002
.Lset1003 = .Ltmp585-.Lfunc_begin0
	.quad	.Lset1003
.Lset1004 = .Ltmp1579-.Ltmp1578         # Loc expr size
	.short	.Lset1004
.Ltmp1578:
	.byte	93                      # super-register
                                        # DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1579:
.Lset1005 = .Ltmp585-.Lfunc_begin0
	.quad	.Lset1005
.Lset1006 = .Lfunc_end23-.Lfunc_begin0
	.quad	.Lset1006
.Lset1007 = .Ltmp1581-.Ltmp1580         # Loc expr size
	.short	.Lset1007
.Ltmp1580:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1581:
	.quad	0
	.quad	0
.Ldebug_loc108:
.Lset1008 = .Ltmp549-.Lfunc_begin0
	.quad	.Lset1008
.Lset1009 = .Ltmp558-.Lfunc_begin0
	.quad	.Lset1009
.Lset1010 = .Ltmp1583-.Ltmp1582         # Loc expr size
	.short	.Lset1010
.Ltmp1582:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1583:
.Lset1011 = .Ltmp558-.Lfunc_begin0
	.quad	.Lset1011
.Lset1012 = .Ltmp563-.Lfunc_begin0
	.quad	.Lset1012
.Lset1013 = .Ltmp1585-.Ltmp1584         # Loc expr size
	.short	.Lset1013
.Ltmp1584:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1585:
.Lset1014 = .Ltmp565-.Lfunc_begin0
	.quad	.Lset1014
.Lset1015 = .Ltmp574-.Lfunc_begin0
	.quad	.Lset1015
.Lset1016 = .Ltmp1587-.Ltmp1586         # Loc expr size
	.short	.Lset1016
.Ltmp1586:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1587:
.Lset1017 = .Ltmp574-.Lfunc_begin0
	.quad	.Lset1017
.Lset1018 = .Ltmp577-.Lfunc_begin0
	.quad	.Lset1018
.Lset1019 = .Ltmp1589-.Ltmp1588         # Loc expr size
	.short	.Lset1019
.Ltmp1588:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1589:
.Lset1020 = .Ltmp577-.Lfunc_begin0
	.quad	.Lset1020
.Lset1021 = .Ltmp581-.Lfunc_begin0
	.quad	.Lset1021
.Lset1022 = .Ltmp1591-.Ltmp1590         # Loc expr size
	.short	.Lset1022
.Ltmp1590:
	.byte	95                      # super-register
                                        # DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1591:
.Lset1023 = .Ltmp581-.Lfunc_begin0
	.quad	.Lset1023
.Lset1024 = .Ltmp583-.Lfunc_begin0
	.quad	.Lset1024
.Lset1025 = .Ltmp1593-.Ltmp1592         # Loc expr size
	.short	.Lset1025
.Ltmp1592:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1593:
.Lset1026 = .Ltmp583-.Lfunc_begin0
	.quad	.Lset1026
.Lset1027 = .Ltmp584-.Lfunc_begin0
	.quad	.Lset1027
.Lset1028 = .Ltmp1595-.Ltmp1594         # Loc expr size
	.short	.Lset1028
.Ltmp1594:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1595:
.Lset1029 = .Ltmp584-.Lfunc_begin0
	.quad	.Lset1029
.Lset1030 = .Ltmp585-.Lfunc_begin0
	.quad	.Lset1030
.Lset1031 = .Ltmp1597-.Ltmp1596         # Loc expr size
	.short	.Lset1031
.Ltmp1596:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1597:
.Lset1032 = .Ltmp585-.Lfunc_begin0
	.quad	.Lset1032
.Lset1033 = .Ltmp585-.Lfunc_begin0
	.quad	.Lset1033
.Lset1034 = .Ltmp1599-.Ltmp1598         # Loc expr size
	.short	.Lset1034
.Ltmp1598:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1599:
.Lset1035 = .Ltmp585-.Lfunc_begin0
	.quad	.Lset1035
.Lset1036 = .Lfunc_end23-.Lfunc_begin0
	.quad	.Lset1036
.Lset1037 = .Ltmp1601-.Ltmp1600         # Loc expr size
	.short	.Lset1037
.Ltmp1600:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1601:
	.quad	0
	.quad	0
.Ldebug_loc109:
.Lset1038 = .Ltmp554-.Lfunc_begin0
	.quad	.Lset1038
.Lset1039 = .Ltmp556-.Lfunc_begin0
	.quad	.Lset1039
.Lset1040 = .Ltmp1603-.Ltmp1602         # Loc expr size
	.short	.Lset1040
.Ltmp1602:
	.byte	84                      # super-register
                                        # DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1603:
	.quad	0
	.quad	0
.Ldebug_loc110:
.Lset1041 = .Ltmp573-.Lfunc_begin0
	.quad	.Lset1041
.Lset1042 = .Ltmp578-.Lfunc_begin0
	.quad	.Lset1042
.Lset1043 = .Ltmp1605-.Ltmp1604         # Loc expr size
	.short	.Lset1043
.Ltmp1604:
	.byte	94                      # super-register
                                        # DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1605:
	.quad	0
	.quad	0
.Ldebug_loc111:
.Lset1044 = .Lfunc_begin24-.Lfunc_begin0
	.quad	.Lset1044
.Lset1045 = .Ltmp609-.Lfunc_begin0
	.quad	.Lset1045
.Lset1046 = .Ltmp1607-.Ltmp1606         # Loc expr size
	.short	.Lset1046
.Ltmp1606:
	.byte	85                      # DW_OP_reg5
.Ltmp1607:
.Lset1047 = .Ltmp609-.Lfunc_begin0
	.quad	.Lset1047
.Lset1048 = .Ltmp649-.Lfunc_begin0
	.quad	.Lset1048
.Lset1049 = .Ltmp1609-.Ltmp1608         # Loc expr size
	.short	.Lset1049
.Ltmp1608:
	.byte	119                     # DW_OP_breg7
	.byte	120                     # 
.Ltmp1609:
.Lset1050 = .Ltmp649-.Lfunc_begin0
	.quad	.Lset1050
.Lset1051 = .Ltmp650-.Lfunc_begin0
	.quad	.Lset1051
.Lset1052 = .Ltmp1611-.Ltmp1610         # Loc expr size
	.short	.Lset1052
.Ltmp1610:
	.byte	85                      # DW_OP_reg5
.Ltmp1611:
	.quad	0
	.quad	0
.Ldebug_loc112:
.Lset1053 = .Ltmp603-.Lfunc_begin0
	.quad	.Lset1053
.Lset1054 = .Ltmp648-.Lfunc_begin0
	.quad	.Lset1054
.Lset1055 = .Ltmp1613-.Ltmp1612         # Loc expr size
	.short	.Lset1055
.Ltmp1612:
	.byte	93                      # super-register
                                        # DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1613:
	.quad	0
	.quad	0
.Ldebug_loc113:
.Lset1056 = .Ltmp604-.Lfunc_begin0
	.quad	.Lset1056
.Lset1057 = .Ltmp613-.Lfunc_begin0
	.quad	.Lset1057
.Lset1058 = .Ltmp1615-.Ltmp1614         # Loc expr size
	.short	.Lset1058
.Ltmp1614:
	.byte	90                      # DW_OP_reg10
.Ltmp1615:
.Lset1059 = .Ltmp625-.Lfunc_begin0
	.quad	.Lset1059
.Lset1060 = .Ltmp626-.Lfunc_begin0
	.quad	.Lset1060
.Lset1061 = .Ltmp1617-.Ltmp1616         # Loc expr size
	.short	.Lset1061
.Ltmp1616:
	.byte	90                      # DW_OP_reg10
.Ltmp1617:
.Lset1062 = .Ltmp628-.Lfunc_begin0
	.quad	.Lset1062
.Lset1063 = .Ltmp635-.Lfunc_begin0
	.quad	.Lset1063
.Lset1064 = .Ltmp1619-.Ltmp1618         # Loc expr size
	.short	.Lset1064
.Ltmp1618:
	.byte	90                      # DW_OP_reg10
.Ltmp1619:
.Lset1065 = .Ltmp642-.Lfunc_begin0
	.quad	.Lset1065
.Lset1066 = .Ltmp643-.Lfunc_begin0
	.quad	.Lset1066
.Lset1067 = .Ltmp1621-.Ltmp1620         # Loc expr size
	.short	.Lset1067
.Ltmp1620:
	.byte	90                      # DW_OP_reg10
.Ltmp1621:
.Lset1068 = .Ltmp645-.Lfunc_begin0
	.quad	.Lset1068
.Lset1069 = .Ltmp648-.Lfunc_begin0
	.quad	.Lset1069
.Lset1070 = .Ltmp1623-.Ltmp1622         # Loc expr size
	.short	.Lset1070
.Ltmp1622:
	.byte	90                      # DW_OP_reg10
.Ltmp1623:
	.quad	0
	.quad	0
.Ldebug_loc114:
.Lset1071 = .Ltmp605-.Lfunc_begin0
	.quad	.Lset1071
.Lset1072 = .Ltmp613-.Lfunc_begin0
	.quad	.Lset1072
.Lset1073 = .Ltmp1625-.Ltmp1624         # Loc expr size
	.short	.Lset1073
.Ltmp1624:
	.byte	84                      # DW_OP_reg4
.Ltmp1625:
.Lset1074 = .Ltmp615-.Lfunc_begin0
	.quad	.Lset1074
.Lset1075 = .Ltmp626-.Lfunc_begin0
	.quad	.Lset1075
.Lset1076 = .Ltmp1627-.Ltmp1626         # Loc expr size
	.short	.Lset1076
.Ltmp1626:
	.byte	92                      # DW_OP_reg12
.Ltmp1627:
.Lset1077 = .Ltmp629-.Lfunc_begin0
	.quad	.Lset1077
.Lset1078 = .Ltmp635-.Lfunc_begin0
	.quad	.Lset1078
.Lset1079 = .Ltmp1629-.Ltmp1628         # Loc expr size
	.short	.Lset1079
.Ltmp1628:
	.byte	84                      # DW_OP_reg4
.Ltmp1629:
.Lset1080 = .Ltmp637-.Lfunc_begin0
	.quad	.Lset1080
.Lset1081 = .Ltmp643-.Lfunc_begin0
	.quad	.Lset1081
.Lset1082 = .Ltmp1631-.Ltmp1630         # Loc expr size
	.short	.Lset1082
.Ltmp1630:
	.byte	80                      # DW_OP_reg0
.Ltmp1631:
.Lset1083 = .Ltmp646-.Lfunc_begin0
	.quad	.Lset1083
.Lset1084 = .Ltmp648-.Lfunc_begin0
	.quad	.Lset1084
.Lset1085 = .Ltmp1633-.Ltmp1632         # Loc expr size
	.short	.Lset1085
.Ltmp1632:
	.byte	84                      # DW_OP_reg4
.Ltmp1633:
	.quad	0
	.quad	0
.Ldebug_loc115:
.Lset1086 = .Ltmp611-.Lfunc_begin0
	.quad	.Lset1086
.Lset1087 = .Ltmp613-.Lfunc_begin0
	.quad	.Lset1087
.Lset1088 = .Ltmp1635-.Ltmp1634         # Loc expr size
	.short	.Lset1088
.Ltmp1634:
	.byte	89                      # super-register
                                        # DW_OP_reg9
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1635:
	.quad	0
	.quad	0
.Ldebug_loc116:
.Lset1089 = .Ltmp618-.Lfunc_begin0
	.quad	.Lset1089
.Lset1090 = .Ltmp622-.Lfunc_begin0
	.quad	.Lset1090
.Lset1091 = .Ltmp1637-.Ltmp1636         # Loc expr size
	.short	.Lset1091
.Ltmp1636:
	.byte	81                      # super-register
                                        # DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1637:
	.quad	0
	.quad	0
.Ldebug_loc117:
.Lset1092 = .Ltmp618-.Lfunc_begin0
	.quad	.Lset1092
.Lset1093 = .Ltmp622-.Lfunc_begin0
	.quad	.Lset1093
.Lset1094 = .Ltmp1639-.Ltmp1638         # Loc expr size
	.short	.Lset1094
.Ltmp1638:
	.byte	81                      # super-register
                                        # DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1639:
	.quad	0
	.quad	0
.Ldebug_loc118:
.Lset1095 = .Ltmp622-.Lfunc_begin0
	.quad	.Lset1095
.Lset1096 = .Ltmp624-.Lfunc_begin0
	.quad	.Lset1096
.Lset1097 = .Ltmp1641-.Ltmp1640         # Loc expr size
	.short	.Lset1097
.Ltmp1640:
	.byte	81                      # super-register
                                        # DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1641:
	.quad	0
	.quad	0
.Ldebug_loc119:
.Lset1098 = .Ltmp630-.Lfunc_begin0
	.quad	.Lset1098
.Lset1099 = .Ltmp631-.Lfunc_begin0
	.quad	.Lset1099
.Lset1100 = .Ltmp1643-.Ltmp1642         # Loc expr size
	.short	.Lset1100
.Ltmp1642:
	.byte	88                      # super-register
                                        # DW_OP_reg8
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1643:
	.quad	0
	.quad	0
.Ldebug_loc120:
.Lset1101 = .Ltmp633-.Lfunc_begin0
	.quad	.Lset1101
.Lset1102 = .Ltmp635-.Lfunc_begin0
	.quad	.Lset1102
.Lset1103 = .Ltmp1645-.Ltmp1644         # Loc expr size
	.short	.Lset1103
.Ltmp1644:
	.byte	91                      # super-register
                                        # DW_OP_reg11
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1645:
	.quad	0
	.quad	0
.Ldebug_loc121:
.Lset1104 = .Ltmp647-.Lfunc_begin0
	.quad	.Lset1104
.Lset1105 = .Ltmp648-.Lfunc_begin0
	.quad	.Lset1105
.Lset1106 = .Ltmp1647-.Ltmp1646         # Loc expr size
	.short	.Lset1106
.Ltmp1646:
	.byte	88                      # super-register
                                        # DW_OP_reg8
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1647:
	.quad	0
	.quad	0
.Ldebug_loc122:
.Lset1107 = .Lfunc_begin26-.Lfunc_begin0
	.quad	.Lset1107
.Lset1108 = .Ltmp664-.Lfunc_begin0
	.quad	.Lset1108
.Lset1109 = .Ltmp1649-.Ltmp1648         # Loc expr size
	.short	.Lset1109
.Ltmp1648:
	.byte	85                      # DW_OP_reg5
.Ltmp1649:
.Lset1110 = .Ltmp664-.Lfunc_begin0
	.quad	.Lset1110
.Lset1111 = .Ltmp666-.Lfunc_begin0
	.quad	.Lset1111
.Lset1112 = .Ltmp1651-.Ltmp1650         # Loc expr size
	.short	.Lset1112
.Ltmp1650:
	.byte	95                      # DW_OP_reg15
.Ltmp1651:
.Lset1113 = .Ltmp667-.Lfunc_begin0
	.quad	.Lset1113
.Lset1114 = .Ltmp668-.Lfunc_begin0
	.quad	.Lset1114
.Lset1115 = .Ltmp1653-.Ltmp1652         # Loc expr size
	.short	.Lset1115
.Ltmp1652:
	.byte	95                      # DW_OP_reg15
.Ltmp1653:
.Lset1116 = .Ltmp669-.Lfunc_begin0
	.quad	.Lset1116
.Lset1117 = .Ltmp679-.Lfunc_begin0
	.quad	.Lset1117
.Lset1118 = .Ltmp1655-.Ltmp1654         # Loc expr size
	.short	.Lset1118
.Ltmp1654:
	.byte	95                      # DW_OP_reg15
.Ltmp1655:
	.quad	0
	.quad	0
.Ldebug_loc123:
.Lset1119 = .Lfunc_begin26-.Lfunc_begin0
	.quad	.Lset1119
.Lset1120 = .Ltmp663-.Lfunc_begin0
	.quad	.Lset1120
.Lset1121 = .Ltmp1657-.Ltmp1656         # Loc expr size
	.short	.Lset1121
.Ltmp1656:
	.byte	84                      # super-register
                                        # DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1657:
.Lset1122 = .Ltmp663-.Lfunc_begin0
	.quad	.Lset1122
.Lset1123 = .Ltmp665-.Lfunc_begin0
	.quad	.Lset1123
.Lset1124 = .Ltmp1659-.Ltmp1658         # Loc expr size
	.short	.Lset1124
.Ltmp1658:
	.byte	92                      # super-register
                                        # DW_OP_reg12
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1659:
.Lset1125 = .Ltmp667-.Lfunc_begin0
	.quad	.Lset1125
.Lset1126 = .Ltmp668-.Lfunc_begin0
	.quad	.Lset1126
.Lset1127 = .Ltmp1661-.Ltmp1660         # Loc expr size
	.short	.Lset1127
.Ltmp1660:
	.byte	92                      # super-register
                                        # DW_OP_reg12
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1661:
.Lset1128 = .Ltmp669-.Lfunc_begin0
	.quad	.Lset1128
.Lset1129 = .Ltmp688-.Lfunc_begin0
	.quad	.Lset1129
.Lset1130 = .Ltmp1663-.Ltmp1662         # Loc expr size
	.short	.Lset1130
.Ltmp1662:
	.byte	92                      # super-register
                                        # DW_OP_reg12
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1663:
	.quad	0
	.quad	0
.Ldebug_loc124:
.Lset1131 = .Ltmp670-.Lfunc_begin0
	.quad	.Lset1131
.Lset1132 = .Ltmp680-.Lfunc_begin0
	.quad	.Lset1132
.Lset1133 = .Ltmp1665-.Ltmp1664         # Loc expr size
	.short	.Lset1133
.Ltmp1664:
	.byte	93                      # DW_OP_reg13
.Ltmp1665:
.Lset1134 = .Ltmp680-.Lfunc_begin0
	.quad	.Lset1134
.Lset1135 = .Ltmp687-.Lfunc_begin0
	.quad	.Lset1135
.Lset1136 = .Ltmp1667-.Ltmp1666         # Loc expr size
	.short	.Lset1136
.Ltmp1666:
	.byte	118                     # DW_OP_breg6
	.ascii	"\260\177"              # 
.Ltmp1667:
.Lset1137 = .Ltmp687-.Lfunc_begin0
	.quad	.Lset1137
.Lset1138 = .Ltmp689-.Lfunc_begin0
	.quad	.Lset1138
.Lset1139 = .Ltmp1669-.Ltmp1668         # Loc expr size
	.short	.Lset1139
.Ltmp1668:
	.byte	80                      # DW_OP_reg0
.Ltmp1669:
.Lset1140 = .Ltmp690-.Lfunc_begin0
	.quad	.Lset1140
.Lset1141 = .Ltmp690-.Lfunc_begin0
	.quad	.Lset1141
.Lset1142 = .Ltmp1671-.Ltmp1670         # Loc expr size
	.short	.Lset1142
.Ltmp1670:
	.byte	80                      # DW_OP_reg0
.Ltmp1671:
.Lset1143 = .Ltmp690-.Lfunc_begin0
	.quad	.Lset1143
.Lset1144 = .Ltmp701-.Lfunc_begin0
	.quad	.Lset1144
.Lset1145 = .Ltmp1673-.Ltmp1672         # Loc expr size
	.short	.Lset1145
.Ltmp1672:
	.byte	118                     # DW_OP_breg6
	.ascii	"\260\177"              # 
.Ltmp1673:
.Lset1146 = .Ltmp701-.Lfunc_begin0
	.quad	.Lset1146
.Lset1147 = .Ltmp702-.Lfunc_begin0
	.quad	.Lset1147
.Lset1148 = .Ltmp1675-.Ltmp1674         # Loc expr size
	.short	.Lset1148
.Ltmp1674:
	.byte	83                      # DW_OP_reg3
.Ltmp1675:
	.quad	0
	.quad	0
.Ldebug_loc125:
.Lset1149 = .Ltmp671-.Lfunc_begin0
	.quad	.Lset1149
.Lset1150 = .Ltmp678-.Lfunc_begin0
	.quad	.Lset1150
.Lset1151 = .Ltmp1677-.Ltmp1676         # Loc expr size
	.short	.Lset1151
.Ltmp1676:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1677:
.Lset1152 = .Ltmp678-.Lfunc_begin0
	.quad	.Lset1152
.Lset1153 = .Ltmp679-.Lfunc_begin0
	.quad	.Lset1153
.Lset1154 = .Ltmp1679-.Ltmp1678         # Loc expr size
	.short	.Lset1154
.Ltmp1678:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1679:
.Lset1155 = .Ltmp679-.Lfunc_begin0
	.quad	.Lset1155
.Lset1156 = .Lfunc_end26-.Lfunc_begin0
	.quad	.Lset1156
.Lset1157 = .Ltmp1681-.Ltmp1680         # Loc expr size
	.short	.Lset1157
.Ltmp1680:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1681:
	.quad	0
	.quad	0
.Ldebug_loc126:
.Lset1158 = .Ltmp672-.Lfunc_begin0
	.quad	.Lset1158
.Lset1159 = .Ltmp675-.Lfunc_begin0
	.quad	.Lset1159
.Lset1160 = .Ltmp1683-.Ltmp1682         # Loc expr size
	.short	.Lset1160
.Ltmp1682:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1683:
	.quad	0
	.quad	0
.Ldebug_loc127:
.Lset1161 = .Ltmp677-.Lfunc_begin0
	.quad	.Lset1161
.Lset1162 = .Ltmp678-.Lfunc_begin0
	.quad	.Lset1162
.Lset1163 = .Ltmp1685-.Ltmp1684         # Loc expr size
	.short	.Lset1163
.Ltmp1684:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1685:
	.quad	0
	.quad	0
.Ldebug_loc128:
.Lset1164 = .Ltmp681-.Lfunc_begin0
	.quad	.Lset1164
.Lset1165 = .Ltmp683-.Lfunc_begin0
	.quad	.Lset1165
.Lset1166 = .Ltmp1687-.Ltmp1686         # Loc expr size
	.short	.Lset1166
.Ltmp1686:
	.byte	93                      # super-register
                                        # DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1687:
	.quad	0
	.quad	0
.Ldebug_loc129:
.Lset1167 = .Ltmp686-.Lfunc_begin0
	.quad	.Lset1167
.Lset1168 = .Ltmp696-.Lfunc_begin0
	.quad	.Lset1168
.Lset1169 = .Ltmp1689-.Ltmp1688         # Loc expr size
	.short	.Lset1169
.Ltmp1688:
	.byte	16                      # DW_OP_constu
	.ascii	"\377\377\377\377\377\377\377\377\377\001" # 
.Ltmp1689:
.Lset1170 = .Ltmp696-.Lfunc_begin0
	.quad	.Lset1170
.Lset1171 = .Ltmp698-.Lfunc_begin0
	.quad	.Lset1171
.Lset1172 = .Ltmp1691-.Ltmp1690         # Loc expr size
	.short	.Lset1172
.Ltmp1690:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1691:
.Lset1173 = .Ltmp700-.Lfunc_begin0
	.quad	.Lset1173
.Lset1174 = .Lfunc_end26-.Lfunc_begin0
	.quad	.Lset1174
.Lset1175 = .Ltmp1693-.Ltmp1692         # Loc expr size
	.short	.Lset1175
.Ltmp1692:
	.byte	16                      # DW_OP_constu
	.ascii	"\377\377\377\377\377\377\377\377\377\001" # 
.Ltmp1693:
	.quad	0
	.quad	0
.Ldebug_loc130:
.Lset1176 = .Ltmp686-.Lfunc_begin0
	.quad	.Lset1176
.Lset1177 = .Ltmp698-.Lfunc_begin0
	.quad	.Lset1177
.Lset1178 = .Ltmp1695-.Ltmp1694         # Loc expr size
	.short	.Lset1178
.Ltmp1694:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1695:
.Lset1179 = .Ltmp698-.Lfunc_begin0
	.quad	.Lset1179
.Lset1180 = .Ltmp700-.Lfunc_begin0
	.quad	.Lset1180
.Lset1181 = .Ltmp1697-.Ltmp1696         # Loc expr size
	.short	.Lset1181
.Ltmp1696:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1697:
.Lset1182 = .Ltmp700-.Lfunc_begin0
	.quad	.Lset1182
.Lset1183 = .Lfunc_end26-.Lfunc_begin0
	.quad	.Lset1183
.Lset1184 = .Ltmp1699-.Ltmp1698         # Loc expr size
	.short	.Lset1184
.Ltmp1698:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1699:
	.quad	0
	.quad	0
.Ldebug_loc131:
.Lset1185 = .Ltmp686-.Lfunc_begin0
	.quad	.Lset1185
.Lset1186 = .Ltmp695-.Lfunc_begin0
	.quad	.Lset1186
.Lset1187 = .Ltmp1701-.Ltmp1700         # Loc expr size
	.short	.Lset1187
.Ltmp1700:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1701:
.Lset1188 = .Ltmp695-.Lfunc_begin0
	.quad	.Lset1188
.Lset1189 = .Ltmp700-.Lfunc_begin0
	.quad	.Lset1189
.Lset1190 = .Ltmp1703-.Ltmp1702         # Loc expr size
	.short	.Lset1190
.Ltmp1702:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1703:
.Lset1191 = .Ltmp700-.Lfunc_begin0
	.quad	.Lset1191
.Lset1192 = .Lfunc_end26-.Lfunc_begin0
	.quad	.Lset1192
.Lset1193 = .Ltmp1705-.Ltmp1704         # Loc expr size
	.short	.Lset1193
.Ltmp1704:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1705:
	.quad	0
	.quad	0
.Ldebug_loc132:
.Lset1194 = .Ltmp691-.Lfunc_begin0
	.quad	.Lset1194
.Lset1195 = .Ltmp693-.Lfunc_begin0
	.quad	.Lset1195
.Lset1196 = .Ltmp1707-.Ltmp1706         # Loc expr size
	.short	.Lset1196
.Ltmp1706:
	.byte	84                      # super-register
                                        # DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1707:
	.quad	0
	.quad	0
.Ldebug_loc133:
.Lset1197 = .Lfunc_begin27-.Lfunc_begin0
	.quad	.Lset1197
.Lset1198 = .Ltmp722-.Lfunc_begin0
	.quad	.Lset1198
.Lset1199 = .Ltmp1709-.Ltmp1708         # Loc expr size
	.short	.Lset1199
.Ltmp1708:
	.byte	85                      # DW_OP_reg5
.Ltmp1709:
.Lset1200 = .Ltmp722-.Lfunc_begin0
	.quad	.Lset1200
.Lset1201 = .Ltmp745-.Lfunc_begin0
	.quad	.Lset1201
.Lset1202 = .Ltmp1711-.Ltmp1710         # Loc expr size
	.short	.Lset1202
.Ltmp1710:
	.byte	119                     # DW_OP_breg7
	.byte	120                     # 
.Ltmp1711:
.Lset1203 = .Ltmp745-.Lfunc_begin0
	.quad	.Lset1203
.Lset1204 = .Ltmp746-.Lfunc_begin0
	.quad	.Lset1204
.Lset1205 = .Ltmp1713-.Ltmp1712         # Loc expr size
	.short	.Lset1205
.Ltmp1712:
	.byte	85                      # DW_OP_reg5
.Ltmp1713:
.Lset1206 = .Ltmp746-.Lfunc_begin0
	.quad	.Lset1206
.Lset1207 = .Ltmp747-.Lfunc_begin0
	.quad	.Lset1207
.Lset1208 = .Ltmp1715-.Ltmp1714         # Loc expr size
	.short	.Lset1208
.Ltmp1714:
	.byte	119                     # DW_OP_breg7
	.byte	120                     # 
.Ltmp1715:
.Lset1209 = .Ltmp747-.Lfunc_begin0
	.quad	.Lset1209
.Lset1210 = .Ltmp748-.Lfunc_begin0
	.quad	.Lset1210
.Lset1211 = .Ltmp1717-.Ltmp1716         # Loc expr size
	.short	.Lset1211
.Ltmp1716:
	.byte	86                      # DW_OP_reg6
.Ltmp1717:
	.quad	0
	.quad	0
.Ldebug_loc134:
.Lset1212 = .Ltmp717-.Lfunc_begin0
	.quad	.Lset1212
.Lset1213 = .Ltmp732-.Lfunc_begin0
	.quad	.Lset1213
.Lset1214 = .Ltmp1719-.Ltmp1718         # Loc expr size
	.short	.Lset1214
.Ltmp1718:
	.byte	16                      # DW_OP_constu
	.ascii	"\377\377\377\377\377\377\377\377\377\001" # 
.Ltmp1719:
.Lset1215 = .Ltmp732-.Lfunc_begin0
	.quad	.Lset1215
.Lset1216 = .Ltmp736-.Lfunc_begin0
	.quad	.Lset1216
.Lset1217 = .Ltmp1721-.Ltmp1720         # Loc expr size
	.short	.Lset1217
.Ltmp1720:
	.byte	84                      # super-register
                                        # DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1721:
.Lset1218 = .Ltmp740-.Lfunc_begin0
	.quad	.Lset1218
.Lset1219 = .Lfunc_end27-.Lfunc_begin0
	.quad	.Lset1219
.Lset1220 = .Ltmp1723-.Ltmp1722         # Loc expr size
	.short	.Lset1220
.Ltmp1722:
	.byte	16                      # DW_OP_constu
	.ascii	"\377\377\377\377\377\377\377\377\377\001" # 
.Ltmp1723:
	.quad	0
	.quad	0
.Ldebug_loc135:
.Lset1221 = .Ltmp717-.Lfunc_begin0
	.quad	.Lset1221
.Lset1222 = .Ltmp732-.Lfunc_begin0
	.quad	.Lset1222
.Lset1223 = .Ltmp1725-.Ltmp1724         # Loc expr size
	.short	.Lset1223
.Ltmp1724:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1725:
.Lset1224 = .Ltmp732-.Lfunc_begin0
	.quad	.Lset1224
.Lset1225 = .Ltmp736-.Lfunc_begin0
	.quad	.Lset1225
.Lset1226 = .Ltmp1727-.Ltmp1726         # Loc expr size
	.short	.Lset1226
.Ltmp1726:
	.byte	84                      # super-register
                                        # DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1727:
.Lset1227 = .Ltmp740-.Lfunc_begin0
	.quad	.Lset1227
.Lset1228 = .Lfunc_end27-.Lfunc_begin0
	.quad	.Lset1228
.Lset1229 = .Ltmp1729-.Ltmp1728         # Loc expr size
	.short	.Lset1229
.Ltmp1728:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1729:
	.quad	0
	.quad	0
.Ldebug_loc136:
.Lset1230 = .Ltmp717-.Lfunc_begin0
	.quad	.Lset1230
.Lset1231 = .Ltmp736-.Lfunc_begin0
	.quad	.Lset1231
.Lset1232 = .Ltmp1731-.Ltmp1730         # Loc expr size
	.short	.Lset1232
.Ltmp1730:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1731:
.Lset1233 = .Ltmp736-.Lfunc_begin0
	.quad	.Lset1233
.Lset1234 = .Ltmp740-.Lfunc_begin0
	.quad	.Lset1234
.Lset1235 = .Ltmp1733-.Ltmp1732         # Loc expr size
	.short	.Lset1235
.Ltmp1732:
	.byte	84                      # super-register
                                        # DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1733:
.Lset1236 = .Ltmp740-.Lfunc_begin0
	.quad	.Lset1236
.Lset1237 = .Lfunc_end27-.Lfunc_begin0
	.quad	.Lset1237
.Lset1238 = .Ltmp1735-.Ltmp1734         # Loc expr size
	.short	.Lset1238
.Ltmp1734:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1735:
	.quad	0
	.quad	0
.Ldebug_loc137:
.Lset1239 = .Ltmp718-.Lfunc_begin0
	.quad	.Lset1239
.Lset1240 = .Ltmp727-.Lfunc_begin0
	.quad	.Lset1240
.Lset1241 = .Ltmp1737-.Ltmp1736         # Loc expr size
	.short	.Lset1241
.Ltmp1736:
	.byte	88                      # super-register
                                        # DW_OP_reg8
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1737:
.Lset1242 = .Ltmp744-.Lfunc_begin0
	.quad	.Lset1242
.Lset1243 = .Ltmp745-.Lfunc_begin0
	.quad	.Lset1243
.Lset1244 = .Ltmp1739-.Ltmp1738         # Loc expr size
	.short	.Lset1244
.Ltmp1738:
	.byte	88                      # super-register
                                        # DW_OP_reg8
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1739:
	.quad	0
	.quad	0
.Ldebug_loc138:
.Lset1245 = .Ltmp721-.Lfunc_begin0
	.quad	.Lset1245
.Lset1246 = .Ltmp745-.Lfunc_begin0
	.quad	.Lset1246
.Lset1247 = .Ltmp1741-.Ltmp1740         # Loc expr size
	.short	.Lset1247
.Ltmp1740:
	.byte	93                      # super-register
                                        # DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1741:
	.quad	0
	.quad	0
.Ldebug_loc139:
.Lset1248 = .Ltmp723-.Lfunc_begin0
	.quad	.Lset1248
.Lset1249 = .Ltmp727-.Lfunc_begin0
	.quad	.Lset1249
.Lset1250 = .Ltmp1743-.Ltmp1742         # Loc expr size
	.short	.Lset1250
.Ltmp1742:
	.byte	86                      # DW_OP_reg6
.Ltmp1743:
.Lset1251 = .Ltmp729-.Lfunc_begin0
	.quad	.Lset1251
.Lset1252 = .Ltmp740-.Lfunc_begin0
	.quad	.Lset1252
.Lset1253 = .Ltmp1745-.Ltmp1744         # Loc expr size
	.short	.Lset1253
.Ltmp1744:
	.byte	92                      # DW_OP_reg12
.Ltmp1745:
.Lset1254 = .Ltmp743-.Lfunc_begin0
	.quad	.Lset1254
.Lset1255 = .Ltmp745-.Lfunc_begin0
	.quad	.Lset1255
.Lset1256 = .Ltmp1747-.Ltmp1746         # Loc expr size
	.short	.Lset1256
.Ltmp1746:
	.byte	86                      # DW_OP_reg6
.Ltmp1747:
	.quad	0
	.quad	0
.Ldebug_loc140:
.Lset1257 = .Ltmp724-.Lfunc_begin0
	.quad	.Lset1257
.Lset1258 = .Ltmp727-.Lfunc_begin0
	.quad	.Lset1258
.Lset1259 = .Ltmp1749-.Ltmp1748         # Loc expr size
	.short	.Lset1259
.Ltmp1748:
	.byte	89                      # DW_OP_reg9
.Ltmp1749:
.Lset1260 = .Ltmp739-.Lfunc_begin0
	.quad	.Lset1260
.Lset1261 = .Ltmp740-.Lfunc_begin0
	.quad	.Lset1261
.Lset1262 = .Ltmp1751-.Ltmp1750         # Loc expr size
	.short	.Lset1262
.Ltmp1750:
	.byte	89                      # DW_OP_reg9
.Ltmp1751:
.Lset1263 = .Ltmp742-.Lfunc_begin0
	.quad	.Lset1263
.Lset1264 = .Ltmp745-.Lfunc_begin0
	.quad	.Lset1264
.Lset1265 = .Ltmp1753-.Ltmp1752         # Loc expr size
	.short	.Lset1265
.Ltmp1752:
	.byte	89                      # DW_OP_reg9
.Ltmp1753:
	.quad	0
	.quad	0
.Ldebug_loc141:
.Lset1266 = .Ltmp725-.Lfunc_begin0
	.quad	.Lset1266
.Lset1267 = .Ltmp727-.Lfunc_begin0
	.quad	.Lset1267
.Lset1268 = .Ltmp1755-.Ltmp1754         # Loc expr size
	.short	.Lset1268
.Ltmp1754:
	.byte	90                      # super-register
                                        # DW_OP_reg10
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1755:
	.quad	0
	.quad	0
.Ldebug_loc142:
.Lset1269 = .Lfunc_begin28-.Lfunc_begin0
	.quad	.Lset1269
.Lset1270 = .Ltmp760-.Lfunc_begin0
	.quad	.Lset1270
.Lset1271 = .Ltmp1757-.Ltmp1756         # Loc expr size
	.short	.Lset1271
.Ltmp1756:
	.byte	85                      # DW_OP_reg5
.Ltmp1757:
.Lset1272 = .Ltmp760-.Lfunc_begin0
	.quad	.Lset1272
.Lset1273 = .Ltmp767-.Lfunc_begin0
	.quad	.Lset1273
.Lset1274 = .Ltmp1759-.Ltmp1758         # Loc expr size
	.short	.Lset1274
.Ltmp1758:
	.byte	94                      # DW_OP_reg14
.Ltmp1759:
.Lset1275 = .Ltmp769-.Lfunc_begin0
	.quad	.Lset1275
.Lset1276 = .Ltmp780-.Lfunc_begin0
	.quad	.Lset1276
.Lset1277 = .Ltmp1761-.Ltmp1760         # Loc expr size
	.short	.Lset1277
.Ltmp1760:
	.byte	94                      # DW_OP_reg14
.Ltmp1761:
	.quad	0
	.quad	0
.Ldebug_loc143:
.Lset1278 = .Lfunc_begin28-.Lfunc_begin0
	.quad	.Lset1278
.Lset1279 = .Ltmp759-.Lfunc_begin0
	.quad	.Lset1279
.Lset1280 = .Ltmp1763-.Ltmp1762         # Loc expr size
	.short	.Lset1280
.Ltmp1762:
	.byte	84                      # DW_OP_reg4
.Ltmp1763:
.Lset1281 = .Ltmp759-.Lfunc_begin0
	.quad	.Lset1281
.Lset1282 = .Ltmp768-.Lfunc_begin0
	.quad	.Lset1282
.Lset1283 = .Ltmp1765-.Ltmp1764         # Loc expr size
	.short	.Lset1283
.Ltmp1764:
	.byte	93                      # DW_OP_reg13
.Ltmp1765:
.Lset1284 = .Ltmp769-.Lfunc_begin0
	.quad	.Lset1284
.Lset1285 = .Ltmp780-.Lfunc_begin0
	.quad	.Lset1285
.Lset1286 = .Ltmp1767-.Ltmp1766         # Loc expr size
	.short	.Lset1286
.Ltmp1766:
	.byte	93                      # DW_OP_reg13
.Ltmp1767:
	.quad	0
	.quad	0
.Ldebug_loc144:
.Lset1287 = .Ltmp765-.Lfunc_begin0
	.quad	.Lset1287
.Lset1288 = .Ltmp769-.Lfunc_begin0
	.quad	.Lset1288
.Lset1289 = .Ltmp1769-.Ltmp1768         # Loc expr size
	.short	.Lset1289
.Ltmp1768:
	.byte	16                      # DW_OP_constu
	.byte	1                       # 
.Ltmp1769:
.Lset1290 = .Ltmp769-.Lfunc_begin0
	.quad	.Lset1290
.Lset1291 = .Lfunc_end28-.Lfunc_begin0
	.quad	.Lset1291
.Lset1292 = .Ltmp1771-.Ltmp1770         # Loc expr size
	.short	.Lset1292
.Ltmp1770:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1771:
	.quad	0
	.quad	0
.Ldebug_loc145:
.Lset1293 = .Ltmp766-.Lfunc_begin0
	.quad	.Lset1293
.Lset1294 = .Ltmp767-.Lfunc_begin0
	.quad	.Lset1294
.Lset1295 = .Ltmp1773-.Ltmp1772         # Loc expr size
	.short	.Lset1295
.Ltmp1772:
	.byte	92                      # DW_OP_reg12
.Ltmp1773:
.Lset1296 = .Ltmp770-.Lfunc_begin0
	.quad	.Lset1296
.Lset1297 = .Ltmp771-.Lfunc_begin0
	.quad	.Lset1297
.Lset1298 = .Ltmp1775-.Ltmp1774         # Loc expr size
	.short	.Lset1298
.Ltmp1774:
	.byte	92                      # DW_OP_reg12
.Ltmp1775:
	.quad	0
	.quad	0
.Ldebug_loc146:
.Lset1299 = .Ltmp772-.Lfunc_begin0
	.quad	.Lset1299
.Lset1300 = .Ltmp779-.Lfunc_begin0
	.quad	.Lset1300
.Lset1301 = .Ltmp1777-.Ltmp1776         # Loc expr size
	.short	.Lset1301
.Ltmp1776:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1777:
.Lset1302 = .Ltmp779-.Lfunc_begin0
	.quad	.Lset1302
.Lset1303 = .Ltmp780-.Lfunc_begin0
	.quad	.Lset1303
.Lset1304 = .Ltmp1779-.Ltmp1778         # Loc expr size
	.short	.Lset1304
.Ltmp1778:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1779:
.Lset1305 = .Ltmp780-.Lfunc_begin0
	.quad	.Lset1305
.Lset1306 = .Lfunc_end28-.Lfunc_begin0
	.quad	.Lset1306
.Lset1307 = .Ltmp1781-.Ltmp1780         # Loc expr size
	.short	.Lset1307
.Ltmp1780:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1781:
	.quad	0
	.quad	0
.Ldebug_loc147:
.Lset1308 = .Ltmp773-.Lfunc_begin0
	.quad	.Lset1308
.Lset1309 = .Ltmp776-.Lfunc_begin0
	.quad	.Lset1309
.Lset1310 = .Ltmp1783-.Ltmp1782         # Loc expr size
	.short	.Lset1310
.Ltmp1782:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1783:
	.quad	0
	.quad	0
.Ldebug_loc148:
.Lset1311 = .Ltmp778-.Lfunc_begin0
	.quad	.Lset1311
.Lset1312 = .Ltmp779-.Lfunc_begin0
	.quad	.Lset1312
.Lset1313 = .Ltmp1785-.Ltmp1784         # Loc expr size
	.short	.Lset1313
.Ltmp1784:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1785:
	.quad	0
	.quad	0
.Ldebug_loc149:
.Lset1314 = .Ltmp782-.Lfunc_begin0
	.quad	.Lset1314
.Lset1315 = .Ltmp784-.Lfunc_begin0
	.quad	.Lset1315
.Lset1316 = .Ltmp1787-.Ltmp1786         # Loc expr size
	.short	.Lset1316
.Ltmp1786:
	.byte	95                      # super-register
                                        # DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1787:
	.quad	0
	.quad	0
.Ldebug_loc150:
.Lset1317 = .Ltmp787-.Lfunc_begin0
	.quad	.Lset1317
.Lset1318 = .Ltmp794-.Lfunc_begin0
	.quad	.Lset1318
.Lset1319 = .Ltmp1789-.Ltmp1788         # Loc expr size
	.short	.Lset1319
.Ltmp1788:
	.byte	16                      # DW_OP_constu
	.ascii	"\377\377\377\377\377\377\377\377\377\001" # 
.Ltmp1789:
.Lset1320 = .Ltmp794-.Lfunc_begin0
	.quad	.Lset1320
.Lset1321 = .Ltmp796-.Lfunc_begin0
	.quad	.Lset1321
.Lset1322 = .Ltmp1791-.Ltmp1790         # Loc expr size
	.short	.Lset1322
.Ltmp1790:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1791:
.Lset1323 = .Ltmp798-.Lfunc_begin0
	.quad	.Lset1323
.Lset1324 = .Lfunc_end28-.Lfunc_begin0
	.quad	.Lset1324
.Lset1325 = .Ltmp1793-.Ltmp1792         # Loc expr size
	.short	.Lset1325
.Ltmp1792:
	.byte	16                      # DW_OP_constu
	.ascii	"\377\377\377\377\377\377\377\377\377\001" # 
.Ltmp1793:
	.quad	0
	.quad	0
.Ldebug_loc151:
.Lset1326 = .Ltmp787-.Lfunc_begin0
	.quad	.Lset1326
.Lset1327 = .Ltmp796-.Lfunc_begin0
	.quad	.Lset1327
.Lset1328 = .Ltmp1795-.Ltmp1794         # Loc expr size
	.short	.Lset1328
.Ltmp1794:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1795:
.Lset1329 = .Ltmp796-.Lfunc_begin0
	.quad	.Lset1329
.Lset1330 = .Ltmp798-.Lfunc_begin0
	.quad	.Lset1330
.Lset1331 = .Ltmp1797-.Ltmp1796         # Loc expr size
	.short	.Lset1331
.Ltmp1796:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1797:
.Lset1332 = .Ltmp798-.Lfunc_begin0
	.quad	.Lset1332
.Lset1333 = .Lfunc_end28-.Lfunc_begin0
	.quad	.Lset1333
.Lset1334 = .Ltmp1799-.Ltmp1798         # Loc expr size
	.short	.Lset1334
.Ltmp1798:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1799:
	.quad	0
	.quad	0
.Ldebug_loc152:
.Lset1335 = .Ltmp787-.Lfunc_begin0
	.quad	.Lset1335
.Lset1336 = .Ltmp793-.Lfunc_begin0
	.quad	.Lset1336
.Lset1337 = .Ltmp1801-.Ltmp1800         # Loc expr size
	.short	.Lset1337
.Ltmp1800:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1801:
.Lset1338 = .Ltmp793-.Lfunc_begin0
	.quad	.Lset1338
.Lset1339 = .Ltmp798-.Lfunc_begin0
	.quad	.Lset1339
.Lset1340 = .Ltmp1803-.Ltmp1802         # Loc expr size
	.short	.Lset1340
.Ltmp1802:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1803:
.Lset1341 = .Ltmp798-.Lfunc_begin0
	.quad	.Lset1341
.Lset1342 = .Lfunc_end28-.Lfunc_begin0
	.quad	.Lset1342
.Lset1343 = .Ltmp1805-.Ltmp1804         # Loc expr size
	.short	.Lset1343
.Ltmp1804:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1805:
	.quad	0
	.quad	0
.Ldebug_loc153:
.Lset1344 = .Ltmp789-.Lfunc_begin0
	.quad	.Lset1344
.Lset1345 = .Ltmp791-.Lfunc_begin0
	.quad	.Lset1345
.Lset1346 = .Ltmp1807-.Ltmp1806         # Loc expr size
	.short	.Lset1346
.Ltmp1806:
	.byte	81                      # super-register
                                        # DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1807:
	.quad	0
	.quad	0
.Ldebug_loc154:
.Lset1347 = .Ltmp807-.Lfunc_begin0
	.quad	.Lset1347
.Lset1348 = .Ltmp813-.Lfunc_begin0
	.quad	.Lset1348
.Lset1349 = .Ltmp1809-.Ltmp1808         # Loc expr size
	.short	.Lset1349
.Ltmp1808:
	.byte	82                      # DW_OP_reg2
.Ltmp1809:
.Lset1350 = .Ltmp816-.Lfunc_begin0
	.quad	.Lset1350
.Lset1351 = .Ltmp822-.Lfunc_begin0
	.quad	.Lset1351
.Lset1352 = .Ltmp1811-.Ltmp1810         # Loc expr size
	.short	.Lset1352
.Ltmp1810:
	.byte	82                      # DW_OP_reg2
.Ltmp1811:
.Lset1353 = .Ltmp822-.Lfunc_begin0
	.quad	.Lset1353
.Lset1354 = .Ltmp824-.Lfunc_begin0
	.quad	.Lset1354
.Lset1355 = .Ltmp1813-.Ltmp1812         # Loc expr size
	.short	.Lset1355
.Ltmp1812:
	.byte	91                      # DW_OP_reg11
.Ltmp1813:
.Lset1356 = .Ltmp830-.Lfunc_begin0
	.quad	.Lset1356
.Lset1357 = .Ltmp832-.Lfunc_begin0
	.quad	.Lset1357
.Lset1358 = .Ltmp1815-.Ltmp1814         # Loc expr size
	.short	.Lset1358
.Ltmp1814:
	.byte	91                      # DW_OP_reg11
.Ltmp1815:
	.quad	0
	.quad	0
.Ldebug_loc155:
.Lset1359 = .Ltmp810-.Lfunc_begin0
	.quad	.Lset1359
.Lset1360 = .Ltmp814-.Lfunc_begin0
	.quad	.Lset1360
.Lset1361 = .Ltmp1817-.Ltmp1816         # Loc expr size
	.short	.Lset1361
.Ltmp1816:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1817:
	.quad	0
	.quad	0
.Ldebug_loc156:
.Lset1362 = .Ltmp817-.Lfunc_begin0
	.quad	.Lset1362
.Lset1363 = .Ltmp824-.Lfunc_begin0
	.quad	.Lset1363
.Lset1364 = .Ltmp1819-.Ltmp1818         # Loc expr size
	.short	.Lset1364
.Ltmp1818:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1819:
.Lset1365 = .Ltmp835-.Lfunc_begin0
	.quad	.Lset1365
.Lset1366 = .Ltmp836-.Lfunc_begin0
	.quad	.Lset1366
.Lset1367 = .Ltmp1821-.Ltmp1820         # Loc expr size
	.short	.Lset1367
.Ltmp1820:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1821:
	.quad	0
	.quad	0
.Ldebug_loc157:
.Lset1368 = .Ltmp819-.Lfunc_begin0
	.quad	.Lset1368
.Lset1369 = .Ltmp836-.Lfunc_begin0
	.quad	.Lset1369
.Lset1370 = .Ltmp1823-.Ltmp1822         # Loc expr size
	.short	.Lset1370
.Ltmp1822:
	.byte	88                      # super-register
                                        # DW_OP_reg8
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1823:
	.quad	0
	.quad	0
.Ldebug_loc158:
.Lset1371 = .Ltmp820-.Lfunc_begin0
	.quad	.Lset1371
.Lset1372 = .Ltmp824-.Lfunc_begin0
	.quad	.Lset1372
.Lset1373 = .Ltmp1825-.Ltmp1824         # Loc expr size
	.short	.Lset1373
.Ltmp1824:
	.byte	90                      # DW_OP_reg10
.Ltmp1825:
.Lset1374 = .Ltmp831-.Lfunc_begin0
	.quad	.Lset1374
.Lset1375 = .Ltmp832-.Lfunc_begin0
	.quad	.Lset1375
.Lset1376 = .Ltmp1827-.Ltmp1826         # Loc expr size
	.short	.Lset1376
.Ltmp1826:
	.byte	90                      # DW_OP_reg10
.Ltmp1827:
	.quad	0
	.quad	0
.Ldebug_loc159:
.Lset1377 = .Ltmp821-.Lfunc_begin0
	.quad	.Lset1377
.Lset1378 = .Ltmp824-.Lfunc_begin0
	.quad	.Lset1378
.Lset1379 = .Ltmp1829-.Ltmp1828         # Loc expr size
	.short	.Lset1379
.Ltmp1828:
	.byte	81                      # DW_OP_reg1
.Ltmp1829:
.Lset1380 = .Ltmp826-.Lfunc_begin0
	.quad	.Lset1380
.Lset1381 = .Ltmp832-.Lfunc_begin0
	.quad	.Lset1381
.Lset1382 = .Ltmp1831-.Ltmp1830         # Loc expr size
	.short	.Lset1382
.Ltmp1830:
	.byte	95                      # DW_OP_reg15
.Ltmp1831:
	.quad	0
	.quad	0
.Ldebug_loc160:
.Lset1383 = .Ltmp837-.Lfunc_begin0
	.quad	.Lset1383
.Lset1384 = .Ltmp839-.Lfunc_begin0
	.quad	.Lset1384
.Lset1385 = .Ltmp1833-.Ltmp1832         # Loc expr size
	.short	.Lset1385
.Ltmp1832:
	.byte	98                      # DW_OP_reg18
.Ltmp1833:
	.quad	0
	.quad	0
.Ldebug_loc161:
.Lset1386 = .Ltmp845-.Lfunc_begin0
	.quad	.Lset1386
.Lset1387 = .Ltmp845-.Lfunc_begin0
	.quad	.Lset1387
.Lset1388 = .Ltmp1835-.Ltmp1834         # Loc expr size
	.short	.Lset1388
.Ltmp1834:
	.byte	97                      # DW_OP_reg17
.Ltmp1835:
	.quad	0
	.quad	0
.Ldebug_loc162:
.Lset1389 = .Lfunc_begin30-.Lfunc_begin0
	.quad	.Lset1389
.Lset1390 = .Ltmp857-.Lfunc_begin0
	.quad	.Lset1390
.Lset1391 = .Ltmp1837-.Ltmp1836         # Loc expr size
	.short	.Lset1391
.Ltmp1836:
	.byte	85                      # DW_OP_reg5
.Ltmp1837:
.Lset1392 = .Ltmp857-.Lfunc_begin0
	.quad	.Lset1392
.Lset1393 = .Ltmp858-.Lfunc_begin0
	.quad	.Lset1393
.Lset1394 = .Ltmp1839-.Ltmp1838         # Loc expr size
	.short	.Lset1394
.Ltmp1838:
	.byte	94                      # DW_OP_reg14
.Ltmp1839:
.Lset1395 = .Ltmp860-.Lfunc_begin0
	.quad	.Lset1395
.Lset1396 = .Ltmp868-.Lfunc_begin0
	.quad	.Lset1396
.Lset1397 = .Ltmp1841-.Ltmp1840         # Loc expr size
	.short	.Lset1397
.Ltmp1840:
	.byte	94                      # DW_OP_reg14
.Ltmp1841:
.Lset1398 = .Ltmp872-.Lfunc_begin0
	.quad	.Lset1398
.Lset1399 = .Ltmp884-.Lfunc_begin0
	.quad	.Lset1399
.Lset1400 = .Ltmp1843-.Ltmp1842         # Loc expr size
	.short	.Lset1400
.Ltmp1842:
	.byte	94                      # DW_OP_reg14
.Ltmp1843:
	.quad	0
	.quad	0
.Ldebug_loc163:
.Lset1401 = .Lfunc_begin30-.Lfunc_begin0
	.quad	.Lset1401
.Lset1402 = .Ltmp856-.Lfunc_begin0
	.quad	.Lset1402
.Lset1403 = .Ltmp1845-.Ltmp1844         # Loc expr size
	.short	.Lset1403
.Ltmp1844:
	.byte	84                      # DW_OP_reg4
.Ltmp1845:
.Lset1404 = .Ltmp856-.Lfunc_begin0
	.quad	.Lset1404
.Lset1405 = .Ltmp859-.Lfunc_begin0
	.quad	.Lset1405
.Lset1406 = .Ltmp1847-.Ltmp1846         # Loc expr size
	.short	.Lset1406
.Ltmp1846:
	.byte	83                      # DW_OP_reg3
.Ltmp1847:
.Lset1407 = .Ltmp860-.Lfunc_begin0
	.quad	.Lset1407
.Lset1408 = .Ltmp868-.Lfunc_begin0
	.quad	.Lset1408
.Lset1409 = .Ltmp1849-.Ltmp1848         # Loc expr size
	.short	.Lset1409
.Ltmp1848:
	.byte	83                      # DW_OP_reg3
.Ltmp1849:
.Lset1410 = .Ltmp872-.Lfunc_begin0
	.quad	.Lset1410
.Lset1411 = .Ltmp875-.Lfunc_begin0
	.quad	.Lset1411
.Lset1412 = .Ltmp1851-.Ltmp1850         # Loc expr size
	.short	.Lset1412
.Ltmp1850:
	.byte	83                      # DW_OP_reg3
.Ltmp1851:
	.quad	0
	.quad	0
.Ldebug_loc164:
.Lset1413 = .Ltmp862-.Lfunc_begin0
	.quad	.Lset1413
.Lset1414 = .Ltmp869-.Lfunc_begin0
	.quad	.Lset1414
.Lset1415 = .Ltmp1853-.Ltmp1852         # Loc expr size
	.short	.Lset1415
.Ltmp1852:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1853:
.Lset1416 = .Ltmp869-.Lfunc_begin0
	.quad	.Lset1416
.Lset1417 = .Ltmp870-.Lfunc_begin0
	.quad	.Lset1417
.Lset1418 = .Ltmp1855-.Ltmp1854         # Loc expr size
	.short	.Lset1418
.Ltmp1854:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1855:
.Lset1419 = .Ltmp871-.Lfunc_begin0
	.quad	.Lset1419
.Lset1420 = .Lfunc_end30-.Lfunc_begin0
	.quad	.Lset1420
.Lset1421 = .Ltmp1857-.Ltmp1856         # Loc expr size
	.short	.Lset1421
.Ltmp1856:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1857:
	.quad	0
	.quad	0
.Ldebug_loc165:
.Lset1422 = .Ltmp863-.Lfunc_begin0
	.quad	.Lset1422
.Lset1423 = .Ltmp867-.Lfunc_begin0
	.quad	.Lset1423
.Lset1424 = .Ltmp1859-.Ltmp1858         # Loc expr size
	.short	.Lset1424
.Ltmp1858:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1859:
	.quad	0
	.quad	0
.Ldebug_loc166:
.Lset1425 = .Ltmp873-.Lfunc_begin0
	.quad	.Lset1425
.Lset1426 = .Ltmp892-.Lfunc_begin0
	.quad	.Lset1426
.Lset1427 = .Ltmp1861-.Ltmp1860         # Loc expr size
	.short	.Lset1427
.Ltmp1860:
	.byte	92                      # DW_OP_reg12
.Ltmp1861:
.Lset1428 = .Ltmp892-.Lfunc_begin0
	.quad	.Lset1428
.Lset1429 = .Ltmp905-.Lfunc_begin0
	.quad	.Lset1429
.Lset1430 = .Ltmp1863-.Ltmp1862         # Loc expr size
	.short	.Lset1430
.Ltmp1862:
	.byte	118                     # DW_OP_breg6
	.ascii	"\230\177"              # 
.Ltmp1863:
.Lset1431 = .Ltmp905-.Lfunc_begin0
	.quad	.Lset1431
.Lset1432 = .Ltmp906-.Lfunc_begin0
	.quad	.Lset1432
.Lset1433 = .Ltmp1865-.Ltmp1864         # Loc expr size
	.short	.Lset1433
.Ltmp1864:
	.byte	83                      # DW_OP_reg3
.Ltmp1865:
	.quad	0
	.quad	0
.Ldebug_loc167:
.Lset1434 = .Ltmp874-.Lfunc_begin0
	.quad	.Lset1434
.Lset1435 = .Ltmp885-.Lfunc_begin0
	.quad	.Lset1435
.Lset1436 = .Ltmp1867-.Ltmp1866         # Loc expr size
	.short	.Lset1436
.Ltmp1866:
	.byte	95                      # DW_OP_reg15
.Ltmp1867:
.Lset1437 = .Ltmp885-.Lfunc_begin0
	.quad	.Lset1437
.Lset1438 = .Ltmp907-.Lfunc_begin0
	.quad	.Lset1438
.Lset1439 = .Ltmp1869-.Ltmp1868         # Loc expr size
	.short	.Lset1439
.Ltmp1868:
	.byte	118                     # DW_OP_breg6
	.ascii	"\220\177"              # 
.Ltmp1869:
	.quad	0
	.quad	0
.Ldebug_loc168:
.Lset1440 = .Ltmp876-.Lfunc_begin0
	.quad	.Lset1440
.Lset1441 = .Ltmp883-.Lfunc_begin0
	.quad	.Lset1441
.Lset1442 = .Ltmp1871-.Ltmp1870         # Loc expr size
	.short	.Lset1442
.Ltmp1870:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1871:
.Lset1443 = .Ltmp883-.Lfunc_begin0
	.quad	.Lset1443
.Lset1444 = .Ltmp884-.Lfunc_begin0
	.quad	.Lset1444
.Lset1445 = .Ltmp1873-.Ltmp1872         # Loc expr size
	.short	.Lset1445
.Ltmp1872:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1873:
.Lset1446 = .Ltmp884-.Lfunc_begin0
	.quad	.Lset1446
.Lset1447 = .Lfunc_end30-.Lfunc_begin0
	.quad	.Lset1447
.Lset1448 = .Ltmp1875-.Ltmp1874         # Loc expr size
	.short	.Lset1448
.Ltmp1874:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1875:
	.quad	0
	.quad	0
.Ldebug_loc169:
.Lset1449 = .Ltmp877-.Lfunc_begin0
	.quad	.Lset1449
.Lset1450 = .Ltmp880-.Lfunc_begin0
	.quad	.Lset1450
.Lset1451 = .Ltmp1877-.Ltmp1876         # Loc expr size
	.short	.Lset1451
.Ltmp1876:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1877:
	.quad	0
	.quad	0
.Ldebug_loc170:
.Lset1452 = .Ltmp882-.Lfunc_begin0
	.quad	.Lset1452
.Lset1453 = .Ltmp883-.Lfunc_begin0
	.quad	.Lset1453
.Lset1454 = .Ltmp1879-.Ltmp1878         # Loc expr size
	.short	.Lset1454
.Ltmp1878:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1879:
	.quad	0
	.quad	0
.Ldebug_loc171:
.Lset1455 = .Ltmp886-.Lfunc_begin0
	.quad	.Lset1455
.Lset1456 = .Ltmp888-.Lfunc_begin0
	.quad	.Lset1456
.Lset1457 = .Ltmp1881-.Ltmp1880         # Loc expr size
	.short	.Lset1457
.Ltmp1880:
	.byte	95                      # super-register
                                        # DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1881:
	.quad	0
	.quad	0
.Ldebug_loc172:
.Lset1458 = .Ltmp891-.Lfunc_begin0
	.quad	.Lset1458
.Lset1459 = .Ltmp899-.Lfunc_begin0
	.quad	.Lset1459
.Lset1460 = .Ltmp1883-.Ltmp1882         # Loc expr size
	.short	.Lset1460
.Ltmp1882:
	.byte	16                      # DW_OP_constu
	.ascii	"\377\377\377\377\377\377\377\377\377\001" # 
.Ltmp1883:
.Lset1461 = .Ltmp899-.Lfunc_begin0
	.quad	.Lset1461
.Lset1462 = .Ltmp901-.Lfunc_begin0
	.quad	.Lset1462
.Lset1463 = .Ltmp1885-.Ltmp1884         # Loc expr size
	.short	.Lset1463
.Ltmp1884:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1885:
.Lset1464 = .Ltmp903-.Lfunc_begin0
	.quad	.Lset1464
.Lset1465 = .Lfunc_end30-.Lfunc_begin0
	.quad	.Lset1465
.Lset1466 = .Ltmp1887-.Ltmp1886         # Loc expr size
	.short	.Lset1466
.Ltmp1886:
	.byte	16                      # DW_OP_constu
	.ascii	"\377\377\377\377\377\377\377\377\377\001" # 
.Ltmp1887:
	.quad	0
	.quad	0
.Ldebug_loc173:
.Lset1467 = .Ltmp891-.Lfunc_begin0
	.quad	.Lset1467
.Lset1468 = .Ltmp901-.Lfunc_begin0
	.quad	.Lset1468
.Lset1469 = .Ltmp1889-.Ltmp1888         # Loc expr size
	.short	.Lset1469
.Ltmp1888:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1889:
.Lset1470 = .Ltmp901-.Lfunc_begin0
	.quad	.Lset1470
.Lset1471 = .Ltmp903-.Lfunc_begin0
	.quad	.Lset1471
.Lset1472 = .Ltmp1891-.Ltmp1890         # Loc expr size
	.short	.Lset1472
.Ltmp1890:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1891:
.Lset1473 = .Ltmp903-.Lfunc_begin0
	.quad	.Lset1473
.Lset1474 = .Lfunc_end30-.Lfunc_begin0
	.quad	.Lset1474
.Lset1475 = .Ltmp1893-.Ltmp1892         # Loc expr size
	.short	.Lset1475
.Ltmp1892:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1893:
	.quad	0
	.quad	0
.Ldebug_loc174:
.Lset1476 = .Ltmp891-.Lfunc_begin0
	.quad	.Lset1476
.Lset1477 = .Ltmp898-.Lfunc_begin0
	.quad	.Lset1477
.Lset1478 = .Ltmp1895-.Ltmp1894         # Loc expr size
	.short	.Lset1478
.Ltmp1894:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1895:
.Lset1479 = .Ltmp898-.Lfunc_begin0
	.quad	.Lset1479
.Lset1480 = .Ltmp903-.Lfunc_begin0
	.quad	.Lset1480
.Lset1481 = .Ltmp1897-.Ltmp1896         # Loc expr size
	.short	.Lset1481
.Ltmp1896:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1897:
.Lset1482 = .Ltmp903-.Lfunc_begin0
	.quad	.Lset1482
.Lset1483 = .Lfunc_end30-.Lfunc_begin0
	.quad	.Lset1483
.Lset1484 = .Ltmp1899-.Ltmp1898         # Loc expr size
	.short	.Lset1484
.Ltmp1898:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1899:
	.quad	0
	.quad	0
.Ldebug_loc175:
.Lset1485 = .Ltmp894-.Lfunc_begin0
	.quad	.Lset1485
.Lset1486 = .Ltmp896-.Lfunc_begin0
	.quad	.Lset1486
.Lset1487 = .Ltmp1901-.Ltmp1900         # Loc expr size
	.short	.Lset1487
.Ltmp1900:
	.byte	81                      # super-register
                                        # DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1901:
	.quad	0
	.quad	0
.Ldebug_loc176:
.Lset1488 = .Lfunc_begin31-.Lfunc_begin0
	.quad	.Lset1488
.Lset1489 = .Ltmp929-.Lfunc_begin0
	.quad	.Lset1489
.Lset1490 = .Ltmp1903-.Ltmp1902         # Loc expr size
	.short	.Lset1490
.Ltmp1902:
	.byte	85                      # DW_OP_reg5
.Ltmp1903:
.Lset1491 = .Ltmp929-.Lfunc_begin0
	.quad	.Lset1491
.Lset1492 = .Ltmp952-.Lfunc_begin0
	.quad	.Lset1492
.Lset1493 = .Ltmp1905-.Ltmp1904         # Loc expr size
	.short	.Lset1493
.Ltmp1904:
	.byte	118                     # DW_OP_breg6
	.ascii	"\240\177"              # 
.Ltmp1905:
.Lset1494 = .Ltmp952-.Lfunc_begin0
	.quad	.Lset1494
.Lset1495 = .Ltmp959-.Lfunc_begin0
	.quad	.Lset1495
.Lset1496 = .Ltmp1907-.Ltmp1906         # Loc expr size
	.short	.Lset1496
.Ltmp1906:
	.byte	85                      # DW_OP_reg5
.Ltmp1907:
.Lset1497 = .Ltmp959-.Lfunc_begin0
	.quad	.Lset1497
.Lset1498 = .Ltmp987-.Lfunc_begin0
	.quad	.Lset1498
.Lset1499 = .Ltmp1909-.Ltmp1908         # Loc expr size
	.short	.Lset1499
.Ltmp1908:
	.byte	118                     # DW_OP_breg6
	.ascii	"\240\177"              # 
.Ltmp1909:
.Lset1500 = .Ltmp987-.Lfunc_begin0
	.quad	.Lset1500
.Lset1501 = .Ltmp992-.Lfunc_begin0
	.quad	.Lset1501
.Lset1502 = .Ltmp1911-.Ltmp1910         # Loc expr size
	.short	.Lset1502
.Ltmp1910:
	.byte	85                      # DW_OP_reg5
.Ltmp1911:
.Lset1503 = .Ltmp992-.Lfunc_begin0
	.quad	.Lset1503
.Lset1504 = .Ltmp1003-.Lfunc_begin0
	.quad	.Lset1504
.Lset1505 = .Ltmp1913-.Ltmp1912         # Loc expr size
	.short	.Lset1505
.Ltmp1912:
	.byte	118                     # DW_OP_breg6
	.ascii	"\240\177"              # 
.Ltmp1913:
.Lset1506 = .Ltmp1003-.Lfunc_begin0
	.quad	.Lset1506
.Lset1507 = .Ltmp1016-.Lfunc_begin0
	.quad	.Lset1507
.Lset1508 = .Ltmp1915-.Ltmp1914         # Loc expr size
	.short	.Lset1508
.Ltmp1914:
	.byte	85                      # DW_OP_reg5
.Ltmp1915:
.Lset1509 = .Ltmp1016-.Lfunc_begin0
	.quad	.Lset1509
.Lset1510 = .Ltmp1025-.Lfunc_begin0
	.quad	.Lset1510
.Lset1511 = .Ltmp1917-.Ltmp1916         # Loc expr size
	.short	.Lset1511
.Ltmp1916:
	.byte	118                     # DW_OP_breg6
	.ascii	"\240\177"              # 
.Ltmp1917:
.Lset1512 = .Ltmp1025-.Lfunc_begin0
	.quad	.Lset1512
.Lset1513 = .Ltmp1026-.Lfunc_begin0
	.quad	.Lset1513
.Lset1514 = .Ltmp1919-.Ltmp1918         # Loc expr size
	.short	.Lset1514
.Ltmp1918:
	.byte	85                      # DW_OP_reg5
.Ltmp1919:
.Lset1515 = .Ltmp1026-.Lfunc_begin0
	.quad	.Lset1515
.Lset1516 = .Ltmp1027-.Lfunc_begin0
	.quad	.Lset1516
.Lset1517 = .Ltmp1921-.Ltmp1920         # Loc expr size
	.short	.Lset1517
.Ltmp1920:
	.byte	118                     # DW_OP_breg6
	.ascii	"\240\177"              # 
.Ltmp1921:
.Lset1518 = .Ltmp1027-.Lfunc_begin0
	.quad	.Lset1518
.Lset1519 = .Ltmp1028-.Lfunc_begin0
	.quad	.Lset1519
.Lset1520 = .Ltmp1923-.Ltmp1922         # Loc expr size
	.short	.Lset1520
.Ltmp1922:
	.byte	85                      # DW_OP_reg5
.Ltmp1923:
.Lset1521 = .Ltmp1028-.Lfunc_begin0
	.quad	.Lset1521
.Lset1522 = .Ltmp1030-.Lfunc_begin0
	.quad	.Lset1522
.Lset1523 = .Ltmp1925-.Ltmp1924         # Loc expr size
	.short	.Lset1523
.Ltmp1924:
	.byte	118                     # DW_OP_breg6
	.ascii	"\240\177"              # 
.Ltmp1925:
.Lset1524 = .Ltmp1030-.Lfunc_begin0
	.quad	.Lset1524
.Lset1525 = .Lfunc_end31-.Lfunc_begin0
	.quad	.Lset1525
.Lset1526 = .Ltmp1927-.Ltmp1926         # Loc expr size
	.short	.Lset1526
.Ltmp1926:
	.byte	84                      # DW_OP_reg4
.Ltmp1927:
	.quad	0
	.quad	0
.Ldebug_loc177:
.Lset1527 = .Ltmp919-.Lfunc_begin0
	.quad	.Lset1527
.Lset1528 = .Ltmp923-.Lfunc_begin0
	.quad	.Lset1528
.Lset1529 = .Ltmp1929-.Ltmp1928         # Loc expr size
	.short	.Lset1529
.Ltmp1928:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1929:
.Lset1530 = .Ltmp923-.Lfunc_begin0
	.quad	.Lset1530
.Lset1531 = .Ltmp952-.Lfunc_begin0
	.quad	.Lset1531
.Lset1532 = .Ltmp1931-.Ltmp1930         # Loc expr size
	.short	.Lset1532
.Ltmp1930:
	.byte	16                      # DW_OP_constu
	.byte	1                       # 
.Ltmp1931:
.Lset1533 = .Ltmp952-.Lfunc_begin0
	.quad	.Lset1533
.Lset1534 = .Ltmp1026-.Lfunc_begin0
	.quad	.Lset1534
.Lset1535 = .Ltmp1933-.Ltmp1932         # Loc expr size
	.short	.Lset1535
.Ltmp1932:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1933:
.Lset1536 = .Ltmp1026-.Lfunc_begin0
	.quad	.Lset1536
.Lset1537 = .Ltmp1027-.Lfunc_begin0
	.quad	.Lset1537
.Lset1538 = .Ltmp1935-.Ltmp1934         # Loc expr size
	.short	.Lset1538
.Ltmp1934:
	.byte	16                      # DW_OP_constu
	.byte	1                       # 
.Ltmp1935:
.Lset1539 = .Ltmp1027-.Lfunc_begin0
	.quad	.Lset1539
.Lset1540 = .Lfunc_end31-.Lfunc_begin0
	.quad	.Lset1540
.Lset1541 = .Ltmp1937-.Ltmp1936         # Loc expr size
	.short	.Lset1541
.Ltmp1936:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1937:
	.quad	0
	.quad	0
.Ldebug_loc178:
.Lset1542 = .Ltmp919-.Lfunc_begin0
	.quad	.Lset1542
.Lset1543 = .Ltmp950-.Lfunc_begin0
	.quad	.Lset1543
.Lset1544 = .Ltmp1939-.Ltmp1938         # Loc expr size
	.short	.Lset1544
.Ltmp1938:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1939:
.Lset1545 = .Ltmp950-.Lfunc_begin0
	.quad	.Lset1545
.Lset1546 = .Ltmp952-.Lfunc_begin0
	.quad	.Lset1546
.Lset1547 = .Ltmp1941-.Ltmp1940         # Loc expr size
	.short	.Lset1547
.Ltmp1940:
	.byte	89                      # super-register
                                        # DW_OP_reg9
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1941:
.Lset1548 = .Ltmp952-.Lfunc_begin0
	.quad	.Lset1548
.Lset1549 = .Ltmp978-.Lfunc_begin0
	.quad	.Lset1549
.Lset1550 = .Ltmp1943-.Ltmp1942         # Loc expr size
	.short	.Lset1550
.Ltmp1942:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1943:
.Lset1551 = .Ltmp978-.Lfunc_begin0
	.quad	.Lset1551
.Lset1552 = .Ltmp981-.Lfunc_begin0
	.quad	.Lset1552
.Lset1553 = .Ltmp1945-.Ltmp1944         # Loc expr size
	.short	.Lset1553
.Ltmp1944:
	.byte	89                      # super-register
                                        # DW_OP_reg9
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1945:
.Lset1554 = .Ltmp981-.Lfunc_begin0
	.quad	.Lset1554
.Lset1555 = .Lfunc_end31-.Lfunc_begin0
	.quad	.Lset1555
.Lset1556 = .Ltmp1947-.Ltmp1946         # Loc expr size
	.short	.Lset1556
.Ltmp1946:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1947:
	.quad	0
	.quad	0
.Ldebug_loc179:
.Lset1557 = .Ltmp919-.Lfunc_begin0
	.quad	.Lset1557
.Lset1558 = .Ltmp940-.Lfunc_begin0
	.quad	.Lset1558
.Lset1559 = .Ltmp1949-.Ltmp1948         # Loc expr size
	.short	.Lset1559
.Ltmp1948:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1949:
.Lset1560 = .Ltmp940-.Lfunc_begin0
	.quad	.Lset1560
.Lset1561 = .Ltmp949-.Lfunc_begin0
	.quad	.Lset1561
.Lset1562 = .Ltmp1951-.Ltmp1950         # Loc expr size
	.short	.Lset1562
.Ltmp1950:
	.byte	89                      # super-register
                                        # DW_OP_reg9
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1951:
.Lset1563 = .Ltmp952-.Lfunc_begin0
	.quad	.Lset1563
.Lset1564 = .Ltmp974-.Lfunc_begin0
	.quad	.Lset1564
.Lset1565 = .Ltmp1953-.Ltmp1952         # Loc expr size
	.short	.Lset1565
.Ltmp1952:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1953:
.Lset1566 = .Ltmp974-.Lfunc_begin0
	.quad	.Lset1566
.Lset1567 = .Ltmp979-.Lfunc_begin0
	.quad	.Lset1567
.Lset1568 = .Ltmp1955-.Ltmp1954         # Loc expr size
	.short	.Lset1568
.Ltmp1954:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1955:
.Lset1569 = .Ltmp981-.Lfunc_begin0
	.quad	.Lset1569
.Lset1570 = .Lfunc_end31-.Lfunc_begin0
	.quad	.Lset1570
.Lset1571 = .Ltmp1957-.Ltmp1956         # Loc expr size
	.short	.Lset1571
.Ltmp1956:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp1957:
	.quad	0
	.quad	0
.Ldebug_loc180:
.Lset1572 = .Ltmp919-.Lfunc_begin0
	.quad	.Lset1572
.Lset1573 = .Ltmp940-.Lfunc_begin0
	.quad	.Lset1573
.Lset1574 = .Ltmp1959-.Ltmp1958         # Loc expr size
	.short	.Lset1574
.Ltmp1958:
	.byte	16                      # DW_OP_constu
	.ascii	"\377\377\377\377\377\377\377\377\377\001" # 
.Ltmp1959:
.Lset1575 = .Ltmp940-.Lfunc_begin0
	.quad	.Lset1575
.Lset1576 = .Ltmp949-.Lfunc_begin0
	.quad	.Lset1576
.Lset1577 = .Ltmp1961-.Ltmp1960         # Loc expr size
	.short	.Lset1577
.Ltmp1960:
	.byte	89                      # super-register
                                        # DW_OP_reg9
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1961:
.Lset1578 = .Ltmp952-.Lfunc_begin0
	.quad	.Lset1578
.Lset1579 = .Ltmp974-.Lfunc_begin0
	.quad	.Lset1579
.Lset1580 = .Ltmp1963-.Ltmp1962         # Loc expr size
	.short	.Lset1580
.Ltmp1962:
	.byte	16                      # DW_OP_constu
	.ascii	"\377\377\377\377\377\377\377\377\377\001" # 
.Ltmp1963:
.Lset1581 = .Ltmp974-.Lfunc_begin0
	.quad	.Lset1581
.Lset1582 = .Ltmp979-.Lfunc_begin0
	.quad	.Lset1582
.Lset1583 = .Ltmp1965-.Ltmp1964         # Loc expr size
	.short	.Lset1583
.Ltmp1964:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1965:
.Lset1584 = .Ltmp981-.Lfunc_begin0
	.quad	.Lset1584
.Lset1585 = .Lfunc_end31-.Lfunc_begin0
	.quad	.Lset1585
.Lset1586 = .Ltmp1967-.Ltmp1966         # Loc expr size
	.short	.Lset1586
.Ltmp1966:
	.byte	16                      # DW_OP_constu
	.ascii	"\377\377\377\377\377\377\377\377\377\001" # 
.Ltmp1967:
	.quad	0
	.quad	0
.Ldebug_loc181:
.Lset1587 = .Ltmp919-.Lfunc_begin0
	.quad	.Lset1587
.Lset1588 = .Ltmp1002-.Lfunc_begin0
	.quad	.Lset1588
.Lset1589 = .Ltmp1969-.Ltmp1968         # Loc expr size
	.short	.Lset1589
.Ltmp1968:
	.byte	82                      # DW_OP_reg2
.Ltmp1969:
	.quad	0
	.quad	0
.Ldebug_loc182:
.Lset1590 = .Ltmp920-.Lfunc_begin0
	.quad	.Lset1590
.Lset1591 = .Ltmp1002-.Lfunc_begin0
	.quad	.Lset1591
.Lset1592 = .Ltmp1971-.Ltmp1970         # Loc expr size
	.short	.Lset1592
.Ltmp1970:
	.byte	93                      # DW_OP_reg13
.Ltmp1971:
	.quad	0
	.quad	0
.Ldebug_loc183:
.Lset1593 = .Ltmp924-.Lfunc_begin0
	.quad	.Lset1593
.Lset1594 = .Ltmp934-.Lfunc_begin0
	.quad	.Lset1594
.Lset1595 = .Ltmp1973-.Ltmp1972         # Loc expr size
	.short	.Lset1595
.Ltmp1972:
	.byte	95                      # super-register
                                        # DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1973:
.Lset1596 = .Ltmp951-.Lfunc_begin0
	.quad	.Lset1596
.Lset1597 = .Ltmp952-.Lfunc_begin0
	.quad	.Lset1597
.Lset1598 = .Ltmp1975-.Ltmp1974         # Loc expr size
	.short	.Lset1598
.Ltmp1974:
	.byte	95                      # super-register
                                        # DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1975:
	.quad	0
	.quad	0
.Ldebug_loc184:
.Lset1599 = .Ltmp925-.Lfunc_begin0
	.quad	.Lset1599
.Lset1600 = .Ltmp926-.Lfunc_begin0
	.quad	.Lset1600
.Lset1601 = .Ltmp1977-.Ltmp1976         # Loc expr size
	.short	.Lset1601
.Ltmp1976:
	.byte	81                      # super-register
                                        # DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1977:
.Lset1602 = .Ltmp926-.Lfunc_begin0
	.quad	.Lset1602
.Lset1603 = .Ltmp932-.Lfunc_begin0
	.quad	.Lset1603
.Lset1604 = .Ltmp1979-.Ltmp1978         # Loc expr size
	.short	.Lset1604
.Ltmp1978:
	.byte	118                     # DW_OP_breg6
	.byte	80                      # 
.Ltmp1979:
.Lset1605 = .Ltmp932-.Lfunc_begin0
	.quad	.Lset1605
.Lset1606 = .Ltmp933-.Lfunc_begin0
	.quad	.Lset1606
.Lset1607 = .Ltmp1981-.Ltmp1980         # Loc expr size
	.short	.Lset1607
.Ltmp1980:
	.byte	88                      # super-register
                                        # DW_OP_reg8
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1981:
.Lset1608 = .Ltmp933-.Lfunc_begin0
	.quad	.Lset1608
.Lset1609 = .Lfunc_end31-.Lfunc_begin0
	.quad	.Lset1609
.Lset1610 = .Ltmp1983-.Ltmp1982         # Loc expr size
	.short	.Lset1610
.Ltmp1982:
	.byte	118                     # DW_OP_breg6
	.byte	80                      # 
.Ltmp1983:
	.quad	0
	.quad	0
.Ldebug_loc185:
.Lset1611 = .Ltmp928-.Lfunc_begin0
	.quad	.Lset1611
.Lset1612 = .Ltmp934-.Lfunc_begin0
	.quad	.Lset1612
.Lset1613 = .Ltmp1985-.Ltmp1984         # Loc expr size
	.short	.Lset1613
.Ltmp1984:
	.byte	94                      # super-register
                                        # DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1985:
.Lset1614 = .Ltmp948-.Lfunc_begin0
	.quad	.Lset1614
.Lset1615 = .Ltmp952-.Lfunc_begin0
	.quad	.Lset1615
.Lset1616 = .Ltmp1987-.Ltmp1986         # Loc expr size
	.short	.Lset1616
.Ltmp1986:
	.byte	94                      # super-register
                                        # DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1987:
	.quad	0
	.quad	0
.Ldebug_loc186:
.Lset1617 = .Ltmp931-.Lfunc_begin0
	.quad	.Lset1617
.Lset1618 = .Ltmp934-.Lfunc_begin0
	.quad	.Lset1618
.Lset1619 = .Ltmp1989-.Ltmp1988         # Loc expr size
	.short	.Lset1619
.Ltmp1988:
	.byte	84                      # super-register
                                        # DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1989:
	.quad	0
	.quad	0
.Ldebug_loc187:
.Lset1620 = .Ltmp940-.Lfunc_begin0
	.quad	.Lset1620
.Lset1621 = .Ltmp944-.Lfunc_begin0
	.quad	.Lset1621
.Lset1622 = .Ltmp1991-.Ltmp1990         # Loc expr size
	.short	.Lset1622
.Ltmp1990:
	.byte	89                      # super-register
                                        # DW_OP_reg9
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1991:
.Lset1623 = .Ltmp947-.Lfunc_begin0
	.quad	.Lset1623
.Lset1624 = .Ltmp949-.Lfunc_begin0
	.quad	.Lset1624
.Lset1625 = .Ltmp1993-.Ltmp1992         # Loc expr size
	.short	.Lset1625
.Ltmp1992:
	.byte	89                      # super-register
                                        # DW_OP_reg9
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1993:
	.quad	0
	.quad	0
.Ldebug_loc188:
.Lset1626 = .Ltmp957-.Lfunc_begin0
	.quad	.Lset1626
.Lset1627 = .Ltmp962-.Lfunc_begin0
	.quad	.Lset1627
.Lset1628 = .Ltmp1995-.Ltmp1994         # Loc expr size
	.short	.Lset1628
.Ltmp1994:
	.byte	83                      # super-register
                                        # DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1995:
.Lset1629 = .Ltmp984-.Lfunc_begin0
	.quad	.Lset1629
.Lset1630 = .Ltmp987-.Lfunc_begin0
	.quad	.Lset1630
.Lset1631 = .Ltmp1997-.Ltmp1996         # Loc expr size
	.short	.Lset1631
.Ltmp1996:
	.byte	83                      # super-register
                                        # DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1997:
	.quad	0
	.quad	0
.Ldebug_loc189:
.Lset1632 = .Ltmp960-.Lfunc_begin0
	.quad	.Lset1632
.Lset1633 = .Ltmp962-.Lfunc_begin0
	.quad	.Lset1633
.Lset1634 = .Ltmp1999-.Ltmp1998         # Loc expr size
	.short	.Lset1634
.Ltmp1998:
	.byte	84                      # super-register
                                        # DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp1999:
.Lset1635 = .Ltmp972-.Lfunc_begin0
	.quad	.Lset1635
.Lset1636 = .Ltmp981-.Lfunc_begin0
	.quad	.Lset1636
.Lset1637 = .Ltmp2001-.Ltmp2000         # Loc expr size
	.short	.Lset1637
.Ltmp2000:
	.byte	94                      # super-register
                                        # DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2001:
	.quad	0
	.quad	0
.Ldebug_loc190:
.Lset1638 = .Ltmp974-.Lfunc_begin0
	.quad	.Lset1638
.Lset1639 = .Ltmp979-.Lfunc_begin0
	.quad	.Lset1639
.Lset1640 = .Ltmp2003-.Ltmp2002         # Loc expr size
	.short	.Lset1640
.Ltmp2002:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2003:
	.quad	0
	.quad	0
.Ldebug_loc191:
.Lset1641 = .Ltmp986-.Lfunc_begin0
	.quad	.Lset1641
.Lset1642 = .Ltmp987-.Lfunc_begin0
	.quad	.Lset1642
.Lset1643 = .Ltmp2005-.Ltmp2004         # Loc expr size
	.short	.Lset1643
.Ltmp2004:
	.byte	95                      # super-register
                                        # DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2005:
	.quad	0
	.quad	0
.Ldebug_loc192:
.Lset1644 = .Ltmp989-.Lfunc_begin0
	.quad	.Lset1644
.Lset1645 = .Ltmp994-.Lfunc_begin0
	.quad	.Lset1645
.Lset1646 = .Ltmp2007-.Ltmp2006         # Loc expr size
	.short	.Lset1646
.Ltmp2006:
	.byte	81                      # super-register
                                        # DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2007:
.Lset1647 = .Ltmp994-.Lfunc_begin0
	.quad	.Lset1647
.Lset1648 = .Ltmp999-.Lfunc_begin0
	.quad	.Lset1648
.Lset1649 = .Ltmp2009-.Ltmp2008         # Loc expr size
	.short	.Lset1649
.Ltmp2008:
	.byte	118                     # DW_OP_breg6
	.ascii	"\270\177"              # 
.Ltmp2009:
.Lset1650 = .Ltmp999-.Lfunc_begin0
	.quad	.Lset1650
.Lset1651 = .Ltmp1002-.Lfunc_begin0
	.quad	.Lset1651
.Lset1652 = .Ltmp2011-.Ltmp2010         # Loc expr size
	.short	.Lset1652
.Ltmp2010:
	.byte	81                      # super-register
                                        # DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2011:
	.quad	0
	.quad	0
.Ldebug_loc193:
.Lset1653 = .Ltmp1005-.Lfunc_begin0
	.quad	.Lset1653
.Lset1654 = .Ltmp1009-.Lfunc_begin0
	.quad	.Lset1654
.Lset1655 = .Ltmp2013-.Ltmp2012         # Loc expr size
	.short	.Lset1655
.Ltmp2012:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2013:
.Lset1656 = .Ltmp1010-.Lfunc_begin0
	.quad	.Lset1656
.Lset1657 = .Ltmp1013-.Lfunc_begin0
	.quad	.Lset1657
.Lset1658 = .Ltmp2015-.Ltmp2014         # Loc expr size
	.short	.Lset1658
.Ltmp2014:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2015:
	.quad	0
	.quad	0
.Ldebug_loc194:
.Lset1659 = .Ltmp1006-.Lfunc_begin0
	.quad	.Lset1659
.Lset1660 = .Ltmp1007-.Lfunc_begin0
	.quad	.Lset1660
.Lset1661 = .Ltmp2017-.Ltmp2016         # Loc expr size
	.short	.Lset1661
.Ltmp2016:
	.byte	81                      # super-register
                                        # DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2017:
.Lset1662 = .Ltmp1009-.Lfunc_begin0
	.quad	.Lset1662
.Lset1663 = .Ltmp1012-.Lfunc_begin0
	.quad	.Lset1663
.Lset1664 = .Ltmp2019-.Ltmp2018         # Loc expr size
	.short	.Lset1664
.Ltmp2018:
	.byte	81                      # super-register
                                        # DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2019:
	.quad	0
	.quad	0
.Ldebug_loc195:
.Lset1665 = .Ltmp1014-.Lfunc_begin0
	.quad	.Lset1665
.Lset1666 = .Ltmp1018-.Lfunc_begin0
	.quad	.Lset1666
.Lset1667 = .Ltmp2021-.Ltmp2020         # Loc expr size
	.short	.Lset1667
.Ltmp2020:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2021:
	.quad	0
	.quad	0
.Ldebug_loc196:
.Lset1668 = .Lfunc_begin32-.Lfunc_begin0
	.quad	.Lset1668
.Lset1669 = .Ltmp1035-.Lfunc_begin0
	.quad	.Lset1669
.Lset1670 = .Ltmp2023-.Ltmp2022         # Loc expr size
	.short	.Lset1670
.Ltmp2022:
	.byte	85                      # DW_OP_reg5
.Ltmp2023:
.Lset1671 = .Ltmp1035-.Lfunc_begin0
	.quad	.Lset1671
.Lset1672 = .Ltmp1036-.Lfunc_begin0
	.quad	.Lset1672
.Lset1673 = .Ltmp2025-.Ltmp2024         # Loc expr size
	.short	.Lset1673
.Ltmp2024:
	.byte	83                      # DW_OP_reg3
.Ltmp2025:
	.quad	0
	.quad	0
.Ldebug_loc197:
.Lset1674 = .Lfunc_begin34-.Lfunc_begin0
	.quad	.Lset1674
.Lset1675 = .Ltmp1054-.Lfunc_begin0
	.quad	.Lset1675
.Lset1676 = .Ltmp2027-.Ltmp2026         # Loc expr size
	.short	.Lset1676
.Ltmp2026:
	.byte	85                      # DW_OP_reg5
.Ltmp2027:
.Lset1677 = .Ltmp1054-.Lfunc_begin0
	.quad	.Lset1677
.Lset1678 = .Ltmp1057-.Lfunc_begin0
	.quad	.Lset1678
.Lset1679 = .Ltmp2029-.Ltmp2028         # Loc expr size
	.short	.Lset1679
.Ltmp2028:
	.byte	83                      # DW_OP_reg3
.Ltmp2029:
.Lset1680 = .Ltmp1058-.Lfunc_begin0
	.quad	.Lset1680
.Lset1681 = .Ltmp1065-.Lfunc_begin0
	.quad	.Lset1681
.Lset1682 = .Ltmp2031-.Ltmp2030         # Loc expr size
	.short	.Lset1682
.Ltmp2030:
	.byte	83                      # DW_OP_reg3
.Ltmp2031:
	.quad	0
	.quad	0
.Ldebug_loc198:
.Lset1683 = .Lfunc_begin34-.Lfunc_begin0
	.quad	.Lset1683
.Lset1684 = .Ltmp1053-.Lfunc_begin0
	.quad	.Lset1684
.Lset1685 = .Ltmp2033-.Ltmp2032         # Loc expr size
	.short	.Lset1685
.Ltmp2032:
	.byte	84                      # super-register
                                        # DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2033:
.Lset1686 = .Ltmp1053-.Lfunc_begin0
	.quad	.Lset1686
.Lset1687 = .Ltmp1056-.Lfunc_begin0
	.quad	.Lset1687
.Lset1688 = .Ltmp2035-.Ltmp2034         # Loc expr size
	.short	.Lset1688
.Ltmp2034:
	.byte	86                      # super-register
                                        # DW_OP_reg6
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2035:
.Lset1689 = .Ltmp1058-.Lfunc_begin0
	.quad	.Lset1689
.Lset1690 = .Ltmp1063-.Lfunc_begin0
	.quad	.Lset1690
.Lset1691 = .Ltmp2037-.Ltmp2036         # Loc expr size
	.short	.Lset1691
.Ltmp2036:
	.byte	86                      # super-register
                                        # DW_OP_reg6
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2037:
	.quad	0
	.quad	0
.Ldebug_loc199:
.Lset1692 = .Ltmp1060-.Lfunc_begin0
	.quad	.Lset1692
.Lset1693 = .Ltmp1065-.Lfunc_begin0
	.quad	.Lset1693
.Lset1694 = .Ltmp2039-.Ltmp2038         # Loc expr size
	.short	.Lset1694
.Ltmp2038:
	.byte	95                      # DW_OP_reg15
.Ltmp2039:
	.quad	0
	.quad	0
.Ldebug_loc200:
.Lset1695 = .Ltmp1061-.Lfunc_begin0
	.quad	.Lset1695
.Lset1696 = .Ltmp1064-.Lfunc_begin0
	.quad	.Lset1696
.Lset1697 = .Ltmp2041-.Ltmp2040         # Loc expr size
	.short	.Lset1697
.Ltmp2040:
	.byte	80                      # DW_OP_reg0
.Ltmp2041:
	.quad	0
	.quad	0
.Ldebug_loc201:
.Lset1698 = .Ltmp1064-.Lfunc_begin0
	.quad	.Lset1698
.Lset1699 = .Ltmp1065-.Lfunc_begin0
	.quad	.Lset1699
.Lset1700 = .Ltmp2043-.Ltmp2042         # Loc expr size
	.short	.Lset1700
.Ltmp2042:
	.byte	80                      # DW_OP_reg0
.Ltmp2043:
	.quad	0
	.quad	0
.Ldebug_loc202:
.Lset1701 = .Ltmp1074-.Lfunc_begin0
	.quad	.Lset1701
.Lset1702 = .Ltmp1082-.Lfunc_begin0
	.quad	.Lset1702
.Lset1703 = .Ltmp2045-.Ltmp2044         # Loc expr size
	.short	.Lset1703
.Ltmp2044:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp2045:
.Lset1704 = .Ltmp1082-.Lfunc_begin0
	.quad	.Lset1704
.Lset1705 = .Ltmp1083-.Lfunc_begin0
	.quad	.Lset1705
.Lset1706 = .Ltmp2047-.Ltmp2046         # Loc expr size
	.short	.Lset1706
.Ltmp2046:
	.byte	80                      # super-register
                                        # DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2047:
	.quad	0
	.quad	0
.Ldebug_loc203:
.Lset1707 = .Ltmp1075-.Lfunc_begin0
	.quad	.Lset1707
.Lset1708 = .Ltmp1080-.Lfunc_begin0
	.quad	.Lset1708
.Lset1709 = .Ltmp2049-.Ltmp2048         # Loc expr size
	.short	.Lset1709
.Ltmp2048:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2049:
	.quad	0
	.quad	0
.Ldebug_loc204:
.Lset1710 = .Ltmp1078-.Lfunc_begin0
	.quad	.Lset1710
.Lset1711 = .Ltmp1081-.Lfunc_begin0
	.quad	.Lset1711
.Lset1712 = .Ltmp2051-.Ltmp2050         # Loc expr size
	.short	.Lset1712
.Ltmp2050:
	.byte	81                      # DW_OP_reg1
.Ltmp2051:
	.quad	0
	.quad	0
.Ldebug_loc205:
.Lset1713 = .Lfunc_begin39-.Lfunc_begin0
	.quad	.Lset1713
.Lset1714 = .Ltmp1099-.Lfunc_begin0
	.quad	.Lset1714
.Lset1715 = .Ltmp2053-.Ltmp2052         # Loc expr size
	.short	.Lset1715
.Ltmp2052:
	.byte	85                      # DW_OP_reg5
.Ltmp2053:
.Lset1716 = .Ltmp1099-.Lfunc_begin0
	.quad	.Lset1716
.Lset1717 = .Ltmp1105-.Lfunc_begin0
	.quad	.Lset1717
.Lset1718 = .Ltmp2055-.Ltmp2054         # Loc expr size
	.short	.Lset1718
.Ltmp2054:
	.byte	92                      # DW_OP_reg12
.Ltmp2055:
.Lset1719 = .Ltmp1113-.Lfunc_begin0
	.quad	.Lset1719
.Lset1720 = .Ltmp1123-.Lfunc_begin0
	.quad	.Lset1720
.Lset1721 = .Ltmp2057-.Ltmp2056         # Loc expr size
	.short	.Lset1721
.Ltmp2056:
	.byte	92                      # DW_OP_reg12
.Ltmp2057:
	.quad	0
	.quad	0
.Ldebug_loc206:
.Lset1722 = .Lfunc_begin39-.Lfunc_begin0
	.quad	.Lset1722
.Lset1723 = .Ltmp1098-.Lfunc_begin0
	.quad	.Lset1723
.Lset1724 = .Ltmp2059-.Ltmp2058         # Loc expr size
	.short	.Lset1724
.Ltmp2058:
	.byte	84                      # super-register
                                        # DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2059:
.Lset1725 = .Ltmp1098-.Lfunc_begin0
	.quad	.Lset1725
.Lset1726 = .Ltmp1109-.Lfunc_begin0
	.quad	.Lset1726
.Lset1727 = .Ltmp2061-.Ltmp2060         # Loc expr size
	.short	.Lset1727
.Ltmp2060:
	.byte	95                      # super-register
                                        # DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2061:
.Lset1728 = .Ltmp1110-.Lfunc_begin0
	.quad	.Lset1728
.Lset1729 = .Ltmp1111-.Lfunc_begin0
	.quad	.Lset1729
.Lset1730 = .Ltmp2063-.Ltmp2062         # Loc expr size
	.short	.Lset1730
.Ltmp2062:
	.byte	95                      # super-register
                                        # DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2063:
.Lset1731 = .Ltmp1112-.Lfunc_begin0
	.quad	.Lset1731
.Lset1732 = .Ltmp1123-.Lfunc_begin0
	.quad	.Lset1732
.Lset1733 = .Ltmp2065-.Ltmp2064         # Loc expr size
	.short	.Lset1733
.Ltmp2064:
	.byte	95                      # super-register
                                        # DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2065:
.Lset1734 = .Ltmp1137-.Lfunc_begin0
	.quad	.Lset1734
.Lset1735 = .Ltmp1138-.Lfunc_begin0
	.quad	.Lset1735
.Lset1736 = .Ltmp2067-.Ltmp2066         # Loc expr size
	.short	.Lset1736
.Ltmp2066:
	.byte	95                      # super-register
                                        # DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2067:
	.quad	0
	.quad	0
.Ldebug_loc207:
.Lset1737 = .Ltmp1115-.Lfunc_begin0
	.quad	.Lset1737
.Lset1738 = .Ltmp1122-.Lfunc_begin0
	.quad	.Lset1738
.Lset1739 = .Ltmp2069-.Ltmp2068         # Loc expr size
	.short	.Lset1739
.Ltmp2068:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp2069:
.Lset1740 = .Ltmp1122-.Lfunc_begin0
	.quad	.Lset1740
.Lset1741 = .Ltmp1123-.Lfunc_begin0
	.quad	.Lset1741
.Lset1742 = .Ltmp2071-.Ltmp2070         # Loc expr size
	.short	.Lset1742
.Ltmp2070:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2071:
.Lset1743 = .Ltmp1123-.Lfunc_begin0
	.quad	.Lset1743
.Lset1744 = .Lfunc_end39-.Lfunc_begin0
	.quad	.Lset1744
.Lset1745 = .Ltmp2073-.Ltmp2072         # Loc expr size
	.short	.Lset1745
.Ltmp2072:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp2073:
	.quad	0
	.quad	0
.Ldebug_loc208:
.Lset1746 = .Ltmp1116-.Lfunc_begin0
	.quad	.Lset1746
.Lset1747 = .Ltmp1119-.Lfunc_begin0
	.quad	.Lset1747
.Lset1748 = .Ltmp2075-.Ltmp2074         # Loc expr size
	.short	.Lset1748
.Ltmp2074:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2075:
	.quad	0
	.quad	0
.Ldebug_loc209:
.Lset1749 = .Ltmp1121-.Lfunc_begin0
	.quad	.Lset1749
.Lset1750 = .Ltmp1122-.Lfunc_begin0
	.quad	.Lset1750
.Lset1751 = .Ltmp2077-.Ltmp2076         # Loc expr size
	.short	.Lset1751
.Ltmp2076:
	.byte	85                      # super-register
                                        # DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2077:
	.quad	0
	.quad	0
.Ldebug_loc210:
.Lset1752 = .Ltmp1124-.Lfunc_begin0
	.quad	.Lset1752
.Lset1753 = .Ltmp1126-.Lfunc_begin0
	.quad	.Lset1753
.Lset1754 = .Ltmp2079-.Ltmp2078         # Loc expr size
	.short	.Lset1754
.Ltmp2078:
	.byte	95                      # super-register
                                        # DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2079:
	.quad	0
	.quad	0
.Ldebug_loc211:
.Lset1755 = .Ltmp1129-.Lfunc_begin0
	.quad	.Lset1755
.Lset1756 = .Ltmp1135-.Lfunc_begin0
	.quad	.Lset1756
.Lset1757 = .Ltmp2081-.Ltmp2080         # Loc expr size
	.short	.Lset1757
.Ltmp2080:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp2081:
.Lset1758 = .Ltmp1135-.Lfunc_begin0
	.quad	.Lset1758
.Lset1759 = .Ltmp1136-.Lfunc_begin0
	.quad	.Lset1759
.Lset1760 = .Ltmp2083-.Ltmp2082         # Loc expr size
	.short	.Lset1760
.Ltmp2082:
	.byte	93                      # super-register
                                        # DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2083:
.Lset1761 = .Ltmp1136-.Lfunc_begin0
	.quad	.Lset1761
.Lset1762 = .Lfunc_end39-.Lfunc_begin0
	.quad	.Lset1762
.Lset1763 = .Ltmp2085-.Ltmp2084         # Loc expr size
	.short	.Lset1763
.Ltmp2084:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp2085:
	.quad	0
	.quad	0
.Ldebug_loc212:
.Lset1764 = .Ltmp1130-.Lfunc_begin0
	.quad	.Lset1764
.Lset1765 = .Ltmp1133-.Lfunc_begin0
	.quad	.Lset1765
.Lset1766 = .Ltmp2087-.Ltmp2086         # Loc expr size
	.short	.Lset1766
.Ltmp2086:
	.byte	95                      # super-register
                                        # DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2087:
	.quad	0
	.quad	0
.Ldebug_loc213:
.Lset1767 = .Ltmp1142-.Lfunc_begin0
	.quad	.Lset1767
.Lset1768 = .Ltmp1151-.Lfunc_begin0
	.quad	.Lset1768
.Lset1769 = .Ltmp2089-.Ltmp2088         # Loc expr size
	.short	.Lset1769
.Ltmp2088:
	.byte	16                      # DW_OP_constu
	.byte	0                       # 
.Ltmp2089:
.Lset1770 = .Ltmp1151-.Lfunc_begin0
	.quad	.Lset1770
.Lset1771 = .Lfunc_end40-.Lfunc_begin0
	.quad	.Lset1771
.Lset1772 = .Ltmp2091-.Ltmp2090         # Loc expr size
	.short	.Lset1772
.Ltmp2090:
	.byte	82                      # super-register
                                        # DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2091:
	.quad	0
	.quad	0
.Ldebug_loc214:
.Lset1773 = .Ltmp1143-.Lfunc_begin0
	.quad	.Lset1773
.Lset1774 = .Ltmp1145-.Lfunc_begin0
	.quad	.Lset1774
.Lset1775 = .Ltmp2093-.Ltmp2092         # Loc expr size
	.short	.Lset1775
.Ltmp2092:
	.byte	84                      # super-register
                                        # DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2093:
	.quad	0
	.quad	0
.Ldebug_loc215:
.Lset1776 = .Ltmp1143-.Lfunc_begin0
	.quad	.Lset1776
.Lset1777 = .Ltmp1145-.Lfunc_begin0
	.quad	.Lset1777
.Lset1778 = .Ltmp2095-.Ltmp2094         # Loc expr size
	.short	.Lset1778
.Ltmp2094:
	.byte	84                      # super-register
                                        # DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
.Ltmp2095:
	.quad	0
	.quad	0
.Ldebug_loc216:
.Lset1779 = .Ltmp1146-.Lfunc_begin0
	.quad	.Lset1779
.Lset1780 = .Ltmp1147-.Lfunc_begin0
	.quad	.Lset1780
.Lset1781 = .Ltmp2097-.Ltmp2096         # Loc expr size
	.short	.Lset1781
.Ltmp2096:
	.byte	82                      # DW_OP_reg2
.Ltmp2097:
.Lset1782 = .Ltmp1148-.Lfunc_begin0
	.quad	.Lset1782
.Lset1783 = .Ltmp1149-.Lfunc_begin0
	.quad	.Lset1783
.Lset1784 = .Ltmp2099-.Ltmp2098         # Loc expr size
	.short	.Lset1784
.Ltmp2098:
	.byte	82                      # DW_OP_reg2
.Ltmp2099:
	.quad	0
	.quad	0
	.section	.debug_pubnames,"",@progbits
.Lset1785 = .LpubNames_end0-.LpubNames_begin0 # Length of Public Names Info
	.long	.Lset1785
.LpubNames_begin0:
	.short	2                       # DWARF Version
	.long	.L.debug_info_begin0    # Offset of Compilation Unit Info
.Lset1786 = .L.debug_info_end0-.L.debug_info_begin0 # Compilation Unit Length
	.long	.Lset1786
	.long	42                      # DIE offset
	.asciz	"g_hard_elements"       # External Name
	.long	5822                    # DIE offset
	.asciz	"matrix_mul"            # External Name
	.long	4455                    # DIE offset
	.asciz	"scalar_mul"            # External Name
	.long	3223                    # DIE offset
	.asciz	"transposed"            # External Name
	.long	7216                    # DIE offset
	.asciz	"matrix_pow"            # External Name
	.long	7178                    # DIE offset
	.asciz	"release_matrix_obj"    # External Name
	.long	7704                    # DIE offset
	.asciz	"get_frequency"         # External Name
	.long	1286                    # DIE offset
	.asciz	"fast_rand"             # External Name
	.long	2444                    # DIE offset
	.asciz	"cloned"                # External Name
	.long	3085                    # DIE offset
	.asciz	"reverse_worker"        # External Name
	.long	3435                    # DIE offset
	.asciz	"transpose_worker"      # External Name
	.long	945                     # DIE offset
	.asciz	"new_matrix"            # External Name
	.long	2794                    # DIE offset
	.asciz	"copy_occurances"       # External Name
	.long	7286                    # DIE offset
	.asciz	"m_pow"                 # External Name
	.long	987                     # DIE offset
	.asciz	"identity_worker"       # External Name
	.long	2656                    # DIE offset
	.asciz	"clone_worker"          # External Name
	.long	304                     # DIE offset
	.asciz	"set_seed"              # External Name
	.long	1980                    # DIE offset
	.asciz	"sequence_worker"       # External Name
	.long	1312                    # DIE offset
	.asciz	"uniform_matrix"        # External Name
	.long	1072                    # DIE offset
	.asciz	"random_matrix"         # External Name
	.long	416                     # DIE offset
	.asciz	"display"               # External Name
	.long	4133                    # DIE offset
	.asciz	"scalar_add_worker"     # External Name
	.long	7620                    # DIE offset
	.asciz	"get_minimum"           # External Name
	.long	7662                    # DIE offset
	.asciz	"get_maximum"           # External Name
	.long	7944                    # DIE offset
	.asciz	"get_cmpe_worker"       # External Name
	.long	689                     # DIE offset
	.asciz	"display_element"       # External Name
	.long	2873                    # DIE offset
	.asciz	"reversed"              # External Name
	.long	155                     # DIE offset
	.asciz	"g_soft_width"          # External Name
	.long	113                     # DIE offset
	.asciz	"g_height"              # External Name
	.long	4969                    # DIE offset
	.asciz	"matrix_add"            # External Name
	.long	134                     # DIE offset
	.asciz	"g_hard_width"          # External Name
	.long	342                     # DIE offset
	.asciz	"set_nthreads"          # External Name
	.long	218                     # DIE offset
	.asciz	"g_seed"                # External Name
	.long	3729                    # DIE offset
	.asciz	"scalar_add"            # External Name
	.long	378                     # DIE offset
	.asciz	"set_dimensions"        # External Name
	.long	7512                    # DIE offset
	.asciz	"get_trace"             # External Name
	.long	7470                    # DIE offset
	.asciz	"get_sum"               # External Name
	.long	5297                    # DIE offset
	.asciz	"matrix_add_worker"     # External Name
	.long	4767                    # DIE offset
	.asciz	"scalar_mul_worker"     # External Name
	.long	176                     # DIE offset
	.asciz	"g_padding"             # External Name
	.long	755                     # DIE offset
	.asciz	"identity_matrix"       # External Name
	.long	92                      # DIE offset
	.asciz	"g_soft_elements"       # External Name
	.long	197                     # DIE offset
	.asciz	"g_nthreads"            # External Name
	.long	600                     # DIE offset
	.asciz	"display_column"        # External Name
	.long	4419                    # DIE offset
	.asciz	"reset_occurances"      # External Name
	.long	515                     # DIE offset
	.asciz	"display_row"           # External Name
	.long	1668                    # DIE offset
	.asciz	"sequence_matrix"       # External Name
	.long	1552                    # DIE offset
	.asciz	"uniform_worker"        # External Name
	.long	6280                    # DIE offset
	.asciz	"matrix_mul_worker"     # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
.Lset1787 = .LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
	.long	.Lset1787
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.L.debug_info_begin0    # Offset of Compilation Unit Info
.Lset1788 = .L.debug_info_end0-.L.debug_info_begin0 # Compilation Unit Length
	.long	.Lset1788
	.long	8930                    # DIE offset
	.asciz	"scalar_add_argument"   # External Name
	.long	63                      # DIE offset
	.asciz	"ssize_t"               # External Name
	.long	8458                    # DIE offset
	.asciz	"uniform_argument"      # External Name
	.long	8788                    # DIE offset
	.asciz	"reverse_argument"      # External Name
	.long	8564                    # DIE offset
	.asciz	"sequence_argument"     # External Name
	.long	9085                    # DIE offset
	.asciz	"scalar_mul_argument"   # External Name
	.long	8859                    # DIE offset
	.asciz	"transpose_argument"    # External Name
	.long	250                     # DIE offset
	.asciz	"unsigned int"          # External Name
	.long	8337                    # DIE offset
	.asciz	"matrix_t"              # External Name
	.long	9381                    # DIE offset
	.asciz	"matrix_mul_argument"   # External Name
	.long	8547                    # DIE offset
	.asciz	"long long int"         # External Name
	.long	8405                    # DIE offset
	.asciz	"identity_argument"     # External Name
	.long	9226                    # DIE offset
	.asciz	"matrix_add_argument"   # External Name
	.long	8524                    # DIE offset
	.asciz	"__m128i"               # External Name
	.long	9533                    # DIE offset
	.asciz	"get_cmpe_argument"     # External Name
	.long	8717                    # DIE offset
	.asciz	"clone_argument"        # External Name
	.long	8393                    # DIE offset
	.asciz	"long unsigned int"     # External Name
	.long	239                     # DIE offset
	.asciz	"uint32_t"              # External Name
	.long	8265                    # DIE offset
	.asciz	"occurances_t"          # External Name
	.long	85                      # DIE offset
	.asciz	"long int"              # External Name
	.long	8382                    # DIE offset
	.asciz	"pthread_t"             # External Name
	.long	8313                    # DIE offset
	.asciz	"char"                  # External Name
	.long	74                      # DIE offset
	.asciz	"__ssize_t"             # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.5.0 (tags/RELEASE_350/final)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
