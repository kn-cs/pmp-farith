/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^511-187) from the paper       |
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
.globl gfp511187nsqr
gfp511187nsqr:

movq	%rsp, %r11
subq	$256, %rsp

movq 	%r11,  0(%rsp)
movq 	%r12,  8(%rsp)
movq 	%r13, 16(%rsp)
movq 	%r14, 24(%rsp)
movq 	%r15, 32(%rsp)
movq 	%rbx, 40(%rsp)
movq 	%rbp, 48(%rsp)
movq 	%rdi, 56(%rsp)

movq 	 0(%rsi), %r8
movq 	 8(%rsi), %r9
movq 	16(%rsi), %r10
movq 	24(%rsi), %r11
movq 	32(%rsi), %r12
movq 	40(%rsi), %r13
movq 	48(%rsi), %r14
movq 	56(%rsi), %r15
movq 	64(%rsi), %rax

movq 	%r8,   0(%rdi)
movq 	%r9,   8(%rdi)
movq 	%r10, 16(%rdi)
movq 	%r11, 24(%rdi)
movq 	%r12, 32(%rdi)
movq 	%r13, 40(%rdi)
movq 	%r14, 48(%rdi)
movq 	%r15, 56(%rdi)
movq 	%rax, 64(%rdi)

movq 	%rdx, %rcx

.START:

subq 	$1, %rcx
movq	%rcx, 184(%rsp)

movq    8(%rdi), %rax
mulq    64(%rdi)		
movq    %rax, %r8
movq    %rdx, %r9    		

movq    16(%rdi), %rax
mulq    56(%rdi)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    24(%rdi), %rax
mulq    48(%rdi)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    32(%rdi), %rax
mulq    40(%rdi)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq	$1496, %rax
mulq	%r8
movq	%rax, %r8
imul 	$1496, %r9, %r9
addq	%rdx, %r9

movq	0(%rdi), %rax
mulq	0(%rdi)
addq    %rax, %r8
adcq    %rdx, %r9

movq    16(%rdi), %rax
shlq    $1, %rax
movq    %rax, 208(%rsp)
mulq    64(%rdi)		
movq    %rax, %r10
movq    %rdx, %r11    		

movq    24(%rdi), %rax
shlq    $1, %rax
movq    %rax, 216(%rsp)
mulq    56(%rdi)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    32(%rdi), %rax
shlq    $1, %rax
movq    %rax, 224(%rsp)
mulq    48(%rdi)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    40(%rdi), %rax
mulq    40(%rdi)		
addq    %rax, %r10
adcq    %rdx, %r11    

movq	$748, %rax
mulq	%r10
movq	%rax, %r10
imul 	$748, %r11, %r11
addq	%rdx, %r11

movq	0(%rdi), %rax
shlq    $1, %rax
movq    %rax, 192(%rsp)
mulq	8(%rdi)

addq    %rax, %r10
adcq    %rdx, %r11

movq	%r10, 64(%rsp)
movq	%r11, 72(%rsp)

movq    24(%rdi), %rax
mulq    64(%rdi)		
movq    %rax, %r12
movq    %rdx, %r13    		

movq    32(%rdi), %rax
mulq    56(%rdi)		
addq    %rax, %r12
adcq    %rdx, %r13    		

movq    40(%rdi), %rax
mulq    48(%rdi)		
addq    %rax, %r12
adcq    %rdx, %r13    		

movq	$1496, %rax
mulq	%r12
movq	%rax, %r12
imul 	$1496, %r13, %r13
addq	%rdx, %r13

movq	192(%rsp), %rax
mulq	16(%rdi)

addq    %rax, %r12
adcq    %rdx, %r13

movq	8(%rdi), %rax
mulq	8(%rdi)	
addq    %rax, %r12
adcq    %rdx, %r13

movq	%r12, 80(%rsp)
movq	%r13, 88(%rsp)

movq    224(%rsp), %rax
mulq    64(%rdi)		
movq    %rax, %r14
movq    %rdx, %r15    		

movq    40(%rdi), %rax
shlq    $1, %rax
mulq    56(%rdi)		
addq    %rax, %r14
adcq    %rdx, %r15    		

movq    48(%rdi), %rax
mulq    48(%rdi)		
addq    %rax, %r14
adcq    %rdx, %r15    

movq	$748, %rax
mulq	%r14
movq	%rax, %r14
imul 	$748, %r15, %r15
addq	%rdx, %r15

movq	192(%rsp), %rax
mulq	24(%rdi)
movq    %rax, %rbx
movq    %rdx, %rcx

movq	8(%rdi), %rax
shlq    $1, %rax
movq    %rax, 200(%rsp)
mulq	16(%rdi)	
addq    %rax, %rbx
adcq    %rdx, %rcx

addq    %rbx, %r14
adcq    %rcx, %r15    

movq	%r14, 96(%rsp)
movq	%r15, 104(%rsp)

movq    40(%rdi), %rax
mulq    64(%rdi)		
movq    %rax, %rbx
movq    %rdx, %rcx    		

movq    48(%rdi), %rax
mulq    56(%rdi)		
addq    %rax, %rbx
adcq    %rdx, %rcx    		

movq	$1496, %rax
mulq	%rbx
movq	%rax, %rbx
imul 	$1496, %rcx, %rcx
addq	%rdx, %rcx

movq	192(%rsp), %rax
mulq	32(%rdi)
movq    %rax, %r10
movq    %rdx, %r11

movq	200(%rsp), %rax
mulq	24(%rdi)	
addq    %rax, %r10
adcq    %rdx, %r11

movq	16(%rdi), %rax
mulq	16(%rdi)	
addq    %rax, %r10
adcq    %rdx, %r11

addq    %r10, %rbx
adcq    %r11, %rcx

movq    48(%rdi), %rax
shlq    $1, %rax
mulq    64(%rdi)		
movq    %rax, %r10
movq    %rdx, %r11

movq    56(%rdi), %rax
mulq    56(%rdi)		
addq    %rax, %r10
adcq    %rdx, %r11

movq	$748, %rax
mulq	%r10
movq	%rax, %r10
imul 	$748, %r11, %r11
addq	%rdx, %r11

movq	192(%rsp), %rax
mulq	40(%rdi)
movq    %rax, %r12
movq    %rdx, %r13

movq	200(%rsp), %rax
mulq	32(%rdi)	
addq    %rax, %r12
adcq    %rdx, %r13

movq	208(%rsp), %rax
mulq	24(%rdi)	
addq    %rax, %r12
adcq    %rdx, %r13

addq    %r12, %r10
adcq    %r13, %r11    

movq    56(%rdi), %rax
mulq    64(%rdi)		
movq    %rax, %r12
movq    %rdx, %r13    		

movq	$1496, %rax
mulq	%r12
movq	%rax, %r12
imul 	$1496, %r13, %r13
addq	%rdx, %r13

movq	192(%rsp), %rax
mulq	48(%rdi)
movq    %rax, %r14
movq    %rdx, %r15

movq	200(%rsp), %rax
mulq	40(%rdi)	
addq    %rax, %r14
adcq    %rdx, %r15

movq	208(%rsp), %rax
mulq	32(%rdi)	
addq    %rax, %r14
adcq    %rdx, %r15

movq	24(%rdi), %rax
mulq	24(%rdi)	
addq    %rax, %r14
adcq    %rdx, %r15

addq    %r14, %r12
adcq    %r15, %r13

movq    64(%rdi), %rax
mulq    64(%rdi)		
movq    %rax, %r14
movq    %rdx, %r15    		

movq	$748, %rax
mulq	%r14
movq	%rax, %r14
imul 	$748, %r15, %r15
addq	%rdx, %r15

movq	192(%rsp), %rax
mulq	56(%rdi)
movq    %rax, %rbp
movq    %rdx, %rsi

movq	200(%rsp), %rax
mulq	48(%rdi)	
addq    %rax, %rbp
adcq    %rdx, %rsi

movq	208(%rsp), %rax
mulq	40(%rdi)	
addq    %rax, %rbp
adcq    %rdx, %rsi

movq	216(%rsp), %rax
mulq	32(%rdi)	
addq    %rax, %rbp
adcq    %rdx, %rsi

addq    %rbp, %r14
adcq    %rsi, %r15

movq	192(%rsp), %rax
mulq	64(%rdi)
movq    %rax, %rbp
movq    %rdx, %rsi

movq	200(%rsp), %rax
mulq	56(%rdi)	
addq    %rax, %rbp
adcq    %rdx, %rsi

movq	208(%rsp), %rax
mulq	48(%rdi)	
addq    %rax, %rbp
adcq    %rdx, %rsi

movq	216(%rsp), %rax
mulq	40(%rdi)	
addq    %rax, %rbp
adcq    %rdx, %rsi

movq	32(%rdi), %rax
mulq	32(%rdi)	
addq    %rax, %rbp
adcq    %rdx, %rsi

movq	mask57, %rdi

movq	%r8, %rax
shrd	$57, %r9, %rax
shrq	$57, %r9
addq	64(%rsp), %rax
adcq	72(%rsp), %r9
andq  	%rdi, %r8

movq    %r8, 64(%rsp)

movq	%rax, %rdx
shrd	$57, %r9, %rax
shrq	$57, %r9
addq	80(%rsp), %rax
adcq	88(%rsp), %r9
andq  	%rdi, %rdx

movq	%rax, %r8
shrd	$57, %r9, %rax
shrq	$57, %r9
addq	96(%rsp), %rax
adcq	104(%rsp), %r9
andq  	%rdi, %r8

movq    %r8, 72(%rsp)

movq	%rax, %r8
shrd	$57, %r9, %rax
shrq	$57, %r9
addq	%rbx, %rax
adcq	%rcx, %r9
andq  	%rdi, %r8

movq	%rax, %rbx
shrd	$57, %r9, %rax
shrq	$57, %r9
addq	%r10, %rax
adcq	%r11, %r9
andq  	%rdi, %rbx

movq	%rax, %rcx
shrd	$57, %r9, %rax
shrq	$57, %r9
addq	%r12, %rax
adcq	%r13, %r9
andq  	%rdi, %rcx

movq	%rax, %r10
shrd	$57, %r9, %rax
shrq	$57, %r9
addq	%r14, %rax
adcq	%r15, %r9
andq  	%rdi, %r10

movq	%rax, %r11
shrd	$57, %r9, %rax
shrq	$57, %r9
addq	%rbp, %rax
adcq	%rsi, %r9
andq  	%rdi, %r11

movq	%rax, %r12
shld	$9, %rax, %r9
andq  	mask55, %r12

movq	%rdx, 80(%rsp)

movq	$187, %rax
mulq	%r9
addq	64(%rsp), %rax
adcq	$0, %rdx

shld	$7, %rax, %rdx
addq	80(%rsp), %rdx
andq  	%rdi, %rax

movq 	72(%rsp), %rbp

movq 	56(%rsp), %rdi

movq   	%rax,  0(%rdi)
movq   	%rdx,  8(%rdi)
movq   	%rbp, 16(%rdi)
movq   	%r8,  24(%rdi)
movq   	%rbx, 32(%rdi)
movq   	%rcx, 40(%rdi)
movq   	%r10, 48(%rdi)
movq   	%r11, 56(%rdi)
movq   	%r12, 64(%rdi)

movq	184(%rsp), %rcx
cmpq    $0, %rcx

jne     .START

movq 	 0(%rsp), %r11
movq 	 8(%rsp), %r12
movq 	16(%rsp), %r13
movq 	24(%rsp), %r14
movq 	32(%rsp), %r15
movq 	40(%rsp), %rbx
movq 	48(%rsp), %rbp

movq	%r11, %rsp

ret


