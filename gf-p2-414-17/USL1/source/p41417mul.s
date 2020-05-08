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
subq 	$160, %rsp

movq 	%r11,  0(%rsp)
movq 	%r12,  8(%rsp)
movq 	%r13, 16(%rsp)
movq 	%r14, 24(%rsp)
movq 	%r15, 32(%rsp)
movq 	%rbp, 40(%rsp)
movq 	%rbx, 48(%rsp)
movq 	%rdi, 56(%rsp)

movq	%rdx, %rcx

movq    0(%rsi), %rax
mulq	0(%rcx)		
movq    %rax, %r8
movq    %rdx, %r9

movq    8(%rsi), %rdx
imul    $68, %rdx, %rax		
mulq	56(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9

movq    16(%rsi), %rdx
imul    $68, %rdx, %rax
movq    %rax, 64(%rsp)  	
mulq    48(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9    

movq    24(%rsi), %rdx
imul    $68, %rdx, %rax
movq    %rax, 72(%rsp)  	
mulq    40(%rcx)	
addq    %rax, %r8
adcq    %rdx, %r9 

movq    32(%rsi), %rdx
imul    $68, %rdx, %rax
movq    %rax, 80(%rsp)  	
mulq    32(%rcx)	
addq    %rax, %r8
adcq    %rdx, %r9 

movq    40(%rsi), %rdx
imul    $68, %rdx, %rax
movq    %rax, 88(%rsp)  	
mulq    24(%rcx)	
addq    %rax, %r8
adcq    %rdx, %r9 

movq    48(%rsi), %rdx
imul    $68, %rdx, %rax
movq    %rax, 96(%rsp)  	
mulq    16(%rcx)	
addq    %rax, %r8
adcq    %rdx, %r9 

movq    56(%rsi), %rdx
imul    $68, %rdx, %rax
movq    %rax, 104(%rsp)  	
mulq    8(%rcx)	
addq    %rax, %r8
adcq    %rdx, %r9 

shld 	$12, %r8, %r9

movq    0(%rsi), %rax
mulq	24(%rcx)		
movq    %rax, %r10
movq    %rdx, %r11

movq    8(%rsi), %rax
mulq	16(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    16(%rsi), %rax
mulq	8(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    24(%rsi), %rax
mulq	0(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    80(%rsp), %rax		
mulq    56(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11   

movq    88(%rsp), %rax		
mulq    48(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    96(%rsp), %rax		
mulq    40(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    104(%rsp), %rax		
mulq    32(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

shld 	$12, %r10, %r11

movq	%r10, 112(%rsp)		
movq	%r11, 120(%rsp)		

movq    0(%rsi), %rax
mulq	32(%rcx)		
movq    %rax, %r10
movq    %rdx, %r11

movq    8(%rsi), %rax
mulq	24(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    16(%rsi), %rax
mulq	16(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    24(%rsi), %rax
mulq	8(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    32(%rsi), %rax
mulq	0(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    88(%rsp), %rax		
mulq    56(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11   

movq    96(%rsp), %rax		
mulq    48(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    104(%rsp), %rax		
mulq    40(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

shld 	$12, %r10, %r11

movq	%r10, 128(%rsp)		
movq	%r11, 136(%rsp)		

movq    0(%rsi), %rax
mulq	40(%rcx)		
movq    %rax, %r10
movq    %rdx, %r11

movq    8(%rsi), %rax
mulq	32(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    16(%rsi), %rax
mulq	24(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    24(%rsi), %rax
mulq	16(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    32(%rsi), %rax
mulq	8(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    40(%rsi), %rax
mulq	0(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    96(%rsp), %rax		
mulq    56(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11   

movq    104(%rsp), %rax		
mulq    48(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

shld 	$12, %r10, %r11

movq	%r10, 144(%rsp)		
movq	%r11, 152(%rsp)		

movq    0(%rsi), %rax
mulq	8(%rcx)
movq    %rax, %r10
movq    %rdx, %r11

movq    8(%rsi), %rax
mulq	0(%rcx)
addq    %rax, %r10
adc    	%rdx, %r11

movq    64(%rsp), %rax
mulq	56(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    72(%rsp), %rax
mulq    48(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11    

movq    80(%rsp), %rax
mulq    40(%rcx)	
addq    %rax, %r10
adcq    %rdx, %r11 

movq    88(%rsp), %rax
mulq    32(%rcx)	
addq    %rax, %r10
adcq    %rdx, %r11 

movq    96(%rsp), %rax
mulq    24(%rcx)	
addq    %rax, %r10
adcq    %rdx, %r11 

movq    104(%rsp), %rax
mulq    16(%rcx)	
addq    %rax, %r10
adcq    %rdx, %r11 

shld 	$12, %r10, %r11

movq    0(%rsi), %rax
mulq	16(%rcx)
movq    %rax, %r12
movq    %rdx, %r13

movq    8(%rsi), %rax
mulq	8(%rcx)
addq    %rax, %r12
adc    	%rdx, %r13

movq    16(%rsi), %rax
mulq	0(%rcx)
addq    %rax, %r12
adc    	%rdx, %r13

movq    72(%rsp), %rax
mulq	56(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13

movq    80(%rsp), %rax
mulq    48(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13    

movq    88(%rsp), %rax
mulq    40(%rcx)	
addq    %rax, %r12
adcq    %rdx, %r13 

movq    96(%rsp), %rax
mulq    32(%rcx)	
addq    %rax, %r12
adcq    %rdx, %r13 

movq    104(%rsp), %rax
mulq    24(%rcx)	
addq    %rax, %r12
adcq    %rdx, %r13 

shld 	$12, %r12, %r13

movq    0(%rsi), %rax
mulq	48(%rcx)		
movq    %rax, %r14
movq    %rdx, %r15

movq    8(%rsi), %rax
mulq	40(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15

movq    16(%rsi), %rax
mulq	32(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15

movq    24(%rsi), %rax
mulq	24(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15

movq    32(%rsi), %rax
mulq	16(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15

movq    40(%rsi), %rax
mulq	8(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15

movq    48(%rsi), %rax
mulq	0(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15

movq    104(%rsp), %rax		
mulq    56(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15   

shld 	$12, %r14, %r15

movq    0(%rsi), %rax
mulq	56(%rcx)		
movq    %rax, %rbp
movq    %rdx, %rbx

movq    8(%rsi), %rax
mulq	48(%rcx)		
addq    %rax, %rbp
adcq    %rdx, %rbx

movq    16(%rsi), %rax
mulq	40(%rcx)		
addq    %rax, %rbp
adcq    %rdx, %rbx

movq    24(%rsi), %rax
mulq	32(%rcx)		
addq    %rax, %rbp
adcq    %rdx, %rbx

movq    32(%rsi), %rax
mulq	24(%rcx)		
addq    %rax, %rbp
adcq    %rdx, %rbx

movq    40(%rsi), %rax
mulq	16(%rcx)		
addq    %rax, %rbp
adcq    %rdx, %rbx

movq    48(%rsi), %rax
mulq	8(%rcx)		
addq    %rax, %rbp
adcq    %rdx, %rbx

movq    56(%rsi), %rax
mulq	0(%rcx)		
addq    %rax, %rbp
adcq    %rdx, %rbx

shld 	$14, %rbp, %rbx

movq	112(%rsp), %rax
movq	120(%rsp), %rdx

movq	128(%rsp), %rcx
movq	136(%rsp), %rsi

movq	mask52, %rdi

andq	%rdi, %r8
andq	%rdi, %r10
andq	%rdi, %r12
andq	%rdi, %rax
andq	%rdi, %rcx

addq	%r9, %r10
addq	%r11, %r12
addq	%r13, %rax
addq	%rdx, %rcx

movq	144(%rsp), %r9
movq	152(%rsp), %r11

andq	%rdi, %r9
andq	%rdi, %r14
andq	mask50, %rbp

addq	%rsi, %r9
addq	%r11, %r14
addq	%r15, %rbp
addq	%rbx, %r8
shlq 	$4, %rbx
addq	%rbx, %r8

movq	%r8, %rdx
shrq 	$52, %rdx
addq	%r10, %rdx
andq	%rdi, %r8

movq	%rdx, %r10
shrq 	$52, %rdx
addq	%r12, %rdx
andq	%rdi, %r10

movq	%rdx, %r12
shrq 	$52, %rdx
addq	%rax, %rdx
andq	%rdi, %r12

movq	%rdx, %rax
shrq 	$52, %rdx
addq	%rcx, %rdx
andq	%rdi, %rax

movq	%rdx, %rcx
shrq 	$52, %rdx
addq	%r9, %rdx
andq	%rdi, %rcx

movq	%rdx, %r9
shrq 	$52, %rdx
addq	%r14, %rdx
andq	%rdi, %r9

movq	%rdx, %r14
shrq 	$52, %rdx
addq	%rbp, %rdx
andq	%rdi, %r14

movq	%rdx, %rbp
shrq 	$50, %rdx
//imul    $17, %rdx, %rdx
addq	%rdx, %r8
shlq 	$4, %rdx
addq	%rdx, %r8
andq	mask50, %rbp

movq   	56(%rsp), %rdi

movq   	%r8,   0(%rdi)
movq   	%r10,  8(%rdi)
movq   	%r12, 16(%rdi)
movq   	%rax, 24(%rdi)
movq   	%rcx, 32(%rdi)
movq   	%r9,  40(%rdi)
movq   	%r14, 48(%rdi)
movq   	%rbp, 56(%rdi)

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
subq 	$16, %rsp

movq 	%r11,  0(%rsp)
movq 	%r12,  8(%rsp)

movq    0(%rdi),   %r8
movq    8(%rdi),   %r9
movq    16(%rdi), %r10
movq    24(%rdi), %r11
movq    32(%rdi), %rax
movq    40(%rdi), %rcx
movq    48(%rdi), %rdx
movq    56(%rdi), %r12

movq	%r8, %rsi
shrq 	$52, %rsi
addq	%r9, %rsi
andq	mask52, %r8

movq	%rsi, %r9
shrq 	$52, %rsi
addq	%r10, %rsi
andq	mask52, %r9

movq	%rsi, %r10
shrq 	$52, %rsi
addq	%r11, %rsi
andq	mask52, %r10

movq	%rsi, %r11
shrq 	$52, %rsi
addq	%rax, %rsi
andq	mask52, %r11

movq	%rsi, %rax
shrq 	$52, %rsi
addq	%rcx, %rsi
andq	mask52, %rax

movq	%rsi, %rcx
shrq 	$52, %rsi
addq	%rdx, %rsi
andq	mask52, %rcx

movq	%rsi, %rdx
shrq 	$52, %rsi
addq	%r12, %rsi
andq	mask52, %rcx

movq	%rsi, %r12
shrq 	$50, %rsi
imul 	$17, %rsi, %rsi
addq	%rsi, %r8
andq	mask50, %r12

movq	%r8, %rsi
shrq 	$52, %rsi
addq	%rsi, %r9
andq	mask52, %r8

movq    %r8,   0(%rdi)
movq    %r9,   8(%rdi)
movq    %r10, 16(%rdi)
movq    %r11, 24(%rdi)
movq    %rax, 32(%rdi)
movq    %rcx, 40(%rdi)
movq    %rdx, 48(%rdi)
movq    %r12, 56(%rdi)

movq 	 0(%rsp), %r11
movq 	 8(%rsp), %r12

movq 	%r11, %rsp

ret
