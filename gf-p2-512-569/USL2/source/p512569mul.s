/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^512-569) from the paper       |
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
.globl gfp512569mul
gfp512569mul:

movq	%rsp, %r11
subq	$184, %rsp

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
mulq	64(%rcx)		
movq    %rax, %r8
movq    %rdx, %r9

movq    16(%rsi), %rax
mulq    56(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    24(%rsi), %rax
mulq    48(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    32(%rsi), %rax
mulq    40(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    40(%rsi), %rax
mulq    32(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    48(%rsi), %rax
mulq    24(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    56(%rsi), %rax
mulq    16(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    64(%rsi), %rax
mulq    8(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9

movq	$1138, %rax
mulq	%r8
movq	%rax, %r8
imul 	$1138, %r9, %r9
addq	%rdx, %r9

movq	0(%rsi), %rax
mulq	0(%rcx)
addq    %rax, %r8	
adcq    %rdx, %r9

movq    16(%rsi), %rax
mulq    64(%rcx)		
movq    %rax, %r10
movq    %rdx, %r11    		

movq    24(%rsi), %rax
mulq    56(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    32(%rsi), %rax
mulq    48(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    40(%rsi), %rax
mulq    40(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    48(%rsi), %rax
mulq    32(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    56(%rsi), %rax
mulq    24(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    64(%rsi), %rax
mulq    16(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq	$1138, %rax
mulq	%r10
movq	%rax, %r10
imul 	$1138, %r11, %r11
addq	%rdx, %r11
    		
movq	0(%rsi), %rax
mulq	8(%rcx)
addq    %rax, %r10
adcq    %rdx, %r11

movq	8(%rsi), %rax
mulq	0(%rcx)
addq    %rax, %r10
adcq    %rdx, %r11

movq    24(%rsi), %rax
mulq    64(%rcx)		
movq    %rax, %r12
movq    %rdx, %r13    		

movq    32(%rsi), %rax
mulq    56(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13    		

movq    40(%rsi), %rax
mulq    48(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13    		

movq    48(%rsi), %rax
mulq    40(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13    		

movq    56(%rsi), %rax
mulq    32(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13    		

movq    64(%rsi), %rax
mulq    24(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13

movq	$1138, %rax
mulq	%r12
movq	%rax, %r12
imul 	$1138, %r13, %r13
addq	%rdx, %r13

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
mulq    64(%rcx)		
movq    %rax, %r14
movq    %rdx, %r15    		

movq    40(%rsi), %rax
mulq    56(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15    		

movq    48(%rsi), %rax
mulq    48(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15    		

movq    56(%rsi), %rax
mulq    40(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15    		

movq    64(%rsi), %rax
mulq    32(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15

movq	$1138, %rax
mulq	%r14
movq	%rax, %r14
imul 	$1138, %r15, %r15
addq	%rdx, %r15

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
mulq    64(%rcx)		
movq    %rax, %rbp
movq    %rdx, %rbx    		

movq    48(%rsi), %rax
mulq    56(%rcx)		
addq    %rax, %rbp
adcq    %rdx, %rbx    		

movq    56(%rsi), %rax
mulq    48(%rcx)		
addq    %rax, %rbp
adcq    %rdx, %rbx    		

movq    64(%rsi), %rax
mulq    40(%rcx)		
addq    %rax, %rbp
adcq    %rdx, %rbx    		

movq	$1138, %rax
mulq	%rbp
movq	%rax, %rbp
imul 	$1138, %rbx, %rbx
addq	%rdx, %rbx

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
mulq    64(%rcx)		
movq    %rax, %r10
movq    %rdx, %r11    		

movq    56(%rsi), %rax
mulq    56(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    64(%rsi), %rax
mulq    48(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq	$1138, %rax
mulq	%r10
movq	%rax, %r10
imul 	$1138, %r11, %r11
addq	%rdx, %r11

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
mulq    64(%rcx)		
movq    %rax, %r12
movq    %rdx, %r13    		

movq    64(%rsi), %rax
mulq    56(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13    		

movq	$1138, %rax
mulq	%r12
movq	%rax, %r12
imul 	$1138, %r13, %r13
addq	%rdx, %r13

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
mulq    64(%rcx)		
movq    %rax, %r14
movq    %rdx, %r15    		

movq	$1138, %rax
mulq	%r14
movq	%rax, %r14
imul 	$1138, %r15, %r15
addq	%rdx, %r15

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

movq	0(%rsi), %rax
mulq	64(%rcx)
movq    %rax, %rbp
movq    %rdx, %rbx

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

movq	64(%rsp), %rsi
movq	72(%rsp), %rdi

movq	80(%rsp), %rcx
movq	88(%rsp), %rdx

movq	%r8, %rax
andq  	mask57, %rax
shrd	$57, %r9, %r8
shrq	$57, %r9

movq	%rax, 128(%rsp)

movq	%rsi, %rax
andq  	mask57, %rax
addq	%rax, %r8
adcq	$0, %r9
shrd	$57, %rdi, %rsi
shrq	$57, %rdi

movq	%rcx, %rax
andq  	mask57, %rax
addq	%rax, %rsi
adcq	$0, %rdi
shrd	$57, %rdx, %rcx
shrq	$57, %rdx

movq	%r8, 136(%rsp)
movq	%r9, 144(%rsp)

movq	96(%rsp), %r8
movq	104(%rsp), %r9

movq	%r8, %rax
andq  	mask57, %rax
addq	%rax, %rcx
adcq	$0, %rdx
shrd	$57, %r9, %r8
shrq	$57, %r9

movq	%rsi, 152(%rsp)
movq	%rdi, 160(%rsp)

movq	112(%rsp), %rsi
movq	120(%rsp), %rdi

movq	%rsi, %rax
andq  	mask57, %rax
addq	%rax, %r8
adcq	$0, %r9
shrd	$57, %rdi, %rsi
shrq	$57, %rdi

movq	%r10, %rax
andq  	mask57, %rax
addq	%rax, %rsi
adcq	$0, %rdi
shrd	$57, %r11, %r10
shrq	$57, %r11

movq	%r12, %rax
andq  	mask57, %rax
addq	%rax, %r10
adcq	$0, %r11
shrd	$57, %r13, %r12
shrq	$57, %r13

movq	%r14, %rax
andq  	mask57, %rax
addq	%rax, %r12
adcq	$0, %r13
shrd	$57, %r15, %r14
shrq	$57, %r15

movq	%rbp, %rax
andq  	mask56, %rax
addq	%rax, %r14
adcq	$0, %r15

movq	%rdx, 168(%rsp)
shld	$8, %rbp, %rbx
movq	$569, %rax
mulq	%rbx
addq	128(%rsp), %rax
adcq	$0, %rdx

movq	136(%rsp), %rbp
movq	144(%rsp), %rbx

shld 	$7, %rax, %rdx 
andq  	mask57, %rax

shld 	$7, %rbp, %rbx
andq  	mask57, %rbp
addq  	%rdx, %rbp

movq	%rbp, 176(%rsp)
movq	152(%rsp), %rbp
movq	160(%rsp), %rdx

shld 	$7, %rbp, %rdx
andq  	mask57, %rbp
addq  	%rbx, %rbp

movq	168(%rsp), %rbx

shld 	$7, %rcx, %rbx
andq  	mask57, %rcx
addq  	%rdx, %rcx

shld 	$7, %r8, %r9
andq  	mask57, %r8
addq  	%rbx, %r8

shld 	$7, %rsi, %rdi
andq  	mask57, %rsi
addq  	%r9, %rsi

shld 	$7, %r10, %r11
andq  	mask57, %r10
addq  	%rdi, %r10

shld 	$7, %r12, %r13
andq  	mask57, %r12
addq  	%r11, %r12

shld 	$8, %r14, %r15
andq  	mask56, %r14
addq  	%r13, %r14

imul	$569, %r15, %r15
addq	%r15, %rax

movq	176(%rsp), %rbx

movq	%rax, %r11
andq	mask57, %rax
shrq	$57, %r11
addq	%r11, %rbx

movq	%rbx, %r11
andq	mask57, %rbx
shrq	$57, %r11
addq	%r11, %rbp

movq	%rbp, %r11
andq	mask57, %rbp
shrq	$57, %r11
addq	%r11, %rcx

movq	%rcx, %r11
andq	mask57, %rcx
shrq	$57, %r11
addq	%r11, %r8

movq	%r8, %r11
andq	mask57, %r8
shrq	$57, %r11
addq	%r11, %rsi

movq	%rsi, %r11
andq	mask57, %rsi
shrq	$57, %r11
addq	%r11, %r10

movq	%r10, %r11
andq	mask57, %r10
shrq	$57, %r11
addq	%r11, %r12

movq	%r12, %r11
andq	mask57, %r12
shrq	$57, %r11
addq	%r11, %r14

movq	%r14, %r11
andq	mask56, %r14
shrq	$56, %r11
imul	$569, %r11, %r11
addq	%r11, %rax

movq 	56(%rsp), %rdi

movq   	%rax,  0(%rdi)
movq   	%rbx,  8(%rdi)
movq   	%rbp, 16(%rdi)
movq   	%rcx, 24(%rdi)
movq   	%r8,  32(%rdi)
movq   	%rsi, 40(%rdi)
movq   	%r10, 48(%rdi)
movq   	%r12, 56(%rdi)
movq   	%r14, 64(%rdi)

movq 	 0(%rsp), %r11
movq 	 8(%rsp), %r12
movq 	16(%rsp), %r13
movq 	24(%rsp), %r14
movq 	32(%rsp), %r15
movq 	40(%rsp), %rbx
movq 	48(%rsp), %rbp

movq	%r11, %rsp

ret


.p2align 5
.globl gfp512569reduce
gfp512569reduce:

movq 	%rsp, %r11
subq 	$24, %rsp

movq 	%r11,  0(%rsp)
movq 	%r12,  8(%rsp)
movq 	%r13, 16(%rsp)

movq    0(%rdi),   %r8
movq    8(%rdi),   %r9
movq    16(%rdi), %r10
movq    24(%rdi), %r11
movq    32(%rdi), %rax
movq    40(%rdi), %rcx
movq    48(%rdi), %rdx
movq    56(%rdi), %r12
movq    64(%rdi), %r13

movq	%r8, %rsi
shrq 	$57, %rsi
addq	%r9, %rsi
andq	mask57, %r8

movq	%rsi, %r9
shrq 	$57, %rsi
addq	%r10, %rsi
andq	mask57, %r9

movq	%rsi, %r10
shrq 	$57, %rsi
addq	%r11, %rsi
andq	mask57, %r10

movq	%rsi, %r11
shrq 	$57, %rsi
addq	%rax, %rsi
andq	mask57, %r11

movq	%rsi, %rax
shrq 	$57, %rsi
addq	%rcx, %rsi
andq	mask57, %rax

movq	%rsi, %rcx
shrq 	$57, %rsi
addq	%rdx, %rsi
andq	mask57, %rcx

movq	%rsi, %rdx
shrq 	$57, %rsi
addq	%r12, %rsi
andq	mask57, %rcx

movq	%rsi, %r12
shrq 	$57, %rsi
addq	%r13, %rsi
andq	mask57, %rcx

movq	%rsi, %r13
shrq 	$56, %rsi
imul 	$569, %rsi, %rsi
addq	%rsi, %r8
andq	mask56, %r13

movq	%r8, %rsi
shrq 	$57, %rsi
addq	%rsi, %r9
andq	mask57, %r8

movq    %r8,   0(%rdi)
movq    %r9,   8(%rdi)
movq    %r10, 16(%rdi)
movq    %r11, 24(%rdi)
movq    %rax, 32(%rdi)
movq    %rcx, 40(%rdi)
movq    %rdx, 48(%rdi)
movq    %r12, 56(%rdi)
movq    %r13, 64(%rdi)

movq 	 0(%rsp), %r11
movq 	 8(%rsp), %r12
movq 	 16(%rsp), %r13

movq 	%r11, %rsp

ret
