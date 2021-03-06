/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^414-17) from the paper        |
| "Efficient Arithmetic In (Pseudo-)Mersenne Prime Order Fields" authored by  |
| Kaushik Nath,  Indian Statistical Institute, Kolkata, India, and            |
| Palash Sarkar, Indian Statistical Institute, Kolkata, India.	              |
+-----------------------------------------------------------------------------+
| Copyright (c) 2018, Kaushik Nath and Palash Sarkar.                         |
|                                                                             |
| Permission to use this code is granted.                          	      |
|                                                                             |
| Redistribution and use in source and binary forms, with or without          |
| modification, are permitted provided that the following conditions are      |
| met:                                                                        |
|                                                                             |
| * Redistributions of source code must retain the above copyright notice,    |
|   this list of conditions and the following disclaimer.                     |
|                                                                             |
| * Redistributions in binary form must reproduce the above copyright         |
|   notice, this list of conditions and the following disclaimer in the       |
|   documentation and/or other materials provided with the distribution.      |
|                                                                             |
| * The names of the contributors may not be used to endorse or promote       |
|   products derived from this software without specific prior written        |
|   permission.                                                               |
+-----------------------------------------------------------------------------+
| THIS SOFTWARE IS PROVIDED BY THE AUTHORS ""AS IS"" AND ANY EXPRESS OR       |
| IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES   |
| OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.     |
| IN NO EVENT SHALL THE CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,      |
| INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT    |
| NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   |
| DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY       |
| THEORY LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING |
| NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,| 
| EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.                          |
+-----------------------------------------------------------------------------+
*/

.p2align 5
.globl gfp41417mul
gfp41417mul:

movq 	%rsp, %r11
subq 	$96, %rsp

movq 	%r11,  0(%rsp)
movq 	%r12,  8(%rsp)
movq 	%r13, 16(%rsp)
movq 	%r14, 24(%rsp)
movq 	%r15, 32(%rsp)
movq 	%rbp, 40(%rsp)
movq 	%rbx, 48(%rsp)
movq 	%rdi, 56(%rsp)

movq	%rdx, %rcx
movq	mask60, %rdi

movq 	8(%rsi),%rax
mulq 	48(%rcx)
movq 	%rax, %r8
movq 	%rdx, %r9

movq 	16(%rsi),%rax
mulq 	40(%rcx)
addq 	%rax, %r8
adcq 	%rdx, %r9

movq 	24(%rsi),%rax
mulq 	32(%rcx)
addq 	%rax, %r8
adcq 	%rdx, %r9

movq 	32(%rsi),%rax
mulq 	24(%rcx)
addq 	%rax, %r8
adcq 	%rdx, %r9

movq 	40(%rsi),%rax
mulq 	16(%rcx)
addq 	%rax, %r8
adcq 	%rdx, %r9

movq 	48(%rsi),%rax
mulq 	8(%rcx)
addq 	%rax, %r8
adcq 	%rdx, %r9

movq 	16(%rsi),%rax
mulq 	48(%rcx)
movq 	%rax, %r10
movq 	%rdx, %r11

movq 	24(%rsi),%rax
mulq 	40(%rcx)
addq 	%rax, %r10
adcq 	%rdx, %r11

movq 	32(%rsi),%rax
mulq 	32(%rcx)
addq 	%rax, %r10
adcq 	%rdx, %r11

movq 	40(%rsi),%rax
mulq 	24(%rcx)
addq 	%rax, %r10
adcq 	%rdx, %r11

movq 	48(%rsi),%rax
mulq 	16(%rcx)
addq 	%rax, %r10
adcq 	%rdx, %r11

movq 	24(%rsi),%rax
mulq 	48(%rcx)
movq 	%rax, %r12
movq 	%rdx, %r13

movq 	32(%rsi),%rax
mulq 	40(%rcx)
addq 	%rax, %r12
adcq 	%rdx, %r13

movq 	40(%rsi),%rax
mulq 	32(%rcx)
addq 	%rax, %r12
adcq 	%rdx, %r13

movq 	48(%rsi),%rax
mulq 	24(%rcx)
addq 	%rax, %r12
adcq 	%rdx, %r13

movq    32(%rsi), %rax
mulq	48(%rcx)		
movq    %rax, %r14
movq    %rdx, %r15

movq    40(%rsi), %rax
mulq	40(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15

movq    48(%rsi), %rax
mulq	32(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15

shld    $4, %r8,  %r9
shld    $4, %r10, %r11
shld    $4, %r12, %r13
shld    $4, %r14, %r15

andq	%rdi, %r8
andq	%rdi, %r10
andq	%rdi, %r12
andq	%rdi, %r14

addq    %r9,  %r10
addq    %r11, %r12
addq    %r13, %r14

movq    $1088, %rax
mulq    %r8
movq    %rax, %r8
movq    %rdx, %r9

movq    0(%rsi), %rax
mulq	0(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9

movq    $1088, %rax
mulq    %r10
movq    %rax, %r10
movq    %rdx, %r11

movq    0(%rsi), %rax
mulq	8(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    8(%rsi), %rax
mulq	0(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    $1088, %rax
mulq    %r12
movq    %rax, %r12
movq    %rdx, %r13

movq    0(%rsi), %rax
mulq	16(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13

movq    8(%rsi), %rax
mulq	8(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13

movq    16(%rsi), %rax
mulq	0(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13

movq    $1088, %rax
mulq    %r14
movq    %rax, %r14
movq    %rdx, %rbx

movq    0(%rsi), %rax
mulq	24(%rcx)		
addq    %rax, %r14
adcq    %rdx, %rbx

movq    8(%rsi), %rax
mulq	16(%rcx)		
addq    %rax, %r14
adcq    %rdx, %rbx

movq    16(%rsi), %rax
mulq	8(%rcx)		
addq    %rax, %r14
adcq    %rdx, %rbx

movq    24(%rsi), %rax
mulq	0(%rcx)		
addq    %rax, %r14
adcq    %rdx, %rbx

movq    %r14, 64(%rsp)
movq    %rbx, 72(%rsp)

movq    $0, %r14
movq    40(%rsi), %rax
mulq	48(%rcx)		
addq    %rax, %r15
adcq    %rdx, %r14

movq    48(%rsi), %rax
mulq	40(%rcx)		
addq    %rax, %r15
adcq    %rdx, %r14

movq    $1088, %rax
mulq    %r15
movq    %rax, %r15
imul    $1088, %r14, %r14
addq    %rdx, %r14

movq 	0(%rsi),%rax
mulq 	32(%rcx)
addq 	%rax, %r15
adcq 	%rdx, %r14

movq 	8(%rsi),%rax
mulq 	24(%rcx)
addq 	%rax, %r15
adcq 	%rdx, %r14

movq 	16(%rsi),%rax
mulq 	16(%rcx)
addq 	%rax, %r15
adcq 	%rdx, %r14

movq 	24(%rsi),%rax
mulq 	8(%rcx)
addq 	%rax, %r15
adcq 	%rdx, %r14

movq 	32(%rsi),%rax
mulq 	0(%rcx)
addq 	%rax, %r15
adcq 	%rdx, %r14

movq    %r15, 80(%rsp)
movq    %r14, 88(%rsp)

movq    48(%rsi), %rax
mulq    48(%rcx)
movq	%rax, %r14
movq    %rdx, %r15
movq    $1088, %rax
mulq    %r14
movq    %rax, %r14
imul    $1088, %r15, %r15
addq    %rdx, %r15

movq 	0(%rsi),%rax
mulq 	40(%rcx)
addq 	%rax, %r14
adcq 	%rdx, %r15

movq 	8(%rsi),%rax
mulq 	32(%rcx)
addq 	%rax, %r14
adcq 	%rdx, %r15

movq 	16(%rsi),%rax
mulq 	24(%rcx)
addq 	%rax, %r14
adcq 	%rdx, %r15

movq 	24(%rsi),%rax
mulq 	16(%rcx)
addq 	%rax, %r14
adcq 	%rdx, %r15

movq 	32(%rsi),%rax
mulq 	8(%rcx)
addq 	%rax, %r14
adcq 	%rdx, %r15

movq 	40(%rsi),%rax
mulq 	0(%rcx)
addq 	%rax, %r14
adcq 	%rdx, %r15

movq 	0(%rsi),%rax
mulq 	48(%rcx)
movq 	%rax, %rbx
movq 	%rdx, %rbp

movq 	8(%rsi),%rax
mulq 	40(%rcx)
addq 	%rax, %rbx
adcq 	%rdx, %rbp

movq 	16(%rsi),%rax
mulq 	32(%rcx)
addq 	%rax, %rbx
adcq 	%rdx, %rbp

movq 	24(%rsi),%rax
mulq 	24(%rcx)
addq 	%rax, %rbx
adcq 	%rdx, %rbp

movq 	32(%rsi),%rax
mulq 	16(%rcx)
addq 	%rax, %rbx
adcq 	%rdx, %rbp

movq 	40(%rsi),%rax
mulq 	8(%rcx)
addq 	%rax, %rbx
adcq 	%rdx, %rbp

movq 	48(%rsi),%rax
mulq 	0(%rcx)
addq 	%rax, %rbx
adcq 	%rdx, %rbp

movq	64(%rsp), %rax
movq	72(%rsp), %rdx

movq	80(%rsp), %rcx
movq	88(%rsp), %rsi

shld    $4, %r8,  %r9
shld    $4, %r10, %r11
shld    $4, %r12, %r13
shld    $4, %rax, %rdx
shld    $4, %r14, %r15

andq	%rdi, %r8
andq	%rdi, %r10
andq	%rdi, %r12
andq	%rdi, %rax
andq	%rdi, %r14

addq	%r9, %r10
addq	%r11, %r12
addq	%r13, %rax

movq    %rcx, %r9
andq    %rdi, %r9
addq    %rdx, %r9

shrd    $60, %rsi, %rcx
shrq    $60, %rsi
addq	%r14, %rcx
adcq    $0, %rsi

movq    %rbx, %r11
andq    mask54, %r11
addq	%r15, %r11

shrd    $54, %rbp, %rbx
shrq    $54, %rbp

movq    %rax, %r13

movq    $17, %rax
mulq    %rbx
movq    %rax, %rbx
imul    $17, %rbp, %rbp
addq    %rdx, %rbp
addq    %r8, %rbx
adcq    $0, %rbp

shld    $4, %rbx, %rbp
addq    %r10, %rbp
andq    %rdi, %rbx

movq    %rbp, %r10
shrq    $60, %rbp
addq    %r12, %rbp
andq    %rdi, %r10

movq    %rbp, %r12
shrq    $60, %rbp
addq    %r13, %rbp
andq    %rdi, %r12

movq    %rbp, %r13
shrq    $60, %rbp
addq    %r9, %rbp
andq    %rdi, %r13

movq    %rbp, %r9
shrq    $60, %rbp
addq    %rcx, %rbp
adcq    $0, %rsi
andq    %rdi, %r9

shld    $4, %rbp, %rsi
addq    %r11, %rsi
andq    %rdi, %rbp

movq    %rsi, %r11
shrq    $54, %rsi
imul    $17, %rsi, %rsi
addq    %rsi, %rbx
andq    mask54, %r11

movq   	56(%rsp), %rdi

movq   	%rbx,  0(%rdi)
movq   	%r10,  8(%rdi)
movq   	%r12, 16(%rdi)
movq   	%r13, 24(%rdi)
movq   	%r9,  32(%rdi)
movq   	%rbp, 40(%rdi)
movq   	%r11, 48(%rdi)

movq 	 0(%rsp), %r11
movq 	 8(%rsp), %r12
movq 	16(%rsp), %r13
movq 	24(%rsp), %r14
movq 	32(%rsp), %r15
movq 	40(%rsp), %rbp
movq 	48(%rsp), %rbx

movq 	%r11, %rsp

ret

.p2align 5
.globl gfp41417reduce
gfp41417reduce:

movq 	%rsp, %r11
subq 	$8, %rsp

movq 	%r11,  0(%rsp)

movq    0(%rdi),   %r8
movq    8(%rdi),   %r9
movq    16(%rdi), %r10
movq    24(%rdi), %r11
movq    32(%rdi), %rax
movq    40(%rdi), %rcx
movq    48(%rdi), %rdx

movq	%r8, %rsi
shrq 	$60, %rsi
addq	%r9, %rsi
andq	mask60, %r8

movq	%rsi, %r9
shrq 	$60, %rsi
addq	%r10, %rsi
andq	mask60, %r9

movq	%rsi, %r10
shrq 	$60, %rsi
addq	%r11, %rsi
andq	mask60, %r10

movq	%rsi, %r11
shrq 	$60, %rsi
addq	%rax, %rsi
andq	mask60, %r11

movq	%rsi, %rax
shrq 	$60, %rsi
addq	%rcx, %rsi
andq	mask60, %rax

movq	%rsi, %rcx
shrq 	$60, %rsi
addq	%rdx, %rsi
andq	mask60, %rcx

movq	%rsi, %rdx
shrq 	$60, %rsi
addq	%r12, %rsi
andq	mask60, %rcx

movq	%rsi, %r12
shrq 	$54, %rsi
imul 	$17, %rsi, %rsi
addq	%rsi, %r8
andq	mask54, %r12

movq	%r8, %rsi
shrq 	$60, %rsi
addq	%rsi, %r9
andq	mask60, %r8

movq    %r8,   0(%rdi)
movq    %r9,   8(%rdi)
movq    %r10, 16(%rdi)
movq    %r11, 24(%rdi)
movq    %rax, 32(%rdi)
movq    %rcx, 40(%rdi)
movq    %rdx, 48(%rdi)

movq 	 0(%rsp), %r11

movq 	%r11, %rsp

ret
