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
shrq	$61, %r9

movq	%rax, 144(%rsp)

movq	%rsi, %rax
andq  	mask61, %rax
addq	%rax, %r8
adcq	$0, %r9
shrd	$61, %rdi, %rsi
shrq	$61, %rdi

movq	%rcx, %rax
andq  	mask61, %rax
addq	%rax, %rsi
adcq	$0, %rdi
shrd	$61, %rdx, %rcx
shrq	$61, %rdx

movq	%rsi, 152(%rsp)
movq	%rdi, 160(%rsp)

movq	96(%rsp), %rsi
movq	104(%rsp), %rdi

movq	%rsi, %rax
andq  	mask61, %rax
addq	%rax, %rcx
adcq	$0, %rdx
shrd	$61, %rdi, %rsi
shrq	$61, %rdi

movq	%rcx, 168(%rsp)
movq	%rdx, 176(%rsp)

movq	112(%rsp), %rcx
movq	120(%rsp), %rdx

movq	%rcx, %rax
andq  	mask61, %rax
addq	%rax, %rsi
adcq	$0, %rdi
shrd	$61, %rdx, %rcx
shrq	$61, %rdx

movq	%r10, %rax
andq  	mask61, %rax
addq	%rax, %rcx
adcq	$0, %rdx
shrd	$61, %r11, %r10
shrq	$61, %r11

movq	%r12, %rax
andq  	mask61, %rax
addq	%rax, %r10
adcq	$0, %r11
shrd	$61, %r13, %r12
shrq	$61, %r13

movq	%r14, %rax
andq  	mask61, %rax
addq	%rax, %r12
adcq	$0, %r13
shrd	$61, %r15, %r14
shrq	$61, %r15

movq	%r10, 184(%rsp)
movq	%r11, 192(%rsp)

movq	128(%rsp), %r10
movq	136(%rsp), %r11

movq	%r10, %rax
andq  	mask61, %rax
addq	%rax, %r14
adcq	$0, %r15
shrd	$61, %r11, %r10
shrq	$61, %r11

movq	%rbp, %rax
andq  	mask58, %rax
addq	%rax, %r10
adcq	$0, %r11
shrd	$58, %rbx, %rbp
shrq	$58, %rbx

addq	144(%rsp), %rbp
adcq	$0, %rbx

shld 	$3, %rbp, %rbx 
andq  	mask61, %rbp

shld 	$3, %r8, %r9
andq  	mask61, %r8
addq  	%rbx, %r8

movq	152(%rsp), %rax
movq	160(%rsp), %rbx

shld 	$3, %rax, %rbx
andq  	mask61, %rax
addq  	%r9, %rax

movq	%rbx, 200(%rsp)

movq	168(%rsp), %r9
movq	176(%rsp), %rbx

shld 	$3, %r9, %rbx
andq  	mask61, %r9
addq  	200(%rsp), %r9

shld 	$3, %rsi, %rdi
andq  	mask61, %rsi
addq  	%rbx, %rsi

shld 	$3, %rcx, %rdx
andq  	mask61, %rcx
addq  	%rdi, %rcx

movq	184(%rsp), %rbx
movq	192(%rsp), %rdi

shld 	$3, %rbx, %rdi
andq  	mask61, %rbx
addq  	%rdx, %rbx

shld 	$3, %r12, %r13
andq  	mask61, %r12
addq  	%rdi, %r12

shld 	$3, %r14, %r15
andq  	mask61, %r14
addq  	%r13, %r14

shld 	$6, %r10, %r11
andq  	mask58, %r10
addq  	%r15, %r10

addq	%r11, %rbp

movq	%rbp, %r11
andq	mask61, %rbp
shrq	$61, %r11
addq	%r11, %r8

movq	%r8, %r11
andq	mask61, %r8
shrq	$61, %r11
addq	%r11, %rax

movq	%rax, %r11
andq	mask61, %rax
shrq	$61, %r11
addq	%r11, %r9

movq	%r9, %r11
andq	mask61, %r9
shrq	$61, %r11
addq	%r11, %rsi

movq	%rsi, %r11
andq	mask61, %rsi
shrq	$61, %r11
addq	%r11, %rcx

movq	%rcx, %r11
andq	mask61, %rcx
shrq	$61, %r11
addq	%r11, %rbx

movq	%rbx, %r11
andq	mask61, %rbx
shrq	$61, %r11
addq	%r11, %r12

movq	%r12, %r11
andq	mask61, %r12
shrq	$61, %r11
addq	%r11, %r14

movq	%r14, %r11
andq	mask61, %r14
shrq	$61, %r11
addq	%r11, %r10

movq	%r10, %r11
andq	mask58, %r10
shrq	$58, %r11
addq	%r11, %rbp

movq 	56(%rsp), %rdi

movq   	%rbp,  0(%rdi)
movq   	%r8,   8(%rdi)
movq   	%rax, 16(%rdi)
movq   	%r9,  24(%rdi)
movq   	%rsi, 32(%rdi)
movq   	%rcx, 40(%rdi)
movq   	%rbx, 48(%rdi)
movq   	%r12, 56(%rdi)
movq   	%r14, 64(%rdi)
movq   	%r10, 72(%rdi)

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

movq	%r8, %rdi
shrq 	$61, %rdi
addq	%r10, %rdi
andq	mask61, %r9

movq	%rdi, %r9
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
addq	%rdi, %r9
andq	mask61, %r8

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

