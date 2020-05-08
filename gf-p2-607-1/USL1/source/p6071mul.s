/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^607-1) from the paper         |
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
.globl gfp6071mul
gfp6071mul:

movq 	%rsp, %r11
subq 	$208, %rsp

movq 	%r11,  0(%rsp)
movq 	%r12,  8(%rsp)
movq 	%r13, 16(%rsp)
movq 	%r14, 24(%rsp)
movq 	%r15, 32(%rsp)
movq 	%rbx, 40(%rsp)
movq 	%rbp, 48(%rsp)
movq 	%rdi, 56(%rsp)

movq	%rdx, %rcx

movq    8(%rsi), %rax
mulq	72(%rcx)		
movq    %rax, %r8
movq    %rdx, %r9

movq    16(%rsi), %rax
mulq    64(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    24(%rsi), %rax
mulq    56(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    32(%rsi), %rax
mulq    48(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    40(%rsi), %rax
mulq    40(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    48(%rsi), %rax
mulq    32(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    56(%rsi), %rax
mulq    24(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    64(%rsi), %rax
mulq    16(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9

movq    72(%rsi), %rax
mulq    8(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9

shld	$3, %r8, %r9
shlq 	$3, %r8

movq	0(%rsi), %rax
mulq	0(%rcx)
addq    %rax, %r8	
adcq    %rdx, %r9

movq    16(%rsi), %rax
mulq    72(%rcx)		
movq    %rax, %r10
movq    %rdx, %r11    		

movq    24(%rsi), %rax
mulq    64(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    32(%rsi), %rax
mulq    56(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    40(%rsi), %rax
mulq    48(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    48(%rsi), %rax
mulq    40(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    56(%rsi), %rax
mulq    32(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    64(%rsi), %rax
mulq    24(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    72(%rsi), %rax
mulq    16(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

shld	$3, %r10, %r11
shlq 	$3, %r10
    		
movq	0(%rsi), %rax
mulq	8(%rcx)
addq    %rax, %r10
adcq    %rdx, %r11

movq	8(%rsi), %rax
mulq	0(%rcx)
addq    %rax, %r10
adcq    %rdx, %r11

movq    24(%rsi), %rax
mulq    72(%rcx)		
movq    %rax, %r12
movq    %rdx, %r13    		

movq    32(%rsi), %rax
mulq    64(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13    		

movq    40(%rsi), %rax
mulq    56(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13    		

movq    48(%rsi), %rax
mulq    48(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13    		

movq    56(%rsi), %rax
mulq    40(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13    		

movq    64(%rsi), %rax
mulq    32(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13

movq    72(%rsi), %rax
mulq    24(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13

shld	$3, %r12, %r13
shlq 	$3, %r12

movq	0(%rsi), %rax
mulq	16(%rcx)
addq    %rax, %r12
adcq    %rdx, %r13

movq	8(%rsi), %rax
mulq	8(%rcx)	
addq    %rax, %r12
adcq    %rdx, %r13

movq	16(%rsi), %rax
mulq	0(%rcx)	
addq    %rax, %r12
adcq    %rdx, %r13

movq    32(%rsi), %rax
mulq    72(%rcx)		
movq    %rax, %r14
movq    %rdx, %r15    		

movq    40(%rsi), %rax
mulq    64(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15    		

movq    48(%rsi), %rax
mulq    56(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15    		

movq    56(%rsi), %rax
mulq    48(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15    		

movq    64(%rsi), %rax
mulq    40(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15

movq    72(%rsi), %rax
mulq    32(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15

shld	$3, %r14, %r15
shlq 	$3, %r14

movq	0(%rsi), %rax
mulq	24(%rcx)
addq    %rax, %r14
adcq    %rdx, %r15

movq	8(%rsi), %rax
mulq	16(%rcx)	
addq    %rax, %r14
adcq    %rdx, %r15

movq	16(%rsi), %rax
mulq	8(%rcx)	
addq    %rax, %r14
adcq    %rdx, %r15

movq	24(%rsi), %rax
mulq	0(%rcx)	
addq    %rax, %r14
adcq    %rdx, %r15

movq    40(%rsi), %rax
mulq    72(%rcx)		
movq    %rax, %rbp
movq    %rdx, %rbx    		

movq    48(%rsi), %rax
mulq    64(%rcx)		
addq    %rax, %rbp
adcq    %rdx, %rbx    		

movq    56(%rsi), %rax
mulq    56(%rcx)		
addq    %rax, %rbp
adcq    %rdx, %rbx    		

movq    64(%rsi), %rax
mulq    48(%rcx)		
addq    %rax, %rbp
adcq    %rdx, %rbx    		

movq    72(%rsi), %rax
mulq    40(%rcx)		
addq    %rax, %rbp
adcq    %rdx, %rbx

shld	$3, %rbp, %rbx
shlq 	$3, %rbp

movq	0(%rsi), %rax
mulq	32(%rcx)
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	8(%rsi), %rax
mulq	24(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	16(%rsi), %rax
mulq	16(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	24(%rsi), %rax
mulq	8(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	32(%rsi), %rax
mulq	0(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	%r10, 64(%rsp)
movq	%r11, 72(%rsp)

movq	%r12, 80(%rsp)
movq	%r13, 88(%rsp)

movq	%r14, 96(%rsp)
movq	%r15, 104(%rsp)

movq	%rbp, 112(%rsp)	
movq	%rbx, 120(%rsp)

movq    48(%rsi), %rax
mulq    72(%rcx)		
movq    %rax, %r10
movq    %rdx, %r11    		

movq    56(%rsi), %rax
mulq    64(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    64(%rsi), %rax
mulq    56(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    72(%rsi), %rax
mulq    48(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

shld	$3, %r10, %r11
shlq 	$3, %r10

movq	0(%rsi), %rax
mulq	40(%rcx)
addq    %rax, %r10
adcq    %rdx, %r11

movq	8(%rsi), %rax
mulq	32(%rcx)	
addq    %rax, %r10
adcq    %rdx, %r11

movq	16(%rsi), %rax
mulq	24(%rcx)	
addq    %rax, %r10
adcq    %rdx, %r11

movq	24(%rsi), %rax
mulq	16(%rcx)	
addq    %rax, %r10
adcq    %rdx, %r11

movq	32(%rsi), %rax
mulq	8(%rcx)	
addq    %rax, %r10
adcq    %rdx, %r11

movq	40(%rsi), %rax
mulq	0(%rcx)	
addq    %rax, %r10
adcq    %rdx, %r11

movq    56(%rsi), %rax
mulq    72(%rcx)		
movq    %rax, %r12
movq    %rdx, %r13    		

movq    64(%rsi), %rax
mulq    64(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13    		

movq    72(%rsi), %rax
mulq    56(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13    		

shld	$3, %r12, %r13
shlq 	$3, %r12

movq	0(%rsi), %rax
mulq	48(%rcx)
addq    %rax, %r12
adcq    %rdx, %r13

movq	8(%rsi), %rax
mulq	40(%rcx)	
addq    %rax, %r12
adcq    %rdx, %r13

movq	16(%rsi), %rax
mulq	32(%rcx)	
addq    %rax, %r12
adcq    %rdx, %r13

movq	24(%rsi), %rax
mulq	24(%rcx)	
addq    %rax, %r12
adcq    %rdx, %r13

movq	32(%rsi), %rax
mulq	16(%rcx)	
addq    %rax, %r12
adcq    %rdx, %r13

movq	40(%rsi), %rax
mulq	8(%rcx)	
addq    %rax, %r12
adcq    %rdx, %r13

movq	48(%rsi), %rax
mulq	0(%rcx)	
addq    %rax, %r12
adcq    %rdx, %r13

movq    64(%rsi), %rax
mulq    72(%rcx)		
movq    %rax, %r14
movq    %rdx, %r15    		

movq    72(%rsi), %rax
mulq    64(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15    		

shld	$3, %r14, %r15
shlq 	$3, %r14

movq	0(%rsi), %rax
mulq	56(%rcx)
addq    %rax, %r14
adcq    %rdx, %r15

movq	8(%rsi), %rax
mulq	48(%rcx)	
addq    %rax, %r14
adcq    %rdx, %r15

movq	16(%rsi), %rax
mulq	40(%rcx)	
addq    %rax, %r14
adcq    %rdx, %r15

movq	24(%rsi), %rax
mulq	32(%rcx)	
addq    %rax, %r14
adcq    %rdx, %r15

movq	32(%rsi), %rax
mulq	24(%rcx)	
addq    %rax, %r14
adcq    %rdx, %r15

movq	40(%rsi), %rax
mulq	16(%rcx)	
addq    %rax, %r14
adcq    %rdx, %r15

movq	48(%rsi), %rax
mulq	8(%rcx)	
addq    %rax, %r14
adcq    %rdx, %r15

movq	56(%rsi), %rax
mulq	0(%rcx)	
addq    %rax, %r14
adcq    %rdx, %r15

movq	72(%rsi), %rax
mulq	72(%rcx)
movq    %rax, %rbp
movq    %rdx, %rbx

shld	$3, %rbp, %rbx
shlq 	$3, %rbp

movq	0(%rsi), %rax
mulq	64(%rcx)
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	8(%rsi), %rax
mulq	56(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	16(%rsi), %rax
mulq	48(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	24(%rsi), %rax
mulq	40(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	32(%rsi), %rax
mulq	32(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	40(%rsi), %rax
mulq	24(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	48(%rsi), %rax
mulq	16(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	56(%rsi), %rax
mulq	8(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	64(%rsi), %rax
mulq	0(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	%rbp, 128(%rsp)	
movq	%rbx, 136(%rsp)	

movq	0(%rsi), %rax
mulq	72(%rcx)
movq    %rax, %rbp
movq    %rdx, %rbx

movq	8(%rsi), %rax
mulq	64(%rcx)
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	16(%rsi), %rax
mulq	56(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	24(%rsi), %rax
mulq	48(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	32(%rsi), %rax
mulq	40(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	40(%rsi), %rax
mulq	32(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	48(%rsi), %rax
mulq	24(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	56(%rsi), %rax
mulq	16(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	64(%rsi), %rax
mulq	8(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	72(%rsi), %rax
mulq	0(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	64(%rsp), %rsi
movq	72(%rsp), %rdi

movq	80(%rsp), %rcx
movq	88(%rsp), %rdx

movq	%r8, %rax
andq  	mask61, %rax
shrd	$61, %r9, %r8
shrq 	$61, %r9
addq	%r8, %rsi
adcq 	%r9, %rdi

movq	%rsi, %r8
andq  	mask61, %r8
shrd	$61, %rdi, %rsi
shrq 	$61, %rdi
addq	%rsi, %rcx
adcq 	%rdi, %rdx

movq	%rcx, %r9
andq  	mask61, %r9
shrd	$61, %rdx, %rcx
shrq 	$61, %rdx
addq	96(%rsp), %rcx
adcq 	104(%rsp), %rdx

movq	%rcx, %rsi
andq  	mask61, %rsi
shrd	$61, %rdx, %rcx
shrq 	$61, %rdx
addq	112(%rsp), %rcx
adcq 	120(%rsp), %rdx

movq	%rcx, %rdi
andq  	mask61, %rdi
shrd	$61, %rdx, %rcx
shrq 	$61, %rdx
addq	%r10, %rcx
adcq 	%r11, %rdx

movq	%rcx, %r10
andq  	mask61, %r10
shrd	$61, %rdx, %rcx
shrq 	$61, %rdx
addq	%r12, %rcx
adcq 	%r13, %rdx

movq	%rcx, %r11
andq  	mask61, %r11
shrd	$61, %rdx, %rcx
shrq 	$61, %rdx
addq	%r14, %rcx
adcq 	%r15, %rdx

movq	%rcx, %r12
andq  	mask61, %r12
shrd	$61, %rdx, %rcx
shrq 	$61, %rdx
addq	128(%rsp), %rcx
adcq 	136(%rsp), %rdx

movq	%rcx, %r13
andq  	mask61, %r13
shrd	$61, %rdx, %rcx
shrq 	$61, %rdx
addq	%rbp, %rcx
adcq 	%rbx, %rdx

movq	%rcx, %r14
andq  	mask58, %r14
shrd	$58, %rdx, %rcx
shrq 	$58, %rdx
addq	%rax, %rcx
adcq 	$0, %rdx

shld	$3, %rcx, %rdx
andq	mask61, %rcx
addq	%rdx, %r8

movq	%rdi, %rax

movq 	56(%rsp), %rdi

movq   	%rcx,  0(%rdi)
movq   	%r8,   8(%rdi)
movq   	%r9,  16(%rdi)
movq   	%rsi, 24(%rdi)
movq   	%rax, 32(%rdi)
movq   	%r10, 40(%rdi)
movq   	%r11, 48(%rdi)
movq   	%r12, 56(%rdi)
movq   	%r13, 64(%rdi)
movq   	%r14, 72(%rdi)

movq 	 0(%rsp), %r11
movq 	 8(%rsp), %r12
movq 	16(%rsp), %r13
movq 	24(%rsp), %r14
movq 	32(%rsp), %r15
movq 	40(%rsp), %rbx
movq 	48(%rsp), %rbp

movq 	%r11, %rsp

ret


.p2align 5
.globl gfp6071reduce
gfp6071reduce:

movq 	%rsp, %r11
subq 	$32,%rsp

movq 	%r11,  0(%rsp)
movq 	%r12,  8(%rsp)
movq 	%r13, 16(%rsp)
movq 	%rdi, 24(%rsp)

movq    0(%rdi),  %r8
movq    8(%rdi),  %r9
movq    16(%rdi), %r10
movq    24(%rdi), %r11
movq    32(%rdi), %r12
movq    40(%rdi), %r13
movq    48(%rdi), %rax
movq    56(%rdi), %rcx
movq    64(%rdi), %rdx
movq    72(%rdi), %rsi

movq	%r9, %rdi
shrq 	$61, %rdi
addq	%r10, %rdi
andq	mask61, %r9

movq	%rdi, %r10
shrq 	$61, %rdi
addq	%r11, %rdi
andq	mask61, %r10

movq	%rdi, %r11
shrq 	$61, %rdi
addq	%r12, %rdi
andq	mask61, %r11

movq	%rdi, %r12
shrq 	$61, %rdi
addq	%r13, %rdi
andq	mask61, %r12

movq	%rdi, %r13
shrq 	$61, %rdi
addq	%rax, %rdi
andq	mask61, %r13

movq	%rdi, %rax
shrq 	$61, %rdi
addq	%rcx, %rdi
andq	mask61, %rax

movq	%rdi, %rcx
shrq 	$61, %rdi
addq	%rdx, %rdi
andq	mask61, %rcx

movq	%rdi, %rdx
shrq 	$61, %rdi
addq	%rsi, %rdi
andq	mask61, %rdx

movq	%rdi, %rsi
shrq 	$58, %rdi
addq	%r8, %rdi
andq	mask58, %rsi

movq	%rdi, %r8
shrq 	$61, %rdi
addq	%r9, %rdi
andq	mask61, %r8

movq	%rdi, %r9
shrq 	$61, %rdi
addq	%rdi, %r10
andq	mask61, %r9

movq 	24(%rsp), %rdi

movq   	%r8,  0(%rdi)
movq   	%r9,  8(%rdi)
movq   	%r10, 16(%rdi)
movq   	%r11, 24(%rdi)
movq   	%r12, 32(%rdi)
movq   	%r13, 40(%rdi)
movq   	%rax, 48(%rdi)
movq   	%rcx, 56(%rdi)
movq   	%rdx, 64(%rdi)
movq   	%rsi, 72(%rdi)

movq 	 16(%rsp), %r13
movq 	 8(%rsp), %r12
movq 	 0(%rsp), %rsp

ret

