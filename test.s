	.file	"matrix.c"
# GNU C (GCC) version 4.9.2 20150212 (Red Hat 4.9.2-6) (x86_64-redhat-linux)
#	compiled by GNU C version 4.9.2 20150212 (Red Hat 4.9.2-6), GMP version 6.0.0, MPFR version 3.1.2, MPC version 1.0.2
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -D_REENTRANT matrix.c -march=haswell -mmmx -mno-3dnow
# -msse -msse2 -msse3 -mssse3 -mno-sse4a -mcx16 -msahf -mmovbe -maes
# -mno-sha -mpclmul -mpopcnt -mabm -mno-lwp -mfma -mno-fma4 -mno-xop -mbmi
# -mbmi2 -mno-tbm -mavx -mavx2 -msse4.2 -msse4.1 -mlzcnt -mno-rtm -mno-hle
# -mrdrnd -mf16c -mfsgsbase -mno-rdseed -mno-prfchw -mno-adx -mfxsr -mxsave
# -mxsaveopt -mno-avx512f -mno-avx512er -mno-avx512cd -mno-avx512pf
# -mno-prefetchwt1 --param l1-cache-size=32 --param l1-cache-line-size=64
# --param l2-cache-size=6144 -mtune=haswell -auxbase-strip test.s -g -O2
# -std=gnu11 -fverbose-asm
# options enabled:  -faggressive-loop-optimizations
# -fasynchronous-unwind-tables -fauto-inc-dec -fbranch-count-reg
# -fcaller-saves -fcombine-stack-adjustments -fcommon -fcompare-elim
# -fcprop-registers -fcrossjumping -fcse-follow-jumps -fdefer-pop
# -fdelete-null-pointer-checks -fdevirtualize -fdevirtualize-speculatively
# -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
# -fexpensive-optimizations -fforward-propagate -ffunction-cse -fgcse
# -fgcse-lm -fgnu-runtime -fgnu-unique -fguess-branch-probability
# -fhoist-adjacent-loads -fident -fif-conversion -fif-conversion2
# -findirect-inlining -finline -finline-atomics
# -finline-functions-called-once -finline-small-functions -fipa-cp
# -fipa-profile -fipa-pure-const -fipa-reference -fipa-sra
# -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
# -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
# -fleading-underscore -fmath-errno -fmerge-constants -fmerge-debug-strings
# -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
# -foptimize-strlen -fpartial-inlining -fpeephole -fpeephole2
# -fprefetch-loop-arrays -free -freg-struct-return -freorder-blocks
# -freorder-blocks-and-partition -freorder-functions -frerun-cse-after-loop
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-insns2 -fshow-column -fshrink-wrap
# -fsigned-zeros -fsplit-ivs-in-unroller -fsplit-wide-types
# -fstrict-aliasing -fstrict-overflow -fstrict-volatile-bitfields
# -fsync-libcalls -fthread-jumps -ftoplevel-reorder -ftrapping-math
# -ftree-bit-ccp -ftree-builtin-call-dce -ftree-ccp -ftree-ch
# -ftree-coalesce-vars -ftree-copy-prop -ftree-copyrename -ftree-cselim
# -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop -ftree-pre
# -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slsr
# -ftree-sra -ftree-switch-conversion -ftree-tail-merge -ftree-ter
# -ftree-vrp -funit-at-a-time -funwind-tables -fvar-tracking
# -fvar-tracking-assignments -fverbose-asm -fzero-initialized-in-bss
# -m128bit-long-double -m64 -m80387 -mabm -maes -malign-stringops -mavx
# -mavx2 -mbmi -mbmi2 -mcx16 -mf16c -mfancy-math-387 -mfma -mfp-ret-in-387
# -mfsgsbase -mfxsr -mglibc -mhle -mieee-fp -mlong-double-80 -mlzcnt -mmmx
# -mmovbe -mpclmul -mpopcnt -mpush-args -mrdrnd -mred-zone -msahf -msse
# -msse2 -msse3 -msse4 -msse4.1 -msse4.2 -mssse3 -mtls-direct-seg-refs
# -mvzeroupper -mxsave -mxsaveopt

	.text
.Ltext0:
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.section	.text.unlikely
.Ltext_cold0:
	.text
	.type	identity_worker, @function
identity_worker:
.LFB2266:
	.file 1 "matrix.c"
	.loc 1 220 0
	.cfi_startproc
.LVL0:
	.loc 1 223 0
	movq	g_width(%rip), %rax	# g_width, tmp120
	.loc 1 222 0
	movq	(%rdi), %rdx	# MEM[(struct identity_argument *)arg_4(D)].matrix_obj, MEM[(struct identity_argument *)arg_4(D)].matrix_obj
.LVL1:
	.loc 1 223 0
	leaq	1(%rax), %rcx	#, D.18948
	movl	8(%rdi), %eax	# MEM[(struct identity_argument *)arg_4(D)].start_row, D.18948
	movq	(%rdx), %rsi	# _6->data,
	imulq	%rcx, %rax	# D.18948, D.18948
	salq	$2, %rcx	#, D.18946
	leaq	(%rsi,%rax,4), %rax	#, matrix
.LVL2:
.LBB17:
	.loc 1 225 0
	movl	12(%rdi), %esi	# MEM[(struct identity_argument *)arg_4(D)].num_rows, i
.LVL3:
	leal	-1(%rsi), %edx	#, i
.LVL4:
	testl	%esi, %esi	# i
	je	.L8	#,
	.p2align 4,,10
	.p2align 3
.L5:
	subl	$1, %edx	#, i
.LVL5:
	.loc 1 227 0
	movl	$1, (%rax)	#, MEM[base: matrix_27, offset: 0B]
	.loc 1 228 0
	addq	%rcx, %rax	# D.18946, matrix
.LVL6:
	.loc 1 225 0
	cmpl	$-1, %edx	#, i
	jne	.L5	#,
.L8:
.LBE17:
	.loc 1 231 0
	xorl	%eax, %eax	#
.LVL7:
	ret
	.cfi_endproc
.LFE2266:
	.size	identity_worker, .-identity_worker
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.text.unlikely
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.type	uniform_worker, @function
uniform_worker:
.LFB2272:
	.loc 1 449 0
	.cfi_startproc
.LVL8:
	.loc 1 453 0
	movq	g_width(%rip), %rsi	# g_width, D.18965
	movl	12(%rdi), %eax	# MEM[(struct uniform_argument *)arg_4(D)].start_row, D.18965
	.loc 1 451 0
	movq	(%rdi), %rdx	# MEM[(struct uniform_argument *)arg_4(D)].matrix_obj, MEM[(struct uniform_argument *)arg_4(D)].matrix_obj
.LVL9:
	.loc 1 452 0
	movl	8(%rdi), %ecx	# MEM[(struct uniform_argument *)arg_4(D)].value, value
.LVL10:
	.loc 1 453 0
	imulq	%rsi, %rax	# D.18965, D.18965
	movq	(%rdx), %r8	# _6->data,
.LBB18:
	.loc 1 455 0
	imull	16(%rdi), %esi	# MEM[(struct uniform_argument *)arg_4(D)].num_rows, i
.LBE18:
	.loc 1 453 0
	leaq	(%r8,%rax,4), %rax	#, matrix
.LVL11:
.LBB19:
	.loc 1 455 0
	leal	-1(%rsi), %edx	#,
.LVL12:
	leaq	4(%rax,%rdx,4), %rdx	#, D.18967
.LVL13:
	testl	%esi, %esi	# i
	je	.L16	#,
.LVL14:
	.p2align 4,,10
	.p2align 3
.L12:
	.loc 1 457 0
	addq	$4, %rax	#, matrix
.LVL15:
	movl	%ecx, -4(%rax)	# value, MEM[base: matrix_20, offset: -4B]
	.loc 1 455 0
	cmpq	%rdx, %rax	# D.18967, matrix
	jne	.L12	#,
.L16:
.LBE19:
	.loc 1 461 0
	xorl	%eax, %eax	#
.LVL16:
	ret
	.cfi_endproc
.LFE2272:
	.size	uniform_worker, .-uniform_worker
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.text.unlikely
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.type	sequence_worker, @function
sequence_worker:
.LFB2275:
	.loc 1 571 0
	.cfi_startproc
.LVL17:
	.loc 1 575 0
	movl	16(%rdi), %edx	# MEM[(struct sequence_argument *)arg_10(D)].start_row,
	.loc 1 574 0
	movl	12(%rdi), %r10d	# MEM[(struct sequence_argument *)arg_10(D)].increment, increment
	.loc 1 575 0
	movq	g_width(%rip), %rcx	# g_width, D.18986
	.loc 1 573 0
	movq	(%rdi), %rsi	# MEM[(struct sequence_argument *)arg_10(D)].matrix_obj, MEM[(struct sequence_argument *)arg_10(D)].matrix_obj
.LVL18:
	.loc 1 575 0
	movl	%edx, %eax	# D.18985, D.18985
	imull	%r10d, %eax	# increment, D.18985
	.loc 1 576 0
	imulq	%rcx, %rdx	# D.18986, D.18986
	movq	(%rsi), %r8	# _12->data,
	.loc 1 575 0
	imull	%ecx, %eax	# D.18986, D.18985
	addl	8(%rdi), %eax	# MEM[(struct sequence_argument *)arg_10(D)].start_value, max
.LVL19:
.LBB20:
	.loc 1 582 0
	imull	20(%rdi), %ecx	# MEM[(struct sequence_argument *)arg_10(D)].num_rows, i
.LBE20:
	.loc 1 576 0
	leaq	(%r8,%rdx,4), %rdx	#, matrix
.LVL20:
.LBB21:
	.loc 1 582 0
	leal	-1(%rcx), %esi	#,
.LVL21:
	testl	%ecx, %ecx	# i
	je	.L20	#,
	leaq	4(%rdx,%rsi,4), %r9	#, D.18983
	xorl	%r8d, %r8d	# sum
	xorl	%ecx, %ecx	# max
	movl	$-1, %esi	#, max
.LVL22:
	.p2align 4,,10
	.p2align 3
.L19:
	cmpl	%eax, %esi	# max, max
	.loc 1 584 0
	movl	%eax, (%rdx)	# max, MEM[base: matrix_65, offset: 0B]
	cmova	%eax, %esi	# max,, max, max
.LVL23:
	cmpl	%eax, %ecx	# max, max
	cmovb	%eax, %ecx	# max,, max, max
.LVL24:
	.loc 1 588 0
	addq	$4, %rdx	#, matrix
.LVL25:
	.loc 1 587 0
	addl	%eax, %r8d	# max, sum
.LVL26:
	.loc 1 589 0
	addl	%r10d, %eax	# increment, max
.LVL27:
	.loc 1 582 0
	cmpq	%r9, %rdx	# D.18983, matrix
	jne	.L19	#,
.LVL28:
.L18:
.LBE21:
	.loc 1 592 0
	movl	48(%rdi), %edx	# MEM[(struct sequence_argument *)arg_10(D)].id, D.18987
.LVL29:
	movq	24(%rdi), %rax	# MEM[(struct sequence_argument *)arg_10(D)].mins, MEM[(struct sequence_argument *)arg_10(D)].mins
.LVL30:
	movl	%esi, (%rax,%rdx,4)	# max, *_38
	.loc 1 593 0
	movq	32(%rdi), %rax	# MEM[(struct sequence_argument *)arg_10(D)].maxes, MEM[(struct sequence_argument *)arg_10(D)].maxes
	movl	48(%rdi), %edx	# MEM[(struct sequence_argument *)arg_10(D)].id, D.18987
	movl	%ecx, (%rax,%rdx,4)	# max, *_44
	.loc 1 594 0
	movq	40(%rdi), %rax	# MEM[(struct sequence_argument *)arg_10(D)].sums, MEM[(struct sequence_argument *)arg_10(D)].sums
	movl	48(%rdi), %edx	# MEM[(struct sequence_argument *)arg_10(D)].id, D.18987
	movl	%r8d, (%rax,%rdx,4)	# sum, *_50
	.loc 1 597 0
	xorl	%eax, %eax	#
	ret
.LVL31:
.L20:
	.loc 1 580 0
	xorl	%r8d, %r8d	# sum
	.loc 1 579 0
	xorl	%ecx, %ecx	# max
	.loc 1 578 0
	movl	$-1, %esi	#, max
.LVL32:
	jmp	.L18	#
	.cfi_endproc
.LFE2275:
	.size	sequence_worker, .-sequence_worker
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.text.unlikely
.LCOLDB3:
	.text
.LHOTB3:
	.p2align 4,,15
	.type	clone_worker, @function
clone_worker:
.LFB2278:
	.loc 1 705 0
	.cfi_startproc
.LVL33:
	.loc 1 710 0
	movq	g_width(%rip), %rdx	# g_width, D.19003
	movl	16(%rdi), %ecx	# MEM[(struct clone_argument *)arg_5(D)].start_row, D.19003
	.loc 1 707 0
	movq	(%rdi), %rsi	# MEM[(struct clone_argument *)arg_5(D)].matrix_obj, MEM[(struct clone_argument *)arg_5(D)].matrix_obj
.LVL34:
	.loc 1 708 0
	movq	8(%rdi), %rax	# MEM[(struct clone_argument *)arg_5(D)].result_obj, MEM[(struct clone_argument *)arg_5(D)].result_obj
.LVL35:
	.loc 1 710 0
	imulq	%rdx, %rcx	# D.19003, D.19003
.LBB22:
	.loc 1 713 0
	imull	20(%rdi), %edx	# MEM[(struct clone_argument *)arg_5(D)].num_rows, i
.LBE22:
	.loc 1 710 0
	salq	$2, %rcx	#, D.19004
	movq	%rcx, %r8	# D.19004, matrix
	addq	(%rsi), %r8	# _7->data, matrix
.LVL36:
	.loc 1 711 0
	addq	(%rax), %rcx	# _9->data, result
.LVL37:
.LBB23:
	.loc 1 713 0
	xorl	%eax, %eax	# ivtmp.312
	leal	-1(%rdx), %esi	#, D.19005
	addq	$1, %rsi	#, D.19005
	testl	%edx, %edx	# i
	je	.L29	#,
.LVL38:
	.p2align 4,,10
	.p2align 3
.L26:
	.loc 1 715 0
	movl	(%r8,%rax,4), %edx	# MEM[base: matrix_17, index: ivtmp.312_2, step: 4, offset: 0B], D.19002
	movl	%edx, (%rcx,%rax,4)	# D.19002, MEM[base: result_18, index: ivtmp.312_2, step: 4, offset: 0B]
	addq	$1, %rax	#, ivtmp.312
.LVL39:
	.loc 1 713 0
	cmpq	%rsi, %rax	# D.19005, ivtmp.312
	jne	.L26	#,
.LVL40:
.L29:
.LBE23:
	.loc 1 724 0
	xorl	%eax, %eax	#
	ret
	.cfi_endproc
.LFE2278:
	.size	clone_worker, .-clone_worker
	.section	.text.unlikely
.LCOLDE3:
	.text
.LHOTE3:
	.section	.text.unlikely
.LCOLDB4:
	.text
.LHOTB4:
	.p2align 4,,15
	.type	reverse_worker, @function
reverse_worker:
.LFB2281:
	.loc 1 808 0
	.cfi_startproc
.LVL41:
	.loc 1 812 0
	movq	g_width(%rip), %rcx	# g_width, D.19023
	movl	20(%rdi), %edx	# MEM[(struct reverse_argument *)arg_5(D)].start_row, D.19023
	.loc 1 811 0
	movq	(%rdi), %r8	# MEM[(struct reverse_argument *)arg_5(D)].result_obj, MEM[(struct reverse_argument *)arg_5(D)].result_obj
	.loc 1 813 0
	movq	g_elements(%rip), %r9	# g_elements, D.19023
	.loc 1 810 0
	movq	8(%rdi), %rsi	# MEM[(struct reverse_argument *)arg_5(D)].matrix_obj, MEM[(struct reverse_argument *)arg_5(D)].matrix_obj
.LVL42:
	.loc 1 812 0
	imulq	%rcx, %rdx	# D.19023, D.19023
.LBB24:
	.loc 1 815 0
	imull	16(%rdi), %ecx	# MEM[(struct reverse_argument *)arg_5(D)].num_rows, i
.LBE24:
	.loc 1 812 0
	leaq	0(,%rdx,4), %rax	#, D.19024
	addq	(%r8), %rax	# _9->data, result
.LVL43:
	.loc 1 813 0
	subq	%rdx, %r9	# D.19023, D.19023
	leaq	-4(,%r9,4), %rdx	#, D.19020
	addq	(%rsi), %rdx	# _7->data, matrix
.LVL44:
.LBB25:
	.loc 1 815 0
	leal	-1(%rcx), %esi	#,
.LVL45:
	leaq	4(%rax,%rsi,4), %rsi	#, D.19025
.LVL46:
	testl	%ecx, %ecx	# i
	je	.L36	#,
.LVL47:
	.p2align 4,,10
	.p2align 3
.L32:
	.loc 1 817 0
	subq	$4, %rdx	#, matrix
.LVL48:
	movl	4(%rdx), %ecx	# MEM[base: matrix_29, offset: 4B], D.19022
	addq	$4, %rax	#, result
.LVL49:
	movl	%ecx, -4(%rax)	# D.19022, MEM[base: result_28, offset: -4B]
	.loc 1 815 0
	cmpq	%rsi, %rax	# D.19025, result
	jne	.L32	#,
.L36:
.LBE25:
	.loc 1 821 0
	xorl	%eax, %eax	#
.LVL50:
	ret
	.cfi_endproc
.LFE2281:
	.size	reverse_worker, .-reverse_worker
	.section	.text.unlikely
.LCOLDE4:
	.text
.LHOTE4:
	.section	.text.unlikely
.LCOLDB5:
	.text
.LHOTB5:
	.p2align 4,,15
	.type	transpose_worker, @function
transpose_worker:
.LFB2283:
	.loc 1 883 0
	.cfi_startproc
.LVL51:
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	g_width(%rip), %r8	# g_width, D.19048
	pushq	%rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	.loc 1 885 0
	movq	(%rdi), %rax	# MEM[(struct transpose_argument *)arg_7(D)].matrix_obj, MEM[(struct transpose_argument *)arg_7(D)].matrix_obj
	.loc 1 888 0
	movl	20(%rdi), %ebx	# MEM[(struct transpose_argument *)arg_7(D)].start_row, curr_y
	.loc 1 885 0
	movq	(%rax), %r11	# _9->data, matrix
.LVL52:
	.loc 1 886 0
	movq	8(%rdi), %rax	# MEM[(struct transpose_argument *)arg_7(D)].result_obj, MEM[(struct transpose_argument *)arg_7(D)].result_obj
	movq	(%rax), %r10	# _11->data, result
.LVL53:
.LBB26:
	.loc 1 889 0
	movl	16(%rdi), %eax	# MEM[(struct transpose_argument *)arg_7(D)].num_rows, num_rows
.LVL54:
	movl	%r8d, %edi	# D.19048, D.19049
.LVL55:
	leal	(%rax,%rbx), %ebp	#, D.19047
	testl	%eax, %eax	# num_rows
	je	.L48	#,
.LVL56:
	.p2align 4,,10
	.p2align 3
.L44:
.LBB27:
.LBB28:
	.loc 1 892 0
	testl	%edi, %edi	# D.19049
	je	.L43	#,
	movl	%ebx, %esi	# curr_y, D.19044
	movq	%r8, %r9	# D.19048, D.19044
	xorl	%edx, %edx	# curr_x
	imulq	%rsi, %r9	# D.19044, D.19044
.LVL57:
	.p2align 4,,10
	.p2align 3
.L42:
	.loc 1 894 0
	movl	%edx, %eax	# curr_x, D.19044
	.loc 1 895 0
	addl	$1, %edx	#, curr_x
.LVL58:
	.loc 1 894 0
	leaq	(%rax,%r9), %rcx	#, tmp114
	imulq	%r8, %rax	# D.19048, D.19044
	movl	(%r11,%rcx,4), %ecx	# *_30, D.19047
	addq	%rsi, %rax	# D.19044, tmp116
	movl	%ecx, (%r10,%rax,4)	# D.19047, *_25
	.loc 1 892 0
	cmpl	%edi, %edx	# D.19049, curr_x
	jne	.L42	#,
.LVL59:
.L43:
.LBE28:
	.loc 1 897 0
	addl	$1, %ebx	#, curr_y
.LVL60:
.LBE27:
	.loc 1 889 0
	cmpl	%ebp, %ebx	# D.19047, curr_y
	jne	.L44	#,
.L48:
.LBE26:
	.loc 1 900 0
	xorl	%eax, %eax	#
	popq	%rbx	#
	.cfi_def_cfa_offset 16
.LVL61:
	popq	%rbp	#
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2283:
	.size	transpose_worker, .-transpose_worker
	.section	.text.unlikely
.LCOLDE5:
	.text
.LHOTE5:
	.section	.text.unlikely
.LCOLDB6:
	.text
.LHOTB6:
	.p2align 4,,15
	.type	scalar_add_worker, @function
scalar_add_worker:
.LFB2286:
	.loc 1 994 0
	.cfi_startproc
.LVL62:
	.loc 1 1000 0
	movq	g_width(%rip), %rax	# g_width, D.19066
	.loc 1 994 0
	pushq	%rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 1 1000 0
	movl	48(%rdi), %r9d	# MEM[(struct scalar_add_argument *)arg_10(D)].start_row, D.19066
	.loc 1 996 0
	movq	(%rdi), %rcx	# MEM[(struct scalar_add_argument *)arg_10(D)].matrix_obj, MEM[(struct scalar_add_argument *)arg_10(D)].matrix_obj
.LVL63:
	.loc 1 997 0
	movq	8(%rdi), %rdx	# MEM[(struct scalar_add_argument *)arg_10(D)].result_obj, MEM[(struct scalar_add_argument *)arg_10(D)].result_obj
.LVL64:
	.loc 1 998 0
	movl	40(%rdi), %r11d	# MEM[(struct scalar_add_argument *)arg_10(D)].scalar, scalar
.LVL65:
	.loc 1 1000 0
	imulq	%rax, %r9	# D.19066, D.19066
.LBB29:
	.loc 1 1007 0
	imull	44(%rdi), %eax	# MEM[(struct scalar_add_argument *)arg_10(D)].num_rows, i
	leal	-1(%rax), %r10d	#,
.LBE29:
	.loc 1 1000 0
	salq	$2, %r9	#, D.19067
	movq	%r9, %rbx	# D.19067, matrix
	.loc 1 1001 0
	addq	(%rdx), %r9	# _14->data, result
	.loc 1 1000 0
	addq	(%rcx), %rbx	# _12->data, matrix
.LVL66:
.LBB30:
	.loc 1 1007 0
	testl	%eax, %eax	# i
	je	.L53	#,
	addq	$1, %r10	#, D.19063
.LVL67:
	xorl	%edx, %edx	# ivtmp.356
	xorl	%r8d, %r8d	# sum
	xorl	%ecx, %ecx	# max
	movl	$-1, %esi	#, max
.LVL68:
	.p2align 4,,10
	.p2align 3
.L52:
	.loc 1 1009 0
	movl	(%rbx,%rdx,4), %eax	# MEM[base: matrix_23, index: ivtmp.356_60, step: 4, offset: 0B], max
	addl	%r11d, %eax	# scalar, max
	cmpl	%eax, %esi	# max, max
	movl	%eax, (%r9,%rdx,4)	# max, MEM[base: result_24, index: ivtmp.356_60, step: 4, offset: 0B]
	cmova	%eax, %esi	# max,, max, max
.LVL69:
	cmpl	%eax, %ecx	# max, max
	cmovb	%eax, %ecx	# max,, max, max
.LVL70:
	addq	$1, %rdx	#, ivtmp.356
.LVL71:
	.loc 1 1012 0
	addl	%eax, %r8d	# max, sum
.LVL72:
	.loc 1 1007 0
	cmpq	%r10, %rdx	# D.19063, ivtmp.356
	jne	.L52	#,
.LVL73:
.L51:
.LBE30:
	.loc 1 1016 0
	movl	52(%rdi), %edx	# MEM[(struct scalar_add_argument *)arg_10(D)].id, D.19067
	movq	16(%rdi), %rax	# MEM[(struct scalar_add_argument *)arg_10(D)].mins, MEM[(struct scalar_add_argument *)arg_10(D)].mins
	movl	%esi, (%rax,%rdx,4)	# max, *_39
	.loc 1 1017 0
	movq	24(%rdi), %rax	# MEM[(struct scalar_add_argument *)arg_10(D)].maxes, MEM[(struct scalar_add_argument *)arg_10(D)].maxes
	movl	52(%rdi), %edx	# MEM[(struct scalar_add_argument *)arg_10(D)].id, D.19067
	movl	%ecx, (%rax,%rdx,4)	# max, *_45
	.loc 1 1018 0
	movq	32(%rdi), %rax	# MEM[(struct scalar_add_argument *)arg_10(D)].sums, MEM[(struct scalar_add_argument *)arg_10(D)].sums
	movl	52(%rdi), %edx	# MEM[(struct scalar_add_argument *)arg_10(D)].id, D.19067
	movl	%r8d, (%rax,%rdx,4)	# sum, *_51
	.loc 1 1021 0
	xorl	%eax, %eax	#
	popq	%rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.LVL74:
.L53:
	.cfi_restore_state
	.loc 1 1005 0
	xorl	%r8d, %r8d	# sum
	.loc 1 1004 0
	xorl	%ecx, %ecx	# max
	.loc 1 1003 0
	movl	$-1, %esi	#, max
	jmp	.L51	#
	.cfi_endproc
.LFE2286:
	.size	scalar_add_worker, .-scalar_add_worker
	.section	.text.unlikely
.LCOLDE6:
	.text
.LHOTE6:
	.section	.text.unlikely
.LCOLDB7:
	.text
.LHOTB7:
	.p2align 4,,15
	.type	scalar_mul_worker, @function
scalar_mul_worker:
.LFB2288:
	.loc 1 1101 0
	.cfi_startproc
.LVL75:
	.loc 1 1107 0
	movq	g_width(%rip), %rax	# g_width, D.19097
	.loc 1 1101 0
	pushq	%rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 1 1107 0
	movl	48(%rdi), %r9d	# MEM[(struct scalar_mul_argument *)arg_10(D)].start_row, D.19097
	.loc 1 1103 0
	movq	(%rdi), %rcx	# MEM[(struct scalar_mul_argument *)arg_10(D)].matrix_obj, MEM[(struct scalar_mul_argument *)arg_10(D)].matrix_obj
.LVL76:
	.loc 1 1104 0
	movq	8(%rdi), %rdx	# MEM[(struct scalar_mul_argument *)arg_10(D)].result_obj, MEM[(struct scalar_mul_argument *)arg_10(D)].result_obj
.LVL77:
	.loc 1 1105 0
	movl	40(%rdi), %r11d	# MEM[(struct scalar_mul_argument *)arg_10(D)].scalar, scalar
.LVL78:
	.loc 1 1107 0
	imulq	%rax, %r9	# D.19097, D.19097
.LBB31:
	.loc 1 1114 0
	imull	44(%rdi), %eax	# MEM[(struct scalar_mul_argument *)arg_10(D)].num_rows, i
	leal	-1(%rax), %r10d	#,
.LBE31:
	.loc 1 1107 0
	salq	$2, %r9	#, D.19098
	movq	%r9, %rbx	# D.19098, matrix
	addq	(%rcx), %rbx	# _12->data, matrix
.LVL79:
	.loc 1 1108 0
	addq	(%rdx), %r9	# _14->data, result
.LVL80:
	.loc 1 1110 0
	movl	(%rbx), %ecx	# *matrix_23, max
.LVL81:
.LBB32:
	.loc 1 1114 0
	testl	%eax, %eax	# i
	je	.L59	#,
	salq	$2, %r10	#, D.19094
.LVL82:
	movl	%ecx, %eax	# max, D.19093
.LVL83:
	movl	%ecx, %esi	# max, max
	xorl	%edx, %edx	# ivtmp.379
	xorl	%r8d, %r8d	# sum
	jmp	.L58	#
.LVL84:
	.p2align 4,,10
	.p2align 3
.L61:
	movl	4(%rbx,%rdx), %eax	# MEM[base: matrix_23, index: ivtmp.379_31, offset: 4B], D.19093
	addq	$4, %rdx	#, ivtmp.379
.LVL85:
.L58:
	.loc 1 1116 0
	imull	%r11d, %eax	# scalar, max
	cmpl	%eax, %ecx	# max, max
	movl	%eax, (%r9,%rdx)	# max, MEM[base: result_24, index: ivtmp.379_31, offset: 0B]
	cmova	%eax, %ecx	# max,, max, max
.LVL86:
	cmpl	%eax, %esi	# max, max
	cmovb	%eax, %esi	# max,, max, max
.LVL87:
	.loc 1 1119 0
	addl	%eax, %r8d	# max, sum
.LVL88:
	.loc 1 1114 0
	cmpq	%r10, %rdx	# D.19094, ivtmp.379
	jne	.L61	#,
.LVL89:
.L57:
.LBE32:
	.loc 1 1123 0
	movl	52(%rdi), %edx	# MEM[(struct scalar_mul_argument *)arg_10(D)].id, D.19098
	movq	16(%rdi), %rax	# MEM[(struct scalar_mul_argument *)arg_10(D)].mins, MEM[(struct scalar_mul_argument *)arg_10(D)].mins
	movl	%ecx, (%rax,%rdx,4)	# max, *_40
	.loc 1 1124 0
	movq	24(%rdi), %rax	# MEM[(struct scalar_mul_argument *)arg_10(D)].maxes, MEM[(struct scalar_mul_argument *)arg_10(D)].maxes
	movl	52(%rdi), %edx	# MEM[(struct scalar_mul_argument *)arg_10(D)].id, D.19098
	movl	%esi, (%rax,%rdx,4)	# max, *_46
	.loc 1 1125 0
	movq	32(%rdi), %rax	# MEM[(struct scalar_mul_argument *)arg_10(D)].sums, MEM[(struct scalar_mul_argument *)arg_10(D)].sums
	movl	52(%rdi), %edx	# MEM[(struct scalar_mul_argument *)arg_10(D)].id, D.19098
	movl	%r8d, (%rax,%rdx,4)	# sum, *_52
	.loc 1 1128 0
	xorl	%eax, %eax	#
	popq	%rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.LVL90:
.L59:
	.cfi_restore_state
	.loc 1 1111 0
	movl	%ecx, %esi	# max, max
	.loc 1 1112 0
	xorl	%r8d, %r8d	# sum
	jmp	.L57	#
	.cfi_endproc
.LFE2288:
	.size	scalar_mul_worker, .-scalar_mul_worker
	.section	.text.unlikely
.LCOLDE7:
	.text
.LHOTE7:
	.section	.text.unlikely
.LCOLDB8:
	.text
.LHOTB8:
	.p2align 4,,15
	.type	matrix_add_worker, @function
matrix_add_worker:
.LFB2290:
	.loc 1 1204 0
	.cfi_startproc
.LVL91:
	.loc 1 1210 0
	movq	g_width(%rip), %rax	# g_width, D.19118
	.loc 1 1204 0
	pushq	%rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 1 1210 0
	movl	52(%rdi), %r9d	# MEM[(struct matrix_add_argument *)arg_11(D)].start_row, D.19118
	.loc 1 1206 0
	movq	(%rdi), %rsi	# MEM[(struct matrix_add_argument *)arg_11(D)].matrix_a_obj, MEM[(struct matrix_add_argument *)arg_11(D)].matrix_a_obj
.LVL92:
	.loc 1 1207 0
	movq	8(%rdi), %rcx	# MEM[(struct matrix_add_argument *)arg_11(D)].matrix_b_obj, MEM[(struct matrix_add_argument *)arg_11(D)].matrix_b_obj
.LVL93:
	.loc 1 1208 0
	movq	16(%rdi), %rdx	# MEM[(struct matrix_add_argument *)arg_11(D)].result_obj, MEM[(struct matrix_add_argument *)arg_11(D)].result_obj
.LVL94:
	.loc 1 1210 0
	imulq	%rax, %r9	# D.19118, D.19118
.LBB33:
	.loc 1 1218 0
	imull	48(%rdi), %eax	# MEM[(struct matrix_add_argument *)arg_11(D)].num_rows, i
	leal	-1(%rax), %r10d	#,
.LBE33:
	.loc 1 1210 0
	salq	$2, %r9	#, D.19119
	movq	%r9, %r11	# D.19119, matrix_a
	.loc 1 1211 0
	movq	%r9, %rbx	# D.19119, matrix_b
	.loc 1 1210 0
	addq	(%rsi), %r11	# _13->data, matrix_a
.LVL95:
	.loc 1 1211 0
	addq	(%rcx), %rbx	# _15->data, matrix_b
.LVL96:
	.loc 1 1212 0
	addq	(%rdx), %r9	# _17->data, result
.LVL97:
.LBB34:
	.loc 1 1218 0
	testl	%eax, %eax	# i
	je	.L65	#,
	addq	$1, %r10	#, D.19115
.LVL98:
	xorl	%edx, %edx	# ivtmp.393
	xorl	%r8d, %r8d	# sum
	xorl	%ecx, %ecx	# max
	movl	$-1, %esi	#, max
.LVL99:
	.p2align 4,,10
	.p2align 3
.L64:
	.loc 1 1220 0
	movl	(%r11,%rdx,4), %eax	# MEM[base: matrix_a_25, index: ivtmp.393_65, step: 4, offset: 0B], MEM[base: matrix_a_25, index: ivtmp.393_65, step: 4, offset: 0B]
	addl	(%rbx,%rdx,4), %eax	# MEM[base: matrix_b_26, index: ivtmp.393_65, step: 4, offset: 0B], max
	cmpl	%eax, %esi	# max, max
	movl	%eax, (%r9,%rdx,4)	# max, MEM[base: result_27, index: ivtmp.393_65, step: 4, offset: 0B]
	cmova	%eax, %esi	# max,, max, max
.LVL100:
	cmpl	%eax, %ecx	# max, max
	cmovb	%eax, %ecx	# max,, max, max
.LVL101:
	addq	$1, %rdx	#, ivtmp.393
.LVL102:
	.loc 1 1223 0
	addl	%eax, %r8d	# max, sum
.LVL103:
	.loc 1 1218 0
	cmpq	%r10, %rdx	# D.19115, ivtmp.393
	jne	.L64	#,
.LVL104:
.L63:
.LBE34:
	.loc 1 1227 0
	movl	56(%rdi), %edx	# MEM[(struct matrix_add_argument *)arg_11(D)].id, D.19119
	movq	24(%rdi), %rax	# MEM[(struct matrix_add_argument *)arg_11(D)].mins, MEM[(struct matrix_add_argument *)arg_11(D)].mins
	movl	%esi, (%rax,%rdx,4)	# max, *_44
	.loc 1 1228 0
	movq	32(%rdi), %rax	# MEM[(struct matrix_add_argument *)arg_11(D)].maxes, MEM[(struct matrix_add_argument *)arg_11(D)].maxes
	movl	56(%rdi), %edx	# MEM[(struct matrix_add_argument *)arg_11(D)].id, D.19119
	movl	%ecx, (%rax,%rdx,4)	# max, *_50
	.loc 1 1229 0
	movq	40(%rdi), %rax	# MEM[(struct matrix_add_argument *)arg_11(D)].sums, MEM[(struct matrix_add_argument *)arg_11(D)].sums
	movl	56(%rdi), %edx	# MEM[(struct matrix_add_argument *)arg_11(D)].id, D.19119
	movl	%r8d, (%rax,%rdx,4)	# sum, *_56
	.loc 1 1232 0
	xorl	%eax, %eax	#
	popq	%rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.LVL105:
.L65:
	.cfi_restore_state
	.loc 1 1216 0
	xorl	%r8d, %r8d	# sum
	.loc 1 1215 0
	xorl	%ecx, %ecx	# max
	.loc 1 1214 0
	movl	$-1, %esi	#, max
	jmp	.L63	#
	.cfi_endproc
.LFE2290:
	.size	matrix_add_worker, .-matrix_add_worker
	.section	.text.unlikely
.LCOLDE8:
	.text
.LHOTE8:
	.section	.text.unlikely
.LCOLDB9:
	.text
.LHOTB9:
	.p2align 4,,15
	.type	matrix_mul_worker, @function
matrix_mul_worker:
.LFB2292:
	.loc 1 1311 0
	.cfi_startproc
.LVL106:
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	.loc 1 1313 0
	movq	(%rdi), %rax	# MEM[(struct matrix_mul_argument *)arg_17(D)].matrix_a_obj, MEM[(struct matrix_mul_argument *)arg_17(D)].matrix_a_obj
	.loc 1 1323 0
	movl	52(%rdi), %ebx	# MEM[(struct matrix_mul_argument *)arg_17(D)].start_row, curr_y
	.loc 1 1311 0
	movq	%rdi, -8(%rsp)	# arg, %sfp
	.loc 1 1313 0
	movq	(%rax), %r9	# _20->data, matrix_a
.LVL107:
	.loc 1 1314 0
	movq	8(%rdi), %rax	# MEM[(struct matrix_mul_argument *)arg_17(D)].matrix_b_obj, MEM[(struct matrix_mul_argument *)arg_17(D)].matrix_b_obj
	.loc 1 1323 0
	movl	%ebx, -16(%rsp)	# curr_y, %sfp
	.loc 1 1314 0
	movq	(%rax), %r10	# _22->data, matrix_b
.LVL108:
	.loc 1 1315 0
	movq	16(%rdi), %rax	# MEM[(struct matrix_mul_argument *)arg_17(D)].result_obj, MEM[(struct matrix_mul_argument *)arg_17(D)].result_obj
	movq	(%rax), %r15	# _24->data, result
.LVL109:
.LBB35:
	.loc 1 1324 0
	movl	48(%rdi), %eax	# MEM[(struct matrix_mul_argument *)arg_17(D)].num_rows, y
.LVL110:
	testl	%eax, %eax	# y
	je	.L74	#,
	movq	g_width(%rip), %r14	# g_width, D.19149
	addl	%ebx, %eax	# curr_y, D.19148
.LVL111:
	xorl	%r13d, %r13d	# sum
	xorl	%ebp, %ebp	# max
	movl	%eax, -12(%rsp)	# D.19148, %sfp
	movl	$-1, %r12d	#, max
	leal	-1(%r14), %edi	#, z
.LVL112:
	movl	%r14d, -20(%rsp)	# D.19149, %sfp
	movl	%edi, -24(%rsp)	# z, %sfp
.LVL113:
.L73:
.LBB36:
.LBB37:
	.loc 1 1327 0
	movl	-20(%rsp), %eax	# %sfp,
	testl	%eax, %eax	#
	je	.L70	#,
	movl	-16(%rsp), %edi	# %sfp, D.19145
	xorl	%ebx, %ebx	# curr_x
	imulq	%r14, %rdi	# D.19149, D.19145
.LVL114:
	.p2align 4,,10
	.p2align 3
.L71:
	movl	%ebx, %r11d	# curr_x, D.19145
	movq	%r14, %r8	# D.19149, D.19145
.LBE37:
.LBE36:
	.loc 1 1324 0 discriminator 1
	movl	-24(%rsp), %edx	# %sfp, z
	xorl	%esi, %esi	# max
	imulq	%r11, %r8	# D.19145, D.19145
.LVL115:
	.p2align 4,,10
	.p2align 3
.L72:
.LBB41:
.LBB40:
.LBB38:
.LBB39:
	.loc 1 1332 0
	movl	%edx, %eax	# z, D.19145
	.loc 1 1330 0
	subl	$1, %edx	#, z
.LVL116:
	.loc 1 1332 0
	leaq	(%rax,%r8), %rcx	#, tmp148
	addq	%rdi, %rax	# D.19145, tmp149
	movl	(%r10,%rcx,4), %ecx	# *_47, *_47
	imull	(%r9,%rax,4), %ecx	# *_40, D.19148
	addl	%ecx, %esi	# D.19148, max
.LVL117:
	.loc 1 1330 0
	cmpl	$-1, %edx	#, z
	jne	.L72	#,
	cmpl	%esi, %r12d	# max, max
	cmova	%esi, %r12d	# max,, max, max
.LVL118:
	cmpl	%esi, %ebp	# max, max
	cmovb	%esi, %ebp	# max,, max, max
.LVL119:
.LBE39:
	.loc 1 1337 0
	addq	%rdi, %r11	# D.19145, tmp152
	.loc 1 1336 0
	addl	%esi, %r13d	# max, sum
.LVL120:
	.loc 1 1337 0
	movl	%esi, (%r15,%r11,4)	# max, *_60
	.loc 1 1338 0
	addl	$1, %ebx	#, curr_x
.LVL121:
.LBE38:
	.loc 1 1327 0
	cmpl	-20(%rsp), %ebx	# %sfp, curr_x
	jne	.L71	#,
.LVL122:
.L70:
.LBE40:
	.loc 1 1340 0
	addl	$1, -16(%rsp)	#, %sfp
.LVL123:
	movl	-16(%rsp), %eax	# %sfp, curr_y
.LVL124:
.LBE41:
	.loc 1 1324 0
	cmpl	-12(%rsp), %eax	# %sfp, curr_y
	jne	.L73	#,
.LVL125:
.L69:
.LBE35:
	.loc 1 1343 0
	movq	-8(%rsp), %rbx	# %sfp, arg
	movl	56(%rbx), %edx	# MEM[(struct matrix_mul_argument *)arg_17(D)].id, D.19146
	movq	24(%rbx), %rax	# MEM[(struct matrix_mul_argument *)arg_17(D)].mins, MEM[(struct matrix_mul_argument *)arg_17(D)].mins
	movl	%r12d, (%rax,%rdx,4)	# max, *_68
	.loc 1 1344 0
	movq	32(%rbx), %rax	# MEM[(struct matrix_mul_argument *)arg_17(D)].maxes, MEM[(struct matrix_mul_argument *)arg_17(D)].maxes
	movl	56(%rbx), %edx	# MEM[(struct matrix_mul_argument *)arg_17(D)].id, D.19146
	movl	%ebp, (%rax,%rdx,4)	# max, *_74
	.loc 1 1345 0
	movq	40(%rbx), %rax	# MEM[(struct matrix_mul_argument *)arg_17(D)].sums, MEM[(struct matrix_mul_argument *)arg_17(D)].sums
	movl	56(%rbx), %edx	# MEM[(struct matrix_mul_argument *)arg_17(D)].id, D.19146
	movl	%r13d, (%rax,%rdx,4)	# sum, *_80
	.loc 1 1348 0
	xorl	%eax, %eax	#
	popq	%rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 48
.LVL126:
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
.LVL127:
	ret
.LVL128:
.L74:
	.cfi_restore_state
	.loc 1 1319 0
	xorl	%r13d, %r13d	# sum
	.loc 1 1318 0
	xorl	%ebp, %ebp	# max
	.loc 1 1317 0
	movl	$-1, %r12d	#, max
	jmp	.L69	#
	.cfi_endproc
.LFE2292:
	.size	matrix_mul_worker, .-matrix_mul_worker
	.section	.text.unlikely
.LCOLDE9:
	.text
.LHOTE9:
	.section	.text.unlikely
.LCOLDB10:
	.text
.LHOTB10:
	.p2align 4,,15
	.type	get_cmpe_worker, @function
get_cmpe_worker:
.LFB2302:
	.loc 1 1571 0
	.cfi_startproc
.LVL129:
	.loc 1 1574 0
	movq	g_width(%rip), %rdx	# g_width, D.19167
	movl	20(%rdi), %eax	# MEM[(struct get_cmpe_argument *)arg_4(D)].start_row, D.19167
	.loc 1 1573 0
	movq	(%rdi), %rcx	# MEM[(struct get_cmpe_argument *)arg_4(D)].matrix_obj, MEM[(struct get_cmpe_argument *)arg_4(D)].matrix_obj
.LVL130:
	.loc 1 1574 0
	imulq	%rdx, %rax	# D.19167, D.19167
	movq	(%rcx), %rsi	# _6->data,
.LBB42:
	.loc 1 1577 0
	imull	16(%rdi), %edx	# MEM[(struct get_cmpe_argument *)arg_4(D)].num_rows, i
.LBE42:
	.loc 1 1574 0
	leaq	(%rsi,%rax,4), %rax	#, matrix
.LVL131:
	.loc 1 1575 0
	movl	28(%rdi), %esi	# MEM[(struct get_cmpe_argument *)arg_4(D)].value, value
.LVL132:
.LBB43:
	.loc 1 1577 0
	leal	-1(%rdx), %ecx	#,
.LVL133:
	testl	%edx, %edx	# i
	je	.L85	#,
	leaq	4(%rax,%rcx,4), %r8	#, D.19163
	xorl	%edx, %edx	# count
.LVL134:
	.p2align 4,,10
	.p2align 3
.L84:
	.loc 1 1579 0
	addq	$4, %rax	#, matrix
.LVL135:
	xorl	%ecx, %ecx	# D.19169
	cmpl	%esi, -4(%rax)	# value, MEM[base: matrix_20, offset: -4B]
	sete	%cl	#, D.19169
	addl	%ecx, %edx	# D.19169, count
.LVL136:
	.loc 1 1577 0
	cmpq	%r8, %rax	# D.19163, matrix
	jne	.L84	#,
.LVL137:
.L83:
.LBE43:
	.loc 1 1581 0
	movq	8(%rdi), %rax	# MEM[(struct get_cmpe_argument *)arg_4(D)].result, MEM[(struct get_cmpe_argument *)arg_4(D)].result
.LVL138:
	movl	24(%rdi), %ecx	# MEM[(struct get_cmpe_argument *)arg_4(D)].id, D.19168
	movl	%edx, (%rax,%rcx,4)	# count, *_29
	.loc 1 1583 0
	xorl	%eax, %eax	#
	ret
.LVL139:
.L85:
	.loc 1 1576 0
	xorl	%edx, %edx	# count
	jmp	.L83	#
	.cfi_endproc
.LFE2302:
	.size	get_cmpe_worker, .-get_cmpe_worker
	.section	.text.unlikely
.LCOLDE10:
	.text
.LHOTE10:
	.section	.text.unlikely
.LCOLDB11:
	.text
.LHOTB11:
	.p2align 4,,15
	.globl	set_seed
	.type	set_seed, @function
set_seed:
.LFB2256:
	.loc 1 82 0
	.cfi_startproc
.LVL140:
	.loc 1 83 0
	movl	%edi, g_seed(%rip)	# seed, g_seed
	ret
	.cfi_endproc
.LFE2256:
	.size	set_seed, .-set_seed
	.section	.text.unlikely
.LCOLDE11:
	.text
.LHOTE11:
	.section	.text.unlikely
.LCOLDB12:
	.text
.LHOTB12:
	.p2align 4,,15
	.globl	set_nthreads
	.type	set_nthreads, @function
set_nthreads:
.LFB2257:
	.loc 1 90 0
	.cfi_startproc
.LVL141:
	.loc 1 91 0
	movq	%rdi, g_nthreads(%rip)	# count, g_nthreads
	ret
	.cfi_endproc
.LFE2257:
	.size	set_nthreads, .-set_nthreads
	.section	.text.unlikely
.LCOLDE12:
	.text
.LHOTE12:
	.section	.text.unlikely
.LCOLDB13:
	.text
.LHOTB13:
	.p2align 4,,15
	.globl	set_dimensions
	.type	set_dimensions, @function
set_dimensions:
.LFB2258:
	.loc 1 98 0
	.cfi_startproc
.LVL142:
	.loc 1 99 0
	movq	%rdi, g_width(%rip)	# order, g_width
	.loc 1 100 0
	movq	%rdi, g_height(%rip)	# order, g_height
	.loc 1 102 0
	imulq	%rdi, %rdi	# order, D.19176
.LVL143:
	movq	%rdi, g_elements(%rip)	# D.19176, g_elements
	ret
	.cfi_endproc
.LFE2258:
	.size	set_dimensions, .-set_dimensions
	.section	.text.unlikely
.LCOLDE13:
	.text
.LHOTE13:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC14:
	.string	"%u"
.LC15:
	.string	" %u"
	.section	.text.unlikely
.LCOLDB16:
	.text
.LHOTB16:
	.p2align 4,,15
	.globl	display
	.type	display, @function
display:
.LFB2259:
	.loc 1 109 0
	.cfi_startproc
.LVL144:
	.loc 1 111 0
	movq	g_height(%rip), %rax	# g_height, g_height
	.loc 1 109 0
	pushq	%r14	#
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13	#
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12	#
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp	#
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	.loc 1 112 0
	movl	%eax, %r13d	# g_height, ivtmp.462
	.loc 1 109 0
	pushq	%rbx	#
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	.loc 1 110 0
	movq	(%rdi), %rbx	# matrix_obj_8(D)->data, matrix
.LVL145:
	.loc 1 112 0
	testl	%eax, %eax	# g_height
	je	.L100	#,
.LVL146:
	.p2align 4,,10
	.p2align 3
.L97:
	.loc 1 114 0
	movl	(%rbx), %esi	# *matrix_34,
	leaq	4(%rbx), %r14	#, matrix
.LVL147:
	movl	$.LC14, %edi	#,
	xorl	%eax, %eax	#
	call	printf	#
.LVL148:
.LBB44:
	.loc 1 115 0
	movq	g_width(%rip), %rax	# g_width, D.19196
.LVL149:
	leal	-2(%rax), %r12d	#,
.LVL150:
	cmpl	$1, %eax	#, D.19196
	je	.L96	#,
	movl	%r12d, %eax	# D.19197, D.19195
	leaq	8(%rbx,%rax,4), %rbp	#, D.19198
	movq	%r14, %rbx	# matrix, matrix
.LVL151:
	.p2align 4,,10
	.p2align 3
.L93:
	.loc 1 117 0
	addq	$4, %rbx	#, matrix
.LVL152:
	movl	-4(%rbx), %esi	# MEM[base: matrix_20, offset: -4B], MEM[base: matrix_20, offset: -4B]
	xorl	%eax, %eax	#
	movl	$.LC15, %edi	#,
	call	printf	#
.LVL153:
	.loc 1 115 0
	cmpq	%rbp, %rbx	# D.19198, matrix
	jne	.L93	#,
	leaq	4(%r14,%r12,4), %rbx	#, matrix
.LVL154:
.L92:
.LBE44:
	.loc 1 119 0
	movl	$10, %edi	#,
	call	putchar	#
.LVL155:
	.loc 1 112 0
	subl	$1, %r13d	#, ivtmp.462
.LVL156:
	jne	.L97	#,
.LVL157:
.L100:
	.loc 1 121 0
	popq	%rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 40
.LVL158:
	popq	%rbp	#
	.cfi_def_cfa_offset 32
	popq	%r12	#
	.cfi_def_cfa_offset 24
	popq	%r13	#
	.cfi_def_cfa_offset 16
	popq	%r14	#
	.cfi_def_cfa_offset 8
	ret
.LVL159:
.L96:
	.cfi_restore_state
	.loc 1 114 0
	movq	%r14, %rbx	# matrix, matrix
	jmp	.L92	#
	.cfi_endproc
.LFE2259:
	.size	display, .-display
	.section	.text.unlikely
.LCOLDE16:
	.text
.LHOTE16:
	.section	.rodata.str1.1
.LC17:
	.string	"%u "
	.section	.text.unlikely
.LCOLDB18:
	.text
.LHOTB18:
	.p2align 4,,15
	.globl	display_row
	.type	display_row, @function
display_row:
.LFB2260:
	.loc 1 127 0
	.cfi_startproc
.LVL160:
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
.LVL161:
	pushq	%rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 32
	.loc 1 129 0
	movq	(%rdi), %rax	# matrix_obj_5(D)->data,
	.loc 1 130 0
	movl	$.LC17, %edi	#,
.LVL162:
	.loc 1 129 0
	imulq	g_width(%rip), %rsi	# g_width, D.19215
.LVL163:
	leaq	(%rax,%rsi,4), %rbp	#, matrix
.LVL164:
	.loc 1 130 0
	xorl	%eax, %eax	#
	movl	0(%rbp), %esi	# *matrix_12,
	leaq	4(%rbp), %rbx	#, matrix
.LVL165:
	call	printf	#
.LVL166:
.LBB45:
	.loc 1 131 0
	movq	g_width(%rip), %rax	# g_width, D.19215
.LVL167:
	leal	-2(%rax), %edx	#, D.19214
	leaq	8(%rbp,%rdx,4), %rbp	#, D.19217
	cmpl	$1, %eax	#, D.19215
	je	.L105	#,
.LVL168:
	.p2align 4,,10
	.p2align 3
.L104:
	.loc 1 133 0
	addq	$4, %rbx	#, matrix
.LVL169:
	movl	-4(%rbx), %esi	# MEM[base: matrix_20, offset: -4B], MEM[base: matrix_20, offset: -4B]
	xorl	%eax, %eax	#
	movl	$.LC17, %edi	#,
	call	printf	#
.LVL170:
	.loc 1 131 0
	cmpq	%rbp, %rbx	# D.19217, matrix
	jne	.L104	#,
.L105:
.LBE45:
	.loc 1 136 0
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 24
	.loc 1 135 0
	movl	$10, %edi	#,
	.loc 1 136 0
	popq	%rbx	#
	.cfi_def_cfa_offset 16
.LVL171:
	popq	%rbp	#
	.cfi_def_cfa_offset 8
	.loc 1 135 0
	jmp	putchar	#
.LVL172:
	.cfi_endproc
.LFE2260:
	.size	display_row, .-display_row
	.section	.text.unlikely
.LCOLDE18:
	.text
.LHOTE18:
	.section	.rodata.str1.1
.LC19:
	.string	"%u\n"
	.section	.text.unlikely
.LCOLDB20:
	.text
.LHOTB20:
	.p2align 4,,15
	.globl	display_column
	.type	display_column, @function
display_column:
.LFB2261:
	.loc 1 143 0
	.cfi_startproc
.LVL173:
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
.LVL174:
	pushq	%rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	.loc 1 145 0
	leaq	0(,%rsi,4), %rbx	#, D.19227
	.loc 1 143 0
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 32
.LBB46:
	.loc 1 146 0
	movq	g_height(%rip), %rax	# g_height, g_height
.LBE46:
	.loc 1 145 0
	addq	(%rdi), %rbx	# matrix_obj_5(D)->data, matrix
.LVL175:
.LBB47:
	.loc 1 146 0
	movl	%eax, %ebp	# g_height, ivtmp.482
	testl	%eax, %eax	# g_height
	je	.L114	#,
.LVL176:
	.p2align 4,,10
	.p2align 3
.L112:
	.loc 1 148 0
	movl	(%rbx), %esi	# *matrix_24,
	movl	$.LC19, %edi	#,
	xorl	%eax, %eax	#
	call	printf	#
.LVL177:
	.loc 1 149 0
	movq	g_width(%rip), %rax	# g_width, g_width
	leaq	(%rbx,%rax,4), %rbx	#, matrix
.LVL178:
	.loc 1 146 0
	subl	$1, %ebp	#, ivtmp.482
.LVL179:
	jne	.L112	#,
.LVL180:
.L114:
.LBE47:
	.loc 1 151 0
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 24
	popq	%rbx	#
	.cfi_def_cfa_offset 16
.LVL181:
	popq	%rbp	#
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2261:
	.size	display_column, .-display_column
	.section	.text.unlikely
.LCOLDE20:
	.text
.LHOTE20:
	.section	.text.unlikely
.LCOLDB21:
	.text
.LHOTB21:
	.p2align 4,,15
	.globl	display_element
	.type	display_element, @function
display_element:
.LFB2262:
	.loc 1 157 0
	.cfi_startproc
.LVL182:
	.loc 1 158 0
	imulq	g_width(%rip), %rsi	# g_width, D.19234
.LVL183:
	movq	(%rdi), %rax	# matrix_obj_2(D)->data, matrix_obj_2(D)->data
	movl	$.LC19, %edi	#,
.LVL184:
	addq	%rsi, %rdx	# D.19234, tmp95
.LVL185:
	movl	(%rax,%rdx,4), %esi	# *_11, *_11
	xorl	%eax, %eax	#
	jmp	printf	#
.LVL186:
	.cfi_endproc
.LFE2262:
	.size	display_element, .-display_element
	.section	.text.unlikely
.LCOLDE21:
	.text
.LHOTE21:
	.section	.text.unlikely
.LCOLDB22:
	.text
.LHOTB22:
	.p2align 4,,15
	.globl	identity_matrix
	.type	identity_matrix, @function
identity_matrix:
.LFB2267:
	.loc 1 234 0
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
.LBB59:
.LBB60:
.LBB61:
.LBB62:
	.loc 1 172 0
	movl	$32, %esi	#,
	movl	$1, %edi	#,
.LBE62:
.LBE61:
.LBE60:
.LBE59:
	.loc 1 234 0
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	subq	$8, %rsp	#,
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	.loc 1 235 0
	movq	g_nthreads(%rip), %r15	# g_nthreads, D.19287
	cmpq	$1, %r15	#, D.19287
	je	.L118	#,
	.loc 1 235 0 is_stmt 0 discriminator 1
	cmpq	$199, g_width(%rip)	#, g_width
	jg	.L119	#,
.L118:
.LBB71:
.LBB69:
.LBB65:
.LBB63:
	.loc 1 172 0 is_stmt 1
	call	calloc	#
.LVL187:
	.loc 1 173 0
	movq	g_elements(%rip), %rdi	# g_elements,
	movl	$4, %esi	#,
	.loc 1 172 0
	movq	%rax, %rbx	#, matrix_obj
.LVL188:
	.loc 1 173 0
	call	calloc	#
.LVL189:
.LBE63:
.LBE65:
.LBB66:
	.loc 1 197 0
	movq	g_height(%rip), %rsi	# g_height, g_height
.LBE66:
.LBB67:
.LBB64:
	.loc 1 173 0
	movq	%rax, %rdx	#, matrix_cpy
	movq	%rax, (%rbx)	# matrix_cpy, matrix_obj_66->data
.LVL190:
	movq	g_width(%rip), %rax	# g_width, g_width
.LVL191:
.LBE64:
.LBE67:
.LBB68:
	.loc 1 197 0
	leal	-1(%rsi), %ecx	#, i
.LVL192:
	leaq	4(,%rax,4), %rax	#, D.19288
	testl	%esi, %esi	# g_height
	je	.L123	#,
	.p2align 4,,10
	.p2align 3
.L131:
	subl	$1, %ecx	#, i
.LVL193:
	.loc 1 199 0
	movl	$1, (%rdx)	#, MEM[base: matrix_cpy_118, offset: 0B]
	.loc 1 200 0
	addq	%rax, %rdx	# D.19288, matrix_cpy
.LVL194:
	.loc 1 197 0
	cmpl	$-1, %ecx	#, i
	jne	.L131	#,
.L123:
.LBE68:
	.loc 1 203 0
	movl	$0, 8(%rbx)	#, matrix_obj_66->min
.LBE69:
.LBE71:
	.loc 1 237 0
	movq	%rbx, %rax	# matrix_obj, D.19285
.LBB72:
.LBB70:
	.loc 1 204 0
	movl	$1, 12(%rbx)	#, matrix_obj_66->max
	.loc 1 205 0
	movl	%esi, 16(%rbx)	# g_height, matrix_obj_66->sum
.LBE70:
.LBE72:
	.loc 1 275 0
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
.LVL195:
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL196:
	.p2align 4,,10
	.p2align 3
.L119:
	.cfi_restore_state
.LBB73:
.LBB74:
	.loc 1 172 0
	call	calloc	#
.LVL197:
.LBE74:
.LBE73:
.LBB77:
	.loc 1 246 0
	leal	-1(%r15), %r14d	#, i
.LBE77:
.LBB80:
.LBB75:
	.loc 1 173 0
	movl	$4, %esi	#,
	movq	g_elements(%rip), %rdi	# g_elements,
	.loc 1 172 0
	movq	%rax, %rbx	#, matrix_obj
.LVL198:
	.loc 1 173 0
	call	calloc	#
.LVL199:
.LBE75:
.LBE80:
	.loc 1 244 0
	movq	%r15, %rdi	# D.19287, D.19289
.LBB81:
.LBB76:
	.loc 1 173 0
	movq	%rax, (%rbx)	# tmp158, matrix_obj_84->data
.LVL200:
.LBE76:
.LBE81:
	.loc 1 242 0
	leaq	22(,%r15,8), %rax	#, tmp162
	.loc 1 244 0
	salq	$4, %rdi	#, D.19289
.LVL201:
	.loc 1 242 0
	andq	$-16, %rax	#, tmp166
	subq	%rax, %rsp	# tmp166,
	.loc 1 244 0
	call	malloc	#
.LVL202:
	.loc 1 242 0
	movq	%rsp, %r13	#, tmp170
.LVL203:
	.loc 1 244 0
	movq	%rax, %r12	#, args
.LVL204:
.LBB82:
	.loc 1 246 0
	testl	%r15d, %r15d	# D.19287
	je	.L124	#,
.LVL205:
	movq	g_height(%rip), %rax	# g_height, D.19294
.LVL206:
	movl	%r14d, %edi	# i, i
	xorl	%r8d, %r8d	# start_row
	cqto
	idivq	%r15	# D.19287
.LVL207:
	.p2align 4,,10
	.p2align 3
.L125:
.LBB78:
	.loc 1 248 0
	movl	%edi, %ecx	# i, D.19287
	movq	%rdx, %rsi	# tmp175, D.19287
	subq	%rcx, %rsi	# D.19287, D.19287
	testq	%rsi, %rsi	# D.19287
	setg	%sil	#, D.19290
	.loc 1 249 0
	salq	$4, %rcx	#, D.19289
.LBE78:
	.loc 1 246 0
	subl	$1, %edi	#, i
.LVL208:
.LBB79:
	.loc 1 248 0
	movzbl	%sil, %esi	# D.19290, D.19290
	.loc 1 249 0
	addq	%r12, %rcx	# args, D.19292
	.loc 1 248 0
	addl	%eax, %esi	# D.19291, this_rows
.LVL209:
	.loc 1 249 0
	movl	%r8d, 8(%rcx)	# start_row, _38->start_row
	movq	%rbx, (%rcx)	# matrix_obj, _38->matrix_obj
	.loc 1 255 0
	addl	%esi, %r8d	# this_rows, start_row
.LVL210:
	.loc 1 249 0
	movl	%esi, 12(%rcx)	# this_rows, _38->num_rows
.LBE79:
	.loc 1 246 0
	cmpl	$-1, %edi	#, i
	jne	.L125	#,
.LVL211:
	.p2align 4,,10
	.p2align 3
.L126:
.LBE82:
.LBB83:
	.loc 1 260 0
	movl	%r14d, %eax	# i, D.19289
	xorl	%esi, %esi	#
	movl	$identity_worker, %edx	#,
	leaq	0(%r13,%rax,8), %rdi	#, D.19293
	movq	%rax, %rcx	# D.19289, D.19289
	salq	$4, %rcx	#, D.19289
	addq	%r12, %rcx	# args, D.19292
	call	pthread_create	#
.LVL212:
	.loc 1 258 0
	testl	%r14d, %r14d	# i
	leal	-1(%r14), %r14d	#, i
.LVL213:
	jne	.L126	#,
	movq	g_nthreads(%rip), %rax	# g_nthreads, g_nthreads
	leal	-1(%rax), %r14d	#, i
.LVL214:
.LBE83:
.LBB84:
	.loc 1 263 0
	testl	%eax, %eax	# g_nthreads
	je	.L124	#,
	.p2align 4,,10
	.p2align 3
.L132:
	.loc 1 265 0
	movl	%r14d, %eax	# i, D.19289
	xorl	%esi, %esi	#
	movq	0(%r13,%rax,8), %rdi	# *_56, *_56
	call	pthread_join	#
.LVL215:
	.loc 1 263 0
	testl	%r14d, %r14d	# i
	leal	-1(%r14), %r14d	#, i
.LVL216:
	jne	.L132	#,
.LVL217:
.L124:
.LBE84:
	.loc 1 270 0
	movq	g_height(%rip), %rax	# g_height, g_height
	.loc 1 268 0
	movl	$0, 8(%rbx)	#, matrix_obj_84->min
	.loc 1 272 0
	movq	%r12, %rdi	# args,
	.loc 1 269 0
	movl	$1, 12(%rbx)	#, matrix_obj_84->max
	.loc 1 270 0
	movl	%eax, 16(%rbx)	# g_height, matrix_obj_84->sum
	.loc 1 272 0
	call	free	#
.LVL218:
	.loc 1 275 0
	leaq	-40(%rbp), %rsp	#,
.LVL219:
	.loc 1 274 0
	movq	%rbx, %rax	# matrix_obj, D.19285
	.loc 1 275 0
	popq	%rbx	#
.LVL220:
	popq	%r12	#
.LVL221:
	popq	%r13	#
.LVL222:
	popq	%r14	#
	popq	%r15	#
.LVL223:
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2267:
	.size	identity_matrix, .-identity_matrix
	.section	.text.unlikely
.LCOLDE22:
	.text
.LHOTE22:
	.section	.text.unlikely
.LCOLDB23:
	.text
.LHOTB23:
	.p2align 4,,15
	.globl	random_matrix_serial
	.type	random_matrix_serial, @function
random_matrix_serial:
.LFB2268:
	.loc 1 283 0
	.cfi_startproc
.LVL224:
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	%edi, %ebx	# seed, seed
.LBB90:
.LBB91:
	.loc 1 182 0
	movl	$32, %edi	#,
.LVL225:
.LBE91:
.LBE90:
	.loc 1 283 0
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 48
.LBB94:
.LBB92:
	.loc 1 182 0
	call	malloc	#
.LVL226:
	.loc 1 183 0
	movq	g_elements(%rip), %r13	# g_elements, D.19322
	.loc 1 182 0
	movq	%rax, %r12	#, matrix_obj
.LVL227:
	.loc 1 183 0
	leaq	0(,%r13,4), %rdi	#, D.19319
	call	malloc	#
.LVL228:
.LBE92:
.LBE94:
	.loc 1 287 0
	movl	$4, %esi	#,
	movl	$32767, %edi	#,
.LBB95:
.LBB93:
	.loc 1 183 0
	movq	%rax, %rbp	#, matrix_cpy
	movq	%rax, (%r12)	# matrix_cpy, matrix_obj_39->data
.LVL229:
.LBE93:
.LBE95:
	.loc 1 287 0
	call	calloc	#
.LVL230:
	.loc 1 289 0
	movl	%ebx, g_seed(%rip)	# seed, g_seed
	.loc 1 287 0
	movq	%rax, %r8	#, occurances
.LVL231:
.LBB96:
	.loc 1 295 0
	leal	-1(%r13), %eax	#,
.LVL232:
	testl	%r13d, %r13d	# D.19322
	je	.L143	#,
	leaq	4(%rbp,%rax,4), %rax	#, D.19320
.LVL233:
	movl	%ebx, %edi	# seed, D.19321
	xorl	%r9d, %r9d	# sum
	xorl	%ecx, %ecx	# max
	movl	$-1, %esi	#, max
.LVL234:
	.p2align 4,,10
	.p2align 3
.L142:
.LBB97:
.LBB98:
	.loc 1 44 0
	imull	$214013, %edi, %edi	#, D.19321, D.19321
	addl	$2531011, %edi	#, D.19321
	.loc 1 45 0
	movl	%edi, %edx	# D.19321, D.19321
	shrl	$16, %edx	#, D.19321
	andl	$32767, %edx	#,
	cmpl	%edx, %esi	# max, max
.LBE98:
.LBE97:
	.loc 1 297 0
	movl	%edx, 0(%rbp)	# max, MEM[base: matrix_cpy_57, offset: 0B]
	cmova	%edx, %esi	# max,, max, max
.LVL235:
	cmpl	%edx, %ecx	# max, max
	cmovb	%edx, %ecx	# max,, max, max
.LVL236:
	.loc 1 302 0
	addq	$4, %rbp	#, matrix_cpy
.LVL237:
	.loc 1 301 0
	addl	$1, (%r8,%rdx,4)	#, *_25
	.loc 1 300 0
	addl	%edx, %r9d	# max, sum
.LVL238:
	.loc 1 295 0
	cmpq	%rax, %rbp	# D.19320, matrix_cpy
	jne	.L142	#,
	movl	%edi, g_seed(%rip)	# D.19321, g_seed
.LVL239:
.L141:
.LBE96:
	.loc 1 305 0
	movq	%r8, 24(%r12)	# occurances, matrix_obj_39->occurances
	.loc 1 311 0
	movq	%r12, %rax	# matrix_obj,
	.loc 1 306 0
	movl	%esi, 8(%r12)	# max, matrix_obj_39->min
	.loc 1 307 0
	movl	%ecx, 12(%r12)	# max, matrix_obj_39->max
	.loc 1 308 0
	movl	%r9d, 16(%r12)	# sum, matrix_obj_39->sum
	.loc 1 311 0
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx	#
	.cfi_def_cfa_offset 32
.LVL240:
	popq	%rbp	#
	.cfi_def_cfa_offset 24
.LVL241:
	popq	%r12	#
	.cfi_def_cfa_offset 16
.LVL242:
	popq	%r13	#
	.cfi_def_cfa_offset 8
	ret
.LVL243:
.L143:
	.cfi_restore_state
	.loc 1 293 0
	xorl	%r9d, %r9d	# sum
	.loc 1 292 0
	xorl	%ecx, %ecx	# max
	.loc 1 291 0
	movl	$-1, %esi	#, max
	jmp	.L141	#
	.cfi_endproc
.LFE2268:
	.size	random_matrix_serial, .-random_matrix_serial
	.section	.text.unlikely
.LCOLDE23:
	.text
.LHOTE23:
	.section	.text.unlikely
.LCOLDB24:
	.text
.LHOTB24:
	.p2align 4,,15
	.globl	random_matrix
	.type	random_matrix, @function
random_matrix:
.LFB2270:
	.loc 1 353 0
	.cfi_startproc
.LVL244:
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 16
	.loc 1 356 0
	call	random_matrix_serial	#
.LVL245:
	.loc 1 407 0
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2270:
	.size	random_matrix, .-random_matrix
	.section	.text.unlikely
.LCOLDE24:
	.text
.LHOTE24:
	.section	.text.unlikely
.LCOLDB25:
	.text
.LHOTB25:
	.p2align 4,,15
	.globl	uniform_matrix
	.type	uniform_matrix, @function
uniform_matrix:
.LFB2273:
	.loc 1 464 0
	.cfi_startproc
.LVL246:
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	movl	%edi, %r14d	# value, value
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	subq	$24, %rsp	#,
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	.loc 1 465 0
	testl	%edi, %edi	# value
	je	.L180	#,
	.loc 1 470 0
	movq	g_nthreads(%rip), %rcx	# g_nthreads, D.19389
	cmpq	$1, %rcx	#, D.19389
	je	.L151	#,
	.loc 1 470 0 is_stmt 0 discriminator 1
	cmpq	$199, g_width(%rip)	#, g_width
	jg	.L152	#,
.L151:
.LVL247:
.LBB114:
.LBB115:
.LBB116:
.LBB117:
	.loc 1 182 0 is_stmt 1
	movl	$32, %edi	#,
.LVL248:
	call	malloc	#
.LVL249:
	.loc 1 183 0
	movq	g_elements(%rip), %r12	# g_elements, D.19389
	.loc 1 182 0
	movq	%rax, %rbx	#, matrix_obj
.LVL250:
	.loc 1 183 0
	leaq	0(,%r12,4), %rdi	#, D.19392
	call	malloc	#
.LVL251:
	movq	%rax, %rdx	#, matrix_cpy
	movq	%rax, (%rbx)	# matrix_cpy, matrix_obj_95->data
.LVL252:
.LBE117:
.LBE116:
.LBB118:
	.loc 1 425 0
	leal	-1(%r12), %eax	#,
.LVL253:
	leaq	4(%rdx,%rax,4), %rax	#, D.19393
.LVL254:
	testl	%r12d, %r12d	# D.19389
	je	.L155	#,
.LVL255:
	.p2align 4,,10
	.p2align 3
.L154:
	.loc 1 427 0
	addq	$4, %rdx	#, matrix_cpy
.LVL256:
	movl	%r14d, -4(%rdx)	# value, MEM[base: matrix_cpy_86, offset: -4B]
	.loc 1 425 0
	cmpq	%rax, %rdx	# D.19393, matrix_cpy
	jne	.L154	#,
.L155:
.LBE118:
	.loc 1 432 0
	movl	%r14d, 8(%rbx)	# value, matrix_obj_95->min
	.loc 1 434 0
	movq	%rbx, %rax	# matrix_obj, D.19387
	.loc 1 433 0
	movl	%r14d, 12(%rbx)	# value, matrix_obj_95->max
	.loc 1 434 0
	imull	%r12d, %r14d	# D.19389, D.19395
.LVL257:
	.loc 1 430 0
	movq	$0, 24(%rbx)	#, matrix_obj_95->occurances
	.loc 1 434 0
	movl	%r14d, 16(%rbx)	# D.19395, matrix_obj_95->sum
.LBE115:
.LBE114:
	.loc 1 516 0
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
.LVL258:
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL259:
	.p2align 4,,10
	.p2align 3
.L152:
	.cfi_restore_state
.LBB119:
.LBB120:
	.loc 1 182 0
	movl	$32, %edi	#,
.LVL260:
	movq	%rcx, -56(%rbp)	# D.19389, %sfp
	call	malloc	#
.LVL261:
	.loc 1 183 0
	movq	g_elements(%rip), %rdx	# g_elements, D.19398
	.loc 1 182 0
	movq	%rax, %rbx	#, matrix_obj
.LVL262:
	.loc 1 183 0
	leaq	0(,%rdx,4), %rdi	#, D.19392
	movq	%rdx, -64(%rbp)	# D.19398, %sfp
	call	malloc	#
.LVL263:
.LBE120:
.LBE119:
	.loc 1 477 0
	movq	-56(%rbp), %rcx	# %sfp, D.19389
.LBB122:
.LBB121:
	.loc 1 183 0
	movq	%rax, (%rbx)	# tmp175, matrix_obj_100->data
.LVL264:
.LBE121:
.LBE122:
	.loc 1 477 0
	leaq	22(,%rcx,8), %rax	#, tmp179
	.loc 1 479 0
	leaq	(%rcx,%rcx,2), %rdi	#, D.19392
	.loc 1 477 0
	andq	$-16, %rax	#, tmp183
	subq	%rax, %rsp	# tmp183,
	.loc 1 479 0
	salq	$3, %rdi	#, tmp191
	call	malloc	#
.LVL265:
.LBB123:
	.loc 1 482 0
	movq	-56(%rbp), %rcx	# %sfp, D.19389
.LBE123:
	.loc 1 477 0
	movq	%rsp, %r12	#, tmp187
.LVL266:
	.loc 1 479 0
	movq	%rax, %r15	#, args
.LVL267:
.LBB126:
	.loc 1 482 0
	movq	-64(%rbp), %rdx	# %sfp, D.19398
	leal	-1(%rcx), %r13d	#, i
.LVL268:
	testl	%ecx, %ecx	# D.19389
	je	.L156	#,
.LVL269:
	movq	g_height(%rip), %rax	# g_height, D.19398
.LVL270:
	movl	%r13d, %edi	# i, i
	xorl	%r8d, %r8d	# start_row
	cqto
	idivq	%rcx	# D.19389
.LVL271:
	.p2align 4,,10
	.p2align 3
.L157:
.LBB124:
	.loc 1 484 0
	movl	%edi, %esi	# i, D.19389
	movq	%rdx, %rcx	# tmp195, D.19389
	subq	%rsi, %rcx	# D.19389, D.19389
	.loc 1 485 0
	leaq	(%rsi,%rsi,2), %rsi	#, D.19392
	.loc 1 484 0
	testq	%rcx, %rcx	# D.19389
	.loc 1 485 0
	leaq	(%r15,%rsi,8), %rsi	#, D.19396
	.loc 1 484 0
	setg	%cl	#, D.19394
.LBE124:
	.loc 1 482 0
	subl	$1, %edi	#, i
.LVL272:
.LBB125:
	.loc 1 484 0
	movzbl	%cl, %ecx	# D.19394, D.19394
	.loc 1 485 0
	movl	%r8d, 12(%rsi)	# start_row, _42->start_row
	.loc 1 484 0
	addl	%eax, %ecx	# D.19395, this_rows
.LVL273:
	.loc 1 485 0
	movq	%rbx, (%rsi)	# matrix_obj, _42->matrix_obj
	movl	%r14d, 8(%rsi)	# value, _42->value
	.loc 1 492 0
	addl	%ecx, %r8d	# this_rows, start_row
.LVL274:
	.loc 1 485 0
	movl	%ecx, 16(%rsi)	# this_rows, _42->num_rows
.LBE125:
	.loc 1 482 0
	cmpl	$-1, %edi	#, i
	jne	.L157	#,
.LVL275:
	.p2align 4,,10
	.p2align 3
.L158:
.LBE126:
.LBB127:
	.loc 1 497 0
	movl	%r13d, %eax	# i, D.19392
	xorl	%esi, %esi	#
	leaq	(%rax,%rax,2), %rdx	#, D.19392
	leaq	(%r15,%rdx,8), %rcx	#, D.19396
	movl	$uniform_worker, %edx	#,
	leaq	(%r12,%rax,8), %rdi	#, D.19397
	call	pthread_create	#
.LVL276:
	.loc 1 495 0
	testl	%r13d, %r13d	# i
	leal	-1(%r13), %r13d	#, i
.LVL277:
	jne	.L158	#,
	movq	g_nthreads(%rip), %rax	# g_nthreads, g_nthreads
.LBE127:
	.loc 1 500 0
	movq	24(%rbx), %rdi	# matrix_obj_100->occurances, D.19393
	movq	g_elements(%rip), %rdx	# g_elements, D.19398
	leal	-1(%rax), %r15d	#, D.19390
.LVL278:
	movl	%eax, %ecx	# g_nthreads, D.19390
	movl	%r15d, %r13d	# D.19390, i
.LVL279:
	testq	%rdi, %rdi	# D.19393
	je	.L159	#,
.L161:
	movq	%rdx, -64(%rbp)	# D.19398, %sfp
	.loc 1 503 0
	movl	%r15d, %r13d	# D.19390, i
	movl	%ecx, -56(%rbp)	# D.19390, %sfp
.LVL280:
	.loc 1 502 0
	call	free	#
.LVL281:
	.loc 1 503 0
	movl	-56(%rbp), %ecx	# %sfp, D.19390
	movq	$0, 24(%rbx)	#, matrix_obj_100->occurances
	movq	-64(%rbp), %rdx	# %sfp, D.19398
.L159:
	.loc 1 506 0
	movl	%r14d, 8(%rbx)	# value, matrix_obj_100->min
	.loc 1 507 0
	movl	%r14d, 12(%rbx)	# value, matrix_obj_100->max
	.loc 1 508 0
	imull	%edx, %r14d	# D.19398, D.19395
.LVL282:
	movl	%r14d, 16(%rbx)	# D.19395, matrix_obj_100->sum
.LVL283:
.LBB128:
	.loc 1 510 0
	testl	%ecx, %ecx	# D.19390
	je	.L178	#,
.LVL284:
	.p2align 4,,10
	.p2align 3
.L160:
	.loc 1 512 0
	movl	%r13d, %eax	# i, D.19392
	xorl	%esi, %esi	#
	movq	(%r12,%rax,8), %rdi	# *_70, *_70
	call	pthread_join	#
.LVL285:
	.loc 1 510 0
	testl	%r13d, %r13d	# i
	leal	-1(%r13), %r13d	#, i
.LVL286:
	jne	.L160	#,
.LVL287:
.L178:
.LBE128:
	.loc 1 516 0
	leaq	-40(%rbp), %rsp	#,
.LVL288:
	.loc 1 508 0
	movq	%rbx, %rax	# matrix_obj, D.19387
	.loc 1 516 0
	popq	%rbx	#
.LVL289:
	popq	%r12	#
.LVL290:
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL291:
	.p2align 4,,10
	.p2align 3
.L180:
	.cfi_restore_state
.LBB129:
.LBB130:
	.loc 1 172 0
	movl	$32, %esi	#,
	movl	$1, %edi	#,
.LVL292:
	call	calloc	#
.LVL293:
	.loc 1 173 0
	movq	g_elements(%rip), %rdi	# g_elements,
	movl	$4, %esi	#,
	.loc 1 172 0
	movq	%rax, %rbx	#, tmp164
.LVL294:
	.loc 1 173 0
	call	calloc	#
.LVL295:
	movq	%rax, (%rbx)	# tmp165, matrix_obj_77->data
.LBE130:
.LBE129:
	.loc 1 516 0
	leaq	-40(%rbp), %rsp	#,
	.loc 1 467 0
	movq	%rbx, %rax	# tmp164, D.19387
	.loc 1 516 0
	popq	%rbx	#
.LVL296:
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
.LVL297:
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL298:
.L156:
	.cfi_restore_state
	.loc 1 500 0
	movq	24(%rbx), %rdi	# matrix_obj_100->occurances, D.19393
	movl	$-1, %r15d	#, D.19390
	xorl	%ecx, %ecx	# D.19390
	testq	%rdi, %rdi	# D.19393
	jne	.L161	#,
	.loc 1 508 0
	imull	%r14d, %edx	# value, D.19395
	.loc 1 506 0
	movl	%r14d, 8(%rbx)	# value, matrix_obj_100->min
	.loc 1 507 0
	movl	%r14d, 12(%rbx)	# value, matrix_obj_100->max
	.loc 1 508 0
	movl	%edx, 16(%rbx)	# D.19395, matrix_obj_100->sum
	jmp	.L178	#
	.cfi_endproc
.LFE2273:
	.size	uniform_matrix, .-uniform_matrix
	.section	.text.unlikely
.LCOLDE25:
	.text
.LHOTE25:
	.section	.text.unlikely
.LCOLDB26:
	.text
.LHOTB26:
	.p2align 4,,15
	.globl	sequence_matrix
	.type	sequence_matrix, @function
sequence_matrix:
.LFB2276:
	.loc 1 600 0
	.cfi_startproc
.LVL299:
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%edi, %r8d	# start, start
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	subq	$56, %rsp	#,
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	.loc 1 601 0
	testl	%esi, %esi	# step
	jne	.L182	#,
	.loc 1 603 0
	testl	%edi, %edi	# start
	jne	.L183	#,
.LBB144:
.LBB145:
	.loc 1 172 0
	movl	$32, %esi	#,
.LVL300:
	movl	$1, %edi	#,
.LVL301:
	call	calloc	#
.LVL302:
	.loc 1 173 0
	movq	g_elements(%rip), %rdi	# g_elements,
	movl	$4, %esi	#,
	.loc 1 172 0
	movq	%rax, %rbx	#, tmp179
.LVL303:
	.loc 1 173 0
	call	calloc	#
.LVL304:
	movq	%rax, (%rbx)	# tmp180, matrix_obj_107->data
.LBE145:
.LBE144:
	.loc 1 673 0
	leaq	-40(%rbp), %rsp	#,
	.loc 1 605 0
	movq	%rbx, %rax	# tmp179, D.19473
	.loc 1 673 0
	popq	%rbx	#
.LVL305:
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL306:
	.p2align 4,,10
	.p2align 3
.L182:
	.cfi_restore_state
	.loc 1 610 0
	movq	g_nthreads(%rip), %rcx	# g_nthreads, D.19475
	cmpq	$1, %rcx	#, D.19475
	je	.L185	#,
	.loc 1 610 0 is_stmt 0 discriminator 1
	cmpq	$199, g_width(%rip)	#, g_width
	jg	.L186	#,
.L185:
.LBB146:
.LBB147:
.LBB148:
.LBB149:
	.loc 1 182 0 is_stmt 1
	movl	$32, %edi	#,
.LVL307:
	movl	%esi, -64(%rbp)	# step, %sfp
	movl	%r8d, -56(%rbp)	# start, %sfp
.LVL308:
	call	malloc	#
.LVL309:
	.loc 1 183 0
	movq	g_elements(%rip), %r12	# g_elements, D.19475
	.loc 1 182 0
	movq	%rax, %rbx	#, matrix_obj
.LVL310:
	.loc 1 183 0
	leaq	0(,%r12,4), %rdi	#, D.19476
	call	malloc	#
.LVL311:
	movq	%rax, %rdx	#, matrix_cpy
	movq	%rax, (%rbx)	# matrix_cpy, matrix_obj_104->data
.LVL312:
.LBE149:
.LBE148:
.LBB150:
	.loc 1 533 0
	leal	-1(%r12), %eax	#,
.LVL313:
	testl	%r12d, %r12d	# D.19475
	je	.L196	#,
	movl	-56(%rbp), %r8d	# %sfp, start
	leaq	4(%rdx,%rax,4), %rax	#, D.19478
.LVL314:
	xorl	%r14d, %r14d	# sum
	xorl	%r12d, %r12d	# max
.LVL315:
	movl	-64(%rbp), %esi	# %sfp, step
	movl	$-1, %r13d	#, max
.LVL316:
	.p2align 4,,10
	.p2align 3
.L188:
	cmpl	%r8d, %r13d	# max, max
	.loc 1 535 0
	movl	%r8d, (%rdx)	# max, MEM[base: matrix_cpy_178, offset: 0B]
	cmova	%r8d, %r13d	# max,, max, max
.LVL317:
	cmpl	%r8d, %r12d	# max, max
	cmovb	%r8d, %r12d	# max,, max, max
.LVL318:
	.loc 1 539 0
	addq	$4, %rdx	#, matrix_cpy
.LVL319:
	.loc 1 538 0
	addl	%r8d, %r14d	# max, sum
.LVL320:
	.loc 1 540 0
	addl	%esi, %r8d	# step, max
.LVL321:
	.loc 1 533 0
	cmpq	%rax, %rdx	# D.19478, matrix_cpy
	jne	.L188	#,
.LVL322:
.L187:
.LBE150:
	.loc 1 543 0
	movq	24(%rbx), %rdi	# matrix_obj_104->occurances, D.19478
	testq	%rdi, %rdi	# D.19478
	je	.L189	#,
	.loc 1 545 0
	call	free	#
.LVL323:
	.loc 1 546 0
	movq	$0, 24(%rbx)	#, matrix_obj_104->occurances
.L189:
	.loc 1 549 0
	movl	%r13d, 8(%rbx)	# max, matrix_obj_104->min
.LBE147:
.LBE146:
	.loc 1 612 0
	movq	%rbx, %rax	# matrix_obj, D.19473
.LBB153:
.LBB151:
	.loc 1 550 0
	movl	%r12d, 12(%rbx)	# max, matrix_obj_104->max
	.loc 1 551 0
	movl	%r14d, 16(%rbx)	# sum, matrix_obj_104->sum
.LBE151:
.LBE153:
	.loc 1 673 0
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
.LVL324:
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
.LVL325:
	ret
.LVL326:
	.p2align 4,,10
	.p2align 3
.L183:
	.cfi_restore_state
	.loc 1 607 0
	call	uniform_matrix	#
.LVL327:
	.loc 1 673 0
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL328:
	.p2align 4,,10
	.p2align 3
.L186:
	.cfi_restore_state
	movl	%edi, -64(%rbp)	# start, %sfp
	.loc 1 615 0
	leaq	0(,%rcx,8), %r15	#, tmp188
	movq	%rcx, %rdi	# D.19475, tmp189
.LVL329:
	salq	$6, %rdi	#, tmp189
	movq	%rcx, -56(%rbp)	# D.19475, %sfp
	subq	%r15, %rdi	# tmp188, D.19476
	movl	%esi, -72(%rbp)	# step, %sfp
	.loc 1 622 0
	addq	$22, %r15	#, tmp202
	.loc 1 615 0
	call	malloc	#
.LVL330:
.LBB154:
.LBB155:
	.loc 1 182 0
	movl	$32, %edi	#,
.LBE155:
.LBE154:
	.loc 1 622 0
	andq	$-16, %r15	#, tmp206
	.loc 1 615 0
	movq	%rax, -96(%rbp)	#, %sfp
.LVL331:
.LBB158:
.LBB156:
	.loc 1 182 0
	call	malloc	#
.LVL332:
	.loc 1 183 0
	movq	g_elements(%rip), %rsi	# g_elements, tmp277
	.loc 1 182 0
	movq	%rax, %r14	#, matrix_obj
.LVL333:
	.loc 1 183 0
	leaq	0(,%rsi,4), %rdi	#, D.19476
	call	malloc	#
.LVL334:
.LBE156:
.LBE158:
	.loc 1 618 0
	movq	-56(%rbp), %rcx	# %sfp, D.19475
.LBB159:
.LBB157:
	.loc 1 183 0
	movq	%r14, -88(%rbp)	# matrix_obj, %sfp
	movq	%rax, (%r14)	# tmp195, matrix_obj_131->data
.LBE157:
.LBE159:
	.loc 1 618 0
	leaq	0(,%rcx,4), %r14	#, D.19476
.LVL335:
	movq	%r14, %rdi	# D.19476,
	call	malloc	#
.LVL336:
	.loc 1 619 0
	movq	%r14, %rdi	# D.19476,
	.loc 1 618 0
	movq	%rax, %r12	#, mins
.LVL337:
	.loc 1 619 0
	call	malloc	#
.LVL338:
	.loc 1 620 0
	movq	%r14, %rdi	# D.19476,
	.loc 1 619 0
	movq	%rax, %r13	#, maxes
.LVL339:
	.loc 1 620 0
	call	malloc	#
.LVL340:
.LBB160:
	.loc 1 625 0
	movq	-56(%rbp), %rcx	# %sfp, D.19475
.LBE160:
	.loc 1 622 0
	subq	%r15, %rsp	# tmp206,
	.loc 1 620 0
	movq	%rax, %r14	#, sums
.LVL341:
	.loc 1 622 0
	movq	%rsp, %r15	#, tmp210
.LVL342:
.LBB163:
	.loc 1 625 0
	leal	-1(%rcx), %ebx	#, i
.LVL343:
	testl	%ecx, %ecx	# D.19475
	je	.L197	#,
	movq	g_height(%rip), %rax	# g_height, D.19483
.LVL344:
	movl	%ebx, %edi	# i, i
	movl	%ebx, -80(%rbp)	# i, %sfp
	xorl	%r11d, %r11d	# start_row
	movq	-96(%rbp), %rbx	# %sfp, args
.LVL345:
	movl	-72(%rbp), %esi	# %sfp, step
	movq	-88(%rbp), %r15	# %sfp, matrix_obj
	cqto
	movl	-64(%rbp), %r8d	# %sfp, start
	movq	%rsp, -64(%rbp)	# tmp210, %sfp
.LVL346:
	idivq	%rcx	# D.19475
	movl	%eax, %r9d	# D.19475, D.19480
.LVL347:
	.p2align 4,,10
	.p2align 3
.L191:
.LBB161:
	.loc 1 627 0
	movl	%edi, %eax	# i, D.19475
	movq	%rdx, %rcx	# tmp213, D.19475
	.loc 1 628 0
	leaq	0(,%rax,8), %r10	#, tmp222
	.loc 1 627 0
	subq	%rax, %rcx	# D.19475, D.19475
	testq	%rcx, %rcx	# D.19475
	setg	%cl	#, D.19479
	.loc 1 628 0
	salq	$6, %rax	#, tmp223
	subq	%r10, %rax	# tmp222, D.19476
	.loc 1 627 0
	movzbl	%cl, %ecx	# D.19479, D.19479
	.loc 1 628 0
	addq	%rbx, %rax	# args, D.19481
	.loc 1 627 0
	addl	%r9d, %ecx	# D.19480, this_rows
.LVL348:
	.loc 1 628 0
	movl	%edi, 48(%rax)	# i, _57->id
.LBE161:
	.loc 1 625 0
	subl	$1, %edi	#, i
.LVL349:
.LBB162:
	.loc 1 628 0
	movl	%r11d, 16(%rax)	# start_row, _57->start_row
	.loc 1 640 0
	addl	%ecx, %r11d	# this_rows, start_row
.LVL350:
	.loc 1 628 0
	movq	%r15, (%rax)	# matrix_obj, _57->matrix_obj
	movl	%r8d, 8(%rax)	# start, _57->start_value
	movl	%esi, 12(%rax)	# step, _57->increment
	movl	%ecx, 20(%rax)	# this_rows, _57->num_rows
	movq	%r12, 24(%rax)	# mins, _57->mins
	movq	%r13, 32(%rax)	# maxes, _57->maxes
	movq	%r14, 40(%rax)	# sums, _57->sums
.LBE162:
	.loc 1 625 0
	cmpl	$-1, %edi	#, i
	jne	.L191	#,
	movq	%r12, -56(%rbp)	# mins, %sfp
.LVL351:
	movq	-64(%rbp), %r15	# %sfp, tmp210
	movl	-80(%rbp), %r12d	# %sfp, i
.LVL352:
	.p2align 4,,10
	.p2align 3
.L192:
.LBE163:
.LBB164:
	.loc 1 645 0
	movl	%r12d, %ecx	# i, D.19476
	xorl	%esi, %esi	#
	movl	$sequence_worker, %edx	#,
	leaq	0(,%rcx,8), %rdi	#, tmp226
	salq	$6, %rcx	#, tmp227
	subq	%rdi, %rcx	# tmp226, D.19476
	addq	%r15, %rdi	# tmp210, D.19482
	addq	%rbx, %rcx	# args, D.19481
	call	pthread_create	#
.LVL353:
	.loc 1 643 0
	testl	%r12d, %r12d	# i
	leal	-1(%r12), %r12d	#, i
.LVL354:
	jne	.L192	#,
	movq	%rbx, -96(%rbp)	# args, %sfp
	movq	-56(%rbp), %r12	# %sfp, mins
.LVL355:
	movl	g_nthreads(%rip), %ebx	# g_nthreads, D.19484
.LVL356:
.L190:
.LBE164:
	.loc 1 648 0
	movq	-88(%rbp), %rax	# %sfp, matrix_obj
	movq	24(%rax), %rdi	# matrix_obj_131->occurances, D.19478
	testq	%rdi, %rdi	# D.19478
	je	.L193	#,
	.loc 1 650 0
	call	free	#
.LVL357:
	.loc 1 651 0
	movq	-88(%rbp), %rax	# %sfp, matrix_obj
	movq	$0, 24(%rax)	#, matrix_obj_131->occurances
.L193:
.LVL358:
	leal	-1(%rbx), %ecx	#, ivtmp.578
	.loc 1 654 0
	movl	$-1, %r9d	#, min
	.loc 1 656 0
	xorl	%ebx, %ebx	# sum
.LVL359:
	movq	%r13, -72(%rbp)	# maxes, %sfp
.LVL360:
	movq	%r14, -80(%rbp)	# sums, %sfp
	movl	%ecx, %r13d	# ivtmp.578, ivtmp.578
.LVL361:
	movl	%r9d, %r14d	# min, min
.LVL362:
	movq	%r12, %rcx	# mins, mins
.LVL363:
	movq	%r15, %r9	# tmp210, tmp210
	movl	%ebx, %r15d	# sum, sum
.LBB165:
	.loc 1 658 0
	jmp	.L194	#
.LVL364:
	.p2align 4,,10
	.p2align 3
.L195:
	.loc 1 660 0
	movl	%r13d, %r12d	# ivtmp.578, D.19476
	xorl	%esi, %esi	#
	movq	%rcx, -64(%rbp)	# mins, %sfp
	movq	(%r9,%r12,8), %rdi	# *_85, *_85
	movq	%r9, -56(%rbp)	# tmp210, %sfp
	call	pthread_join	#
.LVL365:
	.loc 1 661 0
	movq	-80(%rbp), %rax	# %sfp, sums
	.loc 1 662 0
	movq	-64(%rbp), %rcx	# %sfp, mins
	movq	-56(%rbp), %r9	# %sfp, tmp210
	.loc 1 661 0
	addl	(%rax,%r12,4), %r15d	# *_89, sum
.LVL366:
	.loc 1 662 0
	movl	(%rcx,%r12,4), %eax	# *_92, min
	cmpl	%eax, %r14d	# min, min
	cmova	%eax, %r14d	# min,, min, min
.LVL367:
	.loc 1 663 0
	movq	-72(%rbp), %rax	# %sfp, maxes
	movl	(%rax,%r12,4), %eax	# *_95, max
	cmpl	%eax, %ebx	# max, max
	cmovb	%eax, %ebx	# max,, max, max
.LVL368:
	subl	$1, %r13d	#, ivtmp.578
.LVL369:
.L194:
	.loc 1 658 0 discriminator 1
	cmpl	$-1, %r13d	#, ivtmp.578
	jne	.L195	#,
	movl	%ebx, %r8d	# max, max
	movl	%r15d, %ebx	# sum, sum
.LVL370:
.LBE165:
	.loc 1 666 0
	movq	-88(%rbp), %r15	# %sfp, matrix_obj
.LVL371:
	.loc 1 670 0
	movq	-96(%rbp), %rdi	# %sfp,
	.loc 1 666 0
	movq	%r15, %rax	# matrix_obj, matrix_obj
	movl	%r14d, 8(%rax)	# min, matrix_obj_131->min
	.loc 1 668 0
	movl	%ebx, 16(%r15)	# sum, matrix_obj_131->sum
	.loc 1 667 0
	movl	%r8d, 12(%r15)	# max, matrix_obj_131->max
	.loc 1 670 0
	call	free	#
.LVL372:
	.loc 1 673 0
	leaq	-40(%rbp), %rsp	#,
.LVL373:
	.loc 1 672 0
	movq	%r15, %rax	# matrix_obj, D.19473
	.loc 1 673 0
	popq	%rbx	#
.LVL374:
	popq	%r12	#
	popq	%r13	#
.LVL375:
	popq	%r14	#
.LVL376:
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL377:
.L196:
	.cfi_restore_state
.LBB166:
.LBB152:
	.loc 1 531 0
	xorl	%r14d, %r14d	# sum
	.loc 1 530 0
	xorl	%r12d, %r12d	# max
	.loc 1 529 0
	movl	$-1, %r13d	#, max
	jmp	.L187	#
.LVL378:
.L197:
.LBE152:
.LBE166:
.LBB167:
	.loc 1 625 0
	xorl	%ebx, %ebx	# D.19484
.LVL379:
	jmp	.L190	#
.LBE167:
	.cfi_endproc
.LFE2276:
	.size	sequence_matrix, .-sequence_matrix
	.section	.text.unlikely
.LCOLDE26:
	.text
.LHOTE26:
	.section	.text.unlikely
.LCOLDB27:
	.text
.LHOTB27:
	.p2align 4,,15
	.globl	cloned
	.type	cloned, @function
cloned:
.LFB2279:
	.loc 1 726 0
	.cfi_startproc
.LVL380:
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	movq	%rdi, %r14	# matrix_obj, matrix_obj
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	subq	$24, %rsp	#,
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	.loc 1 728 0
	movq	g_nthreads(%rip), %rcx	# g_nthreads, D.19525
	cmpq	$1, %rcx	#, D.19525
	je	.L228	#,
.LBB178:
.LBB179:
	.loc 1 182 0
	movl	$32, %edi	#,
.LVL381:
	movq	%rcx, -56(%rbp)	# D.19525, %sfp
	call	malloc	#
.LVL382:
	movq	%rax, %r12	#, result_obj
.LVL383:
	.loc 1 183 0
	movq	g_elements(%rip), %rax	# g_elements, tmp229
.LVL384:
	leaq	0(,%rax,4), %rdi	#, D.19527
	call	malloc	#
.LVL385:
.LBE179:
.LBE178:
	.loc 1 735 0
	movq	-56(%rbp), %rcx	# %sfp, D.19525
.LBB181:
.LBB180:
	.loc 1 183 0
	movq	%rax, (%r12)	# tmp173, result_obj_87->data
.LVL386:
.LBE180:
.LBE181:
	.loc 1 735 0
	leaq	22(,%rcx,8), %rax	#, tmp177
	.loc 1 737 0
	leaq	(%rcx,%rcx,2), %rdi	#, D.19527
	.loc 1 735 0
	andq	$-16, %rax	#, tmp181
	subq	%rax, %rsp	# tmp181,
	.loc 1 737 0
	salq	$3, %rdi	#, tmp189
	call	malloc	#
.LVL387:
.LBB182:
	.loc 1 739 0
	movq	-56(%rbp), %rcx	# %sfp, D.19525
.LBE182:
	.loc 1 735 0
	movq	%rsp, %r13	#, tmp185
.LVL388:
	.loc 1 737 0
	movq	%rax, %rbx	#, args
.LVL389:
.LBB185:
	.loc 1 739 0
	leal	-1(%rcx), %r15d	#, i
.LVL390:
	testl	%ecx, %ecx	# D.19525
	je	.L215	#,
.LVL391:
	movq	g_height(%rip), %rax	# g_height, D.19533
.LVL392:
	movl	%r15d, %edi	# i, i
	xorl	%r8d, %r8d	# start_row
	cqto
	idivq	%rcx	# D.19525
.LVL393:
	.p2align 4,,10
	.p2align 3
.L216:
.LBB183:
	.loc 1 741 0
	movl	%edi, %esi	# i, D.19525
	movq	%rdx, %rcx	# tmp193, D.19525
	subq	%rsi, %rcx	# D.19525, D.19525
	.loc 1 742 0
	leaq	(%rsi,%rsi,2), %rsi	#, D.19527
	.loc 1 741 0
	testq	%rcx, %rcx	# D.19525
	.loc 1 742 0
	leaq	(%rbx,%rsi,8), %rsi	#, D.19530
	.loc 1 741 0
	setg	%cl	#, D.19528
.LBE183:
	.loc 1 739 0
	subl	$1, %edi	#, i
.LVL394:
.LBB184:
	.loc 1 741 0
	movzbl	%cl, %ecx	# D.19528, D.19528
	.loc 1 742 0
	movl	%r8d, 16(%rsi)	# start_row, _40->start_row
	.loc 1 741 0
	addl	%eax, %ecx	# D.19529, this_rows
.LVL395:
	.loc 1 742 0
	movq	%r14, (%rsi)	# matrix_obj, _40->matrix_obj
	movq	%r12, 8(%rsi)	# result_obj, _40->result_obj
	.loc 1 749 0
	addl	%ecx, %r8d	# this_rows, start_row
.LVL396:
	.loc 1 742 0
	movl	%ecx, 20(%rsi)	# this_rows, _40->num_rows
.LBE184:
	.loc 1 739 0
	cmpl	$-1, %edi	#, i
	jne	.L216	#,
.LVL397:
	.p2align 4,,10
	.p2align 3
.L217:
.LBE185:
.LBB186:
	.loc 1 754 0
	movl	%r15d, %eax	# i, D.19527
	xorl	%esi, %esi	#
	leaq	(%rax,%rax,2), %rdx	#, D.19527
	leaq	(%rbx,%rdx,8), %rcx	#, D.19530
	movl	$clone_worker, %edx	#,
	leaq	0(%r13,%rax,8), %rdi	#, D.19531
	call	pthread_create	#
.LVL398:
	.loc 1 752 0
	testl	%r15d, %r15d	# i
	leal	-1(%r15), %r15d	#, i
.LVL399:
	jne	.L217	#,
.LBE186:
	.loc 1 757 0
	movl	8(%r14), %edx	# matrix_obj_14(D)->min, matrix_obj_14(D)->min
	movq	g_nthreads(%rip), %rax	# g_nthreads, g_nthreads
	movl	%edx, 8(%r12)	# matrix_obj_14(D)->min, result_obj_87->min
	.loc 1 758 0
	movl	12(%r14), %edx	# matrix_obj_14(D)->max, matrix_obj_14(D)->max
	leal	-1(%rax), %r15d	#, i
.LVL400:
	movl	%edx, 12(%r12)	# matrix_obj_14(D)->max, result_obj_87->max
	.loc 1 759 0
	movl	16(%r14), %edx	# matrix_obj_14(D)->sum, matrix_obj_14(D)->sum
	movl	%edx, 16(%r12)	# matrix_obj_14(D)->sum, result_obj_87->sum
	.loc 1 761 0
	movq	24(%r14), %rdx	# matrix_obj_14(D)->occurances, matrix_obj_14(D)->occurances
	movq	%rdx, 24(%r12)	# matrix_obj_14(D)->occurances, result_obj_87->occurances
.LVL401:
.LBB187:
	.loc 1 763 0
	testl	%eax, %eax	# g_nthreads
	je	.L220	#,
	.p2align 4,,10
	.p2align 3
.L221:
	.loc 1 765 0
	movl	%r15d, %eax	# i, D.19527
	xorl	%esi, %esi	#
	movq	0(%r13,%rax,8), %rdi	# *_67, *_67
	call	pthread_join	#
.LVL402:
	.loc 1 763 0
	testl	%r15d, %r15d	# i
	leal	-1(%r15), %r15d	#, i
.LVL403:
	jne	.L221	#,
.LVL404:
.L220:
.LBE187:
	.loc 1 768 0
	movq	%rbx, %rdi	# args,
	call	free	#
.LVL405:
	.loc 1 771 0
	leaq	-40(%rbp), %rsp	#,
.LVL406:
	.loc 1 770 0
	movq	%r12, %rax	# result_obj, D.19523
	.loc 1 771 0
	popq	%rbx	#
.LVL407:
	popq	%r12	#
.LVL408:
	popq	%r13	#
.LVL409:
	popq	%r14	#
.LVL410:
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
.LVL411:
	ret
.LVL412:
	.p2align 4,,10
	.p2align 3
.L228:
	.cfi_restore_state
.LBB188:
.LBB189:
.LBB190:
.LBB191:
	.loc 1 182 0
	movl	$32, %edi	#,
.LVL413:
	call	malloc	#
.LVL414:
	movq	%rax, %r12	#, tmp157
.LVL415:
	.loc 1 183 0
	movq	g_elements(%rip), %rax	# g_elements, tmp228
.LVL416:
	leaq	0(,%rax,4), %rbx	#, D.19527
	movq	%rbx, %rdi	# D.19527,
	call	malloc	#
.LVL417:
.LBE191:
.LBE190:
	.loc 1 685 0
	movq	(%r14), %rsi	# matrix_obj_14(D)->data, matrix_obj_14(D)->data
	movq	%rbx, %rdx	# D.19527,
.LBB193:
.LBB192:
	.loc 1 183 0
	movq	%rax, (%r12)	# tmp159, result_obj_15->data
.LBE192:
.LBE193:
	.loc 1 685 0
	movq	%rax, %rdi	# tmp159,
	call	memcpy	#
.LVL418:
	.loc 1 687 0
	movl	8(%r14), %eax	# matrix_obj_14(D)->min, matrix_obj_14(D)->min
	movl	%eax, 8(%r12)	# matrix_obj_14(D)->min, result_obj_15->min
	.loc 1 688 0
	movl	12(%r14), %eax	# matrix_obj_14(D)->max, matrix_obj_14(D)->max
	movl	%eax, 12(%r12)	# matrix_obj_14(D)->max, result_obj_15->max
	.loc 1 689 0
	movl	16(%r14), %eax	# matrix_obj_14(D)->sum, matrix_obj_14(D)->sum
	movl	%eax, 16(%r12)	# matrix_obj_14(D)->sum, result_obj_15->sum
	.loc 1 691 0
	movq	24(%r14), %rax	# matrix_obj_14(D)->occurances, matrix_obj_14(D)->occurances
	movq	%rax, 24(%r12)	# matrix_obj_14(D)->occurances, result_obj_15->occurances
.LBE189:
.LBE188:
	.loc 1 771 0
	leaq	-40(%rbp), %rsp	#,
	.loc 1 730 0
	movq	%r12, %rax	# tmp157, D.19523
	.loc 1 771 0
	popq	%rbx	#
	popq	%r12	#
.LVL419:
	popq	%r13	#
	popq	%r14	#
.LVL420:
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL421:
.L215:
	.cfi_restore_state
	.loc 1 757 0
	movl	8(%r14), %eax	# matrix_obj_14(D)->min, matrix_obj_14(D)->min
.LVL422:
	movl	%eax, 8(%r12)	# matrix_obj_14(D)->min, result_obj_87->min
	.loc 1 758 0
	movl	12(%r14), %eax	# matrix_obj_14(D)->max, matrix_obj_14(D)->max
	movl	%eax, 12(%r12)	# matrix_obj_14(D)->max, result_obj_87->max
	.loc 1 759 0
	movl	16(%r14), %eax	# matrix_obj_14(D)->sum, matrix_obj_14(D)->sum
	movl	%eax, 16(%r12)	# matrix_obj_14(D)->sum, result_obj_87->sum
	.loc 1 761 0
	movq	24(%r14), %rax	# matrix_obj_14(D)->occurances, matrix_obj_14(D)->occurances
	movq	%rax, 24(%r12)	# matrix_obj_14(D)->occurances, result_obj_87->occurances
.LVL423:
	jmp	.L220	#
	.cfi_endproc
.LFE2279:
	.size	cloned, .-cloned
	.section	.text.unlikely
.LCOLDE27:
	.text
.LHOTE27:
	.section	.text.unlikely
.LCOLDB28:
	.text
.LHOTB28:
	.p2align 4,,15
	.globl	reversed
	.type	reversed, @function
reversed:
.LFB2282:
	.loc 1 824 0
	.cfi_startproc
.LVL424:
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	movq	%rdi, %r12	# matrix_obj, matrix_obj
	pushq	%rbx	#
	subq	$24, %rsp	#,
	.cfi_offset 3, -56
	.loc 1 825 0
	movq	g_nthreads(%rip), %rcx	# g_nthreads, D.19594
	cmpq	$1, %rcx	#, D.19594
	je	.L230	#,
	.loc 1 825 0 is_stmt 0 discriminator 1
	cmpq	$199, g_width(%rip)	#, g_width
	jg	.L231	#,
.L230:
.LVL425:
.LBB205:
.LBB206:
.LBB207:
.LBB208:
	.loc 1 182 0 is_stmt 1
	movl	$32, %edi	#,
.LVL426:
	call	malloc	#
.LVL427:
	.loc 1 183 0
	movq	g_elements(%rip), %r14	# g_elements, D.19594
	.loc 1 182 0
	movq	%rax, %r13	#, result_obj
.LVL428:
	.loc 1 183 0
	leaq	0(,%r14,4), %rbx	#, D.19596
	movq	%rbx, %rdi	# D.19596,
	call	malloc	#
.LVL429:
.LBE208:
.LBE207:
	.loc 1 782 0
	leaq	-4(%rbx), %rcx	#, D.19595
	addq	(%r12), %rcx	# matrix_obj_40(D)->data, matrix_cpy
.LBB210:
.LBB209:
	.loc 1 183 0
	movq	%rax, %rdx	#, result
	movq	%rax, 0(%r13)	# result, result_obj_71->data
.LVL430:
.LBE209:
.LBE210:
.LBB211:
	.loc 1 784 0
	leal	-1(%r14), %eax	#,
.LVL431:
	leaq	4(%rdx,%rax,4), %rax	#, D.19597
.LVL432:
	testl	%r14d, %r14d	# D.19594
	je	.L235	#,
.LVL433:
	.p2align 4,,10
	.p2align 3
.L234:
	.loc 1 786 0
	subq	$4, %rcx	#, matrix_cpy
.LVL434:
	movl	4(%rcx), %esi	# MEM[base: matrix_cpy_86, offset: 4B], D.19599
	addq	$4, %rdx	#, result
.LVL435:
	movl	%esi, -4(%rdx)	# D.19599, MEM[base: result_84, offset: -4B]
	.loc 1 784 0
	cmpq	%rax, %rdx	# D.19597, result
	jne	.L234	#,
.L235:
.LBE211:
	.loc 1 789 0
	movl	8(%r12), %eax	# matrix_obj_40(D)->min, matrix_obj_40(D)->min
	movl	%eax, 8(%r13)	# matrix_obj_40(D)->min, result_obj_71->min
	.loc 1 790 0
	movl	12(%r12), %eax	# matrix_obj_40(D)->max, matrix_obj_40(D)->max
	movl	%eax, 12(%r13)	# matrix_obj_40(D)->max, result_obj_71->max
	.loc 1 791 0
	movl	16(%r12), %eax	# matrix_obj_40(D)->sum, matrix_obj_40(D)->sum
	movl	%eax, 16(%r13)	# matrix_obj_40(D)->sum, result_obj_71->sum
	.loc 1 793 0
	movq	24(%r12), %rax	# matrix_obj_40(D)->occurances, matrix_obj_40(D)->occurances
	movq	%rax, 24(%r13)	# matrix_obj_40(D)->occurances, result_obj_71->occurances
.LBE206:
.LBE205:
	.loc 1 868 0
	leaq	-40(%rbp), %rsp	#,
	.loc 1 827 0
	movq	%r13, %rax	# result_obj, D.19592
	.loc 1 868 0
	popq	%rbx	#
	popq	%r12	#
.LVL436:
	popq	%r13	#
.LVL437:
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL438:
	.p2align 4,,10
	.p2align 3
.L231:
	.cfi_restore_state
.LBB212:
.LBB213:
	.loc 1 182 0
	movl	$32, %edi	#,
.LVL439:
	movq	%rcx, -56(%rbp)	# D.19594, %sfp
	call	malloc	#
.LVL440:
	movq	%rax, %rbx	#, result_obj
.LVL441:
	.loc 1 183 0
	movq	g_elements(%rip), %rax	# g_elements, tmp228
.LVL442:
	leaq	0(,%rax,4), %rdi	#, D.19596
	call	malloc	#
.LVL443:
.LBE213:
.LBE212:
	.loc 1 832 0
	movq	-56(%rbp), %rcx	# %sfp, D.19594
.LBB215:
.LBB214:
	.loc 1 183 0
	movq	%rax, (%rbx)	# tmp177, result_obj_98->data
.LVL444:
.LBE214:
.LBE215:
	.loc 1 832 0
	leaq	22(,%rcx,8), %rax	#, tmp181
	.loc 1 834 0
	leaq	(%rcx,%rcx,2), %rdi	#, D.19596
	.loc 1 832 0
	andq	$-16, %rax	#, tmp185
	subq	%rax, %rsp	# tmp185,
	.loc 1 834 0
	salq	$3, %rdi	#, tmp193
	call	malloc	#
.LVL445:
.LBB216:
	.loc 1 836 0
	movq	-56(%rbp), %rcx	# %sfp, D.19594
.LBE216:
	.loc 1 832 0
	movq	%rsp, %r14	#, tmp189
.LVL446:
	.loc 1 834 0
	movq	%rax, %r13	#, args
.LVL447:
.LBB219:
	.loc 1 836 0
	leal	-1(%rcx), %r15d	#, i
.LVL448:
	testl	%ecx, %ecx	# D.19594
	je	.L236	#,
.LVL449:
	movq	g_height(%rip), %rax	# g_height, D.19602
.LVL450:
	movl	%r15d, %edi	# i, i
	xorl	%r8d, %r8d	# start_row
	cqto
	idivq	%rcx	# D.19594
.LVL451:
	.p2align 4,,10
	.p2align 3
.L237:
.LBB217:
	.loc 1 838 0
	movl	%edi, %esi	# i, D.19594
	movq	%rdx, %rcx	# tmp197, D.19594
	subq	%rsi, %rcx	# D.19594, D.19594
	.loc 1 839 0
	leaq	(%rsi,%rsi,2), %rsi	#, D.19596
	.loc 1 838 0
	testq	%rcx, %rcx	# D.19594
	.loc 1 839 0
	leaq	0(%r13,%rsi,8), %rsi	#, D.19600
	.loc 1 838 0
	setg	%cl	#, D.19598
.LBE217:
	.loc 1 836 0
	subl	$1, %edi	#, i
.LVL452:
.LBB218:
	.loc 1 838 0
	movzbl	%cl, %ecx	# D.19598, D.19598
	.loc 1 839 0
	movl	%r8d, 20(%rsi)	# start_row, _38->start_row
	.loc 1 838 0
	addl	%eax, %ecx	# D.19599, this_rows
.LVL453:
	.loc 1 839 0
	movq	%rbx, (%rsi)	# result_obj, _38->result_obj
	movq	%r12, 8(%rsi)	# matrix_obj, _38->matrix_obj
	.loc 1 846 0
	addl	%ecx, %r8d	# this_rows, start_row
.LVL454:
	.loc 1 839 0
	movl	%ecx, 16(%rsi)	# this_rows, _38->num_rows
.LBE218:
	.loc 1 836 0
	cmpl	$-1, %edi	#, i
	jne	.L237	#,
.LVL455:
	.p2align 4,,10
	.p2align 3
.L238:
.LBE219:
.LBB220:
	.loc 1 851 0
	movl	%r15d, %eax	# i, D.19596
	xorl	%esi, %esi	#
	leaq	(%rax,%rax,2), %rdx	#, D.19596
	leaq	0(%r13,%rdx,8), %rcx	#, D.19600
	movl	$reverse_worker, %edx	#,
	leaq	(%r14,%rax,8), %rdi	#, D.19601
	call	pthread_create	#
.LVL456:
	.loc 1 849 0
	testl	%r15d, %r15d	# i
	leal	-1(%r15), %r15d	#, i
.LVL457:
	jne	.L238	#,
	movq	g_nthreads(%rip), %rax	# g_nthreads, g_nthreads
	leal	-1(%rax), %r15d	#, i
.LVL458:
.LBE220:
.LBB221:
	.loc 1 854 0
	testl	%eax, %eax	# g_nthreads
	je	.L236	#,
	.p2align 4,,10
	.p2align 3
.L243:
	.loc 1 856 0
	movl	%r15d, %eax	# i, D.19596
	xorl	%esi, %esi	#
	movq	(%r14,%rax,8), %rdi	# *_58, *_58
	call	pthread_join	#
.LVL459:
	.loc 1 854 0
	testl	%r15d, %r15d	# i
	leal	-1(%r15), %r15d	#, i
.LVL460:
	jne	.L243	#,
.LVL461:
.L236:
.LBE221:
	.loc 1 859 0
	movl	8(%r12), %eax	# matrix_obj_40(D)->min, matrix_obj_40(D)->min
	.loc 1 865 0
	movq	%r13, %rdi	# args,
	.loc 1 859 0
	movl	%eax, 8(%rbx)	# matrix_obj_40(D)->min, result_obj_98->min
	.loc 1 860 0
	movl	12(%r12), %eax	# matrix_obj_40(D)->max, matrix_obj_40(D)->max
	movl	%eax, 12(%rbx)	# matrix_obj_40(D)->max, result_obj_98->max
	.loc 1 861 0
	movl	16(%r12), %eax	# matrix_obj_40(D)->sum, matrix_obj_40(D)->sum
	movl	%eax, 16(%rbx)	# matrix_obj_40(D)->sum, result_obj_98->sum
	.loc 1 863 0
	movq	24(%r12), %rax	# matrix_obj_40(D)->occurances, matrix_obj_40(D)->occurances
	movq	%rax, 24(%rbx)	# matrix_obj_40(D)->occurances, result_obj_98->occurances
	.loc 1 865 0
	call	free	#
.LVL462:
	.loc 1 868 0
	leaq	-40(%rbp), %rsp	#,
.LVL463:
	.loc 1 867 0
	movq	%rbx, %rax	# result_obj, D.19592
	.loc 1 868 0
	popq	%rbx	#
.LVL464:
	popq	%r12	#
.LVL465:
	popq	%r13	#
.LVL466:
	popq	%r14	#
.LVL467:
	popq	%r15	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
.LVL468:
	ret
	.cfi_endproc
.LFE2282:
	.size	reversed, .-reversed
	.section	.text.unlikely
.LCOLDE28:
	.text
.LHOTE28:
	.section	.text.unlikely
.LCOLDB29:
	.text
.LHOTB29:
	.p2align 4,,15
	.globl	transposed
	.type	transposed, @function
transposed:
.LFB2284:
	.loc 1 903 0
	.cfi_startproc
.LVL469:
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	movq	%rdi, %r14	# matrix_obj, matrix_obj
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	subq	$24, %rsp	#,
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	.loc 1 904 0
	call	identity_matrix	#
.LVL470:
	.loc 1 905 0
	movq	g_elements(%rip), %rbx	# g_elements, tmp210
	movq	(%rax), %rsi	# identity_obj_14->data,
	movq	(%r14), %rdi	# matrix_obj_19(D)->data,
	salq	$2, %rbx	#, D.19636
	movq	%rbx, %rdx	# D.19636,
	call	memcmp	#
.LVL471:
	testl	%eax, %eax	# tmp152
	je	.L267	#,
.LBB228:
.LBB229:
	.loc 1 182 0
	movl	$32, %edi	#,
	call	malloc	#
.LVL472:
	.loc 1 183 0
	movq	%rbx, %rdi	# D.19636,
	.loc 1 182 0
	movq	%rax, %r13	#, result_obj
.LVL473:
	.loc 1 183 0
	call	malloc	#
.LVL474:
.LBE229:
.LBE228:
	.loc 1 911 0
	movq	g_nthreads(%rip), %rcx	# g_nthreads, D.19635
.LBB231:
.LBB230:
	.loc 1 183 0
	movq	%rax, 0(%r13)	# tmp155, result_obj_80->data
.LVL475:
.LBE230:
.LBE231:
	.loc 1 911 0
	leaq	22(,%rcx,8), %rax	#, tmp159
	.loc 1 913 0
	movq	%rcx, -56(%rbp)	# D.19635, %sfp
	leaq	(%rcx,%rcx,2), %rdi	#, D.19636
	.loc 1 911 0
	andq	$-16, %rax	#, tmp163
	subq	%rax, %rsp	# tmp163,
	.loc 1 913 0
	salq	$3, %rdi	#, tmp171
	call	malloc	#
.LVL476:
.LBB232:
	.loc 1 915 0
	movq	-56(%rbp), %rcx	# %sfp, D.19635
.LBE232:
	.loc 1 911 0
	movq	%rsp, %r12	#, tmp167
.LVL477:
	.loc 1 913 0
	movq	%rax, %rbx	#, args
.LVL478:
.LBB235:
	.loc 1 915 0
	leal	-1(%rcx), %r15d	#, i
.LVL479:
	testl	%ecx, %ecx	# D.19635
	je	.L254	#,
.LVL480:
	movq	g_height(%rip), %rax	# g_height, D.19644
.LVL481:
	movl	%r15d, %edi	# i, i
	xorl	%r8d, %r8d	# start_row
	cqto
	idivq	%rcx	# D.19635
.LVL482:
	.p2align 4,,10
	.p2align 3
.L255:
.LBB233:
	.loc 1 917 0
	movl	%edi, %esi	# i, D.19635
	movq	%rdx, %rcx	# tmp175, D.19635
	subq	%rsi, %rcx	# D.19635, D.19635
	.loc 1 918 0
	leaq	(%rsi,%rsi,2), %rsi	#, D.19636
	.loc 1 917 0
	testq	%rcx, %rcx	# D.19635
	.loc 1 918 0
	leaq	(%rbx,%rsi,8), %rsi	#, D.19642
	.loc 1 917 0
	setg	%cl	#, D.19640
.LBE233:
	.loc 1 915 0
	subl	$1, %edi	#, i
.LVL483:
.LBB234:
	.loc 1 917 0
	movzbl	%cl, %ecx	# D.19640, D.19640
	.loc 1 918 0
	movl	%r8d, 20(%rsi)	# start_row, _47->start_row
	.loc 1 917 0
	addl	%eax, %ecx	# D.19641, this_rows
.LVL484:
	.loc 1 918 0
	movq	%r14, (%rsi)	# matrix_obj, _47->matrix_obj
	movq	%r13, 8(%rsi)	# result_obj, _47->result_obj
	.loc 1 925 0
	addl	%ecx, %r8d	# this_rows, start_row
.LVL485:
	.loc 1 918 0
	movl	%ecx, 16(%rsi)	# this_rows, _47->num_rows
.LBE234:
	.loc 1 915 0
	cmpl	$-1, %edi	#, i
	jne	.L255	#,
.LVL486:
	.p2align 4,,10
	.p2align 3
.L256:
.LBE235:
.LBB236:
	.loc 1 930 0
	movl	%r15d, %eax	# i, D.19636
	xorl	%esi, %esi	#
	leaq	(%rax,%rax,2), %rdx	#, D.19636
	leaq	(%rbx,%rdx,8), %rcx	#, D.19642
	movl	$transpose_worker, %edx	#,
	leaq	(%r12,%rax,8), %rdi	#, D.19643
	call	pthread_create	#
.LVL487:
	.loc 1 928 0
	testl	%r15d, %r15d	# i
	leal	-1(%r15), %r15d	#, i
.LVL488:
	jne	.L256	#,
.LBE236:
	.loc 1 933 0
	movl	8(%r14), %edx	# matrix_obj_19(D)->min, matrix_obj_19(D)->min
	movq	g_nthreads(%rip), %rax	# g_nthreads, g_nthreads
	movl	%edx, 8(%r13)	# matrix_obj_19(D)->min, result_obj_80->min
	.loc 1 934 0
	movl	12(%r14), %edx	# matrix_obj_19(D)->max, matrix_obj_19(D)->max
	leal	-1(%rax), %r15d	#, i
.LVL489:
	movl	%edx, 12(%r13)	# matrix_obj_19(D)->max, result_obj_80->max
	.loc 1 935 0
	movl	16(%r14), %edx	# matrix_obj_19(D)->sum, matrix_obj_19(D)->sum
	movl	%edx, 16(%r13)	# matrix_obj_19(D)->sum, result_obj_80->sum
	.loc 1 937 0
	movq	24(%r14), %rdx	# matrix_obj_19(D)->occurances, matrix_obj_19(D)->occurances
	movq	%rdx, 24(%r13)	# matrix_obj_19(D)->occurances, result_obj_80->occurances
.LVL490:
.LBB237:
	.loc 1 939 0
	testl	%eax, %eax	# g_nthreads
	je	.L259	#,
	.p2align 4,,10
	.p2align 3
.L260:
	.loc 1 941 0
	movl	%r15d, %eax	# i, D.19636
	xorl	%esi, %esi	#
	movq	(%r12,%rax,8), %rdi	# *_74, *_74
	call	pthread_join	#
.LVL491:
	.loc 1 939 0
	testl	%r15d, %r15d	# i
	leal	-1(%r15), %r15d	#, i
.LVL492:
	jne	.L260	#,
.LVL493:
.L259:
.LBE237:
	.loc 1 944 0
	movq	%rbx, %rdi	# args,
	call	free	#
.LVL494:
	.loc 1 947 0
	leaq	-40(%rbp), %rsp	#,
.LVL495:
	.loc 1 946 0
	movq	%r13, %rax	# result_obj, D.19633
	.loc 1 947 0
	popq	%rbx	#
.LVL496:
	popq	%r12	#
.LVL497:
	popq	%r13	#
.LVL498:
	popq	%r14	#
.LVL499:
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
.LVL500:
	ret
.LVL501:
	.p2align 4,,10
	.p2align 3
.L267:
	.cfi_restore_state
	.loc 1 907 0
	movq	%r14, %rdi	# matrix_obj,
	call	cloned	#
.LVL502:
	.loc 1 947 0
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
.LVL503:
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL504:
.L254:
	.cfi_restore_state
	.loc 1 933 0
	movl	8(%r14), %eax	# matrix_obj_19(D)->min, matrix_obj_19(D)->min
.LVL505:
	movl	%eax, 8(%r13)	# matrix_obj_19(D)->min, result_obj_80->min
	.loc 1 934 0
	movl	12(%r14), %eax	# matrix_obj_19(D)->max, matrix_obj_19(D)->max
	movl	%eax, 12(%r13)	# matrix_obj_19(D)->max, result_obj_80->max
	.loc 1 935 0
	movl	16(%r14), %eax	# matrix_obj_19(D)->sum, matrix_obj_19(D)->sum
	movl	%eax, 16(%r13)	# matrix_obj_19(D)->sum, result_obj_80->sum
	.loc 1 937 0
	movq	24(%r14), %rax	# matrix_obj_19(D)->occurances, matrix_obj_19(D)->occurances
	movq	%rax, 24(%r13)	# matrix_obj_19(D)->occurances, result_obj_80->occurances
.LVL506:
	jmp	.L259	#
	.cfi_endproc
.LFE2284:
	.size	transposed, .-transposed
	.section	.text.unlikely
.LCOLDE29:
	.text
.LHOTE29:
	.section	.text.unlikely
.LCOLDB30:
	.text
.LHOTB30:
	.p2align 4,,15
	.globl	scalar_add
	.type	scalar_add, @function
scalar_add:
.LFB2287:
	.loc 1 1024 0
	.cfi_startproc
.LVL507:
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %r11	# matrix_obj, matrix_obj
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	subq	$56, %rsp	#,
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	.loc 1 1025 0
	movq	g_nthreads(%rip), %rcx	# g_nthreads, D.19716
	cmpq	$1, %rcx	#, D.19716
	je	.L269	#,
	.loc 1 1025 0 is_stmt 0 discriminator 1
	cmpq	$199, g_width(%rip)	#, g_width
	jg	.L270	#,
.L269:
.LBB249:
.LBB250:
.LBB251:
.LBB252:
	.loc 1 182 0 is_stmt 1
	movl	$32, %edi	#,
.LVL508:
	movq	%r11, -56(%rbp)	# matrix_obj, %sfp
.LVL509:
	movl	%esi, -64(%rbp)	# scalar, %sfp
.LVL510:
	call	malloc	#
.LVL511:
	.loc 1 183 0
	movq	g_elements(%rip), %r12	# g_elements, D.19716
	.loc 1 182 0
	movq	%rax, %rbx	#, result_obj
.LVL512:
	.loc 1 183 0
	leaq	0(,%r12,4), %rdi	#, D.19719
	call	malloc	#
.LVL513:
.LBE252:
.LBE251:
	.loc 1 957 0
	movq	-56(%rbp), %r11	# %sfp, matrix_obj
.LBB254:
	.loc 1 963 0
	leal	-1(%r12), %r10d	#,
.LBE254:
.LBB255:
.LBB253:
	.loc 1 183 0
	movq	%rax, (%rbx)	# result_cpy, result_obj_96->data
.LVL514:
.LBE253:
.LBE255:
	.loc 1 957 0
	movq	(%r11), %r11	# MEM[(uint32_t * *)matrix_obj_50(D)], matrix
.LVL515:
.LBB256:
	.loc 1 963 0
	testl	%r12d, %r12d	# D.19716
	je	.L279	#,
	movl	-64(%rbp), %esi	# %sfp, scalar
	addq	$1, %r10	#, D.19720
.LVL516:
	xorl	%ecx, %ecx	# ivtmp.663
	xorl	%r9d, %r9d	# sum
	xorl	%edi, %edi	# max
	movl	$-1, %r8d	#, max
.LVL517:
	.p2align 4,,10
	.p2align 3
.L272:
	.loc 1 965 0
	movl	(%r11,%rcx,4), %edx	# MEM[base: matrix_101, index: ivtmp.663_114, step: 4, offset: 0B], max
	addl	%esi, %edx	# scalar, max
	cmpl	%edx, %r8d	# max, max
	movl	%edx, (%rax,%rcx,4)	# max, MEM[base: result_cpy_121, index: ivtmp.663_114, step: 4, offset: 0B]
	cmova	%edx, %r8d	# max,, max, max
.LVL518:
	cmpl	%edx, %edi	# max, max
	cmovb	%edx, %edi	# max,, max, max
.LVL519:
	addq	$1, %rcx	#, ivtmp.663
.LVL520:
	.loc 1 968 0
	addl	%edx, %r9d	# max, sum
.LVL521:
	.loc 1 963 0
	cmpq	%r10, %rcx	# D.19720, ivtmp.663
	jne	.L272	#,
.LVL522:
.L271:
.LBE256:
	.loc 1 972 0
	movq	$0, 24(%rbx)	#, result_obj_96->occurances
.LBE250:
.LBE249:
	.loc 1 1027 0
	movq	%rbx, %rax	# result_obj, D.19714
.LBB259:
.LBB257:
	.loc 1 973 0
	movl	%r8d, 8(%rbx)	# max, result_obj_96->min
	.loc 1 974 0
	movl	%edi, 12(%rbx)	# max, result_obj_96->max
	.loc 1 975 0
	movl	%r9d, 16(%rbx)	# sum, result_obj_96->sum
.LBE257:
.LBE259:
	.loc 1 1082 0
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
.LVL523:
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
.LVL524:
	ret
.LVL525:
	.p2align 4,,10
	.p2align 3
.L270:
	.cfi_restore_state
	movq	%rdi, -72(%rbp)	# matrix_obj, %sfp
.LBB260:
.LBB261:
	.loc 1 182 0
	movl	$32, %edi	#,
.LVL526:
	movl	%esi, -80(%rbp)	# scalar, %sfp
	movq	%rcx, -56(%rbp)	# D.19716, %sfp
	call	malloc	#
.LVL527:
	movq	%rax, %rbx	#, result_obj
.LVL528:
	.loc 1 183 0
	movq	g_elements(%rip), %rax	# g_elements, tmp270
.LVL529:
	leaq	0(,%rax,4), %rdi	#, D.19719
	call	malloc	#
.LVL530:
.LBE261:
.LBE260:
	.loc 1 1032 0
	movq	-56(%rbp), %rcx	# %sfp, D.19716
.LBB263:
.LBB262:
	.loc 1 183 0
	movq	%rbx, -88(%rbp)	# result_obj, %sfp
	movq	%rax, (%rbx)	# tmp182, result_obj_122->data
.LVL531:
.LBE262:
.LBE263:
	.loc 1 1032 0
	leaq	0(,%rcx,8), %rdx	#, D.19718
	leaq	22(%rdx), %rax	#, tmp186
	movq	%rdx, -64(%rbp)	# D.19718, %sfp
	.loc 1 1034 0
	leaq	0(,%rcx,4), %rbx	#, D.19719
.LVL532:
	.loc 1 1032 0
	andq	$-16, %rax	#, tmp190
	subq	%rax, %rsp	# tmp190,
	.loc 1 1034 0
	movq	%rbx, %rdi	# D.19719,
	call	malloc	#
.LVL533:
	.loc 1 1035 0
	movq	%rbx, %rdi	# D.19719,
	.loc 1 1032 0
	movq	%rsp, %r15	#, tmp194
.LVL534:
	.loc 1 1034 0
	movq	%rax, %r12	#, mins
.LVL535:
	.loc 1 1035 0
	call	malloc	#
.LVL536:
	.loc 1 1036 0
	movq	%rbx, %rdi	# D.19719,
	.loc 1 1035 0
	movq	%rax, %r13	#, maxes
.LVL537:
	.loc 1 1036 0
	call	malloc	#
.LVL538:
	.loc 1 1038 0
	movq	-56(%rbp), %rcx	# %sfp, D.19716
	movq	-64(%rbp), %rdx	# %sfp, D.19718
	.loc 1 1036 0
	movq	%rax, %r14	#, sums
.LVL539:
	.loc 1 1038 0
	movq	%rcx, %rdi	# D.19716, tmp200
	salq	$6, %rdi	#, tmp200
	subq	%rdx, %rdi	# D.19718, D.19719
	call	malloc	#
.LVL540:
.LBB264:
	.loc 1 1040 0
	movq	-56(%rbp), %rcx	# %sfp, D.19716
.LBE264:
	.loc 1 1038 0
	movq	%rax, %r11	#, args
	movq	%rax, -96(%rbp)	# args, %sfp
.LVL541:
.LBB267:
	.loc 1 1040 0
	leal	-1(%rcx), %ebx	#, i
.LVL542:
	testl	%ecx, %ecx	# D.19716
	je	.L280	#,
.LVL543:
	movq	g_height(%rip), %rax	# g_height, D.19717
.LVL544:
	movl	%ebx, %r8d	# i, i
	movl	%ebx, -64(%rbp)	# i, %sfp
	xorl	%edi, %edi	# start_row
	movl	-80(%rbp), %esi	# %sfp, scalar
	movq	%r11, %rbx	# args, args
.LVL545:
	movq	-88(%rbp), %r15	# %sfp, result_obj
	movq	-72(%rbp), %r11	# %sfp, matrix_obj
.LVL546:
	movq	%rsp, -72(%rbp)	# tmp194, %sfp
.LVL547:
	cqto
	idivq	%rcx	# D.19716
	movl	%eax, %r10d	# D.19716, D.19722
.LVL548:
	.p2align 4,,10
	.p2align 3
.L275:
.LBB265:
	.loc 1 1042 0
	movl	%r8d, %eax	# i, D.19716
	movq	%rdx, %rcx	# tmp205, D.19716
	.loc 1 1043 0
	leaq	0(,%rax,8), %r9	#, tmp214
	.loc 1 1042 0
	subq	%rax, %rcx	# D.19716, D.19716
	testq	%rcx, %rcx	# D.19716
	setg	%cl	#, D.19721
	.loc 1 1043 0
	salq	$6, %rax	#, tmp215
	subq	%r9, %rax	# tmp214, D.19719
	.loc 1 1042 0
	movzbl	%cl, %ecx	# D.19721, D.19721
	.loc 1 1043 0
	addq	%rbx, %rax	# args, D.19723
	.loc 1 1042 0
	addl	%r10d, %ecx	# D.19722, this_rows
.LVL549:
	.loc 1 1043 0
	movl	%r8d, 52(%rax)	# i, _49->id
.LBE265:
	.loc 1 1040 0
	subl	$1, %r8d	#, i
.LVL550:
.LBB266:
	.loc 1 1043 0
	movl	%edi, 48(%rax)	# start_row, _49->start_row
	.loc 1 1054 0
	addl	%ecx, %edi	# this_rows, start_row
.LVL551:
	.loc 1 1043 0
	movq	%r11, (%rax)	# matrix_obj, _49->matrix_obj
	movq	%r15, 8(%rax)	# result_obj, _49->result_obj
	movq	%r12, 16(%rax)	# mins, _49->mins
	movq	%r13, 24(%rax)	# maxes, _49->maxes
	movq	%r14, 32(%rax)	# sums, _49->sums
	movl	%esi, 40(%rax)	# scalar, _49->scalar
	movl	%ecx, 44(%rax)	# this_rows, _49->num_rows
.LBE266:
	.loc 1 1040 0
	cmpl	$-1, %r8d	#, i
	jne	.L275	#,
	movq	%r12, -56(%rbp)	# mins, %sfp
.LVL552:
	movq	-72(%rbp), %r15	# %sfp, tmp194
	movl	-64(%rbp), %r12d	# %sfp, i
.LVL553:
	.p2align 4,,10
	.p2align 3
.L276:
.LBE267:
.LBB268:
	.loc 1 1059 0
	movl	%r12d, %ecx	# i, D.19719
	xorl	%esi, %esi	#
	movl	$scalar_add_worker, %edx	#,
	leaq	0(,%rcx,8), %rdi	#, tmp218
	salq	$6, %rcx	#, tmp219
	subq	%rdi, %rcx	# tmp218, D.19719
	addq	%r15, %rdi	# tmp194, D.19724
	addq	%rbx, %rcx	# args, D.19723
	call	pthread_create	#
.LVL554:
	.loc 1 1057 0
	testl	%r12d, %r12d	# i
	leal	-1(%r12), %r12d	#, i
.LVL555:
	jne	.L276	#,
	movq	-56(%rbp), %r12	# %sfp, mins
.LVL556:
	movq	%rbx, -96(%rbp)	# args, %sfp
	movl	g_nthreads(%rip), %ecx	# g_nthreads, D.19726
.LVL557:
.L274:
.LBE268:
	.loc 1 1065 0
	movq	-88(%rbp), %rax	# %sfp, result_obj
	subl	$1, %ecx	#, ivtmp.682
	.loc 1 1062 0
	movl	$-1, %r9d	#, min
	.loc 1 1064 0
	xorl	%ebx, %ebx	# sum
	movq	%r13, -72(%rbp)	# maxes, %sfp
	movl	%ecx, %r13d	# ivtmp.682, ivtmp.682
.LVL558:
	movq	%r12, %rcx	# mins, mins
	movq	%r14, -80(%rbp)	# sums, %sfp
.LVL559:
	movl	%r9d, %r14d	# min, min
.LVL560:
	movq	%r15, %r9	# tmp194, tmp194
	movl	%ebx, %r15d	# sum, sum
	.loc 1 1065 0
	movq	$0, 24(%rax)	#, result_obj_122->occurances
.LBB269:
	.loc 1 1067 0
	jmp	.L277	#
.LVL561:
	.p2align 4,,10
	.p2align 3
.L278:
	.loc 1 1069 0
	movl	%r13d, %r12d	# ivtmp.682, D.19719
	xorl	%esi, %esi	#
	movq	%rcx, -64(%rbp)	# mins, %sfp
	movq	(%r9,%r12,8), %rdi	# *_77, *_77
	movq	%r9, -56(%rbp)	# tmp194, %sfp
	call	pthread_join	#
.LVL562:
	.loc 1 1070 0
	movq	-80(%rbp), %rax	# %sfp, sums
	.loc 1 1071 0
	movq	-64(%rbp), %rcx	# %sfp, mins
	movq	-56(%rbp), %r9	# %sfp, tmp194
	.loc 1 1070 0
	addl	(%rax,%r12,4), %r15d	# *_81, sum
.LVL563:
	.loc 1 1071 0
	movl	(%rcx,%r12,4), %eax	# *_84, min
	cmpl	%eax, %r14d	# min, min
	cmova	%eax, %r14d	# min,, min, min
.LVL564:
	.loc 1 1072 0
	movq	-72(%rbp), %rax	# %sfp, maxes
	movl	(%rax,%r12,4), %eax	# *_87, max
	cmpl	%eax, %ebx	# max, max
	cmovb	%eax, %ebx	# max,, max, max
.LVL565:
	subl	$1, %r13d	#, ivtmp.682
.LVL566:
.L277:
	.loc 1 1067 0 discriminator 1
	cmpl	$-1, %r13d	#, ivtmp.682
	jne	.L278	#,
	movl	%ebx, %r8d	# max, max
	movl	%r15d, %ebx	# sum, sum
.LVL567:
.LBE269:
	.loc 1 1075 0
	movq	-88(%rbp), %r15	# %sfp, result_obj
.LVL568:
	.loc 1 1079 0
	movq	-96(%rbp), %rdi	# %sfp,
	.loc 1 1075 0
	movq	%r15, %rax	# result_obj, result_obj
	movl	%r14d, 8(%rax)	# min, result_obj_122->min
	.loc 1 1077 0
	movl	%ebx, 16(%r15)	# sum, result_obj_122->sum
	.loc 1 1076 0
	movl	%r8d, 12(%r15)	# max, result_obj_122->max
	.loc 1 1079 0
	call	free	#
.LVL569:
	.loc 1 1082 0
	leaq	-40(%rbp), %rsp	#,
.LVL570:
	.loc 1 1081 0
	movq	%r15, %rax	# result_obj, D.19714
	.loc 1 1082 0
	popq	%rbx	#
.LVL571:
	popq	%r12	#
	popq	%r13	#
.LVL572:
	popq	%r14	#
.LVL573:
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL574:
.L279:
	.cfi_restore_state
.LBB270:
.LBB258:
	.loc 1 961 0
	xorl	%r9d, %r9d	# sum
	.loc 1 960 0
	xorl	%edi, %edi	# max
	.loc 1 959 0
	movl	$-1, %r8d	#, max
	jmp	.L271	#
.LVL575:
.L280:
.LBE258:
.LBE270:
.LBB271:
	.loc 1 1040 0
	xorl	%ecx, %ecx	# D.19726
	jmp	.L274	#
.LBE271:
	.cfi_endproc
.LFE2287:
	.size	scalar_add, .-scalar_add
	.section	.text.unlikely
.LCOLDE30:
	.text
.LHOTE30:
	.section	.text.unlikely
.LCOLDB31:
	.text
.LHOTB31:
	.p2align 4,,15
	.globl	scalar_mul
	.type	scalar_mul, @function
scalar_mul:
.LFB2289:
	.loc 1 1131 0
	.cfi_startproc
.LVL576:
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	subq	$56, %rsp	#,
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	.loc 1 1131 0
	movq	%rdi, -80(%rbp)	# matrix_obj, %sfp
.LBB278:
.LBB279:
	.loc 1 182 0
	movl	$32, %edi	#,
.LVL577:
.LBE279:
.LBE278:
	.loc 1 1131 0
	movl	%esi, -72(%rbp)	# scalar, %sfp
.LBB282:
.LBB280:
	.loc 1 182 0
	call	malloc	#
.LVL578:
	movq	%rax, %rbx	#, result_obj
.LVL579:
	.loc 1 183 0
	movq	g_elements(%rip), %rax	# g_elements, tmp236
.LVL580:
	leaq	0(,%rax,4), %rdi	#, D.19770
	call	malloc	#
.LVL581:
.LBE280:
.LBE282:
	.loc 1 1134 0
	movq	g_nthreads(%rip), %rcx	# g_nthreads, D.19768
.LBB283:
.LBB281:
	.loc 1 183 0
	movq	%rbx, -88(%rbp)	# result_obj, %sfp
	movq	%rax, (%rbx)	# tmp158, result_obj_93->data
.LVL582:
.LBE281:
.LBE283:
	.loc 1 1134 0
	leaq	0(,%rcx,8), %rdx	#, D.19769
	.loc 1 1136 0
	movq	%rcx, -56(%rbp)	# D.19768, %sfp
	.loc 1 1134 0
	leaq	22(%rdx), %rax	#, tmp162
	movq	%rdx, -64(%rbp)	# D.19769, %sfp
	.loc 1 1136 0
	leaq	0(,%rcx,4), %rbx	#, D.19770
.LVL583:
	.loc 1 1134 0
	andq	$-16, %rax	#, tmp166
	subq	%rax, %rsp	# tmp166,
	.loc 1 1136 0
	movq	%rbx, %rdi	# D.19770,
	call	malloc	#
.LVL584:
	.loc 1 1137 0
	movq	%rbx, %rdi	# D.19770,
	.loc 1 1134 0
	movq	%rsp, %r15	#, tmp170
.LVL585:
	.loc 1 1136 0
	movq	%rax, %r12	#, mins
.LVL586:
	.loc 1 1137 0
	call	malloc	#
.LVL587:
	.loc 1 1138 0
	movq	%rbx, %rdi	# D.19770,
	.loc 1 1137 0
	movq	%rax, %r13	#, maxes
.LVL588:
	.loc 1 1138 0
	call	malloc	#
.LVL589:
	.loc 1 1140 0
	movq	-56(%rbp), %rcx	# %sfp, D.19768
	movq	-64(%rbp), %rdx	# %sfp, D.19769
	.loc 1 1138 0
	movq	%rax, %r14	#, sums
.LVL590:
	.loc 1 1140 0
	movq	%rcx, %rdi	# D.19768, tmp176
	salq	$6, %rdi	#, tmp176
	subq	%rdx, %rdi	# D.19769, D.19770
	call	malloc	#
.LVL591:
.LBB284:
	.loc 1 1142 0
	movq	-56(%rbp), %rcx	# %sfp, D.19768
.LBE284:
	.loc 1 1140 0
	movq	%rax, %rsi	#, args
	movq	%rax, -96(%rbp)	# args, %sfp
.LVL592:
.LBB287:
	.loc 1 1142 0
	leal	-1(%rcx), %ebx	#, i
.LVL593:
	testl	%ecx, %ecx	# D.19768
	je	.L295	#,
.LVL594:
	movq	g_height(%rip), %rax	# g_height, D.19776
.LVL595:
	movl	%ebx, %r8d	# i, i
	movl	%ebx, -64(%rbp)	# i, %sfp
	xorl	%edi, %edi	# start_row
	movq	-80(%rbp), %r11	# %sfp, matrix_obj
	movq	%rsi, %rbx	# args, args
.LVL596:
	movq	-88(%rbp), %r15	# %sfp, result_obj
	movl	-72(%rbp), %esi	# %sfp, scalar
.LVL597:
	movq	%rsp, -72(%rbp)	# tmp170, %sfp
.LVL598:
	cqto
	idivq	%rcx	# D.19768
	movl	%eax, %r10d	# D.19768, D.19772
.LVL599:
	.p2align 4,,10
	.p2align 3
.L291:
.LBB285:
	.loc 1 1144 0
	movl	%r8d, %eax	# i, D.19768
	movq	%rdx, %rcx	# tmp181, D.19768
	.loc 1 1145 0
	leaq	0(,%rax,8), %r9	#, tmp190
	.loc 1 1144 0
	subq	%rax, %rcx	# D.19768, D.19768
	testq	%rcx, %rcx	# D.19768
	setg	%cl	#, D.19771
	.loc 1 1145 0
	salq	$6, %rax	#, tmp191
	subq	%r9, %rax	# tmp190, D.19770
	.loc 1 1144 0
	movzbl	%cl, %ecx	# D.19771, D.19771
	.loc 1 1145 0
	addq	%rbx, %rax	# args, D.19773
	.loc 1 1144 0
	addl	%r10d, %ecx	# D.19772, this_rows
.LVL600:
	.loc 1 1145 0
	movl	%r8d, 52(%rax)	# i, _45->id
.LBE285:
	.loc 1 1142 0
	subl	$1, %r8d	#, i
.LVL601:
.LBB286:
	.loc 1 1145 0
	movl	%edi, 48(%rax)	# start_row, _45->start_row
	.loc 1 1156 0
	addl	%ecx, %edi	# this_rows, start_row
.LVL602:
	.loc 1 1145 0
	movq	%r11, (%rax)	# matrix_obj, _45->matrix_obj
	movq	%r15, 8(%rax)	# result_obj, _45->result_obj
	movq	%r12, 16(%rax)	# mins, _45->mins
	movq	%r13, 24(%rax)	# maxes, _45->maxes
	movq	%r14, 32(%rax)	# sums, _45->sums
	movl	%esi, 40(%rax)	# scalar, _45->scalar
	movl	%ecx, 44(%rax)	# this_rows, _45->num_rows
.LBE286:
	.loc 1 1142 0
	cmpl	$-1, %r8d	#, i
	jne	.L291	#,
	movq	%r12, -56(%rbp)	# mins, %sfp
.LVL603:
	movq	-72(%rbp), %r15	# %sfp, tmp170
	movl	-64(%rbp), %r12d	# %sfp, i
.LVL604:
	.p2align 4,,10
	.p2align 3
.L292:
.LBE287:
.LBB288:
	.loc 1 1161 0
	movl	%r12d, %ecx	# i, D.19770
	xorl	%esi, %esi	#
	movl	$scalar_mul_worker, %edx	#,
	leaq	0(,%rcx,8), %rdi	#, tmp194
	salq	$6, %rcx	#, tmp195
	subq	%rdi, %rcx	# tmp194, D.19770
	addq	%r15, %rdi	# tmp170, D.19774
	addq	%rbx, %rcx	# args, D.19773
	call	pthread_create	#
.LVL605:
	.loc 1 1159 0
	testl	%r12d, %r12d	# i
	leal	-1(%r12), %r12d	#, i
.LVL606:
	jne	.L292	#,
	movq	-56(%rbp), %r12	# %sfp, mins
.LVL607:
	movq	%rbx, -96(%rbp)	# args, %sfp
	movl	g_nthreads(%rip), %ecx	# g_nthreads, D.19777
.LVL608:
.L290:
.LBE288:
	.loc 1 1168 0
	movq	-88(%rbp), %rax	# %sfp, result_obj
	subl	$1, %ecx	#, ivtmp.706
	.loc 1 1164 0
	movl	$-1, %r9d	#, min
	.loc 1 1166 0
	xorl	%ebx, %ebx	# sum
	movq	%r13, -72(%rbp)	# maxes, %sfp
	movl	%ecx, %r13d	# ivtmp.706, ivtmp.706
.LVL609:
	movq	%r12, %rcx	# mins, mins
	movq	%r14, -80(%rbp)	# sums, %sfp
.LVL610:
	movl	%r9d, %r14d	# min, min
.LVL611:
	movq	%r15, %r9	# tmp170, tmp170
	movl	%ebx, %r15d	# sum, sum
	.loc 1 1168 0
	movq	$0, 24(%rax)	#, result_obj_93->occurances
.LBB289:
	.loc 1 1170 0
	jmp	.L293	#
.LVL612:
	.p2align 4,,10
	.p2align 3
.L294:
	.loc 1 1172 0
	movl	%r13d, %r12d	# ivtmp.706, D.19770
	xorl	%esi, %esi	#
	movq	%rcx, -64(%rbp)	# mins, %sfp
	movq	(%r9,%r12,8), %rdi	# *_73, *_73
	movq	%r9, -56(%rbp)	# tmp170, %sfp
	call	pthread_join	#
.LVL613:
	.loc 1 1173 0
	movq	-80(%rbp), %rax	# %sfp, sums
	.loc 1 1174 0
	movq	-64(%rbp), %rcx	# %sfp, mins
	movq	-56(%rbp), %r9	# %sfp, tmp170
	.loc 1 1173 0
	addl	(%rax,%r12,4), %r15d	# *_77, sum
.LVL614:
	.loc 1 1174 0
	movl	(%rcx,%r12,4), %eax	# *_80, min
	cmpl	%eax, %r14d	# min, min
	cmova	%eax, %r14d	# min,, min, min
.LVL615:
	.loc 1 1175 0
	movq	-72(%rbp), %rax	# %sfp, maxes
	movl	(%rax,%r12,4), %eax	# *_82, max
	cmpl	%eax, %ebx	# max, max
	cmovb	%eax, %ebx	# max,, max, max
.LVL616:
	subl	$1, %r13d	#, ivtmp.706
.LVL617:
.L293:
	.loc 1 1170 0 discriminator 1
	cmpl	$-1, %r13d	#, ivtmp.706
	jne	.L294	#,
	movl	%ebx, %r8d	# max, max
	movl	%r15d, %ebx	# sum, sum
.LVL618:
.LBE289:
	.loc 1 1178 0
	movq	-88(%rbp), %r15	# %sfp, result_obj
.LVL619:
	.loc 1 1182 0
	movq	-96(%rbp), %rdi	# %sfp,
	.loc 1 1178 0
	movq	%r15, %rax	# result_obj, result_obj
	movl	%r14d, 8(%rax)	# min, result_obj_93->min
	.loc 1 1180 0
	movl	%ebx, 16(%r15)	# sum, result_obj_93->sum
	.loc 1 1179 0
	movl	%r8d, 12(%r15)	# max, result_obj_93->max
	.loc 1 1182 0
	call	free	#
.LVL620:
	.loc 1 1185 0
	leaq	-40(%rbp), %rsp	#,
.LVL621:
	movq	%r15, %rax	# result_obj,
	popq	%rbx	#
.LVL622:
	popq	%r12	#
	popq	%r13	#
.LVL623:
	popq	%r14	#
.LVL624:
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
.LVL625:
	ret
.LVL626:
.L295:
	.cfi_restore_state
.LBB290:
	.loc 1 1142 0
	xorl	%ecx, %ecx	# D.19777
	jmp	.L290	#
.LBE290:
	.cfi_endproc
.LFE2289:
	.size	scalar_mul, .-scalar_mul
	.section	.text.unlikely
.LCOLDE31:
	.text
.LHOTE31:
	.section	.text.unlikely
.LCOLDB32:
	.text
.LHOTB32:
	.p2align 4,,15
	.globl	matrix_add
	.type	matrix_add, @function
matrix_add:
.LFB2291:
	.loc 1 1235 0
	.cfi_startproc
.LVL627:
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	subq	$56, %rsp	#,
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	.loc 1 1235 0
	movq	%rdi, -80(%rbp)	# matrix_a_obj, %sfp
.LBB297:
.LBB298:
	.loc 1 182 0
	movl	$32, %edi	#,
.LVL628:
.LBE298:
.LBE297:
	.loc 1 1235 0
	movq	%rsi, -72(%rbp)	# matrix_b_obj, %sfp
.LBB301:
.LBB299:
	.loc 1 182 0
	call	malloc	#
.LVL629:
	movq	%rax, %rbx	#, result_obj
	movq	%rax, -96(%rbp)	# result_obj, %sfp
.LVL630:
	.loc 1 183 0
	movq	g_elements(%rip), %rax	# g_elements, tmp200
.LVL631:
	leaq	0(,%rax,4), %rdi	#, D.19821
	call	malloc	#
.LVL632:
.LBE299:
.LBE301:
	.loc 1 1238 0
	movq	g_nthreads(%rip), %rcx	# g_nthreads, D.19819
.LBB302:
.LBB300:
	.loc 1 183 0
	movq	%rax, (%rbx)	# tmp158, result_obj_93->data
.LVL633:
.LBE300:
.LBE302:
	.loc 1 1238 0
	leaq	22(,%rcx,8), %rax	#, tmp162
	.loc 1 1240 0
	movq	%rcx, -56(%rbp)	# D.19819, %sfp
	leaq	0(,%rcx,4), %rbx	#, D.19821
.LVL634:
	.loc 1 1238 0
	andq	$-16, %rax	#, tmp166
	subq	%rax, %rsp	# tmp166,
	.loc 1 1240 0
	movq	%rbx, %rdi	# D.19821,
	call	malloc	#
.LVL635:
	.loc 1 1241 0
	movq	%rbx, %rdi	# D.19821,
	.loc 1 1238 0
	movq	%rsp, %r15	#, tmp170
.LVL636:
	.loc 1 1240 0
	movq	%rax, %r12	#, mins
.LVL637:
	.loc 1 1241 0
	call	malloc	#
.LVL638:
	.loc 1 1242 0
	movq	%rbx, %rdi	# D.19821,
	.loc 1 1241 0
	movq	%rax, %r13	#, maxes
.LVL639:
	.loc 1 1242 0
	call	malloc	#
.LVL640:
	.loc 1 1244 0
	movq	-56(%rbp), %rcx	# %sfp, D.19819
	.loc 1 1242 0
	movq	%rax, %r14	#, sums
.LVL641:
	.loc 1 1244 0
	movq	%rcx, %rdi	# D.19819, D.19821
	movq	%rcx, -64(%rbp)	# D.19819, %sfp
	salq	$6, %rdi	#, D.19821
	call	malloc	#
.LVL642:
.LBB303:
	.loc 1 1246 0
	movq	-64(%rbp), %rcx	# %sfp, D.19819
.LBE303:
	.loc 1 1244 0
	movq	%rax, -56(%rbp)	#, %sfp
.LVL643:
.LBB306:
	.loc 1 1246 0
	leal	-1(%rcx), %ebx	#, i
.LVL644:
	testl	%ecx, %ecx	# D.19819
	je	.L305	#,
.LVL645:
	movq	g_height(%rip), %rax	# g_height, D.19827
.LVL646:
	movl	%ebx, %r8d	# i, i
	xorl	%edi, %edi	# start_row
	movq	-80(%rbp), %r11	# %sfp, matrix_a_obj
	movq	-72(%rbp), %rsi	# %sfp, matrix_b_obj
	cqto
	idivq	%rcx	# D.19819
.LVL647:
	.p2align 4,,10
	.p2align 3
.L301:
.LBB304:
	.loc 1 1248 0
	movl	%r8d, %ecx	# i, D.19819
	movq	%rdx, %r9	# tmp178, D.19819
	.loc 1 1249 0
	movq	-96(%rbp), %r10	# %sfp, result_obj
	.loc 1 1248 0
	subq	%rcx, %r9	# D.19819, D.19819
	testq	%r9, %r9	# D.19819
	setg	%r9b	#, D.19822
	.loc 1 1249 0
	salq	$6, %rcx	#, D.19821
	addq	-56(%rbp), %rcx	# %sfp, D.19824
	.loc 1 1248 0
	movzbl	%r9b, %r9d	# D.19822, D.19822
	addl	%eax, %r9d	# D.19823, this_rows
.LVL648:
	.loc 1 1249 0
	movl	%r8d, 56(%rcx)	# i, _45->id
.LBE304:
	.loc 1 1246 0
	subl	$1, %r8d	#, i
.LVL649:
.LBB305:
	.loc 1 1249 0
	movl	%edi, 52(%rcx)	# start_row, _45->start_row
	.loc 1 1261 0
	addl	%r9d, %edi	# this_rows, start_row
.LVL650:
	.loc 1 1249 0
	movq	%r11, (%rcx)	# matrix_a_obj, _45->matrix_a_obj
	movq	%rsi, 8(%rcx)	# matrix_b_obj, _45->matrix_b_obj
	movq	%r10, 16(%rcx)	# result_obj, _45->result_obj
	movq	%r12, 24(%rcx)	# mins, _45->mins
	movq	%r13, 32(%rcx)	# maxes, _45->maxes
	movq	%r14, 40(%rcx)	# sums, _45->sums
	movl	%r9d, 48(%rcx)	# this_rows, _45->num_rows
.LBE305:
	.loc 1 1246 0
	cmpl	$-1, %r8d	#, i
	jne	.L301	#,
.LVL651:
	.p2align 4,,10
	.p2align 3
.L302:
.LBE306:
.LBB307:
	.loc 1 1266 0
	movl	%ebx, %eax	# i, D.19821
	xorl	%esi, %esi	#
	movl	$matrix_add_worker, %edx	#,
	leaq	(%r15,%rax,8), %rdi	#, D.19825
	movq	%rax, %rcx	# D.19821, D.19821
	salq	$6, %rcx	#, D.19821
	addq	-56(%rbp), %rcx	# %sfp, D.19824
	call	pthread_create	#
.LVL652:
	.loc 1 1264 0
	testl	%ebx, %ebx	# i
	leal	-1(%rbx), %ebx	#, i
.LVL653:
	jne	.L302	#,
	movl	g_nthreads(%rip), %ecx	# g_nthreads, D.19828
.LVL654:
.L300:
.LBE307:
	.loc 1 1273 0
	movq	-96(%rbp), %rax	# %sfp, result_obj
	subl	$1, %ecx	#, ivtmp.730
	.loc 1 1271 0
	xorl	%ebx, %ebx	# sum
	.loc 1 1270 0
	xorl	%r8d, %r8d	# max
	.loc 1 1269 0
	movl	$-1, %r9d	#, min
	.loc 1 1273 0
	movq	$0, 24(%rax)	#, result_obj_93->occurances
.LBB308:
	.loc 1 1275 0
	jmp	.L303	#
.LVL655:
	.p2align 4,,10
	.p2align 3
.L304:
	.loc 1 1277 0
	movl	%ecx, %edx	# ivtmp.730, D.19821
	xorl	%esi, %esi	#
	movl	%r8d, -84(%rbp)	# max, %sfp
	movq	(%r15,%rdx,8), %rdi	# *_73, *_73
	movl	%r9d, -80(%rbp)	# min, %sfp
	movl	%ecx, -72(%rbp)	# ivtmp.730, %sfp
	movq	%rdx, -64(%rbp)	# D.19821, %sfp
	call	pthread_join	#
.LVL656:
	.loc 1 1278 0
	movq	-64(%rbp), %rdx	# %sfp, D.19821
	movl	-80(%rbp), %r9d	# %sfp, min
	movl	-84(%rbp), %r8d	# %sfp, max
	movl	-72(%rbp), %ecx	# %sfp, ivtmp.730
	.loc 1 1279 0
	movl	(%r12,%rdx,4), %eax	# *_80, min
	.loc 1 1278 0
	addl	(%r14,%rdx,4), %ebx	# *_77, sum
.LVL657:
	cmpl	%eax, %r9d	# min, min
	cmova	%eax, %r9d	# min,, min, min
.LVL658:
	.loc 1 1280 0
	movl	0(%r13,%rdx,4), %eax	# *_82, max
	cmpl	%eax, %r8d	# max, max
	cmovb	%eax, %r8d	# max,, max, max
	subl	$1, %ecx	#, ivtmp.730
.LVL659:
.L303:
	.loc 1 1275 0 discriminator 1
	cmpl	$-1, %ecx	#, ivtmp.730
	jne	.L304	#,
.LBE308:
	.loc 1 1283 0
	movq	-96(%rbp), %r14	# %sfp, result_obj
.LVL660:
	.loc 1 1287 0
	movq	-56(%rbp), %rdi	# %sfp,
	.loc 1 1285 0
	movl	%ebx, 16(%r14)	# sum, result_obj_93->sum
	.loc 1 1283 0
	movl	%r9d, 8(%r14)	# min, result_obj_93->min
	.loc 1 1284 0
	movl	%r8d, 12(%r14)	# max, result_obj_93->max
	.loc 1 1287 0
	call	free	#
.LVL661:
	.loc 1 1290 0
	leaq	-40(%rbp), %rsp	#,
.LVL662:
	movq	%r14, %rax	# result_obj,
	popq	%rbx	#
.LVL663:
	popq	%r12	#
.LVL664:
	popq	%r13	#
.LVL665:
	popq	%r14	#
	popq	%r15	#
.LVL666:
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
.LVL667:
	ret
.LVL668:
.L305:
	.cfi_restore_state
.LBB309:
	.loc 1 1246 0
	xorl	%ecx, %ecx	# D.19828
	jmp	.L300	#
.LBE309:
	.cfi_endproc
.LFE2291:
	.size	matrix_add, .-matrix_add
	.section	.text.unlikely
.LCOLDE32:
	.text
.LHOTE32:
	.section	.text.unlikely
.LCOLDB33:
	.text
.LHOTB33:
	.p2align 4,,15
	.globl	matrix_mul
	.type	matrix_mul, @function
matrix_mul:
.LFB2293:
	.loc 1 1357 0
	.cfi_startproc
.LVL669:
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rsi, %rbx	# matrix_b_obj, matrix_b_obj
	subq	$56, %rsp	#,
	.loc 1 1357 0
	movq	%rdi, -80(%rbp)	# matrix_a_obj, %sfp
.LBB316:
.LBB317:
	.loc 1 182 0
	movl	$32, %edi	#,
.LVL670:
	call	malloc	#
.LVL671:
	movq	%rax, %r15	#, result_obj
	movq	%rax, -96(%rbp)	# result_obj, %sfp
.LVL672:
	.loc 1 183 0
	movq	g_elements(%rip), %rax	# g_elements, tmp201
.LVL673:
	leaq	0(,%rax,4), %rdi	#, D.19871
	call	malloc	#
.LVL674:
.LBE317:
.LBE316:
	.loc 1 1359 0
	movq	%rbx, %rdi	# matrix_b_obj,
.LBB319:
.LBB318:
	.loc 1 183 0
	movq	%rax, (%r15)	# tmp159, result_obj_95->data
.LBE318:
.LBE319:
	.loc 1 1359 0
	call	transposed	#
.LVL675:
	.loc 1 1361 0
	movq	g_nthreads(%rip), %rcx	# g_nthreads, D.19870
	.loc 1 1359 0
	movq	%rax, -72(%rbp)	# matrix_b_t_obj, %sfp
.LVL676:
	.loc 1 1361 0
	leaq	0(,%rcx,4), %rbx	#, D.19871
.LVL677:
	movq	%rcx, -56(%rbp)	# D.19870, %sfp
	movq	%rbx, %rdi	# D.19871,
	call	malloc	#
.LVL678:
	.loc 1 1362 0
	movq	%rbx, %rdi	# D.19871,
	.loc 1 1361 0
	movq	%rax, %r12	#, mins
.LVL679:
	.loc 1 1362 0
	call	malloc	#
.LVL680:
	.loc 1 1363 0
	movq	%rbx, %rdi	# D.19871,
	.loc 1 1362 0
	movq	%rax, %r13	#, maxes
.LVL681:
	.loc 1 1363 0
	call	malloc	#
.LVL682:
	.loc 1 1365 0
	movq	-56(%rbp), %rcx	# %sfp, D.19870
	.loc 1 1363 0
	movq	%rax, %r14	#, sums
.LVL683:
	.loc 1 1365 0
	leaq	22(,%rcx,8), %rax	#, tmp166
.LVL684:
	.loc 1 1367 0
	movq	%rcx, %rdi	# D.19870, D.19871
	movq	%rcx, -64(%rbp)	# D.19870, %sfp
	.loc 1 1365 0
	andq	$-16, %rax	#, tmp170
	.loc 1 1367 0
	salq	$6, %rdi	#, D.19871
	.loc 1 1365 0
	subq	%rax, %rsp	# tmp170,
	.loc 1 1367 0
	call	malloc	#
.LVL685:
.LBB320:
	.loc 1 1369 0
	movq	-64(%rbp), %rcx	# %sfp, D.19870
.LBE320:
	.loc 1 1365 0
	movq	%rsp, %r15	#, tmp174
.LVL686:
	.loc 1 1367 0
	movq	%rax, -56(%rbp)	#, %sfp
.LVL687:
.LBB323:
	.loc 1 1369 0
	leal	-1(%rcx), %ebx	#, i
.LVL688:
	testl	%ecx, %ecx	# D.19870
	je	.L315	#,
.LVL689:
	movq	g_height(%rip), %rax	# g_height, D.19878
.LVL690:
	movl	%ebx, %esi	# i, i
	xorl	%edi, %edi	# start_row
	movq	-80(%rbp), %r10	# %sfp, matrix_a_obj
	movq	-72(%rbp), %r11	# %sfp, matrix_b_t_obj
	cqto
	idivq	%rcx	# D.19870
.LVL691:
	.p2align 4,,10
	.p2align 3
.L311:
.LBB321:
	.loc 1 1371 0
	movl	%esi, %ecx	# i, D.19870
	movq	%rdx, %r8	# tmp179, D.19870
	.loc 1 1372 0
	movq	-96(%rbp), %r9	# %sfp, result_obj
	.loc 1 1371 0
	subq	%rcx, %r8	# D.19870, D.19870
	testq	%r8, %r8	# D.19870
	setg	%r8b	#, D.19873
	.loc 1 1372 0
	salq	$6, %rcx	#, D.19871
	addq	-56(%rbp), %rcx	# %sfp, D.19875
	.loc 1 1371 0
	movzbl	%r8b, %r8d	# D.19873, D.19873
	addl	%eax, %r8d	# D.19874, this_rows
.LVL692:
	.loc 1 1372 0
	movl	%esi, 56(%rcx)	# i, _48->id
.LBE321:
	.loc 1 1369 0
	subl	$1, %esi	#, i
.LVL693:
.LBB322:
	.loc 1 1372 0
	movl	%edi, 52(%rcx)	# start_row, _48->start_row
	.loc 1 1383 0
	addl	%r8d, %edi	# this_rows, start_row
.LVL694:
	.loc 1 1372 0
	movq	%r10, (%rcx)	# matrix_a_obj, _48->matrix_a_obj
	movq	%r11, 8(%rcx)	# matrix_b_t_obj, _48->matrix_b_obj
	movq	%r9, 16(%rcx)	# result_obj, _48->result_obj
	movq	%r12, 24(%rcx)	# mins, _48->mins
	movq	%r13, 32(%rcx)	# maxes, _48->maxes
	movq	%r14, 40(%rcx)	# sums, _48->sums
	movl	%r8d, 48(%rcx)	# this_rows, _48->num_rows
.LBE322:
	.loc 1 1369 0
	cmpl	$-1, %esi	#, i
	jne	.L311	#,
.LVL695:
	.p2align 4,,10
	.p2align 3
.L312:
.LBE323:
.LBB324:
	.loc 1 1388 0
	movl	%ebx, %eax	# i, D.19871
	xorl	%esi, %esi	#
	movl	$matrix_mul_worker, %edx	#,
	leaq	(%r15,%rax,8), %rdi	#, D.19876
	movq	%rax, %rcx	# D.19871, D.19871
	salq	$6, %rcx	#, D.19871
	addq	-56(%rbp), %rcx	# %sfp, D.19875
	call	pthread_create	#
.LVL696:
	.loc 1 1386 0
	testl	%ebx, %ebx	# i
	leal	-1(%rbx), %ebx	#, i
.LVL697:
	jne	.L312	#,
	movl	g_nthreads(%rip), %ecx	# g_nthreads, D.19879
.LVL698:
.L310:
.LBE324:
	.loc 1 1395 0
	movq	-96(%rbp), %rax	# %sfp, result_obj
	subl	$1, %ecx	#, ivtmp.754
	.loc 1 1393 0
	xorl	%ebx, %ebx	# sum
	.loc 1 1392 0
	xorl	%r8d, %r8d	# max
	.loc 1 1391 0
	movl	$-1, %r9d	#, min
	.loc 1 1395 0
	movq	$0, 24(%rax)	#, result_obj_95->occurances
.LBB325:
	.loc 1 1397 0
	jmp	.L313	#
.LVL699:
	.p2align 4,,10
	.p2align 3
.L314:
	.loc 1 1399 0
	movl	%ecx, %edx	# ivtmp.754, D.19871
	xorl	%esi, %esi	#
	movl	%r8d, -84(%rbp)	# max, %sfp
	movq	(%r15,%rdx,8), %rdi	# *_75, *_75
	movl	%r9d, -80(%rbp)	# min, %sfp
	movl	%ecx, -72(%rbp)	# ivtmp.754, %sfp
	movq	%rdx, -64(%rbp)	# D.19871, %sfp
	call	pthread_join	#
.LVL700:
	.loc 1 1400 0
	movq	-64(%rbp), %rdx	# %sfp, D.19871
	movl	-80(%rbp), %r9d	# %sfp, min
	movl	-84(%rbp), %r8d	# %sfp, max
	movl	-72(%rbp), %ecx	# %sfp, ivtmp.754
	.loc 1 1401 0
	movl	(%r12,%rdx,4), %eax	# *_82, min
	.loc 1 1400 0
	addl	(%r14,%rdx,4), %ebx	# *_79, sum
.LVL701:
	cmpl	%eax, %r9d	# min, min
	cmova	%eax, %r9d	# min,, min, min
.LVL702:
	.loc 1 1402 0
	movl	0(%r13,%rdx,4), %eax	# *_84, max
	cmpl	%eax, %r8d	# max, max
	cmovb	%eax, %r8d	# max,, max, max
	subl	$1, %ecx	#, ivtmp.754
.LVL703:
.L313:
	.loc 1 1397 0 discriminator 1
	cmpl	$-1, %ecx	#, ivtmp.754
	jne	.L314	#,
.LBE325:
	.loc 1 1405 0
	movq	-96(%rbp), %r14	# %sfp, result_obj
.LVL704:
	.loc 1 1409 0
	movq	-56(%rbp), %rdi	# %sfp,
	.loc 1 1407 0
	movl	%ebx, 16(%r14)	# sum, result_obj_95->sum
	.loc 1 1405 0
	movl	%r9d, 8(%r14)	# min, result_obj_95->min
	.loc 1 1406 0
	movl	%r8d, 12(%r14)	# max, result_obj_95->max
	.loc 1 1409 0
	call	free	#
.LVL705:
	.loc 1 1413 0
	leaq	-40(%rbp), %rsp	#,
.LVL706:
	movq	%r14, %rax	# result_obj,
	popq	%rbx	#
.LVL707:
	popq	%r12	#
.LVL708:
	popq	%r13	#
.LVL709:
	popq	%r14	#
	popq	%r15	#
.LVL710:
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
.LVL711:
	ret
.LVL712:
.L315:
	.cfi_restore_state
.LBB326:
	.loc 1 1369 0
	xorl	%ecx, %ecx	# D.19879
	jmp	.L310	#
.LBE326:
	.cfi_endproc
.LFE2293:
	.size	matrix_mul, .-matrix_mul
	.section	.text.unlikely
.LCOLDE33:
	.text
.LHOTE33:
	.section	.text.unlikely
.LCOLDB34:
	.text
.LHOTB34:
	.p2align 4,,15
	.type	m_pow, @function
m_pow:
.LFB2296:
	.loc 1 1447 0
	.cfi_startproc
.LVL713:
	movq	%rdi, %rax	# matrix_obj, D.19908
	.loc 1 1448 0
	cmpl	$1, %esi	#, exponent
	je	.L337	#,
	.loc 1 1447 0
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%esi, %r12d	# exponent, exponent
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp	# matrix_obj, matrix_obj
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 48
.LBB362:
	.loc 1 1454 0
	call	identity_matrix	#
.LVL714:
	.loc 1 1455 0
	movq	0(%rbp), %rdi	# matrix_obj_5(D)->data,
	.loc 1 1454 0
	movq	%rax, %rbx	#, identity_obj
.LVL715:
	.loc 1 1455 0
	movq	g_elements(%rip), %rax	# g_elements, tmp167
.LVL716:
	movq	(%rbx), %rsi	# identity_obj_8->data,
	leaq	0(,%rax,4), %rdx	#, D.19910
	call	memcmp	#
.LVL717:
	movl	%eax, %edx	#, tmp131
	movq	%rbx, %rax	# identity_obj, D.19908
	testl	%edx, %edx	# tmp131
	jne	.L340	#,
.LBE362:
	.loc 1 1479 0
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 40
	popq	%rbx	#
	.cfi_restore 3
	.cfi_def_cfa_offset 32
.LVL718:
	popq	%rbp	#
	.cfi_restore 6
	.cfi_def_cfa_offset 24
.LVL719:
	popq	%r12	#
	.cfi_restore 12
	.cfi_def_cfa_offset 16
.LVL720:
	popq	%r13	#
	.cfi_restore 13
	.cfi_def_cfa_offset 8
.LVL721:
.L337:
	ret
.LVL722:
	.p2align 4,,10
	.p2align 3
.L340:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -40
	.cfi_offset 6, -32
	.cfi_offset 12, -24
	.cfi_offset 13, -16
.LBB393:
	.loc 1 1459 0
	movl	%r12d, %r13d	# exponent, D.19913
.LBB363:
.LBB364:
	.loc 1 1448 0
	movq	%rbp, %rdi	# matrix_obj, D.19908
.LBE364:
.LBE363:
	.loc 1 1459 0
	shrl	%r13d	# D.19913
.LVL723:
.LBB381:
.LBB379:
	.loc 1 1448 0
	cmpl	$1, %r13d	#, D.19913
	je	.L321	#,
.LVL724:
.LBB365:
	.loc 1 1454 0
	call	identity_matrix	#
.LVL725:
	.loc 1 1455 0
	movq	0(%rbp), %rdi	# matrix_obj_5(D)->data,
	.loc 1 1454 0
	movq	%rax, %rbx	#, identity_obj
.LVL726:
	.loc 1 1455 0
	movq	g_elements(%rip), %rax	# g_elements, tmp169
.LVL727:
	movq	(%rbx), %rsi	# identity_obj_41->data,
	leaq	0(,%rax,4), %rdx	#, D.19910
	call	memcmp	#
.LVL728:
	movq	%rbx, %rdi	# identity_obj, D.19908
	testl	%eax, %eax	# tmp135
	jne	.L341	#,
.LVL729:
.L322:
.LBE365:
.LBE379:
.LBE381:
	.loc 1 1460 0
	cmpq	%rdi, %rbp	# D.19908, matrix_obj
	je	.L321	#,
.LBB382:
.LBB383:
	.loc 1 1421 0
	movl	rubbish_counter(%rip), %eax	# rubbish_counter,
	leal	1(%rax), %edx	#, tmp151
	movq	%rdi, pow_rubbish(,%rax,8)	# D.19908, pow_rubbish
	movl	%edx, rubbish_counter(%rip)	# tmp151, rubbish_counter
.LVL730:
.L321:
.LBE383:
.LBE382:
	.loc 1 1464 0
	andl	$1, %r12d	#, exponent
.LVL731:
.LBB384:
	.loc 1 1466 0
	movq	%rdi, %rsi	# D.19908,
.LBE384:
	.loc 1 1464 0
	je	.L339	#,
.LBB385:
	.loc 1 1472 0
	call	matrix_mul	#
.LVL732:
.LBB386:
.LBB387:
	.loc 1 1421 0
	movl	rubbish_counter(%rip), %edx	# rubbish_counter,
.LBE387:
.LBE386:
	.loc 1 1474 0
	movq	%rbp, %rdi	# matrix_obj,
	movq	%rax, %rsi	# passon_inside,
.LBB389:
.LBB388:
	.loc 1 1421 0
	leal	1(%rdx), %ecx	#, tmp158
	movq	%rax, pow_rubbish(,%rdx,8)	# passon_inside, pow_rubbish
	movl	%ecx, rubbish_counter(%rip)	# tmp158, rubbish_counter
.LVL733:
.L339:
.LBE388:
.LBE389:
	.loc 1 1474 0
	call	matrix_mul	#
.LVL734:
.LBB390:
.LBB391:
	.loc 1 1421 0
	movl	rubbish_counter(%rip), %edx	# rubbish_counter,
	leal	1(%rdx), %ecx	#, tmp161
	movq	%rax, pow_rubbish(,%rdx,8)	# passon, pow_rubbish
	movl	%ecx, rubbish_counter(%rip)	# tmp161, rubbish_counter
.LBE391:
.LBE390:
.LBE385:
.LBE393:
	.loc 1 1479 0
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx	#
	.cfi_restore 3
	.cfi_def_cfa_offset 32
	popq	%rbp	#
	.cfi_restore 6
	.cfi_def_cfa_offset 24
.LVL735:
	popq	%r12	#
	.cfi_restore 12
	.cfi_def_cfa_offset 16
	popq	%r13	#
	.cfi_restore 13
	.cfi_def_cfa_offset 8
	jmp	.L337	#
.LVL736:
	.p2align 4,,10
	.p2align 3
.L341:
	.cfi_restore_state
.LBB394:
.LBB392:
.LBB380:
.LBB378:
	.loc 1 1459 0
	movl	%r12d, %esi	# exponent, D.19913
	movq	%rbp, %rdi	# matrix_obj,
	shrl	$2, %esi	#, D.19913
	call	m_pow	#
.LVL737:
	.loc 1 1460 0
	cmpq	%rax, %rbp	# ret, matrix_obj
	je	.L323	#,
.LVL738:
.LBB366:
.LBB367:
	.loc 1 1421 0
	movl	rubbish_counter(%rip), %edx	# rubbish_counter,
	leal	1(%rdx), %ecx	#, tmp138
	movq	%rax, pow_rubbish(,%rdx,8)	# ret, pow_rubbish
	movl	%ecx, rubbish_counter(%rip)	# tmp138, rubbish_counter
.LVL739:
.L323:
.LBE367:
.LBE366:
	.loc 1 1464 0
	andl	$1, %r13d	#, D.19913
.LVL740:
.LBB368:
	.loc 1 1466 0
	movq	%rax, %rsi	# ret,
	movq	%rax, %rdi	# ret,
.LBE368:
	.loc 1 1464 0
	je	.L338	#,
.LBB369:
	.loc 1 1472 0
	call	matrix_mul	#
.LVL741:
.LBB370:
.LBB371:
	.loc 1 1421 0
	movl	rubbish_counter(%rip), %edx	# rubbish_counter,
.LBE371:
.LBE370:
	.loc 1 1474 0
	movq	%rbp, %rdi	# matrix_obj,
	movq	%rax, %rsi	# passon_inside,
.LBB373:
.LBB372:
	.loc 1 1421 0
	leal	1(%rdx), %ecx	#, tmp145
	movq	%rax, pow_rubbish(,%rdx,8)	# passon_inside, pow_rubbish
	movl	%ecx, rubbish_counter(%rip)	# tmp145, rubbish_counter
.LVL742:
.L338:
.LBE372:
.LBE373:
	.loc 1 1474 0
	call	matrix_mul	#
.LVL743:
.LBB374:
.LBB375:
	.loc 1 1421 0
	movl	rubbish_counter(%rip), %edx	# rubbish_counter,
.LBE375:
.LBE374:
	.loc 1 1476 0
	movq	%rax, %rdi	# passon, D.19908
.LBB377:
.LBB376:
	.loc 1 1421 0
	leal	1(%rdx), %ecx	#, tmp148
	movq	%rax, pow_rubbish(,%rdx,8)	# passon, pow_rubbish
	movl	%ecx, rubbish_counter(%rip)	# tmp148, rubbish_counter
	jmp	.L322	#
.LBE376:
.LBE377:
.LBE369:
.LBE378:
.LBE380:
.LBE392:
.LBE394:
	.cfi_endproc
.LFE2296:
	.size	m_pow, .-m_pow
	.section	.text.unlikely
.LCOLDE34:
	.text
.LHOTE34:
	.section	.text.unlikely
.LCOLDB35:
	.text
.LHOTB35:
	.p2align 4,,15
	.globl	matrix_pow
	.type	matrix_pow, @function
matrix_pow:
.LFB2297:
	.loc 1 1484 0
	.cfi_startproc
.LVL744:
	.loc 1 1485 0
	cmpl	$1, %esi	#, exponent
	je	.L395	#,
	.loc 1 1490 0
	testl	%esi, %esi	# exponent
	je	.L394	#,
	.loc 1 1484 0
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%esi, %r13d	# exponent, exponent
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx	# matrix_obj, matrix_obj
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 64
	.loc 1 1495 0
	call	identity_matrix	#
.LVL745:
	.loc 1 1496 0
	movq	g_elements(%rip), %rsi	# g_elements, tmp292
	movq	(%rbx), %rdi	# matrix_obj_5(D)->data,
	leaq	0(,%rsi,4), %rdx	#, D.19979
	movq	(%rax), %rsi	# identity_obj_11->data,
	call	memcmp	#
.LVL746:
	testl	%eax, %eax	# tmp201
	je	.L396	#,
.LVL747:
.LBB451:
.LBB452:
	.loc 1 1454 0
	call	identity_matrix	#
.LVL748:
	.loc 1 1455 0
	movq	(%rbx), %rdi	# matrix_obj_5(D)->data,
	.loc 1 1454 0
	movq	%rax, %r12	#, identity_obj
.LVL749:
	.loc 1 1455 0
	movq	g_elements(%rip), %rax	# g_elements, tmp293
.LVL750:
	movq	(%r12), %rsi	# identity_obj_23->data,
	leaq	0(,%rax,4), %rdx	#, D.19979
	call	memcmp	#
.LVL751:
	testl	%eax, %eax	# tmp205
	jne	.L346	#,
	movl	rubbish_counter(%rip), %r13d	# rubbish_counter, i
.LVL752:
.L347:
	leal	-1(%r13), %ebp	#, ivtmp.778
.LVL753:
.LBE452:
.LBE451:
.LBB526:
.LBB527:
.LBB528:
	.loc 1 1426 0
	cmpl	$-1, %ebp	#, ivtmp.778
	je	.L397	#,
.LVL754:
	.p2align 4,,10
	.p2align 3
.L364:
	.loc 1 1428 0
	movl	%ebp, %r14d	# ivtmp.778, ivtmp.778
	movq	pow_rubbish(,%r14,8), %rbx	# pow_rubbish, D.19977
	testq	%rbx, %rbx	# D.19977
	je	.L360	#,
	cmpq	%rbx, %r12	# D.19977, D.19977
	je	.L360	#,
	movl	%r13d, %edx	# i, i
.L361:
.LVL755:
.LBB529:
	.loc 1 1430 0
	subl	$1, %edx	#, i
.LVL756:
	cmpl	$-1, %edx	#, i
	je	.L398	#,
.L363:
	.loc 1 1432 0
	movl	%edx, %ecx	# i, i
	cmpq	%rbx, pow_rubbish(,%rcx,8)	# D.19977, pow_rubbish
	jne	.L361	#,
	cmpl	%edx, %ebp	# i, ivtmp.778
	je	.L361	#,
	.loc 1 1434 0
	movq	$0, pow_rubbish(,%rcx,8)	#, pow_rubbish
	.loc 1 1430 0
	subl	$1, %edx	#, i
.LVL757:
	movq	pow_rubbish(,%r14,8), %rbx	# pow_rubbish, D.19977
.LVL758:
	cmpl	$-1, %edx	#, i
	jne	.L363	#,
	.p2align 4,,10
	.p2align 3
.L398:
.LBE529:
	.loc 1 1437 0
	movq	(%rbx), %rdi	# _222->data,
	call	free	#
.LVL759:
	.loc 1 1438 0
	movq	%rbx, %rdi	# D.19977,
	call	free	#
.LVL760:
	.loc 1 1439 0
	movq	$0, pow_rubbish(,%r14,8)	#, pow_rubbish
.L360:
	subl	$1, %ebp	#, ivtmp.778
.LVL761:
	.loc 1 1426 0
	cmpl	$-1, %ebp	#, ivtmp.778
	jne	.L364	#,
.L397:
.LBE528:
	.loc 1 1443 0
	movl	$0, rubbish_counter(%rip)	#, rubbish_counter
.LBE527:
.LBE526:
	.loc 1 1506 0
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax	# D.19977,
	popq	%rbx	#
	.cfi_restore 3
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_restore 6
	.cfi_def_cfa_offset 40
.LVL762:
	popq	%r12	#
	.cfi_restore 12
	.cfi_def_cfa_offset 32
.LVL763:
	popq	%r13	#
	.cfi_restore 13
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_restore 14
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_restore 15
	.cfi_def_cfa_offset 8
	ret
.LVL764:
.L396:
	.cfi_restore_state
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_restore 3
	.cfi_def_cfa_offset 48
.LVL765:
	popq	%rbp	#
	.cfi_restore 6
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_restore 12
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_restore 13
	.cfi_def_cfa_offset 24
.LVL766:
	popq	%r14	#
	.cfi_restore 14
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_restore 15
	.cfi_def_cfa_offset 8
.L394:
	.loc 1 1498 0
	jmp	identity_matrix	#
.LVL767:
.L395:
	.loc 1 1487 0
	jmp	cloned	#
.LVL768:
.L346:
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
.LBB530:
.LBB525:
	.loc 1 1459 0
	movl	%r13d, %r12d	# exponent, D.19982
.LVL769:
.LBB453:
.LBB454:
	.loc 1 1448 0
	movq	%rbx, %rdi	# matrix_obj, D.19977
.LBE454:
.LBE453:
	.loc 1 1459 0
	shrl	%r12d	# D.19982
.LVL770:
.LBB511:
.LBB509:
	.loc 1 1448 0
	cmpl	$1, %r12d	#, D.19982
	je	.L348	#,
.LVL771:
.LBB455:
	.loc 1 1454 0
	call	identity_matrix	#
.LVL772:
	.loc 1 1455 0
	movq	(%rbx), %rdi	# matrix_obj_5(D)->data,
	.loc 1 1454 0
	movq	%rax, %rbp	#, identity_obj
.LVL773:
	.loc 1 1455 0
	movq	g_elements(%rip), %rax	# g_elements, tmp295
.LVL774:
	movq	0(%rbp), %rsi	# identity_obj_20->data,
	leaq	0(,%rax,4), %rdx	#, D.19979
	call	memcmp	#
.LVL775:
	movq	%rbp, %rdi	# identity_obj, D.19977
	testl	%eax, %eax	# tmp209
	jne	.L399	#,
.LVL776:
.L349:
.LBE455:
.LBE509:
.LBE511:
	.loc 1 1460 0
	cmpq	%rdi, %rbx	# D.19977, matrix_obj
	je	.L348	#,
.LBB512:
.LBB513:
	.loc 1 1421 0
	movl	rubbish_counter(%rip), %eax	# rubbish_counter,
	leal	1(%rax), %edx	#, tmp259
	movq	%rdi, pow_rubbish(,%rax,8)	# D.19977, pow_rubbish
	movl	%edx, rubbish_counter(%rip)	# tmp259, rubbish_counter
.L348:
.LBE513:
.LBE512:
	.loc 1 1464 0
	andl	$1, %r13d	#, exponent
.LVL777:
.LBB514:
	.loc 1 1466 0
	movq	%rdi, %rsi	# D.19977,
.LBE514:
	.loc 1 1464 0
	je	.L393	#,
.LBB515:
	.loc 1 1472 0
	call	matrix_mul	#
.LVL778:
.LBB516:
.LBB517:
	.loc 1 1421 0
	movl	rubbish_counter(%rip), %edx	# rubbish_counter,
.LBE517:
.LBE516:
	.loc 1 1474 0
	movq	%rbx, %rdi	# matrix_obj,
	movq	%rax, %rsi	# passon_inside,
.LBB519:
.LBB518:
	.loc 1 1421 0
	leal	1(%rdx), %ecx	#, tmp265
	movq	%rax, pow_rubbish(,%rdx,8)	# passon_inside, pow_rubbish
	movl	%ecx, rubbish_counter(%rip)	# tmp265, rubbish_counter
.LVL779:
.L393:
.LBE518:
.LBE519:
	.loc 1 1474 0
	call	matrix_mul	#
.LVL780:
.LBB520:
.LBB521:
	.loc 1 1421 0
	movl	rubbish_counter(%rip), %edx	# rubbish_counter,
.LBE521:
.LBE520:
	.loc 1 1476 0
	movq	%rax, %r12	# passon, D.19977
.LBB523:
.LBB522:
	.loc 1 1421 0
	leal	1(%rdx), %r13d	#, D.19982
	movq	%rax, pow_rubbish(,%rdx,8)	# passon, pow_rubbish
	movl	%r13d, rubbish_counter(%rip)	# D.19982, rubbish_counter
	jmp	.L347	#
.LVL781:
.L399:
.LBE522:
.LBE523:
.LBE515:
.LBB524:
.LBB510:
.LBB508:
	.loc 1 1459 0
	movl	%r13d, %r14d	# exponent, D.19982
.LBB456:
.LBB457:
	.loc 1 1448 0
	movq	%rbx, %rdi	# matrix_obj, D.19977
.LVL782:
.LBE457:
.LBE456:
	.loc 1 1459 0
	shrl	$2, %r14d	#, D.19982
.LVL783:
.LBB494:
.LBB492:
	.loc 1 1448 0
	cmpl	$1, %r14d	#, D.19982
	je	.L350	#,
.LVL784:
.LBB458:
	.loc 1 1454 0
	call	identity_matrix	#
.LVL785:
	.loc 1 1455 0
	movq	(%rbx), %rdi	# matrix_obj_5(D)->data,
	.loc 1 1454 0
	movq	%rax, %rbp	#, identity_obj
.LVL786:
	.loc 1 1455 0
	movq	g_elements(%rip), %rax	# g_elements, tmp297
.LVL787:
	movq	0(%rbp), %rsi	# identity_obj_66->data,
	leaq	0(,%rax,4), %rdx	#, D.19979
	call	memcmp	#
.LVL788:
	movq	%rbp, %rdi	# identity_obj, D.19977
	testl	%eax, %eax	# tmp213
	jne	.L400	#,
.LVL789:
.L351:
.LBE458:
.LBE492:
.LBE494:
	.loc 1 1460 0
	cmpq	%rdi, %rbx	# D.19977, matrix_obj
	je	.L350	#,
.LBB495:
.LBB496:
	.loc 1 1421 0
	movl	rubbish_counter(%rip), %eax	# rubbish_counter,
	leal	1(%rax), %edx	#, tmp246
	movq	%rdi, pow_rubbish(,%rax,8)	# D.19977, pow_rubbish
	movl	%edx, rubbish_counter(%rip)	# tmp246, rubbish_counter
.L350:
.LBE496:
.LBE495:
	.loc 1 1464 0
	andl	$1, %r12d	#, D.19982
.LVL790:
.LBB497:
	.loc 1 1466 0
	movq	%rdi, %rsi	# D.19977,
.LBE497:
	.loc 1 1464 0
	je	.L392	#,
.LBB498:
	.loc 1 1472 0
	call	matrix_mul	#
.LVL791:
.LBB499:
.LBB500:
	.loc 1 1421 0
	movl	rubbish_counter(%rip), %edx	# rubbish_counter,
.LBE500:
.LBE499:
	.loc 1 1474 0
	movq	%rbx, %rdi	# matrix_obj,
	movq	%rax, %rsi	# passon_inside,
.LBB502:
.LBB501:
	.loc 1 1421 0
	leal	1(%rdx), %ecx	#, tmp253
	movq	%rax, pow_rubbish(,%rdx,8)	# passon_inside, pow_rubbish
	movl	%ecx, rubbish_counter(%rip)	# tmp253, rubbish_counter
.LVL792:
.L392:
.LBE501:
.LBE502:
	.loc 1 1474 0
	call	matrix_mul	#
.LVL793:
.LBB503:
.LBB504:
	.loc 1 1421 0
	movl	rubbish_counter(%rip), %edx	# rubbish_counter,
.LBE504:
.LBE503:
	.loc 1 1476 0
	movq	%rax, %rdi	# passon, D.19977
.LBB506:
.LBB505:
	.loc 1 1421 0
	leal	1(%rdx), %ecx	#, tmp256
	movq	%rax, pow_rubbish(,%rdx,8)	# passon, pow_rubbish
	movl	%ecx, rubbish_counter(%rip)	# tmp256, rubbish_counter
	jmp	.L349	#
.LVL794:
.L400:
.LBE505:
.LBE506:
.LBE498:
.LBB507:
.LBB493:
.LBB491:
	.loc 1 1459 0
	movl	%r13d, %ebp	# exponent, D.19982
.LBB459:
.LBB460:
	.loc 1 1448 0
	movq	%rbx, %rdi	# matrix_obj, D.19977
.LVL795:
.LBE460:
.LBE459:
	.loc 1 1459 0
	shrl	$3, %ebp	#, D.19982
.LVL796:
.LBB477:
.LBB475:
	.loc 1 1448 0
	cmpl	$1, %ebp	#, D.19982
	je	.L352	#,
.LVL797:
.LBB461:
	.loc 1 1454 0
	call	identity_matrix	#
.LVL798:
	.loc 1 1455 0
	movq	(%rbx), %rdi	# matrix_obj_5(D)->data,
	.loc 1 1454 0
	movq	%rax, %r15	#, identity_obj
.LVL799:
	.loc 1 1455 0
	movq	g_elements(%rip), %rax	# g_elements, tmp299
.LVL800:
	movq	(%r15), %rsi	# identity_obj_88->data,
	leaq	0(,%rax,4), %rdx	#, D.19979
	call	memcmp	#
.LVL801:
	movq	%r15, %rdi	# identity_obj, D.19977
	testl	%eax, %eax	# tmp217
	jne	.L401	#,
.LVL802:
.L353:
.LBE461:
.LBE475:
.LBE477:
	.loc 1 1460 0
	cmpq	%rdi, %rbx	# D.19977, matrix_obj
	je	.L352	#,
.LBB478:
.LBB479:
	.loc 1 1421 0
	movl	rubbish_counter(%rip), %eax	# rubbish_counter,
	leal	1(%rax), %edx	#, tmp233
	movq	%rdi, pow_rubbish(,%rax,8)	# D.19977, pow_rubbish
	movl	%edx, rubbish_counter(%rip)	# tmp233, rubbish_counter
.LVL803:
.L352:
.LBE479:
.LBE478:
	.loc 1 1464 0
	andl	$1, %r14d	#, D.19982
.LVL804:
.LBB480:
	.loc 1 1466 0
	movq	%rdi, %rsi	# D.19977,
.LBE480:
	.loc 1 1464 0
	je	.L391	#,
.LBB481:
	.loc 1 1472 0
	call	matrix_mul	#
.LVL805:
.LBB482:
.LBB483:
	.loc 1 1421 0
	movl	rubbish_counter(%rip), %edx	# rubbish_counter,
.LBE483:
.LBE482:
	.loc 1 1474 0
	movq	%rbx, %rdi	# matrix_obj,
	movq	%rax, %rsi	# passon_inside,
.LBB485:
.LBB484:
	.loc 1 1421 0
	leal	1(%rdx), %ecx	#, tmp240
	movq	%rax, pow_rubbish(,%rdx,8)	# passon_inside, pow_rubbish
	movl	%ecx, rubbish_counter(%rip)	# tmp240, rubbish_counter
.LVL806:
.L391:
.LBE484:
.LBE485:
	.loc 1 1474 0
	call	matrix_mul	#
.LVL807:
.LBB486:
.LBB487:
	.loc 1 1421 0
	movl	rubbish_counter(%rip), %edx	# rubbish_counter,
.LBE487:
.LBE486:
	.loc 1 1476 0
	movq	%rax, %rdi	# passon, D.19977
.LBB489:
.LBB488:
	.loc 1 1421 0
	leal	1(%rdx), %ecx	#, tmp243
	movq	%rax, pow_rubbish(,%rdx,8)	# passon, pow_rubbish
	movl	%ecx, rubbish_counter(%rip)	# tmp243, rubbish_counter
	jmp	.L351	#
.LVL808:
.L401:
.LBE488:
.LBE489:
.LBE481:
.LBB490:
.LBB476:
.LBB474:
	.loc 1 1459 0
	movl	%ebp, %esi	# D.19982, D.19982
	movq	%rbx, %rdi	# matrix_obj,
.LVL809:
	shrl	%esi	# D.19982
	call	m_pow	#
.LVL810:
	movq	%rax, %rdi	#, ret
.LVL811:
	.loc 1 1460 0
	cmpq	%rax, %rbx	# ret, matrix_obj
	je	.L354	#,
.LVL812:
.LBB462:
.LBB463:
	.loc 1 1421 0
	movl	rubbish_counter(%rip), %eax	# rubbish_counter,
.LVL813:
	leal	1(%rax), %edx	#, tmp220
	movq	%rdi, pow_rubbish(,%rax,8)	# ret, pow_rubbish
	movl	%edx, rubbish_counter(%rip)	# tmp220, rubbish_counter
.LVL814:
.L354:
.LBE463:
.LBE462:
	.loc 1 1464 0
	andl	$1, %ebp	#, D.19982
.LVL815:
.LBB464:
	.loc 1 1466 0
	movq	%rdi, %rsi	# ret,
.LBE464:
	.loc 1 1464 0
	je	.L390	#,
.LVL816:
.LBB465:
	.loc 1 1472 0
	call	matrix_mul	#
.LVL817:
.LBB466:
.LBB467:
	.loc 1 1421 0
	movl	rubbish_counter(%rip), %edx	# rubbish_counter,
.LBE467:
.LBE466:
	.loc 1 1474 0
	movq	%rbx, %rdi	# matrix_obj,
	movq	%rax, %rsi	# passon_inside,
.LBB469:
.LBB468:
	.loc 1 1421 0
	leal	1(%rdx), %ecx	#, tmp227
	movq	%rax, pow_rubbish(,%rdx,8)	# passon_inside, pow_rubbish
	movl	%ecx, rubbish_counter(%rip)	# tmp227, rubbish_counter
.LVL818:
.L390:
.LBE468:
.LBE469:
	.loc 1 1474 0
	call	matrix_mul	#
.LVL819:
.LBB470:
.LBB471:
	.loc 1 1421 0
	movl	rubbish_counter(%rip), %edx	# rubbish_counter,
.LBE471:
.LBE470:
	.loc 1 1476 0
	movq	%rax, %rdi	# passon, D.19977
.LBB473:
.LBB472:
	.loc 1 1421 0
	leal	1(%rdx), %ecx	#, tmp230
	movq	%rax, pow_rubbish(,%rdx,8)	# passon, pow_rubbish
	movl	%ecx, rubbish_counter(%rip)	# tmp230, rubbish_counter
	jmp	.L353	#
.LBE472:
.LBE473:
.LBE465:
.LBE474:
.LBE476:
.LBE490:
.LBE491:
.LBE493:
.LBE507:
.LBE508:
.LBE510:
.LBE524:
.LBE525:
.LBE530:
	.cfi_endproc
.LFE2297:
	.size	matrix_pow, .-matrix_pow
	.section	.text.unlikely
.LCOLDE35:
	.text
.LHOTE35:
	.section	.text.unlikely
.LCOLDB36:
	.text
.LHOTB36:
	.p2align 4,,15
	.globl	get_sum
	.type	get_sum, @function
get_sum:
.LFB2298:
	.loc 1 1517 0
	.cfi_startproc
.LVL820:
	.loc 1 1518 0
	movl	16(%rdi), %eax	# matrix_obj_2(D)->sum, matrix_obj_2(D)->sum
	.loc 1 1519 0
	ret
	.cfi_endproc
.LFE2298:
	.size	get_sum, .-get_sum
	.section	.text.unlikely
.LCOLDE36:
	.text
.LHOTE36:
	.section	.text.unlikely
.LCOLDB37:
	.text
.LHOTB37:
	.p2align 4,,15
	.globl	get_trace
	.type	get_trace, @function
get_trace:
.LFB2299:
	.loc 1 1525 0
	.cfi_startproc
.LVL821:
	.loc 1 1527 0
	movl	g_width(%rip), %eax	# g_width, tmp104
	.loc 1 1528 0
	movq	(%rdi), %rcx	# matrix_obj_8(D)->data, matrix
	.loc 1 1527 0
	leal	1(%rax), %esi	#,
.LVL822:
.LBB531:
	.loc 1 1530 0
	movq	g_height(%rip), %rax	# g_height, g_height
.LVL823:
	leal	-1(%rax), %edx	#, i
.LVL824:
	testl	%eax, %eax	# g_height
	je	.L406	#,
	salq	$2, %rsi	#, D.19999
.LVL825:
	xorl	%eax, %eax	# total
.LVL826:
	.p2align 4,,10
	.p2align 3
.L405:
	subl	$1, %edx	#, i
.LVL827:
	.loc 1 1532 0
	addl	(%rcx), %eax	# MEM[base: matrix_25, offset: 0B], total
.LVL828:
	.loc 1 1533 0
	addq	%rsi, %rcx	# D.19999, matrix
.LVL829:
	.loc 1 1530 0
	cmpl	$-1, %edx	#, i
	jne	.L405	#,
	ret
.LVL830:
.L406:
.LBE531:
	.loc 1 1526 0
	xorl	%eax, %eax	# total
	.loc 1 1537 0
	ret
	.cfi_endproc
.LFE2299:
	.size	get_trace, .-get_trace
	.section	.text.unlikely
.LCOLDE37:
	.text
.LHOTE37:
	.section	.text.unlikely
.LCOLDB38:
	.text
.LHOTB38:
	.p2align 4,,15
	.globl	get_minimum
	.type	get_minimum, @function
get_minimum:
.LFB2300:
	.loc 1 1544 0
	.cfi_startproc
.LVL831:
	.loc 1 1545 0
	movl	8(%rdi), %eax	# matrix_obj_2(D)->min, matrix_obj_2(D)->min
	.loc 1 1546 0
	ret
	.cfi_endproc
.LFE2300:
	.size	get_minimum, .-get_minimum
	.section	.text.unlikely
.LCOLDE38:
	.text
.LHOTE38:
	.section	.text.unlikely
.LCOLDB39:
	.text
.LHOTB39:
	.p2align 4,,15
	.globl	get_maximum
	.type	get_maximum, @function
get_maximum:
.LFB2301:
	.loc 1 1552 0
	.cfi_startproc
.LVL832:
	.loc 1 1553 0
	movl	12(%rdi), %eax	# matrix_obj_2(D)->max, matrix_obj_2(D)->max
	.loc 1 1554 0
	ret
	.cfi_endproc
.LFE2301:
	.size	get_maximum, .-get_maximum
	.section	.text.unlikely
.LCOLDE39:
	.text
.LHOTE39:
	.section	.text.unlikely
.LCOLDB40:
	.text
.LHOTB40:
	.p2align 4,,15
	.globl	get_frequency
	.type	get_frequency, @function
get_frequency:
.LFB2303:
	.loc 1 1586 0
	.cfi_startproc
.LVL833:
	.loc 1 1588 0
	movq	24(%rdi), %rax	# matrix_obj_14(D)->occurances, D.20035
	testq	%rax, %rax	# D.20035
	je	.L412	#,
	.loc 1 1590 0
	movl	%esi, %esi	# value, D.20036
	movl	(%rax,%rsi,4), %eax	# *_19, D.20033
	.loc 1 1631 0
	ret
	.p2align 4,,10
	.p2align 3
.L412:
	.loc 1 1586 0
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	.cfi_offset 15, -24
	movl	%esi, %r15d	# value, value
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	subq	$24, %rsp	#,
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	.loc 1 1593 0
	movq	g_nthreads(%rip), %rcx	# g_nthreads, D.20037
	movq	%rdi, -64(%rbp)	# matrix_obj, %sfp
	leaq	0(,%rcx,4), %rdi	#, D.20036
.LVL834:
	movq	%rcx, -56(%rbp)	# D.20037, %sfp
	call	malloc	#
.LVL835:
	.loc 1 1595 0
	movq	-56(%rbp), %rcx	# %sfp, D.20037
	.loc 1 1593 0
	movq	%rax, %rbx	#, result
.LVL836:
	.loc 1 1595 0
	leaq	22(,%rcx,8), %rax	#, tmp151
.LVL837:
	.loc 1 1597 0
	movq	%rcx, %rdi	# D.20037, D.20036
	.loc 1 1595 0
	andq	$-16, %rax	#, tmp155
	.loc 1 1597 0
	salq	$5, %rdi	#, D.20036
	.loc 1 1595 0
	subq	%rax, %rsp	# tmp155,
	.loc 1 1597 0
	call	malloc	#
.LVL838:
.LBB532:
	.loc 1 1599 0
	movq	-56(%rbp), %rcx	# %sfp, D.20037
.LBE532:
	.loc 1 1595 0
	movq	%rsp, %r12	#, tmp159
.LVL839:
	.loc 1 1597 0
	movq	%rax, %r13	#, args
.LVL840:
.LBB535:
	.loc 1 1599 0
	leal	-1(%rcx), %r14d	#, i
.LVL841:
	testl	%ecx, %ecx	# D.20037
	je	.L418	#,
.LVL842:
	movq	g_height(%rip), %rax	# g_height, D.20043
.LVL843:
	movl	%r14d, %r8d	# i, i
	xorl	%edi, %edi	# start_row
	movq	-64(%rbp), %rsi	# %sfp, matrix_obj
	cqto
	idivq	%rcx	# D.20037
.LVL844:
	.p2align 4,,10
	.p2align 3
.L415:
.LBB533:
	.loc 1 1601 0
	movl	%r8d, %ecx	# i, D.20037
	movq	%rdx, %r9	# tmp164, D.20037
	subq	%rcx, %r9	# D.20037, D.20037
	testq	%r9, %r9	# D.20037
	setg	%r9b	#, D.20039
	.loc 1 1602 0
	salq	$5, %rcx	#, D.20036
	addq	%r13, %rcx	# args, D.20041
	.loc 1 1601 0
	movzbl	%r9b, %r9d	# D.20039, D.20039
	addl	%eax, %r9d	# D.20040, this_rows
.LVL845:
	.loc 1 1602 0
	movl	%r8d, 24(%rcx)	# i, _45->id
.LBE533:
	.loc 1 1599 0
	subl	$1, %r8d	#, i
.LVL846:
.LBB534:
	.loc 1 1602 0
	movl	%edi, 20(%rcx)	# start_row, _45->start_row
	.loc 1 1610 0
	addl	%r9d, %edi	# this_rows, start_row
.LVL847:
	.loc 1 1602 0
	movq	%rsi, (%rcx)	# matrix_obj, _45->matrix_obj
	movq	%rbx, 8(%rcx)	# result, _45->result
	movl	%r9d, 16(%rcx)	# this_rows, _45->num_rows
	movl	%r15d, 28(%rcx)	# value, _45->value
.LBE534:
	.loc 1 1599 0
	cmpl	$-1, %r8d	#, i
	jne	.L415	#,
.LVL848:
	.p2align 4,,10
	.p2align 3
.L416:
.LBE535:
.LBB536:
	.loc 1 1615 0
	movl	%r14d, %eax	# i, D.20036
	xorl	%esi, %esi	#
	movl	$get_cmpe_worker, %edx	#,
	leaq	(%r12,%rax,8), %rdi	#, D.20042
	movq	%rax, %rcx	# D.20036, D.20036
	salq	$5, %rcx	#, D.20036
	addq	%r13, %rcx	# args, D.20041
	call	pthread_create	#
.LVL849:
	.loc 1 1613 0
	testl	%r14d, %r14d	# i
	leal	-1(%r14), %r14d	#, i
.LVL850:
	jne	.L416	#,
	movq	g_nthreads(%rip), %rax	# g_nthreads, g_nthreads
.LBE536:
.LBB537:
	.loc 1 1620 0
	xorl	%r13d, %r13d	# count
.LVL851:
	leal	-1(%rax), %r14d	#, i
.LVL852:
	testl	%eax, %eax	# g_nthreads
	je	.L414	#,
.LVL853:
	.p2align 4,,10
	.p2align 3
.L417:
	.loc 1 1622 0
	movl	%r14d, %r15d	# i, D.20036
	xorl	%esi, %esi	#
	movq	(%r12,%r15,8), %rdi	# *_67, *_67
	call	pthread_join	#
.LVL854:
	.loc 1 1623 0
	addl	(%rbx,%r15,4), %r13d	# *_71, count
.LVL855:
	.loc 1 1620 0
	testl	%r14d, %r14d	# i
	leal	-1(%r14), %r14d	#, i
.LVL856:
	jne	.L417	#,
.LVL857:
.L414:
.LBE537:
	.loc 1 1626 0
	movq	%rbx, %rdi	# result,
	call	free	#
.LVL858:
	.loc 1 1631 0
	leaq	-40(%rbp), %rsp	#,
.LVL859:
	.loc 1 1630 0
	movl	%r13d, %eax	# count, D.20033
	.loc 1 1631 0
	popq	%rbx	#
	.cfi_remember_state
	.cfi_restore 3
.LVL860:
	popq	%r12	#
	.cfi_restore 12
.LVL861:
	popq	%r13	#
	.cfi_restore 13
	popq	%r14	#
	.cfi_restore 14
	popq	%r15	#
	.cfi_restore 15
	popq	%rbp	#
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
.LVL862:
.L418:
	.cfi_restore_state
	.loc 1 1618 0
	xorl	%r13d, %r13d	# count
	jmp	.L414	#
	.cfi_endproc
.LFE2303:
	.size	get_frequency, .-get_frequency
	.section	.text.unlikely
.LCOLDE40:
	.text
.LHOTE40:
	.local	g_seed
	.comm	g_seed,4,4
	.data
	.align 8
	.type	g_nthreads, @object
	.size	g_nthreads, 8
g_nthreads:
	.quad	1
	.local	rubbish_counter
	.comm	rubbish_counter,4,4
	.local	pow_rubbish
	.comm	pow_rubbish,2040,64
	.local	g_elements
	.comm	g_elements,8,8
	.local	g_height
	.comm	g_height,8,8
	.local	g_width
	.comm	g_width,8,8
	.text
.Letext0:
	.section	.text.unlikely
.Letext_cold0:
	.file 2 "/usr/lib/gcc/x86_64-redhat-linux/4.9.2/include/stddef.h"
	.file 3 "/usr/include/bits/types.h"
	.file 4 "/usr/include/libio.h"
	.file 5 "/usr/include/stdio.h"
	.file 6 "/usr/include/bits/pthreadtypes.h"
	.file 7 "/usr/include/stdint.h"
	.file 8 "matrix.h"
	.file 9 "/usr/include/stdlib.h"
	.file 10 "/usr/include/pthread.h"
	.file 11 "/usr/include/string.h"
	.file 12 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x3fed
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF178
	.byte	0x1
	.long	.LASF179
	.long	.LASF180
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF0
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF1
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x4
	.byte	0x8
	.long	0x48
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF2
	.uleb128 0x5
	.long	.LASF10
	.byte	0x2
	.byte	0xd4
	.long	0x5a
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF7
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF9
	.uleb128 0x5
	.long	.LASF11
	.byte	0x3
	.byte	0x83
	.long	0x84
	.uleb128 0x5
	.long	.LASF12
	.byte	0x3
	.byte	0x84
	.long	0x84
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF13
	.uleb128 0x6
	.byte	0x8
	.uleb128 0x5
	.long	.LASF14
	.byte	0x3
	.byte	0xac
	.long	0x84
	.uleb128 0x4
	.byte	0x8
	.long	0xbb
	.uleb128 0x7
	.long	0x48
	.uleb128 0x8
	.long	.LASF44
	.byte	0xd8
	.byte	0x4
	.byte	0xf5
	.long	0x240
	.uleb128 0x9
	.long	.LASF15
	.byte	0x4
	.byte	0xf6
	.long	0x3b
	.byte	0
	.uleb128 0x9
	.long	.LASF16
	.byte	0x4
	.byte	0xfb
	.long	0x42
	.byte	0x8
	.uleb128 0x9
	.long	.LASF17
	.byte	0x4
	.byte	0xfc
	.long	0x42
	.byte	0x10
	.uleb128 0x9
	.long	.LASF18
	.byte	0x4
	.byte	0xfd
	.long	0x42
	.byte	0x18
	.uleb128 0x9
	.long	.LASF19
	.byte	0x4
	.byte	0xfe
	.long	0x42
	.byte	0x20
	.uleb128 0x9
	.long	.LASF20
	.byte	0x4
	.byte	0xff
	.long	0x42
	.byte	0x28
	.uleb128 0xa
	.long	.LASF21
	.byte	0x4
	.value	0x100
	.long	0x42
	.byte	0x30
	.uleb128 0xa
	.long	.LASF22
	.byte	0x4
	.value	0x101
	.long	0x42
	.byte	0x38
	.uleb128 0xa
	.long	.LASF23
	.byte	0x4
	.value	0x102
	.long	0x42
	.byte	0x40
	.uleb128 0xa
	.long	.LASF24
	.byte	0x4
	.value	0x104
	.long	0x42
	.byte	0x48
	.uleb128 0xa
	.long	.LASF25
	.byte	0x4
	.value	0x105
	.long	0x42
	.byte	0x50
	.uleb128 0xa
	.long	.LASF26
	.byte	0x4
	.value	0x106
	.long	0x42
	.byte	0x58
	.uleb128 0xa
	.long	.LASF27
	.byte	0x4
	.value	0x108
	.long	0x278
	.byte	0x60
	.uleb128 0xa
	.long	.LASF28
	.byte	0x4
	.value	0x10a
	.long	0x27e
	.byte	0x68
	.uleb128 0xa
	.long	.LASF29
	.byte	0x4
	.value	0x10c
	.long	0x3b
	.byte	0x70
	.uleb128 0xa
	.long	.LASF30
	.byte	0x4
	.value	0x110
	.long	0x3b
	.byte	0x74
	.uleb128 0xa
	.long	.LASF31
	.byte	0x4
	.value	0x112
	.long	0x8b
	.byte	0x78
	.uleb128 0xa
	.long	.LASF32
	.byte	0x4
	.value	0x116
	.long	0x68
	.byte	0x80
	.uleb128 0xa
	.long	.LASF33
	.byte	0x4
	.value	0x117
	.long	0x76
	.byte	0x82
	.uleb128 0xa
	.long	.LASF34
	.byte	0x4
	.value	0x118
	.long	0x284
	.byte	0x83
	.uleb128 0xa
	.long	.LASF35
	.byte	0x4
	.value	0x11c
	.long	0x294
	.byte	0x88
	.uleb128 0xa
	.long	.LASF36
	.byte	0x4
	.value	0x125
	.long	0x96
	.byte	0x90
	.uleb128 0xa
	.long	.LASF37
	.byte	0x4
	.value	0x12e
	.long	0xa8
	.byte	0x98
	.uleb128 0xa
	.long	.LASF38
	.byte	0x4
	.value	0x12f
	.long	0xa8
	.byte	0xa0
	.uleb128 0xa
	.long	.LASF39
	.byte	0x4
	.value	0x130
	.long	0xa8
	.byte	0xa8
	.uleb128 0xa
	.long	.LASF40
	.byte	0x4
	.value	0x131
	.long	0xa8
	.byte	0xb0
	.uleb128 0xa
	.long	.LASF41
	.byte	0x4
	.value	0x132
	.long	0x4f
	.byte	0xb8
	.uleb128 0xa
	.long	.LASF42
	.byte	0x4
	.value	0x134
	.long	0x3b
	.byte	0xc0
	.uleb128 0xa
	.long	.LASF43
	.byte	0x4
	.value	0x136
	.long	0x29a
	.byte	0xc4
	.byte	0
	.uleb128 0xb
	.long	.LASF181
	.byte	0x4
	.byte	0x9a
	.uleb128 0x8
	.long	.LASF45
	.byte	0x18
	.byte	0x4
	.byte	0xa0
	.long	0x278
	.uleb128 0x9
	.long	.LASF46
	.byte	0x4
	.byte	0xa1
	.long	0x278
	.byte	0
	.uleb128 0x9
	.long	.LASF47
	.byte	0x4
	.byte	0xa2
	.long	0x27e
	.byte	0x8
	.uleb128 0x9
	.long	.LASF48
	.byte	0x4
	.byte	0xa6
	.long	0x3b
	.byte	0x10
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x247
	.uleb128 0x4
	.byte	0x8
	.long	0xc0
	.uleb128 0xc
	.long	0x48
	.long	0x294
	.uleb128 0xd
	.long	0xa1
	.byte	0
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x240
	.uleb128 0xc
	.long	0x48
	.long	0x2aa
	.uleb128 0xd
	.long	0xa1
	.byte	0x13
	.byte	0
	.uleb128 0x5
	.long	.LASF49
	.byte	0x5
	.byte	0x66
	.long	0xaa
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF50
	.uleb128 0x5
	.long	.LASF51
	.byte	0x6
	.byte	0x3c
	.long	0x5a
	.uleb128 0xe
	.long	.LASF54
	.byte	0x38
	.byte	0x6
	.byte	0x3f
	.long	0x2ea
	.uleb128 0xf
	.long	.LASF52
	.byte	0x6
	.byte	0x41
	.long	0x2ea
	.uleb128 0xf
	.long	.LASF53
	.byte	0x6
	.byte	0x42
	.long	0x84
	.byte	0
	.uleb128 0xc
	.long	0x48
	.long	0x2fa
	.uleb128 0xd
	.long	0xa1
	.byte	0x37
	.byte	0
	.uleb128 0x5
	.long	.LASF54
	.byte	0x6
	.byte	0x45
	.long	0x2c7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF55
	.uleb128 0x4
	.byte	0x8
	.long	0x312
	.uleb128 0x10
	.uleb128 0x5
	.long	.LASF56
	.byte	0x7
	.byte	0x33
	.long	0x6f
	.uleb128 0x8
	.long	.LASF57
	.byte	0x20
	.byte	0x8
	.byte	0xf
	.long	0x367
	.uleb128 0x9
	.long	.LASF58
	.byte	0x8
	.byte	0x11
	.long	0x367
	.byte	0
	.uleb128 0x11
	.string	"min"
	.byte	0x8
	.byte	0x12
	.long	0x313
	.byte	0x8
	.uleb128 0x11
	.string	"max"
	.byte	0x8
	.byte	0x13
	.long	0x313
	.byte	0xc
	.uleb128 0x11
	.string	"sum"
	.byte	0x8
	.byte	0x14
	.long	0x313
	.byte	0x10
	.uleb128 0x9
	.long	.LASF59
	.byte	0x8
	.byte	0x15
	.long	0x367
	.byte	0x18
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x313
	.uleb128 0x5
	.long	.LASF57
	.byte	0x8
	.byte	0x16
	.long	0x31e
	.uleb128 0x8
	.long	.LASF60
	.byte	0x10
	.byte	0x1
	.byte	0xd4
	.long	0x3a9
	.uleb128 0x9
	.long	.LASF61
	.byte	0x1
	.byte	0xd6
	.long	0x3a9
	.byte	0
	.uleb128 0x9
	.long	.LASF62
	.byte	0x1
	.byte	0xd7
	.long	0x313
	.byte	0x8
	.uleb128 0x9
	.long	.LASF63
	.byte	0x1
	.byte	0xd8
	.long	0x313
	.byte	0xc
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x36d
	.uleb128 0x12
	.long	.LASF64
	.byte	0x18
	.byte	0x1
	.value	0x13a
	.long	0x3f1
	.uleb128 0xa
	.long	.LASF61
	.byte	0x1
	.value	0x13c
	.long	0x3a9
	.byte	0
	.uleb128 0xa
	.long	.LASF62
	.byte	0x1
	.value	0x13d
	.long	0x313
	.byte	0x8
	.uleb128 0xa
	.long	.LASF63
	.byte	0x1
	.value	0x13e
	.long	0x313
	.byte	0xc
	.uleb128 0xa
	.long	.LASF65
	.byte	0x1
	.value	0x13f
	.long	0x313
	.byte	0x10
	.byte	0
	.uleb128 0x12
	.long	.LASF66
	.byte	0x18
	.byte	0x1
	.value	0x1b8
	.long	0x433
	.uleb128 0xa
	.long	.LASF61
	.byte	0x1
	.value	0x1ba
	.long	0x3a9
	.byte	0
	.uleb128 0xa
	.long	.LASF67
	.byte	0x1
	.value	0x1bb
	.long	0x313
	.byte	0x8
	.uleb128 0xa
	.long	.LASF62
	.byte	0x1
	.value	0x1bc
	.long	0x313
	.byte	0xc
	.uleb128 0xa
	.long	.LASF63
	.byte	0x1
	.value	0x1bd
	.long	0x313
	.byte	0x10
	.byte	0
	.uleb128 0x12
	.long	.LASF68
	.byte	0x38
	.byte	0x1
	.value	0x22d
	.long	0x4b5
	.uleb128 0xa
	.long	.LASF61
	.byte	0x1
	.value	0x22f
	.long	0x3a9
	.byte	0
	.uleb128 0xa
	.long	.LASF69
	.byte	0x1
	.value	0x230
	.long	0x313
	.byte	0x8
	.uleb128 0xa
	.long	.LASF70
	.byte	0x1
	.value	0x231
	.long	0x313
	.byte	0xc
	.uleb128 0xa
	.long	.LASF62
	.byte	0x1
	.value	0x232
	.long	0x313
	.byte	0x10
	.uleb128 0xa
	.long	.LASF63
	.byte	0x1
	.value	0x233
	.long	0x313
	.byte	0x14
	.uleb128 0xa
	.long	.LASF71
	.byte	0x1
	.value	0x234
	.long	0x367
	.byte	0x18
	.uleb128 0xa
	.long	.LASF72
	.byte	0x1
	.value	0x235
	.long	0x367
	.byte	0x20
	.uleb128 0xa
	.long	.LASF73
	.byte	0x1
	.value	0x236
	.long	0x367
	.byte	0x28
	.uleb128 0x13
	.string	"id"
	.byte	0x1
	.value	0x237
	.long	0x313
	.byte	0x30
	.byte	0
	.uleb128 0x12
	.long	.LASF74
	.byte	0x18
	.byte	0x1
	.value	0x2b8
	.long	0x4f7
	.uleb128 0xa
	.long	.LASF61
	.byte	0x1
	.value	0x2ba
	.long	0x3a9
	.byte	0
	.uleb128 0xa
	.long	.LASF75
	.byte	0x1
	.value	0x2bb
	.long	0x3a9
	.byte	0x8
	.uleb128 0xa
	.long	.LASF62
	.byte	0x1
	.value	0x2bc
	.long	0x313
	.byte	0x10
	.uleb128 0xa
	.long	.LASF63
	.byte	0x1
	.value	0x2bd
	.long	0x313
	.byte	0x14
	.byte	0
	.uleb128 0x12
	.long	.LASF76
	.byte	0x18
	.byte	0x1
	.value	0x31f
	.long	0x539
	.uleb128 0xa
	.long	.LASF75
	.byte	0x1
	.value	0x321
	.long	0x3a9
	.byte	0
	.uleb128 0xa
	.long	.LASF61
	.byte	0x1
	.value	0x322
	.long	0x3a9
	.byte	0x8
	.uleb128 0xa
	.long	.LASF63
	.byte	0x1
	.value	0x323
	.long	0x313
	.byte	0x10
	.uleb128 0xa
	.long	.LASF62
	.byte	0x1
	.value	0x324
	.long	0x313
	.byte	0x14
	.byte	0
	.uleb128 0x12
	.long	.LASF77
	.byte	0x18
	.byte	0x1
	.value	0x36a
	.long	0x57b
	.uleb128 0xa
	.long	.LASF61
	.byte	0x1
	.value	0x36c
	.long	0x3a9
	.byte	0
	.uleb128 0xa
	.long	.LASF75
	.byte	0x1
	.value	0x36d
	.long	0x3a9
	.byte	0x8
	.uleb128 0xa
	.long	.LASF63
	.byte	0x1
	.value	0x36e
	.long	0x313
	.byte	0x10
	.uleb128 0xa
	.long	.LASF62
	.byte	0x1
	.value	0x36f
	.long	0x313
	.byte	0x14
	.byte	0
	.uleb128 0x12
	.long	.LASF78
	.byte	0x38
	.byte	0x1
	.value	0x3d4
	.long	0x5fd
	.uleb128 0xa
	.long	.LASF61
	.byte	0x1
	.value	0x3d6
	.long	0x3a9
	.byte	0
	.uleb128 0xa
	.long	.LASF75
	.byte	0x1
	.value	0x3d7
	.long	0x3a9
	.byte	0x8
	.uleb128 0xa
	.long	.LASF71
	.byte	0x1
	.value	0x3d8
	.long	0x367
	.byte	0x10
	.uleb128 0xa
	.long	.LASF72
	.byte	0x1
	.value	0x3d9
	.long	0x367
	.byte	0x18
	.uleb128 0xa
	.long	.LASF73
	.byte	0x1
	.value	0x3da
	.long	0x367
	.byte	0x20
	.uleb128 0xa
	.long	.LASF79
	.byte	0x1
	.value	0x3db
	.long	0x313
	.byte	0x28
	.uleb128 0xa
	.long	.LASF63
	.byte	0x1
	.value	0x3dc
	.long	0x313
	.byte	0x2c
	.uleb128 0xa
	.long	.LASF62
	.byte	0x1
	.value	0x3dd
	.long	0x313
	.byte	0x30
	.uleb128 0x13
	.string	"id"
	.byte	0x1
	.value	0x3de
	.long	0x313
	.byte	0x34
	.byte	0
	.uleb128 0x12
	.long	.LASF80
	.byte	0x38
	.byte	0x1
	.value	0x43f
	.long	0x67f
	.uleb128 0xa
	.long	.LASF61
	.byte	0x1
	.value	0x441
	.long	0x3a9
	.byte	0
	.uleb128 0xa
	.long	.LASF75
	.byte	0x1
	.value	0x442
	.long	0x3a9
	.byte	0x8
	.uleb128 0xa
	.long	.LASF71
	.byte	0x1
	.value	0x443
	.long	0x367
	.byte	0x10
	.uleb128 0xa
	.long	.LASF72
	.byte	0x1
	.value	0x444
	.long	0x367
	.byte	0x18
	.uleb128 0xa
	.long	.LASF73
	.byte	0x1
	.value	0x445
	.long	0x367
	.byte	0x20
	.uleb128 0xa
	.long	.LASF79
	.byte	0x1
	.value	0x446
	.long	0x313
	.byte	0x28
	.uleb128 0xa
	.long	.LASF63
	.byte	0x1
	.value	0x447
	.long	0x313
	.byte	0x2c
	.uleb128 0xa
	.long	.LASF62
	.byte	0x1
	.value	0x448
	.long	0x313
	.byte	0x30
	.uleb128 0x13
	.string	"id"
	.byte	0x1
	.value	0x449
	.long	0x313
	.byte	0x34
	.byte	0
	.uleb128 0x12
	.long	.LASF81
	.byte	0x40
	.byte	0x1
	.value	0x4a6
	.long	0x701
	.uleb128 0xa
	.long	.LASF82
	.byte	0x1
	.value	0x4a8
	.long	0x3a9
	.byte	0
	.uleb128 0xa
	.long	.LASF83
	.byte	0x1
	.value	0x4a9
	.long	0x3a9
	.byte	0x8
	.uleb128 0xa
	.long	.LASF75
	.byte	0x1
	.value	0x4aa
	.long	0x3a9
	.byte	0x10
	.uleb128 0xa
	.long	.LASF71
	.byte	0x1
	.value	0x4ab
	.long	0x367
	.byte	0x18
	.uleb128 0xa
	.long	.LASF72
	.byte	0x1
	.value	0x4ac
	.long	0x367
	.byte	0x20
	.uleb128 0xa
	.long	.LASF73
	.byte	0x1
	.value	0x4ad
	.long	0x367
	.byte	0x28
	.uleb128 0xa
	.long	.LASF63
	.byte	0x1
	.value	0x4ae
	.long	0x313
	.byte	0x30
	.uleb128 0xa
	.long	.LASF62
	.byte	0x1
	.value	0x4af
	.long	0x313
	.byte	0x34
	.uleb128 0x13
	.string	"id"
	.byte	0x1
	.value	0x4b0
	.long	0x313
	.byte	0x38
	.byte	0
	.uleb128 0x12
	.long	.LASF84
	.byte	0x40
	.byte	0x1
	.value	0x510
	.long	0x783
	.uleb128 0xa
	.long	.LASF82
	.byte	0x1
	.value	0x512
	.long	0x3a9
	.byte	0
	.uleb128 0xa
	.long	.LASF83
	.byte	0x1
	.value	0x513
	.long	0x3a9
	.byte	0x8
	.uleb128 0xa
	.long	.LASF75
	.byte	0x1
	.value	0x514
	.long	0x3a9
	.byte	0x10
	.uleb128 0xa
	.long	.LASF71
	.byte	0x1
	.value	0x515
	.long	0x367
	.byte	0x18
	.uleb128 0xa
	.long	.LASF72
	.byte	0x1
	.value	0x516
	.long	0x367
	.byte	0x20
	.uleb128 0xa
	.long	.LASF73
	.byte	0x1
	.value	0x517
	.long	0x367
	.byte	0x28
	.uleb128 0xa
	.long	.LASF63
	.byte	0x1
	.value	0x518
	.long	0x313
	.byte	0x30
	.uleb128 0xa
	.long	.LASF62
	.byte	0x1
	.value	0x519
	.long	0x313
	.byte	0x34
	.uleb128 0x13
	.string	"id"
	.byte	0x1
	.value	0x51a
	.long	0x313
	.byte	0x38
	.byte	0
	.uleb128 0x12
	.long	.LASF85
	.byte	0x20
	.byte	0x1
	.value	0x618
	.long	0x7de
	.uleb128 0xa
	.long	.LASF61
	.byte	0x1
	.value	0x61a
	.long	0x3a9
	.byte	0
	.uleb128 0xa
	.long	.LASF86
	.byte	0x1
	.value	0x61b
	.long	0x367
	.byte	0x8
	.uleb128 0xa
	.long	.LASF63
	.byte	0x1
	.value	0x61c
	.long	0x313
	.byte	0x10
	.uleb128 0xa
	.long	.LASF62
	.byte	0x1
	.value	0x61d
	.long	0x313
	.byte	0x14
	.uleb128 0x13
	.string	"id"
	.byte	0x1
	.value	0x61e
	.long	0x313
	.byte	0x18
	.uleb128 0xa
	.long	.LASF67
	.byte	0x1
	.value	0x61f
	.long	0x313
	.byte	0x1c
	.byte	0
	.uleb128 0x14
	.long	.LASF120
	.byte	0x1
	.value	0x3b9
	.long	0x3a9
	.byte	0x3
	.long	0x85c
	.uleb128 0x15
	.long	.LASF61
	.byte	0x1
	.value	0x3b9
	.long	0x3a9
	.uleb128 0x15
	.long	.LASF79
	.byte	0x1
	.value	0x3b9
	.long	0x313
	.uleb128 0x16
	.long	.LASF75
	.byte	0x1
	.value	0x3bb
	.long	0x3a9
	.uleb128 0x16
	.long	.LASF87
	.byte	0x1
	.value	0x3bc
	.long	0x367
	.uleb128 0x16
	.long	.LASF88
	.byte	0x1
	.value	0x3bd
	.long	0x367
	.uleb128 0x17
	.string	"min"
	.byte	0x1
	.value	0x3bf
	.long	0x313
	.uleb128 0x17
	.string	"max"
	.byte	0x1
	.value	0x3c0
	.long	0x313
	.uleb128 0x17
	.string	"sum"
	.byte	0x1
	.value	0x3c1
	.long	0x313
	.uleb128 0x18
	.uleb128 0x17
	.string	"i"
	.byte	0x1
	.value	0x3c3
	.long	0x313
	.byte	0
	.byte	0
	.uleb128 0x19
	.long	.LASF182
	.byte	0x1
	.byte	0x2a
	.long	0x313
	.byte	0x3
	.uleb128 0x1a
	.long	.LASF152
	.byte	0x1
	.value	0x58b
	.byte	0x3
	.long	0x882
	.uleb128 0x15
	.long	.LASF89
	.byte	0x1
	.value	0x58b
	.long	0x3a9
	.byte	0
	.uleb128 0x1b
	.long	.LASF91
	.byte	0x1
	.byte	0xdb
	.long	0xa8
	.quad	.LFB2266
	.quad	.LFE2266-.LFB2266
	.uleb128 0x1
	.byte	0x9c
	.long	0x8ec
	.uleb128 0x1c
	.string	"arg"
	.byte	0x1
	.byte	0xdb
	.long	0xa8
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1d
	.long	.LASF90
	.byte	0x1
	.byte	0xdd
	.long	0x8ec
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1e
	.long	.LASF88
	.byte	0x1
	.byte	0xde
	.long	0x367
	.long	.LLST0
	.uleb128 0x1f
	.quad	.LBB17
	.quad	.LBE17-.LBB17
	.uleb128 0x20
	.string	"i"
	.byte	0x1
	.byte	0xe1
	.long	0x313
	.long	.LLST1
	.byte	0
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x378
	.uleb128 0x21
	.long	.LASF92
	.byte	0x1
	.value	0x1c0
	.long	0xa8
	.quad	.LFB2272
	.quad	.LFE2272-.LFB2272
	.uleb128 0x1
	.byte	0x9c
	.long	0x963
	.uleb128 0x22
	.string	"arg"
	.byte	0x1
	.value	0x1c0
	.long	0xa8
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x23
	.long	.LASF90
	.byte	0x1
	.value	0x1c2
	.long	0x963
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x24
	.long	.LASF88
	.byte	0x1
	.value	0x1c3
	.long	0x367
	.long	.LLST2
	.uleb128 0x23
	.long	.LASF67
	.byte	0x1
	.value	0x1c4
	.long	0x313
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x25
	.long	.Ldebug_ranges0+0
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x1c7
	.long	0x313
	.long	.LLST3
	.byte	0
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x3f1
	.uleb128 0x21
	.long	.LASF93
	.byte	0x1
	.value	0x23a
	.long	0xa8
	.quad	.LFB2275
	.quad	.LFE2275-.LFB2275
	.uleb128 0x1
	.byte	0x9c
	.long	0xa1a
	.uleb128 0x22
	.string	"arg"
	.byte	0x1
	.value	0x23a
	.long	0xa8
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x23
	.long	.LASF90
	.byte	0x1
	.value	0x23c
	.long	0xa1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x24
	.long	.LASF88
	.byte	0x1
	.value	0x23d
	.long	0x367
	.long	.LLST4
	.uleb128 0x23
	.long	.LASF70
	.byte	0x1
	.value	0x23e
	.long	0x313
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x24
	.long	.LASF94
	.byte	0x1
	.value	0x23f
	.long	0x313
	.long	.LLST5
	.uleb128 0x26
	.string	"min"
	.byte	0x1
	.value	0x242
	.long	0x313
	.long	.LLST6
	.uleb128 0x26
	.string	"max"
	.byte	0x1
	.value	0x243
	.long	0x313
	.long	.LLST7
	.uleb128 0x26
	.string	"sum"
	.byte	0x1
	.value	0x244
	.long	0x313
	.long	.LLST8
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x30
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x246
	.long	0x313
	.long	.LLST9
	.byte	0
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x433
	.uleb128 0x21
	.long	.LASF95
	.byte	0x1
	.value	0x2c0
	.long	0xa8
	.quad	.LFB2278
	.quad	.LFE2278-.LFB2278
	.uleb128 0x1
	.byte	0x9c
	.long	0xa93
	.uleb128 0x22
	.string	"arg"
	.byte	0x1
	.value	0x2c0
	.long	0xa8
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x23
	.long	.LASF90
	.byte	0x1
	.value	0x2c2
	.long	0xa93
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x24
	.long	.LASF88
	.byte	0x1
	.value	0x2c3
	.long	0x367
	.long	.LLST10
	.uleb128 0x24
	.long	.LASF86
	.byte	0x1
	.value	0x2c4
	.long	0x367
	.long	.LLST11
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x60
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x2c9
	.long	0x313
	.long	.LLST12
	.byte	0
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x4b5
	.uleb128 0x21
	.long	.LASF96
	.byte	0x1
	.value	0x327
	.long	0xa8
	.quad	.LFB2281
	.quad	.LFE2281-.LFB2281
	.uleb128 0x1
	.byte	0x9c
	.long	0xb0c
	.uleb128 0x22
	.string	"arg"
	.byte	0x1
	.value	0x327
	.long	0xa8
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x23
	.long	.LASF90
	.byte	0x1
	.value	0x329
	.long	0xb0c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x24
	.long	.LASF88
	.byte	0x1
	.value	0x32a
	.long	0x367
	.long	.LLST13
	.uleb128 0x24
	.long	.LASF86
	.byte	0x1
	.value	0x32b
	.long	0x367
	.long	.LLST14
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x90
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x32f
	.long	0x313
	.long	.LLST15
	.byte	0
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x4f7
	.uleb128 0x21
	.long	.LASF97
	.byte	0x1
	.value	0x372
	.long	0xa8
	.quad	.LFB2283
	.quad	.LFE2283-.LFB2283
	.uleb128 0x1
	.byte	0x9c
	.long	0xbe7
	.uleb128 0x27
	.string	"arg"
	.byte	0x1
	.value	0x372
	.long	0xa8
	.long	.LLST16
	.uleb128 0x24
	.long	.LASF90
	.byte	0x1
	.value	0x374
	.long	0xbe7
	.long	.LLST16
	.uleb128 0x23
	.long	.LASF88
	.byte	0x1
	.value	0x375
	.long	0x367
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x23
	.long	.LASF86
	.byte	0x1
	.value	0x376
	.long	0x367
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x24
	.long	.LASF98
	.byte	0x1
	.value	0x378
	.long	0x313
	.long	.LLST18
	.uleb128 0x1f
	.quad	.LBB26
	.quad	.LBE26-.LBB26
	.uleb128 0x24
	.long	.LASF63
	.byte	0x1
	.value	0x379
	.long	0x313
	.long	.LLST19
	.uleb128 0x1f
	.quad	.LBB27
	.quad	.LBE27-.LBB27
	.uleb128 0x24
	.long	.LASF99
	.byte	0x1
	.value	0x37b
	.long	0x313
	.long	.LLST20
	.uleb128 0x1f
	.quad	.LBB28
	.quad	.LBE28-.LBB28
	.uleb128 0x24
	.long	.LASF100
	.byte	0x1
	.value	0x37c
	.long	0x313
	.long	.LLST21
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x539
	.uleb128 0x21
	.long	.LASF101
	.byte	0x1
	.value	0x3e1
	.long	0xa8
	.quad	.LFB2286
	.quad	.LFE2286-.LFB2286
	.uleb128 0x1
	.byte	0x9c
	.long	0xc9e
	.uleb128 0x22
	.string	"arg"
	.byte	0x1
	.value	0x3e1
	.long	0xa8
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x23
	.long	.LASF90
	.byte	0x1
	.value	0x3e3
	.long	0xc9e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x24
	.long	.LASF88
	.byte	0x1
	.value	0x3e4
	.long	0x367
	.long	.LLST22
	.uleb128 0x24
	.long	.LASF86
	.byte	0x1
	.value	0x3e5
	.long	0x367
	.long	.LLST23
	.uleb128 0x23
	.long	.LASF79
	.byte	0x1
	.value	0x3e6
	.long	0xca4
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x26
	.string	"min"
	.byte	0x1
	.value	0x3eb
	.long	0x313
	.long	.LLST24
	.uleb128 0x26
	.string	"max"
	.byte	0x1
	.value	0x3ec
	.long	0x313
	.long	.LLST25
	.uleb128 0x26
	.string	"sum"
	.byte	0x1
	.value	0x3ed
	.long	0x313
	.long	.LLST26
	.uleb128 0x25
	.long	.Ldebug_ranges0+0xc0
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x3ef
	.long	0x313
	.long	.LLST27
	.byte	0
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x57b
	.uleb128 0x7
	.long	0x313
	.uleb128 0x21
	.long	.LASF102
	.byte	0x1
	.value	0x44c
	.long	0xa8
	.quad	.LFB2288
	.quad	.LFE2288-.LFB2288
	.uleb128 0x1
	.byte	0x9c
	.long	0xd58
	.uleb128 0x22
	.string	"arg"
	.byte	0x1
	.value	0x44c
	.long	0xa8
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x23
	.long	.LASF90
	.byte	0x1
	.value	0x44e
	.long	0xd58
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x24
	.long	.LASF88
	.byte	0x1
	.value	0x44f
	.long	0x367
	.long	.LLST28
	.uleb128 0x24
	.long	.LASF86
	.byte	0x1
	.value	0x450
	.long	0x367
	.long	.LLST29
	.uleb128 0x23
	.long	.LASF79
	.byte	0x1
	.value	0x451
	.long	0xca4
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x28
	.string	"min"
	.byte	0x1
	.value	0x456
	.long	0x313
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x26
	.string	"max"
	.byte	0x1
	.value	0x457
	.long	0x313
	.long	.LLST30
	.uleb128 0x26
	.string	"sum"
	.byte	0x1
	.value	0x458
	.long	0x313
	.long	.LLST31
	.uleb128 0x25
	.long	.Ldebug_ranges0+0xf0
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x45a
	.long	0x313
	.long	.LLST32
	.byte	0
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x5fd
	.uleb128 0x21
	.long	.LASF103
	.byte	0x1
	.value	0x4b3
	.long	0xa8
	.quad	.LFB2290
	.quad	.LFE2290-.LFB2290
	.uleb128 0x1
	.byte	0x9c
	.long	0xe11
	.uleb128 0x22
	.string	"arg"
	.byte	0x1
	.value	0x4b3
	.long	0xa8
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x23
	.long	.LASF90
	.byte	0x1
	.value	0x4b5
	.long	0xe11
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x24
	.long	.LASF104
	.byte	0x1
	.value	0x4b6
	.long	0x367
	.long	.LLST33
	.uleb128 0x24
	.long	.LASF105
	.byte	0x1
	.value	0x4b7
	.long	0x367
	.long	.LLST34
	.uleb128 0x24
	.long	.LASF86
	.byte	0x1
	.value	0x4b8
	.long	0x367
	.long	.LLST35
	.uleb128 0x26
	.string	"min"
	.byte	0x1
	.value	0x4be
	.long	0x313
	.long	.LLST36
	.uleb128 0x26
	.string	"max"
	.byte	0x1
	.value	0x4bf
	.long	0x313
	.long	.LLST37
	.uleb128 0x26
	.string	"sum"
	.byte	0x1
	.value	0x4c0
	.long	0x313
	.long	.LLST38
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x120
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x4c2
	.long	0x313
	.long	.LLST39
	.byte	0
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x67f
	.uleb128 0x21
	.long	.LASF106
	.byte	0x1
	.value	0x51e
	.long	0xa8
	.quad	.LFB2292
	.quad	.LFE2292-.LFB2292
	.uleb128 0x1
	.byte	0x9c
	.long	0xf52
	.uleb128 0x27
	.string	"arg"
	.byte	0x1
	.value	0x51e
	.long	0xa8
	.long	.LLST40
	.uleb128 0x24
	.long	.LASF90
	.byte	0x1
	.value	0x520
	.long	0xf52
	.long	.LLST40
	.uleb128 0x23
	.long	.LASF104
	.byte	0x1
	.value	0x521
	.long	0x367
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x23
	.long	.LASF105
	.byte	0x1
	.value	0x522
	.long	0x367
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x24
	.long	.LASF86
	.byte	0x1
	.value	0x523
	.long	0x367
	.long	.LLST42
	.uleb128 0x26
	.string	"min"
	.byte	0x1
	.value	0x525
	.long	0x313
	.long	.LLST43
	.uleb128 0x26
	.string	"max"
	.byte	0x1
	.value	0x526
	.long	0x313
	.long	.LLST44
	.uleb128 0x26
	.string	"sum"
	.byte	0x1
	.value	0x527
	.long	0x313
	.long	.LLST45
	.uleb128 0x24
	.long	.LASF98
	.byte	0x1
	.value	0x52b
	.long	0x313
	.long	.LLST46
	.uleb128 0x1f
	.quad	.LBB35
	.quad	.LBE35-.LBB35
	.uleb128 0x26
	.string	"y"
	.byte	0x1
	.value	0x52c
	.long	0x313
	.long	.LLST47
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x150
	.uleb128 0x24
	.long	.LASF99
	.byte	0x1
	.value	0x52e
	.long	0x313
	.long	.LLST48
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x180
	.uleb128 0x26
	.string	"x"
	.byte	0x1
	.value	0x52f
	.long	0x313
	.long	.LLST49
	.uleb128 0x1f
	.quad	.LBB38
	.quad	.LBE38-.LBB38
	.uleb128 0x24
	.long	.LASF107
	.byte	0x1
	.value	0x531
	.long	0x313
	.long	.LLST50
	.uleb128 0x1f
	.quad	.LBB39
	.quad	.LBE39-.LBB39
	.uleb128 0x26
	.string	"z"
	.byte	0x1
	.value	0x532
	.long	0x313
	.long	.LLST51
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x701
	.uleb128 0x21
	.long	.LASF108
	.byte	0x1
	.value	0x622
	.long	0xa8
	.quad	.LFB2302
	.quad	.LFE2302-.LFB2302
	.uleb128 0x1
	.byte	0x9c
	.long	0xfd9
	.uleb128 0x22
	.string	"arg"
	.byte	0x1
	.value	0x622
	.long	0xa8
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x23
	.long	.LASF90
	.byte	0x1
	.value	0x624
	.long	0xfd9
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x24
	.long	.LASF88
	.byte	0x1
	.value	0x625
	.long	0x367
	.long	.LLST52
	.uleb128 0x23
	.long	.LASF67
	.byte	0x1
	.value	0x627
	.long	0x313
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x24
	.long	.LASF109
	.byte	0x1
	.value	0x628
	.long	0x313
	.long	.LLST53
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x1b0
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x629
	.long	0x313
	.long	.LLST54
	.byte	0
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x783
	.uleb128 0x29
	.long	.LASF110
	.byte	0x1
	.byte	0x51
	.quad	.LFB2256
	.quad	.LFE2256-.LFB2256
	.uleb128 0x1
	.byte	0x9c
	.long	0x100a
	.uleb128 0x2a
	.long	.LASF65
	.byte	0x1
	.byte	0x51
	.long	0x313
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x29
	.long	.LASF111
	.byte	0x1
	.byte	0x59
	.quad	.LFB2257
	.quad	.LFE2257-.LFB2257
	.uleb128 0x1
	.byte	0x9c
	.long	0x1035
	.uleb128 0x2a
	.long	.LASF109
	.byte	0x1
	.byte	0x59
	.long	0x2aa
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x29
	.long	.LASF112
	.byte	0x1
	.byte	0x61
	.quad	.LFB2258
	.quad	.LFE2258-.LFB2258
	.uleb128 0x1
	.byte	0x9c
	.long	0x1062
	.uleb128 0x2b
	.long	.LASF113
	.byte	0x1
	.byte	0x61
	.long	0x2aa
	.long	.LLST55
	.byte	0
	.uleb128 0x29
	.long	.LASF114
	.byte	0x1
	.byte	0x6c
	.quad	.LFB2259
	.quad	.LFE2259-.LFB2259
	.uleb128 0x1
	.byte	0x9c
	.long	0x111d
	.uleb128 0x2b
	.long	.LASF61
	.byte	0x1
	.byte	0x6c
	.long	0x3a9
	.long	.LLST56
	.uleb128 0x1e
	.long	.LASF88
	.byte	0x1
	.byte	0x6e
	.long	0x367
	.long	.LLST57
	.uleb128 0x1e
	.long	.LASF115
	.byte	0x1
	.byte	0x6f
	.long	0x313
	.long	.LLST58
	.uleb128 0x2c
	.quad	.LBB44
	.quad	.LBE44-.LBB44
	.long	0x10ea
	.uleb128 0x20
	.string	"i"
	.byte	0x1
	.byte	0x73
	.long	0x313
	.long	.LLST59
	.uleb128 0x2d
	.quad	.LVL153
	.long	0x3edb
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC15
	.byte	0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL148
	.long	0x3edb
	.long	0x1109
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC14
	.byte	0
	.uleb128 0x2d
	.quad	.LVL155
	.long	0x3ef2
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF116
	.byte	0x1
	.byte	0x7e
	.quad	.LFB2260
	.quad	.LFE2260-.LFB2260
	.uleb128 0x1
	.byte	0x9c
	.long	0x11d8
	.uleb128 0x2b
	.long	.LASF61
	.byte	0x1
	.byte	0x7e
	.long	0x3a9
	.long	.LLST60
	.uleb128 0x30
	.string	"row"
	.byte	0x1
	.byte	0x7e
	.long	0x11d8
	.long	.LLST61
	.uleb128 0x1e
	.long	.LASF88
	.byte	0x1
	.byte	0x80
	.long	0x367
	.long	.LLST62
	.uleb128 0x2c
	.quad	.LBB45
	.quad	.LBE45-.LBB45
	.long	0x11a5
	.uleb128 0x20
	.string	"i"
	.byte	0x1
	.byte	0x83
	.long	0x313
	.long	.LLST63
	.uleb128 0x2d
	.quad	.LVL170
	.long	0x3edb
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC17
	.byte	0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL166
	.long	0x3edb
	.long	0x11c4
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC17
	.byte	0
	.uleb128 0x31
	.quad	.LVL172
	.long	0x3ef2
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x2aa
	.uleb128 0x29
	.long	.LASF117
	.byte	0x1
	.byte	0x8e
	.quad	.LFB2261
	.quad	.LFE2261-.LFB2261
	.uleb128 0x1
	.byte	0x9c
	.long	0x1258
	.uleb128 0x2b
	.long	.LASF61
	.byte	0x1
	.byte	0x8e
	.long	0x3a9
	.long	.LLST64
	.uleb128 0x2b
	.long	.LASF118
	.byte	0x1
	.byte	0x8e
	.long	0x11d8
	.long	.LLST65
	.uleb128 0x1e
	.long	.LASF88
	.byte	0x1
	.byte	0x90
	.long	0x367
	.long	.LLST66
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x1e0
	.uleb128 0x1e
	.long	.LASF115
	.byte	0x1
	.byte	0x92
	.long	0x313
	.long	.LLST67
	.uleb128 0x2d
	.quad	.LVL177
	.long	0x3edb
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC19
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF119
	.byte	0x1
	.byte	0x9c
	.quad	.LFB2262
	.quad	.LFE2262-.LFB2262
	.uleb128 0x1
	.byte	0x9c
	.long	0x12be
	.uleb128 0x2b
	.long	.LASF61
	.byte	0x1
	.byte	0x9c
	.long	0x12be
	.long	.LLST68
	.uleb128 0x30
	.string	"row"
	.byte	0x1
	.byte	0x9c
	.long	0x11d8
	.long	.LLST69
	.uleb128 0x2b
	.long	.LASF118
	.byte	0x1
	.byte	0x9c
	.long	0x11d8
	.long	.LLST70
	.uleb128 0x31
	.quad	.LVL186
	.long	0x3edb
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC19
	.byte	0
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x12c4
	.uleb128 0x7
	.long	0x36d
	.uleb128 0x32
	.long	.LASF121
	.byte	0x1
	.byte	0xc0
	.long	0x3a9
	.byte	0x3
	.long	0x12fb
	.uleb128 0x33
	.long	.LASF61
	.byte	0x1
	.byte	0xc2
	.long	0x3a9
	.uleb128 0x33
	.long	.LASF122
	.byte	0x1
	.byte	0xc4
	.long	0x367
	.uleb128 0x18
	.uleb128 0x34
	.string	"i"
	.byte	0x1
	.byte	0xc5
	.long	0x313
	.byte	0
	.byte	0
	.uleb128 0x32
	.long	.LASF123
	.byte	0x1
	.byte	0xaa
	.long	0x3a9
	.byte	0x3
	.long	0x1317
	.uleb128 0x33
	.long	.LASF61
	.byte	0x1
	.byte	0xac
	.long	0x3a9
	.byte	0
	.uleb128 0x35
	.long	.LASF128
	.byte	0x1
	.byte	0xe9
	.long	0x3a9
	.quad	.LFB2267
	.quad	.LFE2267-.LFB2267
	.uleb128 0x1
	.byte	0x9c
	.long	0x153e
	.uleb128 0x1d
	.long	.LASF61
	.byte	0x1
	.byte	0xf0
	.long	0x3a9
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x36
	.long	0x1551
	.long	.LLST71
	.uleb128 0x1e
	.long	.LASF124
	.byte	0x1
	.byte	0xf2
	.long	0x153e
	.long	.LLST72
	.uleb128 0x1e
	.long	.LASF125
	.byte	0x1
	.byte	0xf4
	.long	0x8ec
	.long	.LLST73
	.uleb128 0x1e
	.long	.LASF62
	.byte	0x1
	.byte	0xf5
	.long	0x313
	.long	.LLST74
	.uleb128 0x37
	.long	0x12c9
	.quad	.LBB59
	.long	.Ldebug_ranges0+0x210
	.byte	0x1
	.byte	0xed
	.long	0x13ff
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x210
	.uleb128 0x38
	.long	0x12d9
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x39
	.long	0x12e4
	.long	.LLST75
	.uleb128 0x37
	.long	0x12fb
	.quad	.LBB61
	.long	.Ldebug_ranges0+0x250
	.byte	0x1
	.byte	0xc2
	.long	0x13ee
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x250
	.uleb128 0x39
	.long	0x130b
	.long	.LLST76
	.uleb128 0x3a
	.quad	.LVL187
	.long	0x3f0b
	.uleb128 0x2d
	.quad	.LVL189
	.long	0x3f0b
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x34
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x290
	.uleb128 0x39
	.long	0x12f0
	.long	.LLST77
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x37
	.long	0x12fb
	.quad	.LBB73
	.long	.Ldebug_ranges0+0x2c0
	.byte	0x1
	.byte	0xf0
	.long	0x1446
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x2c0
	.uleb128 0x39
	.long	0x130b
	.long	.LLST78
	.uleb128 0x3a
	.quad	.LVL197
	.long	0x3f0b
	.uleb128 0x2d
	.quad	.LVL199
	.long	0x3f0b
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x34
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3b
	.long	.Ldebug_ranges0+0x300
	.long	0x1472
	.uleb128 0x20
	.string	"i"
	.byte	0x1
	.byte	0xf6
	.long	0x313
	.long	.LLST79
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x330
	.uleb128 0x1e
	.long	.LASF126
	.byte	0x1
	.byte	0xf8
	.long	0x313
	.long	.LLST80
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB83
	.quad	.LBE83-.LBB83
	.long	0x14d8
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x102
	.long	0x313
	.long	.LLST81
	.uleb128 0x2d
	.quad	.LVL212
	.long	0x3f26
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xd
	.byte	0x7e
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x33
	.byte	0x24
	.byte	0x77
	.sleb128 0
	.byte	0x22
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	identity_worker
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0xd
	.byte	0x7e
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x34
	.byte	0x24
	.byte	0x7c
	.sleb128 0
	.byte	0x22
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB84
	.quad	.LBE84-.LBB84
	.long	0x150f
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x107
	.long	0x313
	.long	.LLST82
	.uleb128 0x2d
	.quad	.LVL215
	.long	0x3f70
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL202
	.long	0x3f90
	.long	0x1529
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x7f
	.sleb128 0
	.byte	0x34
	.byte	0x24
	.byte	0
	.uleb128 0x2d
	.quad	.LVL218
	.long	0x3fa6
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x2bc
	.long	0x1551
	.uleb128 0x3c
	.long	0xa1
	.long	0x1345
	.byte	0
	.uleb128 0x7
	.long	0xa1
	.uleb128 0x32
	.long	.LASF127
	.byte	0x1
	.byte	0xb4
	.long	0x3a9
	.byte	0x3
	.long	0x1572
	.uleb128 0x33
	.long	.LASF61
	.byte	0x1
	.byte	0xb6
	.long	0x3a9
	.byte	0
	.uleb128 0x3d
	.long	.LASF129
	.byte	0x1
	.value	0x11a
	.long	0x3a9
	.quad	.LFB2268
	.quad	.LFE2268-.LFB2268
	.uleb128 0x1
	.byte	0x9c
	.long	0x16af
	.uleb128 0x3e
	.long	.LASF65
	.byte	0x1
	.value	0x11a
	.long	0x313
	.long	.LLST83
	.uleb128 0x23
	.long	.LASF61
	.byte	0x1
	.value	0x11c
	.long	0x3a9
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x24
	.long	.LASF122
	.byte	0x1
	.value	0x11d
	.long	0x367
	.long	.LLST84
	.uleb128 0x24
	.long	.LASF59
	.byte	0x1
	.value	0x11f
	.long	0x367
	.long	.LLST85
	.uleb128 0x26
	.string	"min"
	.byte	0x1
	.value	0x123
	.long	0x313
	.long	.LLST86
	.uleb128 0x26
	.string	"max"
	.byte	0x1
	.value	0x124
	.long	0x313
	.long	.LLST87
	.uleb128 0x26
	.string	"sum"
	.byte	0x1
	.value	0x125
	.long	0x313
	.long	.LLST88
	.uleb128 0x3f
	.long	0x1556
	.quad	.LBB90
	.long	.Ldebug_ranges0+0x360
	.byte	0x1
	.value	0x11c
	.long	0x1658
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x360
	.uleb128 0x39
	.long	0x1566
	.long	.LLST89
	.uleb128 0x2f
	.quad	.LVL226
	.long	0x3f90
	.long	0x1640
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x2d
	.quad	.LVL228
	.long	0x3f90
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x7d
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB96
	.quad	.LBE96-.LBB96
	.long	0x1694
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x127
	.long	0x313
	.long	.LLST90
	.uleb128 0x40
	.long	0x85c
	.quad	.LBB97
	.quad	.LBE97-.LBB97
	.byte	0x1
	.value	0x129
	.byte	0
	.uleb128 0x2d
	.quad	.LVL230
	.long	0x3f0b
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xa
	.value	0x7fff
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x34
	.byte	0
	.byte	0
	.uleb128 0x3d
	.long	.LASF130
	.byte	0x1
	.value	0x160
	.long	0x3a9
	.quad	.LFB2270
	.quad	.LFE2270-.LFB2270
	.uleb128 0x1
	.byte	0x9c
	.long	0x176f
	.uleb128 0x3e
	.long	.LASF65
	.byte	0x1
	.value	0x160
	.long	0x313
	.long	.LLST91
	.uleb128 0x16
	.long	.LASF61
	.byte	0x1
	.value	0x167
	.long	0x3a9
	.uleb128 0x16
	.long	.LASF71
	.byte	0x1
	.value	0x169
	.long	0x367
	.uleb128 0x16
	.long	.LASF72
	.byte	0x1
	.value	0x16a
	.long	0x367
	.uleb128 0x16
	.long	.LASF73
	.byte	0x1
	.value	0x16b
	.long	0x367
	.uleb128 0x16
	.long	.LASF124
	.byte	0x1
	.value	0x16e
	.long	0x176f
	.uleb128 0x16
	.long	.LASF125
	.byte	0x1
	.value	0x170
	.long	0x177e
	.uleb128 0x16
	.long	.LASF62
	.byte	0x1
	.value	0x171
	.long	0x313
	.uleb128 0x17
	.string	"min"
	.byte	0x1
	.value	0x184
	.long	0x313
	.uleb128 0x17
	.string	"max"
	.byte	0x1
	.value	0x185
	.long	0x313
	.uleb128 0x17
	.string	"sum"
	.byte	0x1
	.value	0x186
	.long	0x313
	.uleb128 0x2d
	.quad	.LVL245
	.long	0x1572
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x2bc
	.long	0x177e
	.uleb128 0x41
	.long	0xa1
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x3af
	.uleb128 0x14
	.long	.LASF131
	.byte	0x1
	.value	0x19e
	.long	0x3a9
	.byte	0x3
	.long	0x17c6
	.uleb128 0x15
	.long	.LASF67
	.byte	0x1
	.value	0x19e
	.long	0x313
	.uleb128 0x16
	.long	.LASF61
	.byte	0x1
	.value	0x1a5
	.long	0x3a9
	.uleb128 0x16
	.long	.LASF122
	.byte	0x1
	.value	0x1a7
	.long	0x367
	.uleb128 0x18
	.uleb128 0x17
	.string	"i"
	.byte	0x1
	.value	0x1a9
	.long	0x313
	.byte	0
	.byte	0
	.uleb128 0x3d
	.long	.LASF132
	.byte	0x1
	.value	0x1cf
	.long	0x3a9
	.quad	.LFB2273
	.quad	.LFE2273-.LFB2273
	.uleb128 0x1
	.byte	0x9c
	.long	0x1ac8
	.uleb128 0x3e
	.long	.LASF67
	.byte	0x1
	.value	0x1cf
	.long	0x313
	.long	.LLST92
	.uleb128 0x23
	.long	.LASF61
	.byte	0x1
	.value	0x1db
	.long	0x3a9
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x36
	.long	0x1adb
	.long	.LLST93
	.uleb128 0x24
	.long	.LASF124
	.byte	0x1
	.value	0x1dd
	.long	0x1ac8
	.long	.LLST94
	.uleb128 0x24
	.long	.LASF125
	.byte	0x1
	.value	0x1df
	.long	0x963
	.long	.LLST95
	.uleb128 0x24
	.long	.LASF62
	.byte	0x1
	.value	0x1e1
	.long	0x313
	.long	.LLST96
	.uleb128 0x42
	.long	0x1784
	.quad	.LBB114
	.quad	.LBE114-.LBB114
	.byte	0x1
	.value	0x1d8
	.long	0x1908
	.uleb128 0x43
	.long	0x1795
	.long	.LLST97
	.uleb128 0x1f
	.quad	.LBB115
	.quad	.LBE115-.LBB115
	.uleb128 0x38
	.long	0x17a1
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x39
	.long	0x17ad
	.long	.LLST98
	.uleb128 0x42
	.long	0x1556
	.quad	.LBB116
	.quad	.LBE116-.LBB116
	.byte	0x1
	.value	0x1a5
	.long	0x18eb
	.uleb128 0x1f
	.quad	.LBB117
	.quad	.LBE117-.LBB117
	.uleb128 0x39
	.long	0x1566
	.long	.LLST99
	.uleb128 0x2f
	.quad	.LVL249
	.long	0x3f90
	.long	0x18d3
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x2d
	.quad	.LVL251
	.long	0x3f90
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x7c
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1f
	.quad	.LBB118
	.quad	.LBE118-.LBB118
	.uleb128 0x39
	.long	0x17ba
	.long	.LLST100
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3f
	.long	0x1556
	.quad	.LBB119
	.long	.Ldebug_ranges0+0x3a0
	.byte	0x1
	.value	0x1db
	.long	0x195f
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x3a0
	.uleb128 0x39
	.long	0x1566
	.long	.LLST101
	.uleb128 0x2f
	.quad	.LVL261
	.long	0x3f90
	.long	0x1946
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x2d
	.quad	.LVL263
	.long	0x3f90
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x5
	.byte	0x76
	.sleb128 -64
	.byte	0x6
	.byte	0x32
	.byte	0x24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3b
	.long	.Ldebug_ranges0+0x3d0
	.long	0x198d
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x1e2
	.long	0x313
	.long	.LLST102
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x400
	.uleb128 0x24
	.long	.LASF126
	.byte	0x1
	.value	0x1e4
	.long	0x313
	.long	.LLST103
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB127
	.quad	.LBE127-.LBB127
	.long	0x19fe
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x1ef
	.long	0x313
	.long	.LLST104
	.uleb128 0x2d
	.quad	.LVL276
	.long	0x3f26
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xd
	.byte	0x7d
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x33
	.byte	0x24
	.byte	0x77
	.sleb128 0
	.byte	0x22
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	uniform_worker
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x18
	.byte	0x7d
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x31
	.byte	0x24
	.byte	0x7d
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x22
	.byte	0x33
	.byte	0x24
	.byte	0x7f
	.sleb128 0
	.byte	0x22
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB128
	.quad	.LBE128-.LBB128
	.long	0x1a35
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x1fe
	.long	0x313
	.long	.LLST105
	.uleb128 0x2d
	.quad	.LVL285
	.long	0x3f70
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x42
	.long	0x12fb
	.quad	.LBB129
	.quad	.LBE129-.LBB129
	.byte	0x1
	.value	0x1d3
	.long	0x1a9d
	.uleb128 0x1f
	.quad	.LBB130
	.quad	.LBE130-.LBB130
	.uleb128 0x39
	.long	0x130b
	.long	.LLST106
	.uleb128 0x2f
	.quad	.LVL293
	.long	0x3f0b
	.long	0x1a88
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x2d
	.quad	.LVL295
	.long	0x3f0b
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x34
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL265
	.long	0x3f90
	.long	0x1aba
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x7
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x33
	.byte	0x1e
	.byte	0x33
	.byte	0x24
	.byte	0
	.uleb128 0x3a
	.quad	.LVL281
	.long	0x3fa6
	.byte	0
	.uleb128 0xc
	.long	0x2bc
	.long	0x1adb
	.uleb128 0x3c
	.long	0xa1
	.long	0x1806
	.byte	0
	.uleb128 0x7
	.long	0xa1
	.uleb128 0x14
	.long	.LASF133
	.byte	0x1
	.value	0x20a
	.long	0x3a9
	.byte	0x3
	.long	0x1b5e
	.uleb128 0x15
	.long	.LASF134
	.byte	0x1
	.value	0x20a
	.long	0xca4
	.uleb128 0x15
	.long	.LASF135
	.byte	0x1
	.value	0x20a
	.long	0xca4
	.uleb128 0x16
	.long	.LASF61
	.byte	0x1
	.value	0x20c
	.long	0x3a9
	.uleb128 0x16
	.long	.LASF122
	.byte	0x1
	.value	0x20d
	.long	0x367
	.uleb128 0x16
	.long	.LASF94
	.byte	0x1
	.value	0x20f
	.long	0x313
	.uleb128 0x17
	.string	"min"
	.byte	0x1
	.value	0x211
	.long	0x313
	.uleb128 0x17
	.string	"max"
	.byte	0x1
	.value	0x212
	.long	0x313
	.uleb128 0x17
	.string	"sum"
	.byte	0x1
	.value	0x213
	.long	0x313
	.uleb128 0x18
	.uleb128 0x17
	.string	"i"
	.byte	0x1
	.value	0x215
	.long	0x313
	.byte	0
	.byte	0
	.uleb128 0x3d
	.long	.LASF136
	.byte	0x1
	.value	0x257
	.long	0x3a9
	.quad	.LFB2276
	.quad	.LFE2276-.LFB2276
	.uleb128 0x1
	.byte	0x9c
	.long	0x1f57
	.uleb128 0x3e
	.long	.LASF134
	.byte	0x1
	.value	0x257
	.long	0xca4
	.long	.LLST107
	.uleb128 0x3e
	.long	.LASF135
	.byte	0x1
	.value	0x257
	.long	0xca4
	.long	.LLST108
	.uleb128 0x24
	.long	.LASF125
	.byte	0x1
	.value	0x267
	.long	0xa1a
	.long	.LLST109
	.uleb128 0x16
	.long	.LASF61
	.byte	0x1
	.value	0x268
	.long	0x3a9
	.uleb128 0x24
	.long	.LASF71
	.byte	0x1
	.value	0x26a
	.long	0x367
	.long	.LLST110
	.uleb128 0x24
	.long	.LASF72
	.byte	0x1
	.value	0x26b
	.long	0x367
	.long	.LLST111
	.uleb128 0x24
	.long	.LASF73
	.byte	0x1
	.value	0x26c
	.long	0x367
	.long	.LLST112
	.uleb128 0x36
	.long	0x1f6a
	.long	.LLST113
	.uleb128 0x24
	.long	.LASF124
	.byte	0x1
	.value	0x26e
	.long	0x1f57
	.long	.LLST114
	.uleb128 0x24
	.long	.LASF62
	.byte	0x1
	.value	0x270
	.long	0x313
	.long	.LLST115
	.uleb128 0x26
	.string	"min"
	.byte	0x1
	.value	0x28e
	.long	0x313
	.long	.LLST116
	.uleb128 0x26
	.string	"max"
	.byte	0x1
	.value	0x28f
	.long	0x313
	.long	.LLST117
	.uleb128 0x26
	.string	"sum"
	.byte	0x1
	.value	0x290
	.long	0x313
	.long	.LLST118
	.uleb128 0x42
	.long	0x12fb
	.quad	.LBB144
	.quad	.LBE144-.LBB144
	.byte	0x1
	.value	0x25d
	.long	0x1cad
	.uleb128 0x1f
	.quad	.LBB145
	.quad	.LBE145-.LBB145
	.uleb128 0x39
	.long	0x130b
	.long	.LLST119
	.uleb128 0x2f
	.quad	.LVL302
	.long	0x3f0b
	.long	0x1c98
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x2d
	.quad	.LVL304
	.long	0x3f0b
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x34
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3f
	.long	0x1ae0
	.quad	.LBB146
	.long	.Ldebug_ranges0+0x430
	.byte	0x1
	.value	0x264
	.long	0x1da4
	.uleb128 0x43
	.long	0x1afd
	.long	.LLST120
	.uleb128 0x43
	.long	0x1af1
	.long	.LLST121
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x430
	.uleb128 0x38
	.long	0x1b09
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x39
	.long	0x1b15
	.long	.LLST122
	.uleb128 0x39
	.long	0x1b21
	.long	.LLST123
	.uleb128 0x39
	.long	0x1b2d
	.long	.LLST124
	.uleb128 0x39
	.long	0x1b39
	.long	.LLST125
	.uleb128 0x39
	.long	0x1b45
	.long	.LLST126
	.uleb128 0x42
	.long	0x1556
	.quad	.LBB148
	.quad	.LBE148-.LBB148
	.byte	0x1
	.value	0x20c
	.long	0x1d76
	.uleb128 0x1f
	.quad	.LBB149
	.quad	.LBE149-.LBB149
	.uleb128 0x39
	.long	0x1566
	.long	.LLST127
	.uleb128 0x2f
	.quad	.LVL309
	.long	0x3f90
	.long	0x1d5e
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x2d
	.quad	.LVL311
	.long	0x3f90
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x7c
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB150
	.quad	.LBE150-.LBB150
	.long	0x1d95
	.uleb128 0x39
	.long	0x1b52
	.long	.LLST128
	.byte	0
	.uleb128 0x3a
	.quad	.LVL323
	.long	0x3fa6
	.byte	0
	.byte	0
	.uleb128 0x3f
	.long	0x1556
	.quad	.LBB154
	.long	.Ldebug_ranges0+0x470
	.byte	0x1
	.value	0x268
	.long	0x1df1
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x470
	.uleb128 0x39
	.long	0x1566
	.long	.LLST129
	.uleb128 0x2f
	.quad	.LVL332
	.long	0x3f90
	.long	0x1de2
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x3a
	.quad	.LVL334
	.long	0x3f90
	.byte	0
	.byte	0
	.uleb128 0x3b
	.long	.Ldebug_ranges0+0x4b0
	.long	0x1e1f
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x271
	.long	0x313
	.long	.LLST130
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x4f0
	.uleb128 0x24
	.long	.LASF126
	.byte	0x1
	.value	0x273
	.long	0x313
	.long	.LLST131
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB164
	.quad	.LBE164-.LBB164
	.long	0x1e86
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x283
	.long	0x313
	.long	.LLST132
	.uleb128 0x2d
	.quad	.LVL353
	.long	0x3f26
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xd
	.byte	0x7c
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x33
	.byte	0x24
	.byte	0x7f
	.sleb128 0
	.byte	0x22
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	sequence_worker
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0xe
	.byte	0x7c
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x8
	.byte	0x38
	.byte	0x1e
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB165
	.quad	.LBE165-.LBB165
	.long	0x1ebd
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x292
	.long	0x313
	.long	.LLST133
	.uleb128 0x2d
	.quad	.LVL365
	.long	0x3f70
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x3a
	.quad	.LVL327
	.long	0x17c6
	.uleb128 0x2f
	.quad	.LVL330
	.long	0x3f90
	.long	0x1eeb
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xb
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0x36
	.byte	0x24
	.byte	0x7f
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x16
	.byte	0
	.uleb128 0x2f
	.quad	.LVL336
	.long	0x3f90
	.long	0x1f03
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL338
	.long	0x3f90
	.long	0x1f1b
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL340
	.long	0x3f90
	.long	0x1f33
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x3a
	.quad	.LVL357
	.long	0x3fa6
	.uleb128 0x2d
	.quad	.LVL372
	.long	0x3fa6
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -112
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x2bc
	.long	0x1f6a
	.uleb128 0x3c
	.long	0xa1
	.long	0x1bec
	.byte	0
	.uleb128 0x7
	.long	0xa1
	.uleb128 0x14
	.long	.LASF137
	.byte	0x1
	.value	0x2aa
	.long	0x3a9
	.byte	0x3
	.long	0x1f99
	.uleb128 0x15
	.long	.LASF61
	.byte	0x1
	.value	0x2aa
	.long	0x3a9
	.uleb128 0x16
	.long	.LASF75
	.byte	0x1
	.value	0x2ac
	.long	0x3a9
	.byte	0
	.uleb128 0x3d
	.long	.LASF138
	.byte	0x1
	.value	0x2d6
	.long	0x3a9
	.quad	.LFB2279
	.quad	.LFE2279-.LFB2279
	.uleb128 0x1
	.byte	0x9c
	.long	0x220c
	.uleb128 0x3e
	.long	.LASF61
	.byte	0x1
	.value	0x2d6
	.long	0x3a9
	.long	.LLST134
	.uleb128 0x23
	.long	.LASF75
	.byte	0x1
	.value	0x2dd
	.long	0x3a9
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x36
	.long	0x221f
	.long	.LLST135
	.uleb128 0x24
	.long	.LASF124
	.byte	0x1
	.value	0x2df
	.long	0x220c
	.long	.LLST136
	.uleb128 0x24
	.long	.LASF125
	.byte	0x1
	.value	0x2e1
	.long	0xa93
	.long	.LLST137
	.uleb128 0x24
	.long	.LASF62
	.byte	0x1
	.value	0x2e2
	.long	0x313
	.long	.LLST138
	.uleb128 0x3f
	.long	0x1556
	.quad	.LBB178
	.long	.Ldebug_ranges0+0x520
	.byte	0x1
	.value	0x2dd
	.long	0x205f
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x520
	.uleb128 0x39
	.long	0x1566
	.long	.LLST139
	.uleb128 0x2f
	.quad	.LVL382
	.long	0x3f90
	.long	0x2050
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x3a
	.quad	.LVL385
	.long	0x3f90
	.byte	0
	.byte	0
	.uleb128 0x3b
	.long	.Ldebug_ranges0+0x550
	.long	0x208d
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x2e3
	.long	0x313
	.long	.LLST140
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x580
	.uleb128 0x24
	.long	.LASF126
	.byte	0x1
	.value	0x2e5
	.long	0x313
	.long	.LLST141
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB186
	.quad	.LBE186-.LBB186
	.long	0x20fe
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x2f0
	.long	0x313
	.long	.LLST142
	.uleb128 0x2d
	.quad	.LVL398
	.long	0x3f26
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xd
	.byte	0x7f
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x33
	.byte	0x24
	.byte	0x77
	.sleb128 0
	.byte	0x22
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	clone_worker
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x18
	.byte	0x7f
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x31
	.byte	0x24
	.byte	0x7f
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x22
	.byte	0x33
	.byte	0x24
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB187
	.quad	.LBE187-.LBB187
	.long	0x2135
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x2fb
	.long	0x313
	.long	.LLST143
	.uleb128 0x2d
	.quad	.LVL402
	.long	0x3f70
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x42
	.long	0x1f6f
	.quad	.LBB188
	.quad	.LBE188-.LBB188
	.byte	0x1
	.value	0x2da
	.long	0x21da
	.uleb128 0x43
	.long	0x1f80
	.long	.LLST144
	.uleb128 0x1f
	.quad	.LBB189
	.quad	.LBE189-.LBB189
	.uleb128 0x44
	.long	0x1f8c
	.uleb128 0x3f
	.long	0x1556
	.quad	.LBB190
	.long	.Ldebug_ranges0+0x5b0
	.byte	0x1
	.value	0x2ac
	.long	0x21c4
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x5b0
	.uleb128 0x39
	.long	0x1566
	.long	.LLST145
	.uleb128 0x2f
	.quad	.LVL414
	.long	0x3f90
	.long	0x21ae
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x2d
	.quad	.LVL417
	.long	0x3f90
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2d
	.quad	.LVL418
	.long	0x3fb8
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL387
	.long	0x3f90
	.long	0x21f7
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x7
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x33
	.byte	0x1e
	.byte	0x33
	.byte	0x24
	.byte	0
	.uleb128 0x2d
	.quad	.LVL405
	.long	0x3fa6
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x2bc
	.long	0x221f
	.uleb128 0x3c
	.long	0xa1
	.long	0x1fd9
	.byte	0
	.uleb128 0x7
	.long	0xa1
	.uleb128 0x14
	.long	.LASF139
	.byte	0x1
	.value	0x309
	.long	0x3a9
	.byte	0x3
	.long	0x2272
	.uleb128 0x15
	.long	.LASF61
	.byte	0x1
	.value	0x309
	.long	0x3a9
	.uleb128 0x16
	.long	.LASF75
	.byte	0x1
	.value	0x30b
	.long	0x3a9
	.uleb128 0x16
	.long	.LASF86
	.byte	0x1
	.value	0x30c
	.long	0x367
	.uleb128 0x16
	.long	.LASF122
	.byte	0x1
	.value	0x30d
	.long	0x367
	.uleb128 0x18
	.uleb128 0x17
	.string	"i"
	.byte	0x1
	.value	0x310
	.long	0x313
	.byte	0
	.byte	0
	.uleb128 0x3d
	.long	.LASF140
	.byte	0x1
	.value	0x337
	.long	0x3a9
	.quad	.LFB2282
	.quad	.LFE2282-.LFB2282
	.uleb128 0x1
	.byte	0x9c
	.long	0x2500
	.uleb128 0x3e
	.long	.LASF61
	.byte	0x1
	.value	0x337
	.long	0x3a9
	.long	.LLST146
	.uleb128 0x23
	.long	.LASF75
	.byte	0x1
	.value	0x33e
	.long	0x3a9
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x36
	.long	0x2513
	.long	.LLST147
	.uleb128 0x24
	.long	.LASF124
	.byte	0x1
	.value	0x340
	.long	0x2500
	.long	.LLST148
	.uleb128 0x24
	.long	.LASF125
	.byte	0x1
	.value	0x342
	.long	0xb0c
	.long	.LLST149
	.uleb128 0x24
	.long	.LASF62
	.byte	0x1
	.value	0x343
	.long	0x313
	.long	.LLST150
	.uleb128 0x42
	.long	0x2224
	.quad	.LBB205
	.quad	.LBE205-.LBB205
	.byte	0x1
	.value	0x33b
	.long	0x23ab
	.uleb128 0x43
	.long	0x2235
	.long	.LLST151
	.uleb128 0x1f
	.quad	.LBB206
	.quad	.LBE206-.LBB206
	.uleb128 0x38
	.long	0x2241
	.uleb128 0x1
	.byte	0x5d
	.uleb128 0x39
	.long	0x224d
	.long	.LLST152
	.uleb128 0x39
	.long	0x2259
	.long	.LLST153
	.uleb128 0x3f
	.long	0x1556
	.quad	.LBB207
	.long	.Ldebug_ranges0+0x5e0
	.byte	0x1
	.value	0x30b
	.long	0x238e
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x5e0
	.uleb128 0x39
	.long	0x1566
	.long	.LLST154
	.uleb128 0x2f
	.quad	.LVL427
	.long	0x3f90
	.long	0x2378
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x2d
	.quad	.LVL429
	.long	0x3f90
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1f
	.quad	.LBB211
	.quad	.LBE211-.LBB211
	.uleb128 0x39
	.long	0x2266
	.long	.LLST155
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3f
	.long	0x1556
	.quad	.LBB212
	.long	.Ldebug_ranges0+0x610
	.byte	0x1
	.value	0x33e
	.long	0x23f8
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x610
	.uleb128 0x39
	.long	0x1566
	.long	.LLST156
	.uleb128 0x2f
	.quad	.LVL440
	.long	0x3f90
	.long	0x23e9
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x3a
	.quad	.LVL443
	.long	0x3f90
	.byte	0
	.byte	0
	.uleb128 0x3b
	.long	.Ldebug_ranges0+0x640
	.long	0x2426
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x344
	.long	0x313
	.long	.LLST157
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x670
	.uleb128 0x24
	.long	.LASF126
	.byte	0x1
	.value	0x346
	.long	0x313
	.long	.LLST158
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB220
	.quad	.LBE220-.LBB220
	.long	0x2497
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x351
	.long	0x313
	.long	.LLST159
	.uleb128 0x2d
	.quad	.LVL456
	.long	0x3f26
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xd
	.byte	0x7f
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x33
	.byte	0x24
	.byte	0x77
	.sleb128 0
	.byte	0x22
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	reverse_worker
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x18
	.byte	0x7f
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x31
	.byte	0x24
	.byte	0x7f
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x22
	.byte	0x33
	.byte	0x24
	.byte	0x7d
	.sleb128 0
	.byte	0x22
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB221
	.quad	.LBE221-.LBB221
	.long	0x24ce
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x356
	.long	0x313
	.long	.LLST160
	.uleb128 0x2d
	.quad	.LVL459
	.long	0x3f70
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL445
	.long	0x3f90
	.long	0x24eb
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x7
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x33
	.byte	0x1e
	.byte	0x33
	.byte	0x24
	.byte	0
	.uleb128 0x2d
	.quad	.LVL462
	.long	0x3fa6
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x2bc
	.long	0x2513
	.uleb128 0x3c
	.long	0xa1
	.long	0x22b2
	.byte	0
	.uleb128 0x7
	.long	0xa1
	.uleb128 0x3d
	.long	.LASF141
	.byte	0x1
	.value	0x386
	.long	0x3a9
	.quad	.LFB2284
	.quad	.LFE2284-.LFB2284
	.uleb128 0x1
	.byte	0x9c
	.long	0x273a
	.uleb128 0x3e
	.long	.LASF61
	.byte	0x1
	.value	0x386
	.long	0x3a9
	.long	.LLST161
	.uleb128 0x24
	.long	.LASF142
	.byte	0x1
	.value	0x388
	.long	0x3a9
	.long	.LLST162
	.uleb128 0x23
	.long	.LASF75
	.byte	0x1
	.value	0x38e
	.long	0x3a9
	.uleb128 0x1
	.byte	0x5d
	.uleb128 0x36
	.long	0x274d
	.long	.LLST163
	.uleb128 0x24
	.long	.LASF124
	.byte	0x1
	.value	0x38f
	.long	0x273a
	.long	.LLST164
	.uleb128 0x24
	.long	.LASF125
	.byte	0x1
	.value	0x391
	.long	0xbe7
	.long	.LLST165
	.uleb128 0x24
	.long	.LASF62
	.byte	0x1
	.value	0x392
	.long	0x313
	.long	.LLST166
	.uleb128 0x3f
	.long	0x1556
	.quad	.LBB228
	.long	.Ldebug_ranges0+0x6a0
	.byte	0x1
	.value	0x38e
	.long	0x25f5
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x6a0
	.uleb128 0x39
	.long	0x1566
	.long	.LLST167
	.uleb128 0x2f
	.quad	.LVL472
	.long	0x3f90
	.long	0x25df
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x2d
	.quad	.LVL474
	.long	0x3f90
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3b
	.long	.Ldebug_ranges0+0x6d0
	.long	0x2623
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x393
	.long	0x313
	.long	.LLST168
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x700
	.uleb128 0x24
	.long	.LASF126
	.byte	0x1
	.value	0x395
	.long	0x313
	.long	.LLST169
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB236
	.quad	.LBE236-.LBB236
	.long	0x2694
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x3a0
	.long	0x313
	.long	.LLST170
	.uleb128 0x2d
	.quad	.LVL487
	.long	0x3f26
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xd
	.byte	0x7f
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x33
	.byte	0x24
	.byte	0x77
	.sleb128 0
	.byte	0x22
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	transpose_worker
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x18
	.byte	0x7f
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x31
	.byte	0x24
	.byte	0x7f
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x22
	.byte	0x33
	.byte	0x24
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB237
	.quad	.LBE237-.LBB237
	.long	0x26cb
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x3ab
	.long	0x313
	.long	.LLST171
	.uleb128 0x2d
	.quad	.LVL491
	.long	0x3f70
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x3a
	.quad	.LVL470
	.long	0x1317
	.uleb128 0x2f
	.quad	.LVL471
	.long	0x3fd5
	.long	0x26f0
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL476
	.long	0x3f90
	.long	0x270d
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x7
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x33
	.byte	0x1e
	.byte	0x33
	.byte	0x24
	.byte	0
	.uleb128 0x2f
	.quad	.LVL494
	.long	0x3fa6
	.long	0x2725
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2d
	.quad	.LVL502
	.long	0x1f99
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x2bc
	.long	0x274d
	.uleb128 0x3c
	.long	0xa1
	.long	0x2568
	.byte	0
	.uleb128 0x7
	.long	0xa1
	.uleb128 0x3d
	.long	.LASF143
	.byte	0x1
	.value	0x3ff
	.long	0x3a9
	.quad	.LFB2287
	.quad	.LFE2287-.LFB2287
	.uleb128 0x1
	.byte	0x9c
	.long	0x2a9c
	.uleb128 0x3e
	.long	.LASF61
	.byte	0x1
	.value	0x3ff
	.long	0x3a9
	.long	.LLST172
	.uleb128 0x3e
	.long	.LASF79
	.byte	0x1
	.value	0x3ff
	.long	0xca4
	.long	.LLST173
	.uleb128 0x16
	.long	.LASF75
	.byte	0x1
	.value	0x406
	.long	0x3a9
	.uleb128 0x36
	.long	0x2aaf
	.long	.LLST174
	.uleb128 0x24
	.long	.LASF124
	.byte	0x1
	.value	0x408
	.long	0x2a9c
	.long	.LLST175
	.uleb128 0x24
	.long	.LASF71
	.byte	0x1
	.value	0x40a
	.long	0x367
	.long	.LLST176
	.uleb128 0x24
	.long	.LASF72
	.byte	0x1
	.value	0x40b
	.long	0x367
	.long	.LLST177
	.uleb128 0x24
	.long	.LASF73
	.byte	0x1
	.value	0x40c
	.long	0x367
	.long	.LLST178
	.uleb128 0x24
	.long	.LASF125
	.byte	0x1
	.value	0x40e
	.long	0xc9e
	.long	.LLST179
	.uleb128 0x24
	.long	.LASF62
	.byte	0x1
	.value	0x40f
	.long	0x313
	.long	.LLST180
	.uleb128 0x26
	.string	"min"
	.byte	0x1
	.value	0x426
	.long	0x313
	.long	.LLST181
	.uleb128 0x26
	.string	"max"
	.byte	0x1
	.value	0x427
	.long	0x313
	.long	.LLST182
	.uleb128 0x26
	.string	"sum"
	.byte	0x1
	.value	0x428
	.long	0x313
	.long	.LLST183
	.uleb128 0x3f
	.long	0x7de
	.quad	.LBB249
	.long	.Ldebug_ranges0+0x730
	.byte	0x1
	.value	0x403
	.long	0x2903
	.uleb128 0x43
	.long	0x7ef
	.long	.LLST184
	.uleb128 0x43
	.long	0x7fb
	.long	.LLST185
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x730
	.uleb128 0x38
	.long	0x807
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x39
	.long	0x813
	.long	.LLST186
	.uleb128 0x39
	.long	0x81f
	.long	.LLST187
	.uleb128 0x39
	.long	0x82b
	.long	.LLST188
	.uleb128 0x39
	.long	0x837
	.long	.LLST189
	.uleb128 0x39
	.long	0x843
	.long	.LLST190
	.uleb128 0x3f
	.long	0x1556
	.quad	.LBB251
	.long	.Ldebug_ranges0+0x770
	.byte	0x1
	.value	0x3bb
	.long	0x28f2
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x770
	.uleb128 0x39
	.long	0x1566
	.long	.LLST191
	.uleb128 0x2f
	.quad	.LVL511
	.long	0x3f90
	.long	0x28da
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x2d
	.quad	.LVL513
	.long	0x3f90
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x7c
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x7a0
	.uleb128 0x39
	.long	0x850
	.long	.LLST192
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3f
	.long	0x1556
	.quad	.LBB260
	.long	.Ldebug_ranges0+0x7d0
	.byte	0x1
	.value	0x406
	.long	0x2950
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x7d0
	.uleb128 0x39
	.long	0x1566
	.long	.LLST193
	.uleb128 0x2f
	.quad	.LVL527
	.long	0x3f90
	.long	0x2941
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x3a
	.quad	.LVL530
	.long	0x3f90
	.byte	0
	.byte	0
	.uleb128 0x3b
	.long	.Ldebug_ranges0+0x800
	.long	0x297e
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x410
	.long	0x313
	.long	.LLST194
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x840
	.uleb128 0x24
	.long	.LASF126
	.byte	0x1
	.value	0x412
	.long	0x313
	.long	.LLST195
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB268
	.quad	.LBE268-.LBB268
	.long	0x29e5
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x421
	.long	0x313
	.long	.LLST196
	.uleb128 0x2d
	.quad	.LVL554
	.long	0x3f26
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xd
	.byte	0x7c
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x33
	.byte	0x24
	.byte	0x7f
	.sleb128 0
	.byte	0x22
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	scalar_add_worker
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0xe
	.byte	0x7c
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x8
	.byte	0x38
	.byte	0x1e
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB269
	.quad	.LBE269-.LBB269
	.long	0x2a1c
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x42b
	.long	0x313
	.long	.LLST197
	.uleb128 0x2d
	.quad	.LVL562
	.long	0x3f70
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL533
	.long	0x3f90
	.long	0x2a34
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL536
	.long	0x3f90
	.long	0x2a4c
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL538
	.long	0x3f90
	.long	0x2a64
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL540
	.long	0x3f90
	.long	0x2a85
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xb
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0x36
	.byte	0x24
	.byte	0x91
	.sleb128 -80
	.byte	0x6
	.byte	0x1c
	.byte	0
	.uleb128 0x2d
	.quad	.LVL569
	.long	0x3fa6
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -112
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x2bc
	.long	0x2aaf
	.uleb128 0x3c
	.long	0xa1
	.long	0x27a0
	.byte	0
	.uleb128 0x7
	.long	0xa1
	.uleb128 0x3d
	.long	.LASF144
	.byte	0x1
	.value	0x46a
	.long	0x3a9
	.quad	.LFB2289
	.quad	.LFE2289-.LFB2289
	.uleb128 0x1
	.byte	0x9c
	.long	0x2d32
	.uleb128 0x3e
	.long	.LASF61
	.byte	0x1
	.value	0x46a
	.long	0x3a9
	.long	.LLST198
	.uleb128 0x3e
	.long	.LASF79
	.byte	0x1
	.value	0x46a
	.long	0xca4
	.long	.LLST199
	.uleb128 0x16
	.long	.LASF75
	.byte	0x1
	.value	0x46c
	.long	0x3a9
	.uleb128 0x36
	.long	0x2d45
	.long	.LLST200
	.uleb128 0x24
	.long	.LASF124
	.byte	0x1
	.value	0x46e
	.long	0x2d32
	.long	.LLST201
	.uleb128 0x24
	.long	.LASF71
	.byte	0x1
	.value	0x470
	.long	0x367
	.long	.LLST202
	.uleb128 0x24
	.long	.LASF72
	.byte	0x1
	.value	0x471
	.long	0x367
	.long	.LLST203
	.uleb128 0x24
	.long	.LASF73
	.byte	0x1
	.value	0x472
	.long	0x367
	.long	.LLST204
	.uleb128 0x24
	.long	.LASF125
	.byte	0x1
	.value	0x474
	.long	0xd58
	.long	.LLST205
	.uleb128 0x24
	.long	.LASF62
	.byte	0x1
	.value	0x475
	.long	0x313
	.long	.LLST206
	.uleb128 0x26
	.string	"min"
	.byte	0x1
	.value	0x48c
	.long	0x313
	.long	.LLST207
	.uleb128 0x26
	.string	"max"
	.byte	0x1
	.value	0x48d
	.long	0x313
	.long	.LLST208
	.uleb128 0x26
	.string	"sum"
	.byte	0x1
	.value	0x48e
	.long	0x313
	.long	.LLST209
	.uleb128 0x3f
	.long	0x1556
	.quad	.LBB278
	.long	.Ldebug_ranges0+0x870
	.byte	0x1
	.value	0x46c
	.long	0x2be8
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x870
	.uleb128 0x39
	.long	0x1566
	.long	.LLST210
	.uleb128 0x2f
	.quad	.LVL578
	.long	0x3f90
	.long	0x2bd9
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x3a
	.quad	.LVL581
	.long	0x3f90
	.byte	0
	.byte	0
	.uleb128 0x3b
	.long	.Ldebug_ranges0+0x8b0
	.long	0x2c16
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x476
	.long	0x313
	.long	.LLST211
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x8f0
	.uleb128 0x24
	.long	.LASF126
	.byte	0x1
	.value	0x478
	.long	0x313
	.long	.LLST212
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB288
	.quad	.LBE288-.LBB288
	.long	0x2c7d
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x487
	.long	0x313
	.long	.LLST213
	.uleb128 0x2d
	.quad	.LVL605
	.long	0x3f26
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xd
	.byte	0x7c
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x33
	.byte	0x24
	.byte	0x7f
	.sleb128 0
	.byte	0x22
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	scalar_mul_worker
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0xe
	.byte	0x7c
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x8
	.byte	0x38
	.byte	0x1e
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB289
	.quad	.LBE289-.LBB289
	.long	0x2cb4
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x492
	.long	0x313
	.long	.LLST214
	.uleb128 0x2d
	.quad	.LVL613
	.long	0x3f70
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL584
	.long	0x3f90
	.long	0x2ccc
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL587
	.long	0x3f90
	.long	0x2ce4
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL589
	.long	0x3f90
	.long	0x2cfc
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL591
	.long	0x3f90
	.long	0x2d1b
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x36
	.byte	0x24
	.byte	0x76
	.sleb128 -64
	.byte	0x6
	.byte	0x1c
	.byte	0
	.uleb128 0x2d
	.quad	.LVL620
	.long	0x3fa6
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x76
	.sleb128 -96
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x2bc
	.long	0x2d45
	.uleb128 0x3c
	.long	0xa1
	.long	0x2b02
	.byte	0
	.uleb128 0x7
	.long	0xa1
	.uleb128 0x3d
	.long	.LASF145
	.byte	0x1
	.value	0x4d2
	.long	0x3a9
	.quad	.LFB2291
	.quad	.LFE2291-.LFB2291
	.uleb128 0x1
	.byte	0x9c
	.long	0x2fc3
	.uleb128 0x3e
	.long	.LASF82
	.byte	0x1
	.value	0x4d2
	.long	0x3a9
	.long	.LLST215
	.uleb128 0x3e
	.long	.LASF83
	.byte	0x1
	.value	0x4d2
	.long	0x3a9
	.long	.LLST216
	.uleb128 0x16
	.long	.LASF75
	.byte	0x1
	.value	0x4d4
	.long	0x3a9
	.uleb128 0x36
	.long	0x2fd6
	.long	.LLST217
	.uleb128 0x24
	.long	.LASF124
	.byte	0x1
	.value	0x4d6
	.long	0x2fc3
	.long	.LLST218
	.uleb128 0x24
	.long	.LASF71
	.byte	0x1
	.value	0x4d8
	.long	0x367
	.long	.LLST219
	.uleb128 0x24
	.long	.LASF72
	.byte	0x1
	.value	0x4d9
	.long	0x367
	.long	.LLST220
	.uleb128 0x24
	.long	.LASF73
	.byte	0x1
	.value	0x4da
	.long	0x367
	.long	.LLST221
	.uleb128 0x24
	.long	.LASF125
	.byte	0x1
	.value	0x4dc
	.long	0xe11
	.long	.LLST222
	.uleb128 0x24
	.long	.LASF62
	.byte	0x1
	.value	0x4dd
	.long	0x313
	.long	.LLST223
	.uleb128 0x26
	.string	"min"
	.byte	0x1
	.value	0x4f5
	.long	0x313
	.long	.LLST224
	.uleb128 0x26
	.string	"max"
	.byte	0x1
	.value	0x4f6
	.long	0x313
	.long	.LLST225
	.uleb128 0x26
	.string	"sum"
	.byte	0x1
	.value	0x4f7
	.long	0x313
	.long	.LLST226
	.uleb128 0x3f
	.long	0x1556
	.quad	.LBB297
	.long	.Ldebug_ranges0+0x920
	.byte	0x1
	.value	0x4d4
	.long	0x2e7e
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x920
	.uleb128 0x39
	.long	0x1566
	.long	.LLST227
	.uleb128 0x2f
	.quad	.LVL629
	.long	0x3f90
	.long	0x2e6f
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x3a
	.quad	.LVL632
	.long	0x3f90
	.byte	0
	.byte	0
	.uleb128 0x3b
	.long	.Ldebug_ranges0+0x960
	.long	0x2eac
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x4de
	.long	0x313
	.long	.LLST228
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x9a0
	.uleb128 0x24
	.long	.LASF126
	.byte	0x1
	.value	0x4e0
	.long	0x313
	.long	.LLST229
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB307
	.quad	.LBE307-.LBB307
	.long	0x2f13
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x4f0
	.long	0x313
	.long	.LLST230
	.uleb128 0x2d
	.quad	.LVL652
	.long	0x3f26
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xd
	.byte	0x73
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x33
	.byte	0x24
	.byte	0x77
	.sleb128 0
	.byte	0x22
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	matrix_add_worker
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0xe
	.byte	0x73
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x36
	.byte	0x24
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x22
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB308
	.quad	.LBE308-.LBB308
	.long	0x2f4a
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x4fb
	.long	0x313
	.long	.LLST231
	.uleb128 0x2d
	.quad	.LVL656
	.long	0x3f70
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL635
	.long	0x3f90
	.long	0x2f62
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL638
	.long	0x3f90
	.long	0x2f7a
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL640
	.long	0x3f90
	.long	0x2f92
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL642
	.long	0x3f90
	.long	0x2fad
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x5
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x36
	.byte	0x24
	.byte	0
	.uleb128 0x2d
	.quad	.LVL661
	.long	0x3fa6
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x2bc
	.long	0x2fd6
	.uleb128 0x3c
	.long	0xa1
	.long	0x2d98
	.byte	0
	.uleb128 0x7
	.long	0xa1
	.uleb128 0x3d
	.long	.LASF146
	.byte	0x1
	.value	0x54c
	.long	0x3a9
	.quad	.LFB2293
	.quad	.LFE2293-.LFB2293
	.uleb128 0x1
	.byte	0x9c
	.long	0x327c
	.uleb128 0x3e
	.long	.LASF82
	.byte	0x1
	.value	0x54c
	.long	0x3a9
	.long	.LLST232
	.uleb128 0x3e
	.long	.LASF83
	.byte	0x1
	.value	0x54c
	.long	0x3a9
	.long	.LLST233
	.uleb128 0x16
	.long	.LASF75
	.byte	0x1
	.value	0x54e
	.long	0x3a9
	.uleb128 0x24
	.long	.LASF147
	.byte	0x1
	.value	0x54f
	.long	0x3a9
	.long	.LLST234
	.uleb128 0x24
	.long	.LASF71
	.byte	0x1
	.value	0x551
	.long	0x367
	.long	.LLST235
	.uleb128 0x24
	.long	.LASF72
	.byte	0x1
	.value	0x552
	.long	0x367
	.long	.LLST236
	.uleb128 0x24
	.long	.LASF73
	.byte	0x1
	.value	0x553
	.long	0x367
	.long	.LLST237
	.uleb128 0x36
	.long	0x328f
	.long	.LLST238
	.uleb128 0x24
	.long	.LASF124
	.byte	0x1
	.value	0x555
	.long	0x327c
	.long	.LLST239
	.uleb128 0x24
	.long	.LASF125
	.byte	0x1
	.value	0x557
	.long	0xf52
	.long	.LLST240
	.uleb128 0x24
	.long	.LASF62
	.byte	0x1
	.value	0x558
	.long	0x313
	.long	.LLST241
	.uleb128 0x26
	.string	"min"
	.byte	0x1
	.value	0x56f
	.long	0x313
	.long	.LLST242
	.uleb128 0x26
	.string	"max"
	.byte	0x1
	.value	0x570
	.long	0x313
	.long	.LLST243
	.uleb128 0x26
	.string	"sum"
	.byte	0x1
	.value	0x571
	.long	0x313
	.long	.LLST244
	.uleb128 0x3f
	.long	0x1556
	.quad	.LBB316
	.long	.Ldebug_ranges0+0x9d0
	.byte	0x1
	.value	0x54e
	.long	0x311f
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x9d0
	.uleb128 0x39
	.long	0x1566
	.long	.LLST245
	.uleb128 0x2f
	.quad	.LVL671
	.long	0x3f90
	.long	0x3110
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x3a
	.quad	.LVL674
	.long	0x3f90
	.byte	0
	.byte	0
	.uleb128 0x3b
	.long	.Ldebug_ranges0+0xa00
	.long	0x314d
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x559
	.long	0x313
	.long	.LLST246
	.uleb128 0x25
	.long	.Ldebug_ranges0+0xa40
	.uleb128 0x24
	.long	.LASF126
	.byte	0x1
	.value	0x55b
	.long	0x313
	.long	.LLST247
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB324
	.quad	.LBE324-.LBB324
	.long	0x31b4
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x56a
	.long	0x313
	.long	.LLST248
	.uleb128 0x2d
	.quad	.LVL696
	.long	0x3f26
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xd
	.byte	0x73
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x33
	.byte	0x24
	.byte	0x77
	.sleb128 0
	.byte	0x22
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	matrix_mul_worker
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0xe
	.byte	0x73
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x36
	.byte	0x24
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x22
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB325
	.quad	.LBE325-.LBB325
	.long	0x31eb
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x575
	.long	0x313
	.long	.LLST249
	.uleb128 0x2d
	.quad	.LVL700
	.long	0x3f70
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL675
	.long	0x2518
	.long	0x3203
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL678
	.long	0x3f90
	.long	0x321b
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL680
	.long	0x3f90
	.long	0x3233
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL682
	.long	0x3f90
	.long	0x324b
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL685
	.long	0x3f90
	.long	0x3266
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x5
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x36
	.byte	0x24
	.byte	0
	.uleb128 0x2d
	.quad	.LVL705
	.long	0x3fa6
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x2bc
	.long	0x328f
	.uleb128 0x3c
	.long	0xa1
	.long	0x3069
	.byte	0
	.uleb128 0x7
	.long	0xa1
	.uleb128 0x14
	.long	.LASF148
	.byte	0x1
	.value	0x5a6
	.long	0x3a9
	.byte	0x3
	.long	0x3304
	.uleb128 0x15
	.long	.LASF61
	.byte	0x1
	.value	0x5a6
	.long	0x3a9
	.uleb128 0x15
	.long	.LASF149
	.byte	0x1
	.value	0x5a6
	.long	0x313
	.uleb128 0x18
	.uleb128 0x16
	.long	.LASF142
	.byte	0x1
	.value	0x5ae
	.long	0x3a9
	.uleb128 0x17
	.string	"ret"
	.byte	0x1
	.value	0x5b3
	.long	0x3a9
	.uleb128 0x45
	.long	0x32e8
	.uleb128 0x16
	.long	.LASF150
	.byte	0x1
	.value	0x5ba
	.long	0x3a9
	.byte	0
	.uleb128 0x18
	.uleb128 0x16
	.long	.LASF151
	.byte	0x1
	.value	0x5c0
	.long	0x3a9
	.uleb128 0x16
	.long	.LASF150
	.byte	0x1
	.value	0x5c2
	.long	0x3a9
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x46
	.long	0x3294
	.quad	.LFB2296
	.quad	.LFE2296-.LFB2296
	.uleb128 0x1
	.byte	0x9c
	.long	0x3567
	.uleb128 0x43
	.long	0x32a5
	.long	.LLST250
	.uleb128 0x43
	.long	0x32b1
	.long	.LLST251
	.uleb128 0x25
	.long	.Ldebug_ranges0+0xa70
	.uleb128 0x39
	.long	0x32be
	.long	.LLST252
	.uleb128 0x44
	.long	0x32ca
	.uleb128 0x3f
	.long	0x3294
	.quad	.LBB363
	.long	.Ldebug_ranges0+0xab0
	.byte	0x1
	.value	0x5b3
	.long	0x3482
	.uleb128 0x43
	.long	0x32b1
	.long	.LLST253
	.uleb128 0x43
	.long	0x32a5
	.long	.LLST254
	.uleb128 0x25
	.long	.Ldebug_ranges0+0xaf0
	.uleb128 0x39
	.long	0x32be
	.long	.LLST255
	.uleb128 0x39
	.long	0x32ca
	.long	.LLST256
	.uleb128 0x42
	.long	0x868
	.quad	.LBB366
	.quad	.LBE366-.LBB366
	.byte	0x1
	.value	0x5b6
	.long	0x33ab
	.uleb128 0x43
	.long	0x875
	.long	.LLST257
	.byte	0
	.uleb128 0x2c
	.quad	.LBB368
	.quad	.LBE368-.LBB368
	.long	0x33c8
	.uleb128 0x38
	.long	0x32db
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x2c
	.quad	.LBB369
	.quad	.LBE369-.LBB369
	.long	0x344a
	.uleb128 0x39
	.long	0x32e9
	.long	.LLST258
	.uleb128 0x38
	.long	0x32f5
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3f
	.long	0x868
	.quad	.LBB370
	.long	.Ldebug_ranges0+0xb20
	.byte	0x1
	.value	0x5c1
	.long	0x340f
	.uleb128 0x43
	.long	0x875
	.long	.LLST258
	.byte	0
	.uleb128 0x3f
	.long	0x868
	.quad	.LBB374
	.long	.Ldebug_ranges0+0xb50
	.byte	0x1
	.value	0x5c3
	.long	0x342f
	.uleb128 0x47
	.long	0x875
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x3a
	.quad	.LVL741
	.long	0x2fdb
	.uleb128 0x3a
	.quad	.LVL743
	.long	0x2fdb
	.byte	0
	.uleb128 0x3a
	.quad	.LVL725
	.long	0x1317
	.uleb128 0x3a
	.quad	.LVL728
	.long	0x3fd5
	.uleb128 0x2d
	.quad	.LVL737
	.long	0x3294
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x4
	.byte	0x7c
	.sleb128 0
	.byte	0x32
	.byte	0x25
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x42
	.long	0x868
	.quad	.LBB382
	.quad	.LBE382-.LBB382
	.byte	0x1
	.value	0x5b6
	.long	0x34a4
	.uleb128 0x48
	.long	0x875
	.byte	0
	.uleb128 0x2c
	.quad	.LBB384
	.quad	.LBE384-.LBB384
	.long	0x34c1
	.uleb128 0x38
	.long	0x32db
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x2c
	.quad	.LBB385
	.quad	.LBE385-.LBB385
	.long	0x354b
	.uleb128 0x39
	.long	0x32e9
	.long	.LLST260
	.uleb128 0x39
	.long	0x32f5
	.long	.LLST261
	.uleb128 0x3f
	.long	0x868
	.quad	.LBB386
	.long	.Ldebug_ranges0+0xb80
	.byte	0x1
	.value	0x5c1
	.long	0x350a
	.uleb128 0x43
	.long	0x875
	.long	.LLST260
	.byte	0
	.uleb128 0x42
	.long	0x868
	.quad	.LBB390
	.quad	.LBE390-.LBB390
	.byte	0x1
	.value	0x5c3
	.long	0x3530
	.uleb128 0x43
	.long	0x875
	.long	.LLST261
	.byte	0
	.uleb128 0x3a
	.quad	.LVL732
	.long	0x2fdb
	.uleb128 0x3a
	.quad	.LVL734
	.long	0x2fdb
	.byte	0
	.uleb128 0x3a
	.quad	.LVL714
	.long	0x1317
	.uleb128 0x3a
	.quad	.LVL717
	.long	0x3fd5
	.byte	0
	.byte	0
	.uleb128 0x1a
	.long	.LASF153
	.byte	0x1
	.value	0x590
	.byte	0x3
	.long	0x3599
	.uleb128 0x15
	.long	.LASF154
	.byte	0x1
	.value	0x590
	.long	0x3a9
	.uleb128 0x18
	.uleb128 0x17
	.string	"i"
	.byte	0x1
	.value	0x592
	.long	0x313
	.uleb128 0x18
	.uleb128 0x17
	.string	"j"
	.byte	0x1
	.value	0x596
	.long	0x313
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3d
	.long	.LASF155
	.byte	0x1
	.value	0x5cb
	.long	0x3a9
	.quad	.LFB2297
	.quad	.LFE2297-.LFB2297
	.uleb128 0x1
	.byte	0x9c
	.long	0x3b45
	.uleb128 0x3e
	.long	.LASF61
	.byte	0x1
	.value	0x5cb
	.long	0x3a9
	.long	.LLST264
	.uleb128 0x3e
	.long	.LASF149
	.byte	0x1
	.value	0x5cb
	.long	0xca4
	.long	.LLST265
	.uleb128 0x24
	.long	.LASF142
	.byte	0x1
	.value	0x5d7
	.long	0x3a9
	.long	.LLST266
	.uleb128 0x17
	.string	"ret"
	.byte	0x1
	.value	0x5de
	.long	0x3a9
	.uleb128 0x3f
	.long	0x3294
	.quad	.LBB451
	.long	.Ldebug_ranges0+0xbb0
	.byte	0x1
	.value	0x5de
	.long	0x3a8f
	.uleb128 0x43
	.long	0x32b1
	.long	.LLST267
	.uleb128 0x43
	.long	0x32a5
	.long	.LLST268
	.uleb128 0x25
	.long	.Ldebug_ranges0+0xbb0
	.uleb128 0x39
	.long	0x32be
	.long	.LLST269
	.uleb128 0x44
	.long	0x32ca
	.uleb128 0x3f
	.long	0x3294
	.quad	.LBB453
	.long	.Ldebug_ranges0+0xbe0
	.byte	0x1
	.value	0x5b3
	.long	0x39ae
	.uleb128 0x43
	.long	0x32b1
	.long	.LLST270
	.uleb128 0x43
	.long	0x32a5
	.long	.LLST271
	.uleb128 0x25
	.long	.Ldebug_ranges0+0xc20
	.uleb128 0x39
	.long	0x32be
	.long	.LLST272
	.uleb128 0x44
	.long	0x32ca
	.uleb128 0x3f
	.long	0x3294
	.quad	.LBB456
	.long	.Ldebug_ranges0+0xc50
	.byte	0x1
	.value	0x5b3
	.long	0x38cd
	.uleb128 0x43
	.long	0x32b1
	.long	.LLST273
	.uleb128 0x43
	.long	0x32a5
	.long	.LLST274
	.uleb128 0x25
	.long	.Ldebug_ranges0+0xc90
	.uleb128 0x39
	.long	0x32be
	.long	.LLST275
	.uleb128 0x44
	.long	0x32ca
	.uleb128 0x3f
	.long	0x3294
	.quad	.LBB459
	.long	.Ldebug_ranges0+0xcc0
	.byte	0x1
	.value	0x5b3
	.long	0x37ec
	.uleb128 0x43
	.long	0x32b1
	.long	.LLST276
	.uleb128 0x43
	.long	0x32a5
	.long	.LLST277
	.uleb128 0x25
	.long	.Ldebug_ranges0+0xd00
	.uleb128 0x39
	.long	0x32be
	.long	.LLST278
	.uleb128 0x39
	.long	0x32ca
	.long	.LLST279
	.uleb128 0x42
	.long	0x868
	.quad	.LBB462
	.quad	.LBE462-.LBB462
	.byte	0x1
	.value	0x5b6
	.long	0x3715
	.uleb128 0x43
	.long	0x875
	.long	.LLST280
	.byte	0
	.uleb128 0x2c
	.quad	.LBB464
	.quad	.LBE464-.LBB464
	.long	0x3732
	.uleb128 0x38
	.long	0x32db
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x2c
	.quad	.LBB465
	.quad	.LBE465-.LBB465
	.long	0x37b4
	.uleb128 0x39
	.long	0x32e9
	.long	.LLST281
	.uleb128 0x38
	.long	0x32f5
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3f
	.long	0x868
	.quad	.LBB466
	.long	.Ldebug_ranges0+0xd30
	.byte	0x1
	.value	0x5c1
	.long	0x3779
	.uleb128 0x43
	.long	0x875
	.long	.LLST281
	.byte	0
	.uleb128 0x3f
	.long	0x868
	.quad	.LBB470
	.long	.Ldebug_ranges0+0xd60
	.byte	0x1
	.value	0x5c3
	.long	0x3799
	.uleb128 0x47
	.long	0x875
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x3a
	.quad	.LVL817
	.long	0x2fdb
	.uleb128 0x3a
	.quad	.LVL819
	.long	0x2fdb
	.byte	0
	.uleb128 0x3a
	.quad	.LVL798
	.long	0x1317
	.uleb128 0x3a
	.quad	.LVL801
	.long	0x3fd5
	.uleb128 0x2d
	.quad	.LVL810
	.long	0x3294
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x4
	.byte	0x76
	.sleb128 0
	.byte	0x31
	.byte	0x25
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x42
	.long	0x868
	.quad	.LBB478
	.quad	.LBE478-.LBB478
	.byte	0x1
	.value	0x5b6
	.long	0x380e
	.uleb128 0x48
	.long	0x875
	.byte	0
	.uleb128 0x2c
	.quad	.LBB480
	.quad	.LBE480-.LBB480
	.long	0x382b
	.uleb128 0x38
	.long	0x32db
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x2c
	.quad	.LBB481
	.quad	.LBE481-.LBB481
	.long	0x38b1
	.uleb128 0x39
	.long	0x32e9
	.long	.LLST283
	.uleb128 0x39
	.long	0x32f5
	.long	.LLST284
	.uleb128 0x3f
	.long	0x868
	.quad	.LBB482
	.long	.Ldebug_ranges0+0xd90
	.byte	0x1
	.value	0x5c1
	.long	0x3874
	.uleb128 0x43
	.long	0x875
	.long	.LLST283
	.byte	0
	.uleb128 0x3f
	.long	0x868
	.quad	.LBB486
	.long	.Ldebug_ranges0+0xdc0
	.byte	0x1
	.value	0x5c3
	.long	0x3896
	.uleb128 0x43
	.long	0x875
	.long	.LLST284
	.byte	0
	.uleb128 0x3a
	.quad	.LVL805
	.long	0x2fdb
	.uleb128 0x3a
	.quad	.LVL807
	.long	0x2fdb
	.byte	0
	.uleb128 0x3a
	.quad	.LVL785
	.long	0x1317
	.uleb128 0x3a
	.quad	.LVL788
	.long	0x3fd5
	.byte	0
	.byte	0
	.uleb128 0x42
	.long	0x868
	.quad	.LBB495
	.quad	.LBE495-.LBB495
	.byte	0x1
	.value	0x5b6
	.long	0x38ef
	.uleb128 0x48
	.long	0x875
	.byte	0
	.uleb128 0x2c
	.quad	.LBB497
	.quad	.LBE497-.LBB497
	.long	0x390c
	.uleb128 0x38
	.long	0x32db
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x2c
	.quad	.LBB498
	.quad	.LBE498-.LBB498
	.long	0x3992
	.uleb128 0x39
	.long	0x32e9
	.long	.LLST287
	.uleb128 0x39
	.long	0x32f5
	.long	.LLST288
	.uleb128 0x3f
	.long	0x868
	.quad	.LBB499
	.long	.Ldebug_ranges0+0xdf0
	.byte	0x1
	.value	0x5c1
	.long	0x3955
	.uleb128 0x43
	.long	0x875
	.long	.LLST287
	.byte	0
	.uleb128 0x3f
	.long	0x868
	.quad	.LBB503
	.long	.Ldebug_ranges0+0xe20
	.byte	0x1
	.value	0x5c3
	.long	0x3977
	.uleb128 0x43
	.long	0x875
	.long	.LLST288
	.byte	0
	.uleb128 0x3a
	.quad	.LVL791
	.long	0x2fdb
	.uleb128 0x3a
	.quad	.LVL793
	.long	0x2fdb
	.byte	0
	.uleb128 0x3a
	.quad	.LVL772
	.long	0x1317
	.uleb128 0x3a
	.quad	.LVL775
	.long	0x3fd5
	.byte	0
	.byte	0
	.uleb128 0x42
	.long	0x868
	.quad	.LBB512
	.quad	.LBE512-.LBB512
	.byte	0x1
	.value	0x5b6
	.long	0x39d0
	.uleb128 0x48
	.long	0x875
	.byte	0
	.uleb128 0x2c
	.quad	.LBB514
	.quad	.LBE514-.LBB514
	.long	0x39ed
	.uleb128 0x38
	.long	0x32db
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x2c
	.quad	.LBB515
	.quad	.LBE515-.LBB515
	.long	0x3a73
	.uleb128 0x39
	.long	0x32e9
	.long	.LLST291
	.uleb128 0x39
	.long	0x32f5
	.long	.LLST292
	.uleb128 0x3f
	.long	0x868
	.quad	.LBB516
	.long	.Ldebug_ranges0+0xe50
	.byte	0x1
	.value	0x5c1
	.long	0x3a36
	.uleb128 0x43
	.long	0x875
	.long	.LLST291
	.byte	0
	.uleb128 0x3f
	.long	0x868
	.quad	.LBB520
	.long	.Ldebug_ranges0+0xe80
	.byte	0x1
	.value	0x5c3
	.long	0x3a58
	.uleb128 0x43
	.long	0x875
	.long	.LLST292
	.byte	0
	.uleb128 0x3a
	.quad	.LVL778
	.long	0x2fdb
	.uleb128 0x3a
	.quad	.LVL780
	.long	0x2fdb
	.byte	0
	.uleb128 0x3a
	.quad	.LVL748
	.long	0x1317
	.uleb128 0x3a
	.quad	.LVL751
	.long	0x3fd5
	.byte	0
	.byte	0
	.uleb128 0x42
	.long	0x3567
	.quad	.LBB526
	.quad	.LBE526-.LBB526
	.byte	0x1
	.value	0x5df
	.long	0x3b10
	.uleb128 0x43
	.long	0x3574
	.long	.LLST295
	.uleb128 0x1f
	.quad	.LBB528
	.quad	.LBE528-.LBB528
	.uleb128 0x39
	.long	0x3581
	.long	.LLST296
	.uleb128 0x2c
	.quad	.LBB529
	.quad	.LBE529-.LBB529
	.long	0x3aed
	.uleb128 0x39
	.long	0x358c
	.long	.LLST297
	.byte	0
	.uleb128 0x3a
	.quad	.LVL759
	.long	0x3fa6
	.uleb128 0x2d
	.quad	.LVL760
	.long	0x3fa6
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3a
	.quad	.LVL745
	.long	0x1317
	.uleb128 0x3a
	.quad	.LVL746
	.long	0x3fd5
	.uleb128 0x49
	.quad	.LVL767
	.long	0x1317
	.uleb128 0x49
	.quad	.LVL768
	.long	0x1f99
	.byte	0
	.uleb128 0x3d
	.long	.LASF156
	.byte	0x1
	.value	0x5ec
	.long	0x313
	.quad	.LFB2298
	.quad	.LFE2298-.LFB2298
	.uleb128 0x1
	.byte	0x9c
	.long	0x3b76
	.uleb128 0x4a
	.long	.LASF61
	.byte	0x1
	.value	0x5ec
	.long	0x3a9
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x3d
	.long	.LASF157
	.byte	0x1
	.value	0x5f4
	.long	0x313
	.quad	.LFB2299
	.quad	.LFE2299-.LFB2299
	.uleb128 0x1
	.byte	0x9c
	.long	0x3bf5
	.uleb128 0x4a
	.long	.LASF61
	.byte	0x1
	.value	0x5f4
	.long	0x3a9
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x24
	.long	.LASF107
	.byte	0x1
	.value	0x5f6
	.long	0x313
	.long	.LLST298
	.uleb128 0x26
	.string	"gap"
	.byte	0x1
	.value	0x5f7
	.long	0x313
	.long	.LLST299
	.uleb128 0x23
	.long	.LASF88
	.byte	0x1
	.value	0x5f8
	.long	0x367
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1f
	.quad	.LBB531
	.quad	.LBE531-.LBB531
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x5fa
	.long	0x313
	.long	.LLST300
	.byte	0
	.byte	0
	.uleb128 0x3d
	.long	.LASF158
	.byte	0x1
	.value	0x607
	.long	0x313
	.quad	.LFB2300
	.quad	.LFE2300-.LFB2300
	.uleb128 0x1
	.byte	0x9c
	.long	0x3c26
	.uleb128 0x4a
	.long	.LASF61
	.byte	0x1
	.value	0x607
	.long	0x3a9
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x3d
	.long	.LASF159
	.byte	0x1
	.value	0x60f
	.long	0x313
	.quad	.LFB2301
	.quad	.LFE2301-.LFB2301
	.uleb128 0x1
	.byte	0x9c
	.long	0x3c57
	.uleb128 0x4a
	.long	.LASF61
	.byte	0x1
	.value	0x60f
	.long	0x3a9
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x3d
	.long	.LASF160
	.byte	0x1
	.value	0x631
	.long	0x313
	.quad	.LFB2303
	.quad	.LFE2303-.LFB2303
	.uleb128 0x1
	.byte	0x9c
	.long	0x3e0a
	.uleb128 0x3e
	.long	.LASF61
	.byte	0x1
	.value	0x631
	.long	0x3a9
	.long	.LLST301
	.uleb128 0x3e
	.long	.LASF67
	.byte	0x1
	.value	0x631
	.long	0x313
	.long	.LLST302
	.uleb128 0x24
	.long	.LASF86
	.byte	0x1
	.value	0x639
	.long	0x367
	.long	.LLST303
	.uleb128 0x36
	.long	0x3e1d
	.long	.LLST304
	.uleb128 0x24
	.long	.LASF124
	.byte	0x1
	.value	0x63b
	.long	0x3e0a
	.long	.LLST305
	.uleb128 0x24
	.long	.LASF125
	.byte	0x1
	.value	0x63d
	.long	0xfd9
	.long	.LLST306
	.uleb128 0x24
	.long	.LASF62
	.byte	0x1
	.value	0x63e
	.long	0x313
	.long	.LLST307
	.uleb128 0x24
	.long	.LASF109
	.byte	0x1
	.value	0x652
	.long	0x313
	.long	.LLST308
	.uleb128 0x3b
	.long	.Ldebug_ranges0+0xeb0
	.long	0x3d20
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x63f
	.long	0x313
	.long	.LLST309
	.uleb128 0x25
	.long	.Ldebug_ranges0+0xee0
	.uleb128 0x24
	.long	.LASF126
	.byte	0x1
	.value	0x641
	.long	0x313
	.long	.LLST310
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB536
	.quad	.LBE536-.LBB536
	.long	0x3d86
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x64d
	.long	0x313
	.long	.LLST311
	.uleb128 0x2d
	.quad	.LVL849
	.long	0x3f26
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xd
	.byte	0x7e
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x33
	.byte	0x24
	.byte	0x77
	.sleb128 0
	.byte	0x22
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	get_cmpe_worker
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0xd
	.byte	0x7e
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0x35
	.byte	0x24
	.byte	0x7d
	.sleb128 0
	.byte	0x22
	.byte	0
	.byte	0
	.uleb128 0x2c
	.quad	.LBB537
	.quad	.LBE537-.LBB537
	.long	0x3dbd
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x654
	.long	0x313
	.long	.LLST312
	.uleb128 0x2d
	.quad	.LVL854
	.long	0x3f70
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL835
	.long	0x3f90
	.long	0x3dd9
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x6
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0x32
	.byte	0x24
	.byte	0
	.uleb128 0x2f
	.quad	.LVL838
	.long	0x3f90
	.long	0x3df5
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x6
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0x35
	.byte	0x24
	.byte	0
	.uleb128 0x2d
	.quad	.LVL858
	.long	0x3fa6
	.uleb128 0x2e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x2bc
	.long	0x3e1d
	.uleb128 0x3c
	.long	0xa1
	.long	0x3ca9
	.byte	0
	.uleb128 0x7
	.long	0xa1
	.uleb128 0x1d
	.long	.LASF161
	.byte	0x1
	.byte	0x13
	.long	0x2aa
	.uleb128 0x9
	.byte	0x3
	.quad	g_width
	.uleb128 0x1d
	.long	.LASF162
	.byte	0x1
	.byte	0x14
	.long	0x2aa
	.uleb128 0x9
	.byte	0x3
	.quad	g_height
	.uleb128 0x1d
	.long	.LASF163
	.byte	0x1
	.byte	0x15
	.long	0x2aa
	.uleb128 0x9
	.byte	0x3
	.quad	g_elements
	.uleb128 0xc
	.long	0x3a9
	.long	0x3e71
	.uleb128 0xd
	.long	0xa1
	.byte	0xfe
	.byte	0
	.uleb128 0x1d
	.long	.LASF164
	.byte	0x1
	.byte	0x17
	.long	0x3e61
	.uleb128 0x9
	.byte	0x3
	.quad	pow_rubbish
	.uleb128 0x1d
	.long	.LASF165
	.byte	0x1
	.byte	0x18
	.long	0x313
	.uleb128 0x9
	.byte	0x3
	.quad	rubbish_counter
	.uleb128 0x1d
	.long	.LASF166
	.byte	0x1
	.byte	0x1a
	.long	0x2aa
	.uleb128 0x9
	.byte	0x3
	.quad	g_nthreads
	.uleb128 0x1d
	.long	.LASF167
	.byte	0x1
	.byte	0x1c
	.long	0x313
	.uleb128 0x9
	.byte	0x3
	.quad	g_seed
	.uleb128 0x4b
	.long	.LASF168
	.byte	0x5
	.byte	0xa8
	.long	0x27e
	.uleb128 0x4b
	.long	.LASF169
	.byte	0x5
	.byte	0xa9
	.long	0x27e
	.uleb128 0x4c
	.long	.LASF170
	.byte	0x5
	.value	0x16a
	.long	0x3b
	.long	0x3ef2
	.uleb128 0x4d
	.long	0xb5
	.uleb128 0x4e
	.byte	0
	.uleb128 0x4f
	.long	.LASF183
	.byte	0xc
	.byte	0
	.long	.LASF184
	.long	0x3b
	.long	0x3f0b
	.uleb128 0x4d
	.long	0x3b
	.byte	0
	.uleb128 0x4c
	.long	.LASF171
	.byte	0x9
	.value	0x1d4
	.long	0xa8
	.long	0x3f26
	.uleb128 0x4d
	.long	0x4f
	.uleb128 0x4d
	.long	0x4f
	.byte	0
	.uleb128 0x50
	.long	.LASF172
	.byte	0xa
	.byte	0xeb
	.long	0x3b
	.long	0x3f4a
	.uleb128 0x4d
	.long	0x3f4a
	.uleb128 0x4d
	.long	0x3f50
	.uleb128 0x4d
	.long	0x3f5b
	.uleb128 0x4d
	.long	0xa8
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x2bc
	.uleb128 0x4
	.byte	0x8
	.long	0x3f56
	.uleb128 0x7
	.long	0x2fa
	.uleb128 0x4
	.byte	0x8
	.long	0x3f61
	.uleb128 0x51
	.long	0xa8
	.long	0x3f70
	.uleb128 0x4d
	.long	0xa8
	.byte	0
	.uleb128 0x50
	.long	.LASF173
	.byte	0xa
	.byte	0xfc
	.long	0x3b
	.long	0x3f8a
	.uleb128 0x4d
	.long	0x2bc
	.uleb128 0x4d
	.long	0x3f8a
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0xa8
	.uleb128 0x4c
	.long	.LASF174
	.byte	0x9
	.value	0x1d2
	.long	0xa8
	.long	0x3fa6
	.uleb128 0x4d
	.long	0x4f
	.byte	0
	.uleb128 0x52
	.long	.LASF175
	.byte	0x9
	.value	0x1e3
	.long	0x3fb8
	.uleb128 0x4d
	.long	0xa8
	.byte	0
	.uleb128 0x53
	.long	.LASF176
	.long	0xa8
	.long	0x3fd5
	.uleb128 0x4d
	.long	0xa8
	.uleb128 0x4d
	.long	0x30c
	.uleb128 0x4d
	.long	0xa1
	.byte	0
	.uleb128 0x54
	.long	.LASF177
	.byte	0xb
	.byte	0x45
	.long	0x3b
	.uleb128 0x4d
	.long	0x30c
	.uleb128 0x4d
	.long	0x30c
	.uleb128 0x4d
	.long	0x4f
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x17
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0x19
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x34
	.byte	0
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3c
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3e
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x3f
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x40
	.uleb128 0x1d
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x41
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x42
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x43
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x44
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x45
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x46
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x47
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x48
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x49
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0x19
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4a
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x4c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4d
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4e
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x4f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x50
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x51
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x52
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x53
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x54
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LVL1-.Ltext0
	.quad	.LVL2-.Ltext0
	.value	0x2
	.byte	0x71
	.sleb128 0
	.quad	.LVL2-.Ltext0
	.quad	.LVL7-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL3-.Ltext0
	.quad	.LVL4-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL4-.Ltext0
	.quad	.LVL5-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL5-.Ltext0
	.quad	.LVL6-.Ltext0
	.value	0x3
	.byte	0x71
	.sleb128 1
	.byte	0x9f
	.quad	.LVL6-.Ltext0
	.quad	.LFE2266-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL9-.Ltext0
	.quad	.LVL11-.Ltext0
	.value	0x2
	.byte	0x71
	.sleb128 0
	.quad	.LVL11-.Ltext0
	.quad	.LVL16-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL11-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL12-.Ltext0
	.quad	.LVL13-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL13-.Ltext0
	.quad	.LVL14-.Ltext0
	.value	0x3
	.byte	0x74
	.sleb128 -1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL18-.Ltext0
	.quad	.LVL20-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 0
	.quad	.LVL20-.Ltext0
	.quad	.LVL25-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL25-.Ltext0
	.quad	.LVL26-.Ltext0
	.value	0x3
	.byte	0x71
	.sleb128 -4
	.byte	0x9f
	.quad	.LVL26-.Ltext0
	.quad	.LVL29-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL31-.Ltext0
	.quad	.LFE2275-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL19-.Ltext0
	.quad	.LVL30-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL31-.Ltext0
	.quad	.LFE2275-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST6:
	.quad	.LVL20-.Ltext0
	.quad	.LVL22-.Ltext0
	.value	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.quad	.LVL22-.Ltext0
	.quad	.LVL28-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL31-.Ltext0
	.quad	.LFE2275-.Ltext0
	.value	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL20-.Ltext0
	.quad	.LVL22-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL22-.Ltext0
	.quad	.LVL28-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL31-.Ltext0
	.quad	.LFE2275-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST8:
	.quad	.LVL20-.Ltext0
	.quad	.LVL22-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL22-.Ltext0
	.quad	.LVL28-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL31-.Ltext0
	.quad	.LFE2275-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST9:
	.quad	.LVL20-.Ltext0
	.quad	.LVL21-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL21-.Ltext0
	.quad	.LVL22-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL31-.Ltext0
	.quad	.LVL32-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL32-.Ltext0
	.quad	.LFE2275-.Ltext0
	.value	0x13
	.byte	0x3
	.quad	g_width
	.byte	0x94
	.byte	0x4
	.byte	0x75
	.sleb128 20
	.byte	0x94
	.byte	0x4
	.byte	0x1e
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST10:
	.quad	.LVL34-.Ltext0
	.quad	.LVL36-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 0
	.quad	.LVL36-.Ltext0
	.quad	.LVL38-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL38-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x8
	.byte	0x70
	.sleb128 1
	.byte	0x32
	.byte	0x24
	.byte	0x78
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL39-.Ltext0
	.quad	.LVL40-.Ltext0
	.value	0x8
	.byte	0x70
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x78
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	0
	.quad	0
.LLST11:
	.quad	.LVL35-.Ltext0
	.quad	.LVL37-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 0
	.quad	.LVL37-.Ltext0
	.quad	.LVL38-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL38-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x8
	.byte	0x70
	.sleb128 1
	.byte	0x32
	.byte	0x24
	.byte	0x72
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL39-.Ltext0
	.quad	.LVL40-.Ltext0
	.value	0x8
	.byte	0x70
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x72
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	0
	.quad	0
.LLST12:
	.quad	.LVL37-.Ltext0
	.quad	.LVL38-.Ltext0
	.value	0x3
	.byte	0x71
	.sleb128 -1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST13:
	.quad	.LVL42-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 0
	.quad	.LVL44-.Ltext0
	.quad	.LVL48-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL48-.Ltext0
	.quad	.LVL49-.Ltext0
	.value	0x3
	.byte	0x71
	.sleb128 4
	.byte	0x9f
	.quad	.LVL49-.Ltext0
	.quad	.LFE2281-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST14:
	.quad	.LVL42-.Ltext0
	.quad	.LVL43-.Ltext0
	.value	0x2
	.byte	0x78
	.sleb128 0
	.quad	.LVL43-.Ltext0
	.quad	.LVL50-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST15:
	.quad	.LVL44-.Ltext0
	.quad	.LVL45-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL45-.Ltext0
	.quad	.LVL46-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL46-.Ltext0
	.quad	.LVL47-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST16:
	.quad	.LVL51-.Ltext0
	.quad	.LVL55-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL55-.Ltext0
	.quad	.LFE2283-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST18:
	.quad	.LVL53-.Ltext0
	.quad	.LVL61-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST19:
	.quad	.LVL54-.Ltext0
	.quad	.LVL56-.Ltext0
	.value	0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST20:
	.quad	.LVL56-.Ltext0
	.quad	.LVL57-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL57-.Ltext0
	.quad	.LVL59-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST21:
	.quad	.LVL56-.Ltext0
	.quad	.LVL57-.Ltext0
	.value	0x3
	.byte	0x75
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL57-.Ltext0
	.quad	.LVL59-.Ltext0
	.value	0x7
	.byte	0x71
	.sleb128 0
	.byte	0x20
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	0
	.quad	0
.LLST22:
	.quad	.LVL63-.Ltext0
	.quad	.LVL66-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 0
	.quad	.LVL66-.Ltext0
	.quad	.LVL68-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL68-.Ltext0
	.quad	.LVL71-.Ltext0
	.value	0x8
	.byte	0x71
	.sleb128 1
	.byte	0x32
	.byte	0x24
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL71-.Ltext0
	.quad	.LVL73-.Ltext0
	.value	0x8
	.byte	0x71
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL74-.Ltext0
	.quad	.LFE2286-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST23:
	.quad	.LVL64-.Ltext0
	.quad	.LVL66-.Ltext0
	.value	0x2
	.byte	0x71
	.sleb128 0
	.quad	.LVL66-.Ltext0
	.quad	.LVL68-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL68-.Ltext0
	.quad	.LVL71-.Ltext0
	.value	0x8
	.byte	0x71
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x79
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL71-.Ltext0
	.quad	.LVL72-.Ltext0
	.value	0x8
	.byte	0x71
	.sleb128 -1
	.byte	0x32
	.byte	0x24
	.byte	0x79
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL74-.Ltext0
	.quad	.LFE2286-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	0
	.quad	0
.LLST24:
	.quad	.LVL66-.Ltext0
	.quad	.LVL68-.Ltext0
	.value	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.quad	.LVL68-.Ltext0
	.quad	.LVL73-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL74-.Ltext0
	.quad	.LFE2286-.Ltext0
	.value	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.quad	0
	.quad	0
.LLST25:
	.quad	.LVL66-.Ltext0
	.quad	.LVL68-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL68-.Ltext0
	.quad	.LVL73-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL74-.Ltext0
	.quad	.LFE2286-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST26:
	.quad	.LVL66-.Ltext0
	.quad	.LVL68-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL68-.Ltext0
	.quad	.LVL73-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL74-.Ltext0
	.quad	.LFE2286-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST27:
	.quad	.LVL66-.Ltext0
	.quad	.LVL67-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL67-.Ltext0
	.quad	.LVL68-.Ltext0
	.value	0x3
	.byte	0x7a
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL74-.Ltext0
	.quad	.LFE2286-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	0
	.quad	0
.LLST28:
	.quad	.LVL76-.Ltext0
	.quad	.LVL79-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 0
	.quad	.LVL79-.Ltext0
	.quad	.LVL84-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL84-.Ltext0
	.quad	.LVL89-.Ltext0
	.value	0x8
	.byte	0x73
	.sleb128 0
	.byte	0x71
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x4
	.byte	0x9f
	.quad	.LVL90-.Ltext0
	.quad	.LFE2288-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST29:
	.quad	.LVL77-.Ltext0
	.quad	.LVL80-.Ltext0
	.value	0x2
	.byte	0x71
	.sleb128 0
	.quad	.LVL80-.Ltext0
	.quad	.LVL84-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL84-.Ltext0
	.quad	.LVL85-.Ltext0
	.value	0x8
	.byte	0x79
	.sleb128 0
	.byte	0x71
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x4
	.byte	0x9f
	.quad	.LVL85-.Ltext0
	.quad	.LVL88-.Ltext0
	.value	0x6
	.byte	0x79
	.sleb128 0
	.byte	0x71
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL88-.Ltext0
	.quad	.LVL89-.Ltext0
	.value	0x8
	.byte	0x79
	.sleb128 0
	.byte	0x71
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x4
	.byte	0x9f
	.quad	.LVL90-.Ltext0
	.quad	.LFE2288-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	0
	.quad	0
.LLST30:
	.quad	.LVL81-.Ltext0
	.quad	.LVL84-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL84-.Ltext0
	.quad	.LVL90-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL90-.Ltext0
	.quad	.LFE2288-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST31:
	.quad	.LVL81-.Ltext0
	.quad	.LVL84-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL84-.Ltext0
	.quad	.LVL89-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL90-.Ltext0
	.quad	.LFE2288-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST32:
	.quad	.LVL81-.Ltext0
	.quad	.LVL82-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL82-.Ltext0
	.quad	.LVL83-.Ltext0
	.value	0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL83-.Ltext0
	.quad	.LVL84-.Ltext0
	.value	0x13
	.byte	0x3
	.quad	g_width
	.byte	0x94
	.byte	0x4
	.byte	0x75
	.sleb128 44
	.byte	0x94
	.byte	0x4
	.byte	0x1e
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL90-.Ltext0
	.quad	.LFE2288-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	0
	.quad	0
.LLST33:
	.quad	.LVL92-.Ltext0
	.quad	.LVL95-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 0
	.quad	.LVL95-.Ltext0
	.quad	.LVL99-.Ltext0
	.value	0x1
	.byte	0x5b
	.quad	.LVL99-.Ltext0
	.quad	.LVL102-.Ltext0
	.value	0x8
	.byte	0x71
	.sleb128 1
	.byte	0x32
	.byte	0x24
	.byte	0x7b
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL102-.Ltext0
	.quad	.LVL104-.Ltext0
	.value	0x8
	.byte	0x71
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x7b
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL105-.Ltext0
	.quad	.LFE2290-.Ltext0
	.value	0x1
	.byte	0x5b
	.quad	0
	.quad	0
.LLST34:
	.quad	.LVL93-.Ltext0
	.quad	.LVL96-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 0
	.quad	.LVL96-.Ltext0
	.quad	.LVL99-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL99-.Ltext0
	.quad	.LVL102-.Ltext0
	.value	0x8
	.byte	0x71
	.sleb128 1
	.byte	0x32
	.byte	0x24
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL102-.Ltext0
	.quad	.LVL104-.Ltext0
	.value	0x8
	.byte	0x71
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL105-.Ltext0
	.quad	.LFE2290-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST35:
	.quad	.LVL94-.Ltext0
	.quad	.LVL97-.Ltext0
	.value	0x2
	.byte	0x71
	.sleb128 0
	.quad	.LVL97-.Ltext0
	.quad	.LVL99-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL99-.Ltext0
	.quad	.LVL102-.Ltext0
	.value	0x8
	.byte	0x71
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x79
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL102-.Ltext0
	.quad	.LVL103-.Ltext0
	.value	0x8
	.byte	0x71
	.sleb128 -1
	.byte	0x32
	.byte	0x24
	.byte	0x79
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL105-.Ltext0
	.quad	.LFE2290-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	0
	.quad	0
.LLST36:
	.quad	.LVL97-.Ltext0
	.quad	.LVL99-.Ltext0
	.value	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.quad	.LVL99-.Ltext0
	.quad	.LVL104-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL105-.Ltext0
	.quad	.LFE2290-.Ltext0
	.value	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.quad	0
	.quad	0
.LLST37:
	.quad	.LVL97-.Ltext0
	.quad	.LVL99-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL99-.Ltext0
	.quad	.LVL104-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL105-.Ltext0
	.quad	.LFE2290-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST38:
	.quad	.LVL97-.Ltext0
	.quad	.LVL99-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL99-.Ltext0
	.quad	.LVL104-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL105-.Ltext0
	.quad	.LFE2290-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST39:
	.quad	.LVL97-.Ltext0
	.quad	.LVL98-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL98-.Ltext0
	.quad	.LVL99-.Ltext0
	.value	0x3
	.byte	0x7a
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL105-.Ltext0
	.quad	.LFE2290-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	0
	.quad	0
.LLST40:
	.quad	.LVL106-.Ltext0
	.quad	.LVL112-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL112-.Ltext0
	.quad	.LVL126-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL126-.Ltext0
	.quad	.LVL128-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -64
	.quad	.LVL128-.Ltext0
	.quad	.LFE2292-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST42:
	.quad	.LVL109-.Ltext0
	.quad	.LVL127-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL127-.Ltext0
	.quad	.LVL128-.Ltext0
	.value	0x6
	.byte	0x91
	.sleb128 -64
	.byte	0x6
	.byte	0x23
	.uleb128 0x10
	.byte	0x6
	.quad	.LVL128-.Ltext0
	.quad	.LFE2292-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST43:
	.quad	.LVL109-.Ltext0
	.quad	.LVL113-.Ltext0
	.value	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.quad	.LVL113-.Ltext0
	.quad	.LVL125-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL128-.Ltext0
	.quad	.LFE2292-.Ltext0
	.value	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.quad	0
	.quad	0
.LLST44:
	.quad	.LVL109-.Ltext0
	.quad	.LVL113-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL113-.Ltext0
	.quad	.LVL125-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL128-.Ltext0
	.quad	.LFE2292-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST45:
	.quad	.LVL109-.Ltext0
	.quad	.LVL113-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL113-.Ltext0
	.quad	.LVL125-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL128-.Ltext0
	.quad	.LFE2292-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST46:
	.quad	.LVL109-.Ltext0
	.quad	.LVL113-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL113-.Ltext0
	.quad	.LVL123-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	.LVL124-.Ltext0
	.quad	.LVL125-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL125-.Ltext0
	.quad	.LVL128-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	.LVL128-.Ltext0
	.quad	.LFE2292-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST47:
	.quad	.LVL110-.Ltext0
	.quad	.LVL111-.Ltext0
	.value	0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL111-.Ltext0
	.quad	.LVL112-.Ltext0
	.value	0x7
	.byte	0x75
	.sleb128 48
	.byte	0x94
	.byte	0x4
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL112-.Ltext0
	.quad	.LVL113-.Ltext0
	.value	0xa
	.byte	0x77
	.sleb128 0
	.byte	0x6
	.byte	0x23
	.uleb128 0x30
	.byte	0x94
	.byte	0x4
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL128-.Ltext0
	.quad	.LFE2292-.Ltext0
	.value	0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST48:
	.quad	.LVL113-.Ltext0
	.quad	.LVL114-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL114-.Ltext0
	.quad	.LVL122-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST49:
	.quad	.LVL113-.Ltext0
	.quad	.LVL114-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	.LVL114-.Ltext0
	.quad	.LVL122-.Ltext0
	.value	0x7
	.byte	0x73
	.sleb128 0
	.byte	0x20
	.byte	0x7e
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	0
	.quad	0
.LLST50:
	.quad	.LVL114-.Ltext0
	.quad	.LVL115-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL115-.Ltext0
	.quad	.LVL122-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LLST51:
	.quad	.LVL114-.Ltext0
	.quad	.LVL115-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	.LVL115-.Ltext0
	.quad	.LVL116-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL116-.Ltext0
	.quad	.LVL117-.Ltext0
	.value	0x3
	.byte	0x71
	.sleb128 1
	.byte	0x9f
	.quad	.LVL117-.Ltext0
	.quad	.LVL122-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST52:
	.quad	.LVL130-.Ltext0
	.quad	.LVL131-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 0
	.quad	.LVL131-.Ltext0
	.quad	.LVL138-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL139-.Ltext0
	.quad	.LFE2302-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST53:
	.quad	.LVL132-.Ltext0
	.quad	.LVL134-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL134-.Ltext0
	.quad	.LVL137-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL139-.Ltext0
	.quad	.LFE2302-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST54:
	.quad	.LVL132-.Ltext0
	.quad	.LVL133-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL133-.Ltext0
	.quad	.LVL134-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL139-.Ltext0
	.quad	.LFE2302-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST55:
	.quad	.LVL142-.Ltext0
	.quad	.LVL143-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL143-.Ltext0
	.quad	.LFE2258-.Ltext0
	.value	0x9
	.byte	0x3
	.quad	g_width
	.quad	0
	.quad	0
.LLST56:
	.quad	.LVL144-.Ltext0
	.quad	.LVL146-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL146-.Ltext0
	.quad	.LFE2259-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST57:
	.quad	.LVL145-.Ltext0
	.quad	.LVL147-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL147-.Ltext0
	.quad	.LVL151-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL151-.Ltext0
	.quad	.LVL154-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL155-.Ltext0
	.quad	.LVL158-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL159-.Ltext0
	.quad	.LFE2259-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST58:
	.quad	.LVL145-.Ltext0
	.quad	.LVL146-.Ltext0
	.value	0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL146-.Ltext0
	.quad	.LVL155-.Ltext0
	.value	0x3
	.byte	0x7d
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL155-.Ltext0
	.quad	.LVL156-.Ltext0
	.value	0x3
	.byte	0x7d
	.sleb128 -2
	.byte	0x9f
	.quad	.LVL156-.Ltext0
	.quad	.LVL157-.Ltext0
	.value	0x3
	.byte	0x7d
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL159-.Ltext0
	.quad	.LFE2259-.Ltext0
	.value	0x3
	.byte	0x7d
	.sleb128 -1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST59:
	.quad	.LVL149-.Ltext0
	.quad	.LVL150-.Ltext0
	.value	0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL150-.Ltext0
	.quad	.LVL151-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL159-.Ltext0
	.quad	.LFE2259-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST60:
	.quad	.LVL160-.Ltext0
	.quad	.LVL162-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL162-.Ltext0
	.quad	.LFE2260-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST61:
	.quad	.LVL160-.Ltext0
	.quad	.LVL163-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL163-.Ltext0
	.quad	.LFE2260-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST62:
	.quad	.LVL160-.Ltext0
	.quad	.LVL161-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 0
	.quad	.LVL164-.Ltext0
	.quad	.LVL165-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL165-.Ltext0
	.quad	.LVL171-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST63:
	.quad	.LVL167-.Ltext0
	.quad	.LVL168-.Ltext0
	.value	0x3
	.byte	0x70
	.sleb128 -2
	.byte	0x9f
	.quad	0
	.quad	0
.LLST64:
	.quad	.LVL173-.Ltext0
	.quad	.LVL176-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL176-.Ltext0
	.quad	.LFE2261-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST65:
	.quad	.LVL173-.Ltext0
	.quad	.LVL176-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL176-.Ltext0
	.quad	.LFE2261-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST66:
	.quad	.LVL173-.Ltext0
	.quad	.LVL174-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 0
	.quad	.LVL175-.Ltext0
	.quad	.LVL181-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST67:
	.quad	.LVL175-.Ltext0
	.quad	.LVL176-.Ltext0
	.value	0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL176-.Ltext0
	.quad	.LVL178-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL178-.Ltext0
	.quad	.LVL179-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -2
	.byte	0x9f
	.quad	.LVL179-.Ltext0
	.quad	.LVL180-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST68:
	.quad	.LVL182-.Ltext0
	.quad	.LVL184-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL184-.Ltext0
	.quad	.LFE2262-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST69:
	.quad	.LVL182-.Ltext0
	.quad	.LVL183-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL183-.Ltext0
	.quad	.LFE2262-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST70:
	.quad	.LVL182-.Ltext0
	.quad	.LVL185-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL185-.Ltext0
	.quad	.LFE2262-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	0
	.quad	0
.LLST71:
	.quad	.LVL200-.Ltext0
	.quad	.LVL201-.Ltext0
	.value	0x3
	.byte	0x75
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL201-.Ltext0
	.quad	.LVL223-.Ltext0
	.value	0x3
	.byte	0x7f
	.sleb128 -1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST72:
	.quad	.LVL203-.Ltext0
	.quad	.LVL205-.Ltext0
	.value	0x2
	.byte	0x7d
	.sleb128 0
	.quad	.LVL205-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL219-.Ltext0
	.quad	.LVL222-.Ltext0
	.value	0x2
	.byte	0x7d
	.sleb128 0
	.quad	0
	.quad	0
.LLST73:
	.quad	.LVL204-.Ltext0
	.quad	.LVL206-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL206-.Ltext0
	.quad	.LVL221-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST74:
	.quad	.LVL204-.Ltext0
	.quad	.LVL207-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL207-.Ltext0
	.quad	.LVL211-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	0
	.quad	0
.LLST75:
	.quad	.LVL190-.Ltext0
	.quad	.LVL191-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL191-.Ltext0
	.quad	.LVL196-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST76:
	.quad	.LVL188-.Ltext0
	.quad	.LVL189-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL189-1-.Ltext0
	.quad	.LVL195-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL195-.Ltext0
	.quad	.LVL196-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST77:
	.quad	.LVL190-.Ltext0
	.quad	.LVL192-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL192-.Ltext0
	.quad	.LVL193-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL193-.Ltext0
	.quad	.LVL194-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 1
	.byte	0x9f
	.quad	.LVL194-.Ltext0
	.quad	.LVL196-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST78:
	.quad	.LVL198-.Ltext0
	.quad	.LVL199-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL199-1-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL220-.Ltext0
	.quad	.LFE2267-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST79:
	.quad	.LVL204-.Ltext0
	.quad	.LVL207-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL207-.Ltext0
	.quad	.LVL208-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL208-.Ltext0
	.quad	.LVL210-.Ltext0
	.value	0x3
	.byte	0x75
	.sleb128 1
	.byte	0x9f
	.quad	.LVL210-.Ltext0
	.quad	.LVL211-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST80:
	.quad	.LVL209-.Ltext0
	.quad	.LVL211-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LLST81:
	.quad	.LVL211-.Ltext0
	.quad	.LVL212-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL212-.Ltext0
	.quad	.LVL213-.Ltext0
	.value	0x3
	.byte	0x7e
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL213-.Ltext0
	.quad	.LVL214-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST82:
	.quad	.LVL214-.Ltext0
	.quad	.LVL215-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL215-.Ltext0
	.quad	.LVL216-.Ltext0
	.value	0x3
	.byte	0x7e
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL216-.Ltext0
	.quad	.LVL217-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST83:
	.quad	.LVL224-.Ltext0
	.quad	.LVL225-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL225-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL240-.Ltext0
	.quad	.LVL243-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL243-.Ltext0
	.quad	.LFE2268-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST84:
	.quad	.LVL229-.Ltext0
	.quad	.LVL230-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL230-1-.Ltext0
	.quad	.LVL237-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL237-.Ltext0
	.quad	.LVL238-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -4
	.byte	0x9f
	.quad	.LVL238-.Ltext0
	.quad	.LVL241-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL243-.Ltext0
	.quad	.LFE2268-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST85:
	.quad	.LVL231-.Ltext0
	.quad	.LVL232-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL232-.Ltext0
	.quad	.LFE2268-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	0
	.quad	0
.LLST86:
	.quad	.LVL231-.Ltext0
	.quad	.LVL234-.Ltext0
	.value	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.quad	.LVL234-.Ltext0
	.quad	.LVL239-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL243-.Ltext0
	.quad	.LFE2268-.Ltext0
	.value	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.quad	0
	.quad	0
.LLST87:
	.quad	.LVL231-.Ltext0
	.quad	.LVL234-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL234-.Ltext0
	.quad	.LVL239-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL243-.Ltext0
	.quad	.LFE2268-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST88:
	.quad	.LVL231-.Ltext0
	.quad	.LVL234-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL234-.Ltext0
	.quad	.LVL239-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL243-.Ltext0
	.quad	.LFE2268-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST89:
	.quad	.LVL227-.Ltext0
	.quad	.LVL228-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL228-1-.Ltext0
	.quad	.LVL242-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL242-.Ltext0
	.quad	.LVL243-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL243-.Ltext0
	.quad	.LFE2268-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST90:
	.quad	.LVL231-.Ltext0
	.quad	.LVL232-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL232-.Ltext0
	.quad	.LVL233-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL233-.Ltext0
	.quad	.LVL234-.Ltext0
	.value	0x3
	.byte	0x7d
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL243-.Ltext0
	.quad	.LFE2268-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST91:
	.quad	.LVL244-.Ltext0
	.quad	.LVL245-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL245-1-.Ltext0
	.quad	.LFE2270-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST92:
	.quad	.LVL246-.Ltext0
	.quad	.LVL248-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL248-.Ltext0
	.quad	.LVL257-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL257-.Ltext0
	.quad	.LVL259-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 8
	.quad	.LVL259-.Ltext0
	.quad	.LVL260-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL260-.Ltext0
	.quad	.LVL282-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL282-.Ltext0
	.quad	.LVL284-.Ltext0
	.value	0x2
	.byte	0x73
	.sleb128 8
	.quad	.LVL284-.Ltext0
	.quad	.LVL291-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL291-.Ltext0
	.quad	.LVL292-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL292-.Ltext0
	.quad	.LVL297-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL297-.Ltext0
	.quad	.LVL298-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL298-.Ltext0
	.quad	.LFE2273-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST93:
	.quad	.LVL264-.Ltext0
	.quad	.LVL265-1-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL265-1-.Ltext0
	.quad	.LVL280-.Ltext0
	.value	0x6
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL298-.Ltext0
	.quad	.LFE2273-.Ltext0
	.value	0x6
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST94:
	.quad	.LVL266-.Ltext0
	.quad	.LVL269-.Ltext0
	.value	0x2
	.byte	0x7c
	.sleb128 0
	.quad	.LVL269-.Ltext0
	.quad	.LVL288-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL288-.Ltext0
	.quad	.LVL290-.Ltext0
	.value	0x2
	.byte	0x7c
	.sleb128 0
	.quad	.LVL298-.Ltext0
	.quad	.LFE2273-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	0
	.quad	0
.LLST95:
	.quad	.LVL267-.Ltext0
	.quad	.LVL270-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL270-.Ltext0
	.quad	.LVL278-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL298-.Ltext0
	.quad	.LFE2273-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST96:
	.quad	.LVL267-.Ltext0
	.quad	.LVL271-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL271-.Ltext0
	.quad	.LVL275-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL298-.Ltext0
	.quad	.LFE2273-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST97:
	.quad	.LVL247-.Ltext0
	.quad	.LVL248-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL248-.Ltext0
	.quad	.LVL257-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL257-.Ltext0
	.quad	.LVL259-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 8
	.quad	0
	.quad	0
.LLST98:
	.quad	.LVL252-.Ltext0
	.quad	.LVL253-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL253-.Ltext0
	.quad	.LVL259-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST99:
	.quad	.LVL250-.Ltext0
	.quad	.LVL251-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL251-1-.Ltext0
	.quad	.LVL258-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL258-.Ltext0
	.quad	.LVL259-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST100:
	.quad	.LVL252-.Ltext0
	.quad	.LVL253-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL253-.Ltext0
	.quad	.LVL254-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL254-.Ltext0
	.quad	.LVL255-.Ltext0
	.value	0x3
	.byte	0x7c
	.sleb128 -1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST101:
	.quad	.LVL262-.Ltext0
	.quad	.LVL263-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL263-1-.Ltext0
	.quad	.LVL289-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL289-.Ltext0
	.quad	.LVL291-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL298-.Ltext0
	.quad	.LFE2273-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST102:
	.quad	.LVL267-.Ltext0
	.quad	.LVL268-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -56
	.quad	.LVL268-.Ltext0
	.quad	.LVL271-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL271-.Ltext0
	.quad	.LVL272-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL272-.Ltext0
	.quad	.LVL274-.Ltext0
	.value	0x3
	.byte	0x75
	.sleb128 1
	.byte	0x9f
	.quad	.LVL274-.Ltext0
	.quad	.LVL275-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL298-.Ltext0
	.quad	.LFE2273-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST103:
	.quad	.LVL273-.Ltext0
	.quad	.LVL275-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST104:
	.quad	.LVL275-.Ltext0
	.quad	.LVL276-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL276-.Ltext0
	.quad	.LVL277-.Ltext0
	.value	0x3
	.byte	0x7d
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL277-.Ltext0
	.quad	.LVL279-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST105:
	.quad	.LVL284-.Ltext0
	.quad	.LVL285-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL285-.Ltext0
	.quad	.LVL286-.Ltext0
	.value	0x3
	.byte	0x7d
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL286-.Ltext0
	.quad	.LVL287-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL287-.Ltext0
	.quad	.LVL291-.Ltext0
	.value	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.quad	0
	.quad	0
.LLST106:
	.quad	.LVL294-.Ltext0
	.quad	.LVL295-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL295-1-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL296-.Ltext0
	.quad	.LVL298-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST107:
	.quad	.LVL299-.Ltext0
	.quad	.LVL301-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL301-.Ltext0
	.quad	.LVL302-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL302-1-.Ltext0
	.quad	.LVL306-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL306-.Ltext0
	.quad	.LVL307-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL307-.Ltext0
	.quad	.LVL309-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL309-1-.Ltext0
	.quad	.LVL325-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -56
	.quad	.LVL325-.Ltext0
	.quad	.LVL326-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	.LVL326-.Ltext0
	.quad	.LVL327-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL327-1-.Ltext0
	.quad	.LVL328-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL328-.Ltext0
	.quad	.LVL329-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL329-.Ltext0
	.quad	.LVL330-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL330-1-.Ltext0
	.quad	.LVL346-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	.LVL346-.Ltext0
	.quad	.LVL377-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL377-.Ltext0
	.quad	.LVL378-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	.LVL378-.Ltext0
	.quad	.LFE2276-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	0
	.quad	0
.LLST108:
	.quad	.LVL299-.Ltext0
	.quad	.LVL300-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL300-.Ltext0
	.quad	.LVL306-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL306-.Ltext0
	.quad	.LVL309-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL309-1-.Ltext0
	.quad	.LVL325-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -64
	.quad	.LVL325-.Ltext0
	.quad	.LVL326-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	.LVL326-.Ltext0
	.quad	.LVL327-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL327-1-.Ltext0
	.quad	.LVL328-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL328-.Ltext0
	.quad	.LVL330-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL330-1-.Ltext0
	.quad	.LVL360-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -88
	.quad	.LVL360-.Ltext0
	.quad	.LVL377-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL377-.Ltext0
	.quad	.LVL378-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	.LVL378-.Ltext0
	.quad	.LFE2276-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -88
	.quad	0
	.quad	0
.LLST109:
	.quad	.LVL330-.Ltext0
	.quad	.LVL331-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -112
	.quad	0
	.quad	0
.LLST110:
	.quad	.LVL337-.Ltext0
	.quad	.LVL338-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL338-1-.Ltext0
	.quad	.LVL352-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL352-.Ltext0
	.quad	.LVL356-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	.LVL378-.Ltext0
	.quad	.LFE2276-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST111:
	.quad	.LVL339-.Ltext0
	.quad	.LVL340-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL340-1-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL361-.Ltext0
	.quad	.LVL377-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -88
	.quad	.LVL378-.Ltext0
	.quad	.LFE2276-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST112:
	.quad	.LVL341-.Ltext0
	.quad	.LVL344-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL344-.Ltext0
	.quad	.LVL362-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL362-.Ltext0
	.quad	.LVL377-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -96
	.quad	.LVL378-.Ltext0
	.quad	.LFE2276-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST113:
	.quad	.LVL341-.Ltext0
	.quad	.LVL347-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL347-.Ltext0
	.quad	.LVL351-.Ltext0
	.value	0x7
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL378-.Ltext0
	.quad	.LFE2276-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST114:
	.quad	.LVL342-.Ltext0
	.quad	.LVL373-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL378-.Ltext0
	.quad	.LFE2276-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	0
	.quad	0
.LLST115:
	.quad	.LVL342-.Ltext0
	.quad	.LVL347-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL347-.Ltext0
	.quad	.LVL352-.Ltext0
	.value	0x1
	.byte	0x5b
	.quad	.LVL378-.Ltext0
	.quad	.LFE2276-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST116:
	.quad	.LVL358-.Ltext0
	.quad	.LVL364-.Ltext0
	.value	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.quad	.LVL364-.Ltext0
	.quad	.LVL376-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST117:
	.quad	.LVL358-.Ltext0
	.quad	.LVL364-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL364-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL369-.Ltext0
	.quad	.LVL370-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL370-.Ltext0
	.quad	.LVL372-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	0
	.quad	0
.LLST118:
	.quad	.LVL358-.Ltext0
	.quad	.LVL364-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL364-.Ltext0
	.quad	.LVL371-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL371-.Ltext0
	.quad	.LVL374-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST119:
	.quad	.LVL303-.Ltext0
	.quad	.LVL304-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL304-1-.Ltext0
	.quad	.LVL305-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL305-.Ltext0
	.quad	.LVL306-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST120:
	.quad	.LVL308-.Ltext0
	.quad	.LVL325-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -64
	.quad	.LVL325-.Ltext0
	.quad	.LVL326-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	.LVL377-.Ltext0
	.quad	.LVL378-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	0
	.quad	0
.LLST121:
	.quad	.LVL308-.Ltext0
	.quad	.LVL325-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -56
	.quad	.LVL325-.Ltext0
	.quad	.LVL326-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	.LVL377-.Ltext0
	.quad	.LVL378-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	0
	.quad	0
.LLST122:
	.quad	.LVL312-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL313-.Ltext0
	.quad	.LVL319-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL319-.Ltext0
	.quad	.LVL320-.Ltext0
	.value	0x3
	.byte	0x71
	.sleb128 -4
	.byte	0x9f
	.quad	.LVL320-.Ltext0
	.quad	.LVL323-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL377-.Ltext0
	.quad	.LVL378-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST123:
	.quad	.LVL312-.Ltext0
	.quad	.LVL316-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -56
	.quad	.LVL316-.Ltext0
	.quad	.LVL322-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL377-.Ltext0
	.quad	.LVL378-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	0
	.quad	0
.LLST124:
	.quad	.LVL312-.Ltext0
	.quad	.LVL316-.Ltext0
	.value	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.quad	.LVL316-.Ltext0
	.quad	.LVL322-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL377-.Ltext0
	.quad	.LVL378-.Ltext0
	.value	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.quad	0
	.quad	0
.LLST125:
	.quad	.LVL312-.Ltext0
	.quad	.LVL316-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL316-.Ltext0
	.quad	.LVL322-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL377-.Ltext0
	.quad	.LVL378-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST126:
	.quad	.LVL312-.Ltext0
	.quad	.LVL316-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL316-.Ltext0
	.quad	.LVL322-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL377-.Ltext0
	.quad	.LVL378-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST127:
	.quad	.LVL310-.Ltext0
	.quad	.LVL311-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL311-1-.Ltext0
	.quad	.LVL324-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL324-.Ltext0
	.quad	.LVL326-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL377-.Ltext0
	.quad	.LVL378-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST128:
	.quad	.LVL312-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL313-.Ltext0
	.quad	.LVL314-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL314-.Ltext0
	.quad	.LVL315-.Ltext0
	.value	0x3
	.byte	0x7c
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL377-.Ltext0
	.quad	.LVL378-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST129:
	.quad	.LVL333-.Ltext0
	.quad	.LVL334-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL334-1-.Ltext0
	.quad	.LVL335-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL335-.Ltext0
	.quad	.LVL377-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -104
	.quad	.LVL378-.Ltext0
	.quad	.LFE2276-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -104
	.quad	0
	.quad	0
.LLST130:
	.quad	.LVL342-.Ltext0
	.quad	.LVL343-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	.LVL343-.Ltext0
	.quad	.LVL345-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL345-.Ltext0
	.quad	.LVL349-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL349-.Ltext0
	.quad	.LVL350-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 48
	.quad	.LVL350-.Ltext0
	.quad	.LVL352-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL378-.Ltext0
	.quad	.LVL379-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL379-.Ltext0
	.quad	.LFE2276-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST131:
	.quad	.LVL348-.Ltext0
	.quad	.LVL352-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST132:
	.quad	.LVL352-.Ltext0
	.quad	.LVL353-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL353-.Ltext0
	.quad	.LVL354-.Ltext0
	.value	0x3
	.byte	0x7c
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL354-.Ltext0
	.quad	.LVL355-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST133:
	.quad	.LVL358-.Ltext0
	.quad	.LVL359-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL359-.Ltext0
	.quad	.LVL363-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 1
	.byte	0x9f
	.quad	.LVL363-.Ltext0
	.quad	.LVL364-.Ltext0
	.value	0x3
	.byte	0x7d
	.sleb128 1
	.byte	0x9f
	.quad	.LVL364-.Ltext0
	.quad	.LVL375-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST134:
	.quad	.LVL380-.Ltext0
	.quad	.LVL381-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL381-.Ltext0
	.quad	.LVL410-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL410-.Ltext0
	.quad	.LVL412-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL412-.Ltext0
	.quad	.LVL413-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL413-.Ltext0
	.quad	.LVL420-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL420-.Ltext0
	.quad	.LVL421-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL421-.Ltext0
	.quad	.LFE2279-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST135:
	.quad	.LVL386-.Ltext0
	.quad	.LVL387-1-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL387-1-.Ltext0
	.quad	.LVL411-.Ltext0
	.value	0x6
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL411-.Ltext0
	.quad	.LVL412-.Ltext0
	.value	0x7
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL421-.Ltext0
	.quad	.LFE2279-.Ltext0
	.value	0x7
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST136:
	.quad	.LVL388-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x2
	.byte	0x7d
	.sleb128 0
	.quad	.LVL391-.Ltext0
	.quad	.LVL406-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL406-.Ltext0
	.quad	.LVL409-.Ltext0
	.value	0x2
	.byte	0x7d
	.sleb128 0
	.quad	.LVL421-.Ltext0
	.quad	.LFE2279-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	0
	.quad	0
.LLST137:
	.quad	.LVL389-.Ltext0
	.quad	.LVL392-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL392-.Ltext0
	.quad	.LVL407-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL421-.Ltext0
	.quad	.LVL422-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL422-.Ltext0
	.quad	.LFE2279-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST138:
	.quad	.LVL389-.Ltext0
	.quad	.LVL393-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL393-.Ltext0
	.quad	.LVL397-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL421-.Ltext0
	.quad	.LFE2279-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST139:
	.quad	.LVL383-.Ltext0
	.quad	.LVL384-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL384-.Ltext0
	.quad	.LVL408-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL408-.Ltext0
	.quad	.LVL412-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL421-.Ltext0
	.quad	.LFE2279-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST140:
	.quad	.LVL389-.Ltext0
	.quad	.LVL390-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -56
	.quad	.LVL390-.Ltext0
	.quad	.LVL393-.Ltext0
	.value	0x7
	.byte	0x76
	.sleb128 -56
	.byte	0x94
	.byte	0x4
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL393-.Ltext0
	.quad	.LVL394-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL394-.Ltext0
	.quad	.LVL396-.Ltext0
	.value	0x3
	.byte	0x75
	.sleb128 1
	.byte	0x9f
	.quad	.LVL396-.Ltext0
	.quad	.LVL397-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL421-.Ltext0
	.quad	.LFE2279-.Ltext0
	.value	0x8
	.byte	0x91
	.sleb128 -72
	.byte	0x94
	.byte	0x4
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST141:
	.quad	.LVL395-.Ltext0
	.quad	.LVL397-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST142:
	.quad	.LVL398-.Ltext0
	.quad	.LVL399-.Ltext0
	.value	0x3
	.byte	0x7f
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL399-.Ltext0
	.quad	.LVL400-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST143:
	.quad	.LVL401-.Ltext0
	.quad	.LVL402-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL402-.Ltext0
	.quad	.LVL403-.Ltext0
	.value	0x3
	.byte	0x7f
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL403-.Ltext0
	.quad	.LVL404-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL423-.Ltext0
	.quad	.LFE2279-.Ltext0
	.value	0x8
	.byte	0x91
	.sleb128 -72
	.byte	0x94
	.byte	0x4
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST144:
	.quad	.LVL412-.Ltext0
	.quad	.LVL413-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL413-.Ltext0
	.quad	.LVL420-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL420-.Ltext0
	.quad	.LVL421-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST145:
	.quad	.LVL415-.Ltext0
	.quad	.LVL416-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL416-.Ltext0
	.quad	.LVL419-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL419-.Ltext0
	.quad	.LVL421-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST146:
	.quad	.LVL424-.Ltext0
	.quad	.LVL426-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL426-.Ltext0
	.quad	.LVL436-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL436-.Ltext0
	.quad	.LVL438-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL438-.Ltext0
	.quad	.LVL439-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL439-.Ltext0
	.quad	.LVL465-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL465-.Ltext0
	.quad	.LFE2282-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST147:
	.quad	.LVL444-.Ltext0
	.quad	.LVL445-1-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL445-1-.Ltext0
	.quad	.LVL468-.Ltext0
	.value	0x6
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL468-.Ltext0
	.quad	.LFE2282-.Ltext0
	.value	0x7
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST148:
	.quad	.LVL446-.Ltext0
	.quad	.LVL449-.Ltext0
	.value	0x2
	.byte	0x7e
	.sleb128 0
	.quad	.LVL449-.Ltext0
	.quad	.LVL463-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL463-.Ltext0
	.quad	.LVL467-.Ltext0
	.value	0x2
	.byte	0x7e
	.sleb128 0
	.quad	0
	.quad	0
.LLST149:
	.quad	.LVL447-.Ltext0
	.quad	.LVL450-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL450-.Ltext0
	.quad	.LVL466-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST150:
	.quad	.LVL447-.Ltext0
	.quad	.LVL451-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL451-.Ltext0
	.quad	.LVL455-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	0
	.quad	0
.LLST151:
	.quad	.LVL425-.Ltext0
	.quad	.LVL426-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL426-.Ltext0
	.quad	.LVL436-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL436-.Ltext0
	.quad	.LVL438-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST152:
	.quad	.LVL430-.Ltext0
	.quad	.LVL431-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL431-.Ltext0
	.quad	.LVL438-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST153:
	.quad	.LVL430-.Ltext0
	.quad	.LVL434-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL434-.Ltext0
	.quad	.LVL435-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 4
	.byte	0x9f
	.quad	.LVL435-.Ltext0
	.quad	.LVL438-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST154:
	.quad	.LVL428-.Ltext0
	.quad	.LVL429-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL429-1-.Ltext0
	.quad	.LVL437-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL437-.Ltext0
	.quad	.LVL438-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST155:
	.quad	.LVL430-.Ltext0
	.quad	.LVL431-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL431-.Ltext0
	.quad	.LVL432-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL432-.Ltext0
	.quad	.LVL433-.Ltext0
	.value	0x3
	.byte	0x7e
	.sleb128 -1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST156:
	.quad	.LVL441-.Ltext0
	.quad	.LVL442-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL442-.Ltext0
	.quad	.LVL464-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL464-.Ltext0
	.quad	.LFE2282-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST157:
	.quad	.LVL447-.Ltext0
	.quad	.LVL448-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -56
	.quad	.LVL448-.Ltext0
	.quad	.LVL451-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL451-.Ltext0
	.quad	.LVL452-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL452-.Ltext0
	.quad	.LVL454-.Ltext0
	.value	0x3
	.byte	0x75
	.sleb128 1
	.byte	0x9f
	.quad	.LVL454-.Ltext0
	.quad	.LVL455-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST158:
	.quad	.LVL453-.Ltext0
	.quad	.LVL455-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST159:
	.quad	.LVL455-.Ltext0
	.quad	.LVL456-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL456-.Ltext0
	.quad	.LVL457-.Ltext0
	.value	0x3
	.byte	0x7f
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL457-.Ltext0
	.quad	.LVL458-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST160:
	.quad	.LVL458-.Ltext0
	.quad	.LVL459-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL459-.Ltext0
	.quad	.LVL460-.Ltext0
	.value	0x3
	.byte	0x7f
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL460-.Ltext0
	.quad	.LVL461-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST161:
	.quad	.LVL469-.Ltext0
	.quad	.LVL470-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL470-1-.Ltext0
	.quad	.LVL499-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL499-.Ltext0
	.quad	.LVL501-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL501-.Ltext0
	.quad	.LVL503-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL503-.Ltext0
	.quad	.LVL504-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL504-.Ltext0
	.quad	.LFE2284-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST162:
	.quad	.LVL470-.Ltext0
	.quad	.LVL471-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST163:
	.quad	.LVL475-.Ltext0
	.quad	.LVL476-1-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL476-1-.Ltext0
	.quad	.LVL500-.Ltext0
	.value	0x6
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL500-.Ltext0
	.quad	.LVL501-.Ltext0
	.value	0x7
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL504-.Ltext0
	.quad	.LFE2284-.Ltext0
	.value	0x7
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST164:
	.quad	.LVL477-.Ltext0
	.quad	.LVL480-.Ltext0
	.value	0x2
	.byte	0x7c
	.sleb128 0
	.quad	.LVL480-.Ltext0
	.quad	.LVL495-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL495-.Ltext0
	.quad	.LVL497-.Ltext0
	.value	0x2
	.byte	0x7c
	.sleb128 0
	.quad	.LVL504-.Ltext0
	.quad	.LFE2284-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	0
	.quad	0
.LLST165:
	.quad	.LVL478-.Ltext0
	.quad	.LVL481-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL481-.Ltext0
	.quad	.LVL496-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL504-.Ltext0
	.quad	.LVL505-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL505-.Ltext0
	.quad	.LFE2284-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST166:
	.quad	.LVL478-.Ltext0
	.quad	.LVL482-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL482-.Ltext0
	.quad	.LVL486-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL504-.Ltext0
	.quad	.LFE2284-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST167:
	.quad	.LVL473-.Ltext0
	.quad	.LVL474-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL474-1-.Ltext0
	.quad	.LVL498-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL498-.Ltext0
	.quad	.LVL501-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL504-.Ltext0
	.quad	.LFE2284-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST168:
	.quad	.LVL478-.Ltext0
	.quad	.LVL479-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -56
	.quad	.LVL479-.Ltext0
	.quad	.LVL482-.Ltext0
	.value	0x7
	.byte	0x76
	.sleb128 -56
	.byte	0x94
	.byte	0x4
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL482-.Ltext0
	.quad	.LVL483-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL483-.Ltext0
	.quad	.LVL485-.Ltext0
	.value	0x3
	.byte	0x75
	.sleb128 1
	.byte	0x9f
	.quad	.LVL485-.Ltext0
	.quad	.LVL486-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL504-.Ltext0
	.quad	.LFE2284-.Ltext0
	.value	0x8
	.byte	0x91
	.sleb128 -72
	.byte	0x94
	.byte	0x4
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST169:
	.quad	.LVL484-.Ltext0
	.quad	.LVL486-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST170:
	.quad	.LVL487-.Ltext0
	.quad	.LVL488-.Ltext0
	.value	0x3
	.byte	0x7f
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL488-.Ltext0
	.quad	.LVL489-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST171:
	.quad	.LVL490-.Ltext0
	.quad	.LVL491-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL491-.Ltext0
	.quad	.LVL492-.Ltext0
	.value	0x3
	.byte	0x7f
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL492-.Ltext0
	.quad	.LVL493-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL506-.Ltext0
	.quad	.LFE2284-.Ltext0
	.value	0x8
	.byte	0x91
	.sleb128 -72
	.byte	0x94
	.byte	0x4
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST172:
	.quad	.LVL507-.Ltext0
	.quad	.LVL508-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL508-.Ltext0
	.quad	.LVL511-1-.Ltext0
	.value	0x1
	.byte	0x5b
	.quad	.LVL511-1-.Ltext0
	.quad	.LVL524-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -56
	.quad	.LVL524-.Ltext0
	.quad	.LVL525-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	.LVL525-.Ltext0
	.quad	.LVL526-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL526-.Ltext0
	.quad	.LVL527-1-.Ltext0
	.value	0x1
	.byte	0x5b
	.quad	.LVL527-1-.Ltext0
	.quad	.LVL547-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -88
	.quad	.LVL547-.Ltext0
	.quad	.LVL574-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL574-.Ltext0
	.quad	.LVL575-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	.LVL575-.Ltext0
	.quad	.LFE2287-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -88
	.quad	0
	.quad	0
.LLST173:
	.quad	.LVL507-.Ltext0
	.quad	.LVL511-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL511-1-.Ltext0
	.quad	.LVL524-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -64
	.quad	.LVL524-.Ltext0
	.quad	.LVL525-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	.LVL525-.Ltext0
	.quad	.LVL527-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL527-1-.Ltext0
	.quad	.LVL559-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -96
	.quad	.LVL559-.Ltext0
	.quad	.LVL574-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL574-.Ltext0
	.quad	.LVL575-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	.LVL575-.Ltext0
	.quad	.LFE2287-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -96
	.quad	0
	.quad	0
.LLST174:
	.quad	.LVL531-.Ltext0
	.quad	.LVL533-1-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL533-1-.Ltext0
	.quad	.LVL552-.Ltext0
	.value	0x7
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL575-.Ltext0
	.quad	.LFE2287-.Ltext0
	.value	0x7
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST175:
	.quad	.LVL534-.Ltext0
	.quad	.LVL543-.Ltext0
	.value	0x2
	.byte	0x7f
	.sleb128 0
	.quad	.LVL543-.Ltext0
	.quad	.LVL570-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL575-.Ltext0
	.quad	.LFE2287-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	0
	.quad	0
.LLST176:
	.quad	.LVL535-.Ltext0
	.quad	.LVL536-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL536-1-.Ltext0
	.quad	.LVL553-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL553-.Ltext0
	.quad	.LVL557-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	.LVL575-.Ltext0
	.quad	.LFE2287-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST177:
	.quad	.LVL537-.Ltext0
	.quad	.LVL538-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL538-1-.Ltext0
	.quad	.LVL558-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL558-.Ltext0
	.quad	.LVL574-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -88
	.quad	.LVL575-.Ltext0
	.quad	.LFE2287-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST178:
	.quad	.LVL539-.Ltext0
	.quad	.LVL540-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL540-1-.Ltext0
	.quad	.LVL560-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL560-.Ltext0
	.quad	.LVL574-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -96
	.quad	.LVL575-.Ltext0
	.quad	.LFE2287-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST179:
	.quad	.LVL541-.Ltext0
	.quad	.LVL544-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL544-.Ltext0
	.quad	.LVL546-.Ltext0
	.value	0x1
	.byte	0x5b
	.quad	.LVL546-.Ltext0
	.quad	.LVL557-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL557-.Ltext0
	.quad	.LVL574-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -112
	.quad	.LVL575-.Ltext0
	.quad	.LFE2287-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST180:
	.quad	.LVL541-.Ltext0
	.quad	.LVL548-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL548-.Ltext0
	.quad	.LVL553-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL575-.Ltext0
	.quad	.LFE2287-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST181:
	.quad	.LVL557-.Ltext0
	.quad	.LVL561-.Ltext0
	.value	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.quad	.LVL561-.Ltext0
	.quad	.LVL573-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST182:
	.quad	.LVL557-.Ltext0
	.quad	.LVL561-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL561-.Ltext0
	.quad	.LVL565-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL566-.Ltext0
	.quad	.LVL567-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL567-.Ltext0
	.quad	.LVL569-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	0
	.quad	0
.LLST183:
	.quad	.LVL557-.Ltext0
	.quad	.LVL561-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL561-.Ltext0
	.quad	.LVL568-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL568-.Ltext0
	.quad	.LVL571-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST184:
	.quad	.LVL509-.Ltext0
	.quad	.LVL511-1-.Ltext0
	.value	0x1
	.byte	0x5b
	.quad	.LVL511-1-.Ltext0
	.quad	.LVL524-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -56
	.quad	.LVL524-.Ltext0
	.quad	.LVL525-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	.LVL574-.Ltext0
	.quad	.LVL575-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	0
	.quad	0
.LLST185:
	.quad	.LVL509-.Ltext0
	.quad	.LVL510-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -64
	.quad	0
	.quad	0
.LLST186:
	.quad	.LVL514-.Ltext0
	.quad	.LVL517-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL517-.Ltext0
	.quad	.LVL520-.Ltext0
	.value	0x8
	.byte	0x72
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x70
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL520-.Ltext0
	.quad	.LVL521-.Ltext0
	.value	0x8
	.byte	0x72
	.sleb128 -1
	.byte	0x32
	.byte	0x24
	.byte	0x70
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL574-.Ltext0
	.quad	.LVL575-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST187:
	.quad	.LVL515-.Ltext0
	.quad	.LVL517-.Ltext0
	.value	0x1
	.byte	0x5b
	.quad	.LVL517-.Ltext0
	.quad	.LVL520-.Ltext0
	.value	0x8
	.byte	0x72
	.sleb128 1
	.byte	0x32
	.byte	0x24
	.byte	0x7b
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL520-.Ltext0
	.quad	.LVL522-.Ltext0
	.value	0x8
	.byte	0x72
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x7b
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL574-.Ltext0
	.quad	.LVL575-.Ltext0
	.value	0x1
	.byte	0x5b
	.quad	0
	.quad	0
.LLST188:
	.quad	.LVL515-.Ltext0
	.quad	.LVL517-.Ltext0
	.value	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.quad	.LVL517-.Ltext0
	.quad	.LVL522-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL574-.Ltext0
	.quad	.LVL575-.Ltext0
	.value	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.quad	0
	.quad	0
.LLST189:
	.quad	.LVL515-.Ltext0
	.quad	.LVL517-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL517-.Ltext0
	.quad	.LVL522-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL574-.Ltext0
	.quad	.LVL575-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST190:
	.quad	.LVL515-.Ltext0
	.quad	.LVL517-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL517-.Ltext0
	.quad	.LVL522-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL574-.Ltext0
	.quad	.LVL575-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST191:
	.quad	.LVL512-.Ltext0
	.quad	.LVL513-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL513-1-.Ltext0
	.quad	.LVL523-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL523-.Ltext0
	.quad	.LVL525-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL574-.Ltext0
	.quad	.LVL575-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST192:
	.quad	.LVL515-.Ltext0
	.quad	.LVL516-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL516-.Ltext0
	.quad	.LVL517-.Ltext0
	.value	0x3
	.byte	0x7a
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL517-.Ltext0
	.quad	.LVL520-.Ltext0
	.value	0x7
	.byte	0x72
	.sleb128 0
	.byte	0x20
	.byte	0x7c
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL574-.Ltext0
	.quad	.LVL575-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	0
	.quad	0
.LLST193:
	.quad	.LVL528-.Ltext0
	.quad	.LVL529-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL529-.Ltext0
	.quad	.LVL532-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL532-.Ltext0
	.quad	.LVL574-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -104
	.quad	.LVL575-.Ltext0
	.quad	.LFE2287-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -104
	.quad	0
	.quad	0
.LLST194:
	.quad	.LVL541-.Ltext0
	.quad	.LVL542-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	.LVL542-.Ltext0
	.quad	.LVL545-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL545-.Ltext0
	.quad	.LVL550-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL550-.Ltext0
	.quad	.LVL551-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 52
	.quad	.LVL551-.Ltext0
	.quad	.LVL553-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL575-.Ltext0
	.quad	.LFE2287-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST195:
	.quad	.LVL549-.Ltext0
	.quad	.LVL553-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST196:
	.quad	.LVL553-.Ltext0
	.quad	.LVL554-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL554-.Ltext0
	.quad	.LVL555-.Ltext0
	.value	0x3
	.byte	0x7c
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL555-.Ltext0
	.quad	.LVL556-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST197:
	.quad	.LVL561-.Ltext0
	.quad	.LVL572-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST198:
	.quad	.LVL576-.Ltext0
	.quad	.LVL577-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL577-.Ltext0
	.quad	.LVL610-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -80
	.quad	.LVL610-.Ltext0
	.quad	.LVL626-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL626-.Ltext0
	.quad	.LFE2289-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -96
	.quad	0
	.quad	0
.LLST199:
	.quad	.LVL576-.Ltext0
	.quad	.LVL578-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL578-1-.Ltext0
	.quad	.LVL598-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -72
	.quad	.LVL598-.Ltext0
	.quad	.LVL626-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL626-.Ltext0
	.quad	.LFE2289-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -88
	.quad	0
	.quad	0
.LLST200:
	.quad	.LVL582-.Ltext0
	.quad	.LVL584-1-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL584-1-.Ltext0
	.quad	.LVL603-.Ltext0
	.value	0x6
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL626-.Ltext0
	.quad	.LFE2289-.Ltext0
	.value	0x7
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST201:
	.quad	.LVL585-.Ltext0
	.quad	.LVL594-.Ltext0
	.value	0x2
	.byte	0x7f
	.sleb128 0
	.quad	.LVL594-.Ltext0
	.quad	.LVL621-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL626-.Ltext0
	.quad	.LFE2289-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	0
	.quad	0
.LLST202:
	.quad	.LVL586-.Ltext0
	.quad	.LVL587-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL587-1-.Ltext0
	.quad	.LVL604-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL604-.Ltext0
	.quad	.LVL608-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -56
	.quad	.LVL626-.Ltext0
	.quad	.LFE2289-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST203:
	.quad	.LVL588-.Ltext0
	.quad	.LVL589-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL589-1-.Ltext0
	.quad	.LVL609-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL609-.Ltext0
	.quad	.LVL625-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -72
	.quad	.LVL625-.Ltext0
	.quad	.LVL626-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -88
	.quad	.LVL626-.Ltext0
	.quad	.LFE2289-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST204:
	.quad	.LVL590-.Ltext0
	.quad	.LVL591-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL591-1-.Ltext0
	.quad	.LVL611-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL611-.Ltext0
	.quad	.LVL625-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -80
	.quad	.LVL625-.Ltext0
	.quad	.LVL626-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -96
	.quad	.LVL626-.Ltext0
	.quad	.LFE2289-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST205:
	.quad	.LVL592-.Ltext0
	.quad	.LVL595-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL595-.Ltext0
	.quad	.LVL597-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL597-.Ltext0
	.quad	.LVL608-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL608-.Ltext0
	.quad	.LVL625-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -96
	.quad	.LVL625-.Ltext0
	.quad	.LVL626-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -112
	.quad	.LVL626-.Ltext0
	.quad	.LFE2289-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST206:
	.quad	.LVL592-.Ltext0
	.quad	.LVL599-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL599-.Ltext0
	.quad	.LVL604-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL626-.Ltext0
	.quad	.LFE2289-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST207:
	.quad	.LVL608-.Ltext0
	.quad	.LVL612-.Ltext0
	.value	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.quad	.LVL612-.Ltext0
	.quad	.LVL624-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST208:
	.quad	.LVL608-.Ltext0
	.quad	.LVL612-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL612-.Ltext0
	.quad	.LVL616-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL617-.Ltext0
	.quad	.LVL618-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL618-.Ltext0
	.quad	.LVL620-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	0
	.quad	0
.LLST209:
	.quad	.LVL608-.Ltext0
	.quad	.LVL612-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL612-.Ltext0
	.quad	.LVL619-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL619-.Ltext0
	.quad	.LVL622-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST210:
	.quad	.LVL579-.Ltext0
	.quad	.LVL580-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL580-.Ltext0
	.quad	.LVL583-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL583-.Ltext0
	.quad	.LVL625-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -88
	.quad	.LVL625-.Ltext0
	.quad	.LFE2289-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -104
	.quad	0
	.quad	0
.LLST211:
	.quad	.LVL592-.Ltext0
	.quad	.LVL593-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -56
	.quad	.LVL593-.Ltext0
	.quad	.LVL596-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL596-.Ltext0
	.quad	.LVL601-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL601-.Ltext0
	.quad	.LVL602-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 52
	.quad	.LVL602-.Ltext0
	.quad	.LVL604-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL626-.Ltext0
	.quad	.LFE2289-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST212:
	.quad	.LVL600-.Ltext0
	.quad	.LVL604-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST213:
	.quad	.LVL604-.Ltext0
	.quad	.LVL605-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL605-.Ltext0
	.quad	.LVL606-.Ltext0
	.value	0x3
	.byte	0x7c
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL606-.Ltext0
	.quad	.LVL607-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST214:
	.quad	.LVL612-.Ltext0
	.quad	.LVL623-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST215:
	.quad	.LVL627-.Ltext0
	.quad	.LVL628-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL628-.Ltext0
	.quad	.LVL655-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -80
	.quad	.LVL655-.Ltext0
	.quad	.LVL668-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL668-.Ltext0
	.quad	.LFE2291-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -96
	.quad	0
	.quad	0
.LLST216:
	.quad	.LVL627-.Ltext0
	.quad	.LVL629-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL629-1-.Ltext0
	.quad	.LVL655-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -72
	.quad	.LVL655-.Ltext0
	.quad	.LVL668-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL668-.Ltext0
	.quad	.LFE2291-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -88
	.quad	0
	.quad	0
.LLST217:
	.quad	.LVL633-.Ltext0
	.quad	.LVL635-1-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL635-1-.Ltext0
	.quad	.LVL643-.Ltext0
	.value	0x6
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST218:
	.quad	.LVL636-.Ltext0
	.quad	.LVL645-.Ltext0
	.value	0x2
	.byte	0x7f
	.sleb128 0
	.quad	.LVL645-.Ltext0
	.quad	.LVL662-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL662-.Ltext0
	.quad	.LVL666-.Ltext0
	.value	0x2
	.byte	0x7f
	.sleb128 0
	.quad	.LVL668-.Ltext0
	.quad	.LFE2291-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	0
	.quad	0
.LLST219:
	.quad	.LVL637-.Ltext0
	.quad	.LVL638-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL638-1-.Ltext0
	.quad	.LVL664-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL668-.Ltext0
	.quad	.LFE2291-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST220:
	.quad	.LVL639-.Ltext0
	.quad	.LVL640-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL640-1-.Ltext0
	.quad	.LVL665-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL668-.Ltext0
	.quad	.LFE2291-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST221:
	.quad	.LVL641-.Ltext0
	.quad	.LVL642-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL642-1-.Ltext0
	.quad	.LVL660-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL668-.Ltext0
	.quad	.LFE2291-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST222:
	.quad	.LVL643-.Ltext0
	.quad	.LVL646-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL646-.Ltext0
	.quad	.LVL667-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -56
	.quad	.LVL667-.Ltext0
	.quad	.LVL668-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	.LVL668-.Ltext0
	.quad	.LFE2291-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST223:
	.quad	.LVL643-.Ltext0
	.quad	.LVL647-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL647-.Ltext0
	.quad	.LVL651-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL668-.Ltext0
	.quad	.LFE2291-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST224:
	.quad	.LVL654-.Ltext0
	.quad	.LVL655-.Ltext0
	.value	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.quad	.LVL655-.Ltext0
	.quad	.LVL656-1-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL656-1-.Ltext0
	.quad	.LVL658-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -80
	.quad	.LVL658-.Ltext0
	.quad	.LVL661-1-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	0
	.quad	0
.LLST225:
	.quad	.LVL654-.Ltext0
	.quad	.LVL655-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL655-.Ltext0
	.quad	.LVL656-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL656-1-.Ltext0
	.quad	.LVL659-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -84
	.quad	.LVL659-.Ltext0
	.quad	.LVL661-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	0
	.quad	0
.LLST226:
	.quad	.LVL654-.Ltext0
	.quad	.LVL655-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL655-.Ltext0
	.quad	.LVL657-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL659-.Ltext0
	.quad	.LVL663-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST227:
	.quad	.LVL630-.Ltext0
	.quad	.LVL631-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL631-.Ltext0
	.quad	.LVL634-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL634-.Ltext0
	.quad	.LVL667-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -96
	.quad	.LVL667-.Ltext0
	.quad	.LFE2291-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -112
	.quad	0
	.quad	0
.LLST228:
	.quad	.LVL643-.Ltext0
	.quad	.LVL644-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -64
	.quad	.LVL644-.Ltext0
	.quad	.LVL647-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL647-.Ltext0
	.quad	.LVL649-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL649-.Ltext0
	.quad	.LVL650-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 56
	.quad	.LVL650-.Ltext0
	.quad	.LVL651-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL668-.Ltext0
	.quad	.LFE2291-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST229:
	.quad	.LVL648-.Ltext0
	.quad	.LVL651-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	0
	.quad	0
.LLST230:
	.quad	.LVL651-.Ltext0
	.quad	.LVL652-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL652-.Ltext0
	.quad	.LVL653-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL653-.Ltext0
	.quad	.LVL654-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST231:
	.quad	.LVL655-.Ltext0
	.quad	.LVL656-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL656-1-.Ltext0
	.quad	.LVL659-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -72
	.quad	.LVL659-.Ltext0
	.quad	.LVL661-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST232:
	.quad	.LVL669-.Ltext0
	.quad	.LVL670-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL670-.Ltext0
	.quad	.LVL699-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -80
	.quad	.LVL699-.Ltext0
	.quad	.LVL712-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL712-.Ltext0
	.quad	.LFE2293-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -96
	.quad	0
	.quad	0
.LLST233:
	.quad	.LVL669-.Ltext0
	.quad	.LVL671-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL671-1-.Ltext0
	.quad	.LVL677-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL677-.Ltext0
	.quad	.LFE2293-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST234:
	.quad	.LVL676-.Ltext0
	.quad	.LVL678-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL678-1-.Ltext0
	.quad	.LVL699-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -72
	.quad	.LVL712-.Ltext0
	.quad	.LFE2293-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -88
	.quad	0
	.quad	0
.LLST235:
	.quad	.LVL679-.Ltext0
	.quad	.LVL680-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL680-1-.Ltext0
	.quad	.LVL708-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL712-.Ltext0
	.quad	.LFE2293-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST236:
	.quad	.LVL681-.Ltext0
	.quad	.LVL682-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL682-1-.Ltext0
	.quad	.LVL709-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL712-.Ltext0
	.quad	.LFE2293-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST237:
	.quad	.LVL683-.Ltext0
	.quad	.LVL684-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL684-.Ltext0
	.quad	.LVL704-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL712-.Ltext0
	.quad	.LFE2293-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST238:
	.quad	.LVL683-.Ltext0
	.quad	.LVL685-1-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL685-1-.Ltext0
	.quad	.LVL687-.Ltext0
	.value	0x6
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL687-.Ltext0
	.quad	.LVL699-.Ltext0
	.value	0x6
	.byte	0x76
	.sleb128 -64
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL712-.Ltext0
	.quad	.LFE2293-.Ltext0
	.value	0x7
	.byte	0x91
	.sleb128 -80
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST239:
	.quad	.LVL686-.Ltext0
	.quad	.LVL689-.Ltext0
	.value	0x2
	.byte	0x7f
	.sleb128 0
	.quad	.LVL689-.Ltext0
	.quad	.LVL706-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL706-.Ltext0
	.quad	.LVL710-.Ltext0
	.value	0x2
	.byte	0x7f
	.sleb128 0
	.quad	.LVL712-.Ltext0
	.quad	.LFE2293-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	0
	.quad	0
.LLST240:
	.quad	.LVL687-.Ltext0
	.quad	.LVL690-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL690-.Ltext0
	.quad	.LVL711-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -56
	.quad	.LVL711-.Ltext0
	.quad	.LVL712-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	.LVL712-.Ltext0
	.quad	.LFE2293-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST241:
	.quad	.LVL687-.Ltext0
	.quad	.LVL691-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL691-.Ltext0
	.quad	.LVL695-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL712-.Ltext0
	.quad	.LFE2293-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST242:
	.quad	.LVL698-.Ltext0
	.quad	.LVL699-.Ltext0
	.value	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.quad	.LVL699-.Ltext0
	.quad	.LVL700-1-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL700-1-.Ltext0
	.quad	.LVL702-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -80
	.quad	.LVL702-.Ltext0
	.quad	.LVL705-1-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	0
	.quad	0
.LLST243:
	.quad	.LVL698-.Ltext0
	.quad	.LVL699-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL699-.Ltext0
	.quad	.LVL700-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL700-1-.Ltext0
	.quad	.LVL703-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -84
	.quad	.LVL703-.Ltext0
	.quad	.LVL705-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	0
	.quad	0
.LLST244:
	.quad	.LVL698-.Ltext0
	.quad	.LVL699-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL699-.Ltext0
	.quad	.LVL701-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL703-.Ltext0
	.quad	.LVL707-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST245:
	.quad	.LVL672-.Ltext0
	.quad	.LVL673-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL673-.Ltext0
	.quad	.LVL686-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL686-.Ltext0
	.quad	.LVL711-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -96
	.quad	.LVL711-.Ltext0
	.quad	.LFE2293-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -112
	.quad	0
	.quad	0
.LLST246:
	.quad	.LVL687-.Ltext0
	.quad	.LVL688-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -64
	.quad	.LVL688-.Ltext0
	.quad	.LVL691-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL691-.Ltext0
	.quad	.LVL693-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL693-.Ltext0
	.quad	.LVL694-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 56
	.quad	.LVL694-.Ltext0
	.quad	.LVL695-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL712-.Ltext0
	.quad	.LFE2293-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST247:
	.quad	.LVL692-.Ltext0
	.quad	.LVL695-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	0
	.quad	0
.LLST248:
	.quad	.LVL695-.Ltext0
	.quad	.LVL696-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL696-.Ltext0
	.quad	.LVL697-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL697-.Ltext0
	.quad	.LVL698-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST249:
	.quad	.LVL699-.Ltext0
	.quad	.LVL700-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL700-1-.Ltext0
	.quad	.LVL703-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -72
	.quad	.LVL703-.Ltext0
	.quad	.LVL705-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST250:
	.quad	.LVL713-.Ltext0
	.quad	.LVL714-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL714-1-.Ltext0
	.quad	.LVL719-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL719-.Ltext0
	.quad	.LVL722-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL722-.Ltext0
	.quad	.LVL724-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL724-.Ltext0
	.quad	.LVL725-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL725-1-.Ltext0
	.quad	.LVL735-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL735-.Ltext0
	.quad	.LVL736-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL736-.Ltext0
	.quad	.LFE2296-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST251:
	.quad	.LVL713-.Ltext0
	.quad	.LVL714-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL714-1-.Ltext0
	.quad	.LVL720-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL720-.Ltext0
	.quad	.LVL722-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL722-.Ltext0
	.quad	.LVL731-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL731-.Ltext0
	.quad	.LVL736-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL736-.Ltext0
	.quad	.LFE2296-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST252:
	.quad	.LVL715-.Ltext0
	.quad	.LVL716-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL716-.Ltext0
	.quad	.LVL718-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL718-.Ltext0
	.quad	.LVL721-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL722-.Ltext0
	.quad	.LVL725-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL725-1-.Ltext0
	.quad	.LVL726-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST253:
	.quad	.LVL723-.Ltext0
	.quad	.LVL729-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL729-.Ltext0
	.quad	.LVL731-.Ltext0
	.value	0x5
	.byte	0x7c
	.sleb128 0
	.byte	0x31
	.byte	0x25
	.byte	0x9f
	.quad	.LVL731-.Ltext0
	.quad	.LVL736-.Ltext0
	.value	0x6
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x31
	.byte	0x25
	.byte	0x9f
	.quad	.LVL736-.Ltext0
	.quad	.LVL740-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL740-.Ltext0
	.quad	.LFE2296-.Ltext0
	.value	0x5
	.byte	0x7c
	.sleb128 0
	.byte	0x31
	.byte	0x25
	.byte	0x9f
	.quad	0
	.quad	0
.LLST254:
	.quad	.LVL723-.Ltext0
	.quad	.LVL725-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL725-1-.Ltext0
	.quad	.LVL735-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL735-.Ltext0
	.quad	.LVL736-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL736-.Ltext0
	.quad	.LFE2296-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST255:
	.quad	.LVL726-.Ltext0
	.quad	.LVL727-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL727-.Ltext0
	.quad	.LVL730-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL736-.Ltext0
	.quad	.LFE2296-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST256:
	.quad	.LVL737-.Ltext0
	.quad	.LVL741-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST257:
	.quad	.LVL738-.Ltext0
	.quad	.LVL739-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST258:
	.quad	.LVL741-.Ltext0
	.quad	.LVL742-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST260:
	.quad	.LVL732-.Ltext0
	.quad	.LVL733-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST261:
	.quad	.LVL734-.Ltext0
	.quad	.LVL736-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST264:
	.quad	.LVL744-.Ltext0
	.quad	.LVL745-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL745-1-.Ltext0
	.quad	.LVL754-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL754-.Ltext0
	.quad	.LVL764-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL764-.Ltext0
	.quad	.LVL765-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL765-.Ltext0
	.quad	.LVL767-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL767-.Ltext0
	.quad	.LVL768-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL768-1-.Ltext0
	.quad	.LVL768-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL768-.Ltext0
	.quad	.LFE2297-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST265:
	.quad	.LVL744-.Ltext0
	.quad	.LVL745-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL745-1-.Ltext0
	.quad	.LVL752-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL752-.Ltext0
	.quad	.LVL764-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL764-.Ltext0
	.quad	.LVL766-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL766-.Ltext0
	.quad	.LVL767-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL767-.Ltext0
	.quad	.LVL768-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL768-1-.Ltext0
	.quad	.LVL768-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL768-.Ltext0
	.quad	.LVL777-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL777-.Ltext0
	.quad	.LVL781-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL781-.Ltext0
	.quad	.LFE2297-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST266:
	.quad	.LVL745-.Ltext0
	.quad	.LVL746-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST267:
	.quad	.LVL747-.Ltext0
	.quad	.LVL752-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL752-.Ltext0
	.quad	.LVL764-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL768-.Ltext0
	.quad	.LVL777-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL777-.Ltext0
	.quad	.LVL781-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL781-.Ltext0
	.quad	.LFE2297-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST268:
	.quad	.LVL747-.Ltext0
	.quad	.LVL754-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL754-.Ltext0
	.quad	.LVL764-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL768-.Ltext0
	.quad	.LFE2297-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST269:
	.quad	.LVL749-.Ltext0
	.quad	.LVL750-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL750-.Ltext0
	.quad	.LVL752-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL768-.Ltext0
	.quad	.LVL769-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST270:
	.quad	.LVL770-.Ltext0
	.quad	.LVL776-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL776-.Ltext0
	.quad	.LVL777-.Ltext0
	.value	0x5
	.byte	0x7d
	.sleb128 0
	.byte	0x31
	.byte	0x25
	.byte	0x9f
	.quad	.LVL777-.Ltext0
	.quad	.LVL781-.Ltext0
	.value	0x6
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x31
	.byte	0x25
	.byte	0x9f
	.quad	.LVL781-.Ltext0
	.quad	.LVL790-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL790-.Ltext0
	.quad	.LVL794-.Ltext0
	.value	0x5
	.byte	0x7d
	.sleb128 0
	.byte	0x31
	.byte	0x25
	.byte	0x9f
	.quad	.LVL794-.Ltext0
	.quad	.LFE2297-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST271:
	.quad	.LVL770-.Ltext0
	.quad	.LVL771-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL771-.Ltext0
	.quad	.LFE2297-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST272:
	.quad	.LVL773-.Ltext0
	.quad	.LVL774-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL774-.Ltext0
	.quad	.LVL776-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL781-.Ltext0
	.quad	.LVL782-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL782-.Ltext0
	.quad	.LVL786-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST273:
	.quad	.LVL783-.Ltext0
	.quad	.LVL789-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL789-.Ltext0
	.quad	.LVL794-.Ltext0
	.value	0x5
	.byte	0x7d
	.sleb128 0
	.byte	0x32
	.byte	0x25
	.byte	0x9f
	.quad	.LVL794-.Ltext0
	.quad	.LVL804-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL804-.Ltext0
	.quad	.LVL808-.Ltext0
	.value	0x5
	.byte	0x7d
	.sleb128 0
	.byte	0x32
	.byte	0x25
	.byte	0x9f
	.quad	.LVL808-.Ltext0
	.quad	.LFE2297-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST274:
	.quad	.LVL783-.Ltext0
	.quad	.LVL784-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL784-.Ltext0
	.quad	.LFE2297-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST275:
	.quad	.LVL786-.Ltext0
	.quad	.LVL787-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL787-.Ltext0
	.quad	.LVL789-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL794-.Ltext0
	.quad	.LVL795-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST276:
	.quad	.LVL796-.Ltext0
	.quad	.LVL802-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL802-.Ltext0
	.quad	.LVL808-.Ltext0
	.value	0x5
	.byte	0x7d
	.sleb128 0
	.byte	0x33
	.byte	0x25
	.byte	0x9f
	.quad	.LVL808-.Ltext0
	.quad	.LVL815-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL815-.Ltext0
	.quad	.LFE2297-.Ltext0
	.value	0x5
	.byte	0x7d
	.sleb128 0
	.byte	0x33
	.byte	0x25
	.byte	0x9f
	.quad	0
	.quad	0
.LLST277:
	.quad	.LVL796-.Ltext0
	.quad	.LVL797-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL797-.Ltext0
	.quad	.LFE2297-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST278:
	.quad	.LVL799-.Ltext0
	.quad	.LVL800-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL800-.Ltext0
	.quad	.LVL803-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL808-.Ltext0
	.quad	.LVL809-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL809-.Ltext0
	.quad	.LFE2297-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST279:
	.quad	.LVL811-.Ltext0
	.quad	.LVL813-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL813-.Ltext0
	.quad	.LVL816-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL816-.Ltext0
	.quad	.LVL817-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LLST280:
	.quad	.LVL812-.Ltext0
	.quad	.LVL813-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL813-.Ltext0
	.quad	.LVL814-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST281:
	.quad	.LVL817-.Ltext0
	.quad	.LVL818-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST283:
	.quad	.LVL805-.Ltext0
	.quad	.LVL806-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST284:
	.quad	.LVL807-.Ltext0
	.quad	.LVL808-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST287:
	.quad	.LVL791-.Ltext0
	.quad	.LVL792-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST288:
	.quad	.LVL793-.Ltext0
	.quad	.LVL794-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST291:
	.quad	.LVL778-.Ltext0
	.quad	.LVL779-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST292:
	.quad	.LVL780-.Ltext0
	.quad	.LVL781-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST295:
	.quad	.LVL752-.Ltext0
	.quad	.LVL763-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL763-.Ltext0
	.quad	.LVL764-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST296:
	.quad	.LVL752-.Ltext0
	.quad	.LVL753-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL753-.Ltext0
	.quad	.LVL762-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST297:
	.quad	.LVL755-.Ltext0
	.quad	.LVL757-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL757-.Ltext0
	.quad	.LVL758-.Ltext0
	.value	0x3
	.byte	0x71
	.sleb128 1
	.byte	0x9f
	.quad	.LVL758-.Ltext0
	.quad	.LVL759-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST298:
	.quad	.LVL821-.Ltext0
	.quad	.LVL826-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL826-.Ltext0
	.quad	.LVL830-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL830-.Ltext0
	.quad	.LFE2299-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST299:
	.quad	.LVL822-.Ltext0
	.quad	.LVL825-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL825-.Ltext0
	.quad	.LVL830-.Ltext0
	.value	0xe
	.byte	0x3
	.quad	g_width
	.byte	0x94
	.byte	0x4
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.quad	.LVL830-.Ltext0
	.quad	.LFE2299-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LLST300:
	.quad	.LVL823-.Ltext0
	.quad	.LVL824-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL824-.Ltext0
	.quad	.LVL827-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL827-.Ltext0
	.quad	.LVL829-.Ltext0
	.value	0x3
	.byte	0x71
	.sleb128 1
	.byte	0x9f
	.quad	.LVL829-.Ltext0
	.quad	.LFE2299-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST301:
	.quad	.LVL833-.Ltext0
	.quad	.LVL834-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL834-.Ltext0
	.quad	.LFE2303-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	0
	.quad	0
.LLST302:
	.quad	.LVL833-.Ltext0
	.quad	.LVL835-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL835-1-.Ltext0
	.quad	.LVL853-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL853-.Ltext0
	.quad	.LVL862-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL862-.Ltext0
	.quad	.LFE2303-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST303:
	.quad	.LVL836-.Ltext0
	.quad	.LVL837-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL837-.Ltext0
	.quad	.LVL860-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL862-.Ltext0
	.quad	.LFE2303-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST304:
	.quad	.LVL836-.Ltext0
	.quad	.LVL838-1-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL838-1-.Ltext0
	.quad	.LFE2303-.Ltext0
	.value	0x7
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST305:
	.quad	.LVL839-.Ltext0
	.quad	.LVL842-.Ltext0
	.value	0x2
	.byte	0x7c
	.sleb128 0
	.quad	.LVL842-.Ltext0
	.quad	.LVL859-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL859-.Ltext0
	.quad	.LVL861-.Ltext0
	.value	0x2
	.byte	0x7c
	.sleb128 0
	.quad	.LVL862-.Ltext0
	.quad	.LFE2303-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	0
	.quad	0
.LLST306:
	.quad	.LVL840-.Ltext0
	.quad	.LVL843-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL843-.Ltext0
	.quad	.LVL851-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL862-.Ltext0
	.quad	.LFE2303-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST307:
	.quad	.LVL840-.Ltext0
	.quad	.LVL844-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL844-.Ltext0
	.quad	.LVL848-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL862-.Ltext0
	.quad	.LFE2303-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST308:
	.quad	.LVL852-.Ltext0
	.quad	.LVL853-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL853-.Ltext0
	.quad	.LVL857-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST309:
	.quad	.LVL840-.Ltext0
	.quad	.LVL841-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	.LVL841-.Ltext0
	.quad	.LVL844-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL844-.Ltext0
	.quad	.LVL846-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL846-.Ltext0
	.quad	.LVL847-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 24
	.quad	.LVL847-.Ltext0
	.quad	.LVL848-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL862-.Ltext0
	.quad	.LFE2303-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST310:
	.quad	.LVL845-.Ltext0
	.quad	.LVL848-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	0
	.quad	0
.LLST311:
	.quad	.LVL848-.Ltext0
	.quad	.LVL849-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL849-.Ltext0
	.quad	.LVL850-.Ltext0
	.value	0x3
	.byte	0x7e
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL850-.Ltext0
	.quad	.LVL852-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST312:
	.quad	.LVL852-.Ltext0
	.quad	.LVL855-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL855-.Ltext0
	.quad	.LVL856-.Ltext0
	.value	0x3
	.byte	0x7e
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL856-.Ltext0
	.quad	.LVL857-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB18-.Ltext0
	.quad	.LBE18-.Ltext0
	.quad	.LBB19-.Ltext0
	.quad	.LBE19-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB20-.Ltext0
	.quad	.LBE20-.Ltext0
	.quad	.LBB21-.Ltext0
	.quad	.LBE21-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB22-.Ltext0
	.quad	.LBE22-.Ltext0
	.quad	.LBB23-.Ltext0
	.quad	.LBE23-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB24-.Ltext0
	.quad	.LBE24-.Ltext0
	.quad	.LBB25-.Ltext0
	.quad	.LBE25-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB29-.Ltext0
	.quad	.LBE29-.Ltext0
	.quad	.LBB30-.Ltext0
	.quad	.LBE30-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB31-.Ltext0
	.quad	.LBE31-.Ltext0
	.quad	.LBB32-.Ltext0
	.quad	.LBE32-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB33-.Ltext0
	.quad	.LBE33-.Ltext0
	.quad	.LBB34-.Ltext0
	.quad	.LBE34-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB36-.Ltext0
	.quad	.LBE36-.Ltext0
	.quad	.LBB41-.Ltext0
	.quad	.LBE41-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB37-.Ltext0
	.quad	.LBE37-.Ltext0
	.quad	.LBB40-.Ltext0
	.quad	.LBE40-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB42-.Ltext0
	.quad	.LBE42-.Ltext0
	.quad	.LBB43-.Ltext0
	.quad	.LBE43-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB46-.Ltext0
	.quad	.LBE46-.Ltext0
	.quad	.LBB47-.Ltext0
	.quad	.LBE47-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB59-.Ltext0
	.quad	.LBE59-.Ltext0
	.quad	.LBB71-.Ltext0
	.quad	.LBE71-.Ltext0
	.quad	.LBB72-.Ltext0
	.quad	.LBE72-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB61-.Ltext0
	.quad	.LBE61-.Ltext0
	.quad	.LBB65-.Ltext0
	.quad	.LBE65-.Ltext0
	.quad	.LBB67-.Ltext0
	.quad	.LBE67-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB66-.Ltext0
	.quad	.LBE66-.Ltext0
	.quad	.LBB68-.Ltext0
	.quad	.LBE68-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB73-.Ltext0
	.quad	.LBE73-.Ltext0
	.quad	.LBB80-.Ltext0
	.quad	.LBE80-.Ltext0
	.quad	.LBB81-.Ltext0
	.quad	.LBE81-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB77-.Ltext0
	.quad	.LBE77-.Ltext0
	.quad	.LBB82-.Ltext0
	.quad	.LBE82-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB78-.Ltext0
	.quad	.LBE78-.Ltext0
	.quad	.LBB79-.Ltext0
	.quad	.LBE79-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB90-.Ltext0
	.quad	.LBE90-.Ltext0
	.quad	.LBB94-.Ltext0
	.quad	.LBE94-.Ltext0
	.quad	.LBB95-.Ltext0
	.quad	.LBE95-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB119-.Ltext0
	.quad	.LBE119-.Ltext0
	.quad	.LBB122-.Ltext0
	.quad	.LBE122-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB123-.Ltext0
	.quad	.LBE123-.Ltext0
	.quad	.LBB126-.Ltext0
	.quad	.LBE126-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB124-.Ltext0
	.quad	.LBE124-.Ltext0
	.quad	.LBB125-.Ltext0
	.quad	.LBE125-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB146-.Ltext0
	.quad	.LBE146-.Ltext0
	.quad	.LBB153-.Ltext0
	.quad	.LBE153-.Ltext0
	.quad	.LBB166-.Ltext0
	.quad	.LBE166-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB154-.Ltext0
	.quad	.LBE154-.Ltext0
	.quad	.LBB158-.Ltext0
	.quad	.LBE158-.Ltext0
	.quad	.LBB159-.Ltext0
	.quad	.LBE159-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB160-.Ltext0
	.quad	.LBE160-.Ltext0
	.quad	.LBB163-.Ltext0
	.quad	.LBE163-.Ltext0
	.quad	.LBB167-.Ltext0
	.quad	.LBE167-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB161-.Ltext0
	.quad	.LBE161-.Ltext0
	.quad	.LBB162-.Ltext0
	.quad	.LBE162-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB178-.Ltext0
	.quad	.LBE178-.Ltext0
	.quad	.LBB181-.Ltext0
	.quad	.LBE181-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB182-.Ltext0
	.quad	.LBE182-.Ltext0
	.quad	.LBB185-.Ltext0
	.quad	.LBE185-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB183-.Ltext0
	.quad	.LBE183-.Ltext0
	.quad	.LBB184-.Ltext0
	.quad	.LBE184-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB190-.Ltext0
	.quad	.LBE190-.Ltext0
	.quad	.LBB193-.Ltext0
	.quad	.LBE193-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB207-.Ltext0
	.quad	.LBE207-.Ltext0
	.quad	.LBB210-.Ltext0
	.quad	.LBE210-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB212-.Ltext0
	.quad	.LBE212-.Ltext0
	.quad	.LBB215-.Ltext0
	.quad	.LBE215-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB216-.Ltext0
	.quad	.LBE216-.Ltext0
	.quad	.LBB219-.Ltext0
	.quad	.LBE219-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB217-.Ltext0
	.quad	.LBE217-.Ltext0
	.quad	.LBB218-.Ltext0
	.quad	.LBE218-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB228-.Ltext0
	.quad	.LBE228-.Ltext0
	.quad	.LBB231-.Ltext0
	.quad	.LBE231-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB232-.Ltext0
	.quad	.LBE232-.Ltext0
	.quad	.LBB235-.Ltext0
	.quad	.LBE235-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB233-.Ltext0
	.quad	.LBE233-.Ltext0
	.quad	.LBB234-.Ltext0
	.quad	.LBE234-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB249-.Ltext0
	.quad	.LBE249-.Ltext0
	.quad	.LBB259-.Ltext0
	.quad	.LBE259-.Ltext0
	.quad	.LBB270-.Ltext0
	.quad	.LBE270-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB251-.Ltext0
	.quad	.LBE251-.Ltext0
	.quad	.LBB255-.Ltext0
	.quad	.LBE255-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB254-.Ltext0
	.quad	.LBE254-.Ltext0
	.quad	.LBB256-.Ltext0
	.quad	.LBE256-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB260-.Ltext0
	.quad	.LBE260-.Ltext0
	.quad	.LBB263-.Ltext0
	.quad	.LBE263-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB264-.Ltext0
	.quad	.LBE264-.Ltext0
	.quad	.LBB267-.Ltext0
	.quad	.LBE267-.Ltext0
	.quad	.LBB271-.Ltext0
	.quad	.LBE271-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB265-.Ltext0
	.quad	.LBE265-.Ltext0
	.quad	.LBB266-.Ltext0
	.quad	.LBE266-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB278-.Ltext0
	.quad	.LBE278-.Ltext0
	.quad	.LBB282-.Ltext0
	.quad	.LBE282-.Ltext0
	.quad	.LBB283-.Ltext0
	.quad	.LBE283-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB284-.Ltext0
	.quad	.LBE284-.Ltext0
	.quad	.LBB287-.Ltext0
	.quad	.LBE287-.Ltext0
	.quad	.LBB290-.Ltext0
	.quad	.LBE290-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB285-.Ltext0
	.quad	.LBE285-.Ltext0
	.quad	.LBB286-.Ltext0
	.quad	.LBE286-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB297-.Ltext0
	.quad	.LBE297-.Ltext0
	.quad	.LBB301-.Ltext0
	.quad	.LBE301-.Ltext0
	.quad	.LBB302-.Ltext0
	.quad	.LBE302-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB303-.Ltext0
	.quad	.LBE303-.Ltext0
	.quad	.LBB306-.Ltext0
	.quad	.LBE306-.Ltext0
	.quad	.LBB309-.Ltext0
	.quad	.LBE309-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB304-.Ltext0
	.quad	.LBE304-.Ltext0
	.quad	.LBB305-.Ltext0
	.quad	.LBE305-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB316-.Ltext0
	.quad	.LBE316-.Ltext0
	.quad	.LBB319-.Ltext0
	.quad	.LBE319-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB320-.Ltext0
	.quad	.LBE320-.Ltext0
	.quad	.LBB323-.Ltext0
	.quad	.LBE323-.Ltext0
	.quad	.LBB326-.Ltext0
	.quad	.LBE326-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB321-.Ltext0
	.quad	.LBE321-.Ltext0
	.quad	.LBB322-.Ltext0
	.quad	.LBE322-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB362-.Ltext0
	.quad	.LBE362-.Ltext0
	.quad	.LBB393-.Ltext0
	.quad	.LBE393-.Ltext0
	.quad	.LBB394-.Ltext0
	.quad	.LBE394-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB363-.Ltext0
	.quad	.LBE363-.Ltext0
	.quad	.LBB381-.Ltext0
	.quad	.LBE381-.Ltext0
	.quad	.LBB392-.Ltext0
	.quad	.LBE392-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB365-.Ltext0
	.quad	.LBE365-.Ltext0
	.quad	.LBB378-.Ltext0
	.quad	.LBE378-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB370-.Ltext0
	.quad	.LBE370-.Ltext0
	.quad	.LBB373-.Ltext0
	.quad	.LBE373-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB374-.Ltext0
	.quad	.LBE374-.Ltext0
	.quad	.LBB377-.Ltext0
	.quad	.LBE377-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB386-.Ltext0
	.quad	.LBE386-.Ltext0
	.quad	.LBB389-.Ltext0
	.quad	.LBE389-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB451-.Ltext0
	.quad	.LBE451-.Ltext0
	.quad	.LBB530-.Ltext0
	.quad	.LBE530-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB453-.Ltext0
	.quad	.LBE453-.Ltext0
	.quad	.LBB511-.Ltext0
	.quad	.LBE511-.Ltext0
	.quad	.LBB524-.Ltext0
	.quad	.LBE524-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB455-.Ltext0
	.quad	.LBE455-.Ltext0
	.quad	.LBB508-.Ltext0
	.quad	.LBE508-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB456-.Ltext0
	.quad	.LBE456-.Ltext0
	.quad	.LBB494-.Ltext0
	.quad	.LBE494-.Ltext0
	.quad	.LBB507-.Ltext0
	.quad	.LBE507-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB458-.Ltext0
	.quad	.LBE458-.Ltext0
	.quad	.LBB491-.Ltext0
	.quad	.LBE491-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB459-.Ltext0
	.quad	.LBE459-.Ltext0
	.quad	.LBB477-.Ltext0
	.quad	.LBE477-.Ltext0
	.quad	.LBB490-.Ltext0
	.quad	.LBE490-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB461-.Ltext0
	.quad	.LBE461-.Ltext0
	.quad	.LBB474-.Ltext0
	.quad	.LBE474-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB466-.Ltext0
	.quad	.LBE466-.Ltext0
	.quad	.LBB469-.Ltext0
	.quad	.LBE469-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB470-.Ltext0
	.quad	.LBE470-.Ltext0
	.quad	.LBB473-.Ltext0
	.quad	.LBE473-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB482-.Ltext0
	.quad	.LBE482-.Ltext0
	.quad	.LBB485-.Ltext0
	.quad	.LBE485-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB486-.Ltext0
	.quad	.LBE486-.Ltext0
	.quad	.LBB489-.Ltext0
	.quad	.LBE489-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB499-.Ltext0
	.quad	.LBE499-.Ltext0
	.quad	.LBB502-.Ltext0
	.quad	.LBE502-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB503-.Ltext0
	.quad	.LBE503-.Ltext0
	.quad	.LBB506-.Ltext0
	.quad	.LBE506-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB516-.Ltext0
	.quad	.LBE516-.Ltext0
	.quad	.LBB519-.Ltext0
	.quad	.LBE519-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB520-.Ltext0
	.quad	.LBE520-.Ltext0
	.quad	.LBB523-.Ltext0
	.quad	.LBE523-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB532-.Ltext0
	.quad	.LBE532-.Ltext0
	.quad	.LBB535-.Ltext0
	.quad	.LBE535-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB533-.Ltext0
	.quad	.LBE533-.Ltext0
	.quad	.LBB534-.Ltext0
	.quad	.LBE534-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF170:
	.string	"printf"
.LASF70:
	.string	"increment"
.LASF109:
	.string	"count"
.LASF16:
	.string	"_IO_read_ptr"
.LASF174:
	.string	"malloc"
.LASF176:
	.string	"memcpy"
.LASF10:
	.string	"size_t"
.LASF97:
	.string	"transpose_worker"
.LASF34:
	.string	"_shortbuf"
.LASF131:
	.string	"uniform_matrix_serial"
.LASF49:
	.string	"ssize_t"
.LASF52:
	.string	"__size"
.LASF163:
	.string	"g_elements"
.LASF135:
	.string	"step"
.LASF116:
	.string	"display_row"
.LASF110:
	.string	"set_seed"
.LASF55:
	.string	"long long unsigned int"
.LASF148:
	.string	"m_pow"
.LASF72:
	.string	"maxes"
.LASF175:
	.string	"free"
.LASF88:
	.string	"matrix"
.LASF54:
	.string	"pthread_attr_t"
.LASF50:
	.string	"long long int"
.LASF7:
	.string	"signed char"
.LASF173:
	.string	"pthread_join"
.LASF158:
	.string	"get_minimum"
.LASF145:
	.string	"matrix_add"
.LASF153:
	.string	"empty_rubbish"
.LASF142:
	.string	"identity_obj"
.LASF79:
	.string	"scalar"
.LASF29:
	.string	"_fileno"
.LASF71:
	.string	"mins"
.LASF9:
	.string	"long int"
.LASF132:
	.string	"uniform_matrix"
.LASF15:
	.string	"_flags"
.LASF14:
	.string	"__ssize_t"
.LASF23:
	.string	"_IO_buf_end"
.LASF32:
	.string	"_cur_column"
.LASF184:
	.string	"putchar"
.LASF81:
	.string	"matrix_add_argument"
.LASF108:
	.string	"get_cmpe_worker"
.LASF1:
	.string	"double"
.LASF93:
	.string	"sequence_worker"
.LASF59:
	.string	"occurances"
.LASF31:
	.string	"_old_offset"
.LASF36:
	.string	"_offset"
.LASF80:
	.string	"scalar_mul_argument"
.LASF150:
	.string	"passon"
.LASF37:
	.string	"__pad1"
.LASF152:
	.string	"pow_rubbish_add"
.LASF41:
	.string	"__pad5"
.LASF114:
	.string	"display"
.LASF67:
	.string	"value"
.LASF45:
	.string	"_IO_marker"
.LASF129:
	.string	"random_matrix_serial"
.LASF127:
	.string	"new_matrix_malloc"
.LASF82:
	.string	"matrix_a_obj"
.LASF182:
	.string	"fast_rand"
.LASF53:
	.string	"__align"
.LASF65:
	.string	"seed"
.LASF3:
	.string	"long unsigned int"
.LASF115:
	.string	"rows_remaining"
.LASF94:
	.string	"curr_value"
.LASF20:
	.string	"_IO_write_ptr"
.LASF69:
	.string	"start_value"
.LASF183:
	.string	"__builtin_putchar"
.LASF61:
	.string	"matrix_obj"
.LASF58:
	.string	"data"
.LASF178:
	.ascii	"GNU C 4.9.2 20150212 (Red Hat 4.9.2-6) -march=haswell -mmmx "
	.ascii	"-mno-3dnow -msse -msse2 -msse3 -mssse3 -mno-sse4a -mcx16 -ms"
	.ascii	"ahf -mmovbe -maes -mno-sha -mpclmul -mpopcnt -mabm -mno-lwp "
	.ascii	"-mfma -mno-fma4 -mno-xop -mbmi -mbmi2 -mno-tbm -mavx -mavx2 "
	.ascii	"-msse4.2 -msse4.1 -mlzcnt -mno-rtm -mno-hle -mrdrnd -mf16c "
	.string	"-mfsgsbase -mno-rdseed -mno-prfchw -mno-adx -mfxsr -mxsave -mxsaveopt -mno-avx512f -mno-avx512er -mno-avx512cd -mno-avx512pf -mno-prefetchwt1 --param l1-cache-size=32 --param l1-cache-line-size=64 --param l2-cache-size=6144 -mtune=haswell -g -O2 -std=gnu11"
.LASF5:
	.string	"short unsigned int"
.LASF76:
	.string	"reverse_argument"
.LASF90:
	.string	"arguments"
.LASF122:
	.string	"matrix_cpy"
.LASF62:
	.string	"start_row"
.LASF24:
	.string	"_IO_save_base"
.LASF146:
	.string	"matrix_mul"
.LASF128:
	.string	"identity_matrix"
.LASF168:
	.string	"stdin"
.LASF126:
	.string	"this_rows"
.LASF103:
	.string	"matrix_add_worker"
.LASF95:
	.string	"clone_worker"
.LASF154:
	.string	"exception"
.LASF179:
	.string	"matrix.c"
.LASF35:
	.string	"_lock"
.LASF30:
	.string	"_flags2"
.LASF107:
	.string	"total"
.LASF169:
	.string	"stdout"
.LASF137:
	.string	"cloned_serial"
.LASF74:
	.string	"clone_argument"
.LASF151:
	.string	"passon_inside"
.LASF17:
	.string	"_IO_read_end"
.LASF121:
	.string	"identity_matrix_serial"
.LASF13:
	.string	"sizetype"
.LASF140:
	.string	"reversed"
.LASF120:
	.string	"scalar_add_serial"
.LASF77:
	.string	"transpose_argument"
.LASF91:
	.string	"identity_worker"
.LASF21:
	.string	"_IO_write_end"
.LASF92:
	.string	"uniform_worker"
.LASF100:
	.string	"todo_x"
.LASF149:
	.string	"exponent"
.LASF130:
	.string	"random_matrix"
.LASF181:
	.string	"_IO_lock_t"
.LASF44:
	.string	"_IO_FILE"
.LASF136:
	.string	"sequence_matrix"
.LASF11:
	.string	"__off_t"
.LASF143:
	.string	"scalar_add"
.LASF160:
	.string	"get_frequency"
.LASF106:
	.string	"matrix_mul_worker"
.LASF42:
	.string	"_mode"
.LASF0:
	.string	"float"
.LASF48:
	.string	"_pos"
.LASF63:
	.string	"num_rows"
.LASF27:
	.string	"_markers"
.LASF78:
	.string	"scalar_add_argument"
.LASF4:
	.string	"unsigned char"
.LASF99:
	.string	"curr_x"
.LASF98:
	.string	"curr_y"
.LASF112:
	.string	"set_dimensions"
.LASF144:
	.string	"scalar_mul"
.LASF8:
	.string	"short int"
.LASF28:
	.string	"_chain"
.LASF75:
	.string	"result_obj"
.LASF33:
	.string	"_vtable_offset"
.LASF119:
	.string	"display_element"
.LASF171:
	.string	"calloc"
.LASF117:
	.string	"display_column"
.LASF141:
	.string	"transposed"
.LASF64:
	.string	"random_argument"
.LASF87:
	.string	"result_cpy"
.LASF56:
	.string	"uint32_t"
.LASF147:
	.string	"matrix_b_t_obj"
.LASF111:
	.string	"set_nthreads"
.LASF2:
	.string	"char"
.LASF165:
	.string	"rubbish_counter"
.LASF6:
	.string	"unsigned int"
.LASF51:
	.string	"pthread_t"
.LASF123:
	.string	"new_matrix"
.LASF101:
	.string	"scalar_add_worker"
.LASF68:
	.string	"sequence_argument"
.LASF138:
	.string	"cloned"
.LASF167:
	.string	"g_seed"
.LASF177:
	.string	"memcmp"
.LASF46:
	.string	"_next"
.LASF12:
	.string	"__off64_t"
.LASF162:
	.string	"g_height"
.LASF18:
	.string	"_IO_read_base"
.LASF118:
	.string	"column"
.LASF26:
	.string	"_IO_save_end"
.LASF85:
	.string	"get_cmpe_argument"
.LASF164:
	.string	"pow_rubbish"
.LASF96:
	.string	"reverse_worker"
.LASF38:
	.string	"__pad2"
.LASF39:
	.string	"__pad3"
.LASF40:
	.string	"__pad4"
.LASF157:
	.string	"get_trace"
.LASF166:
	.string	"g_nthreads"
.LASF159:
	.string	"get_maximum"
.LASF43:
	.string	"_unused2"
.LASF84:
	.string	"matrix_mul_argument"
.LASF102:
	.string	"scalar_mul_worker"
.LASF73:
	.string	"sums"
.LASF133:
	.string	"sequence_matrix_serial"
.LASF180:
	.string	"/home/jexah/comp2129/comp2129-assignment3"
.LASF104:
	.string	"matrix_a"
.LASF105:
	.string	"matrix_b"
.LASF172:
	.string	"pthread_create"
.LASF156:
	.string	"get_sum"
.LASF25:
	.string	"_IO_backup_base"
.LASF57:
	.string	"matrix_t"
.LASF89:
	.string	"garbage"
.LASF161:
	.string	"g_width"
.LASF113:
	.string	"order"
.LASF155:
	.string	"matrix_pow"
.LASF139:
	.string	"reversed_serial"
.LASF60:
	.string	"identity_argument"
.LASF134:
	.string	"start"
.LASF83:
	.string	"matrix_b_obj"
.LASF125:
	.string	"args"
.LASF66:
	.string	"uniform_argument"
.LASF124:
	.string	"thread_ids"
.LASF19:
	.string	"_IO_write_base"
.LASF22:
	.string	"_IO_buf_base"
.LASF86:
	.string	"result"
.LASF47:
	.string	"_sbuf"
	.ident	"GCC: (GNU) 4.9.2 20150212 (Red Hat 4.9.2-6)"
	.section	.note.GNU-stack,"",@progbits
