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

movq	64(%rsp), %rdi
movq	72(%rsp), %rdx

movq	%r8, %rax
andq  	mask57, %rax
shrd	$57, %r9, %r8
shrq	$57, %r9

movq	%rax, 112(%rsp)

movq	%rdi, %rax
andq  	mask57, %rax
addq	%rax, %r8
adcq	$0, %r9
shrd	$57, %rdx, %rdi
shrq	$57, %rdx

movq	%r8, 120(%rsp)
movq	%r9, 128(%rsp)
movq	80(%rsp), %r8
movq	88(%rsp), %r9

movq	%r8, %rax
andq  	mask57, %rax
addq	%rax, %rdi
adcq	$0, %rdx
shrd	$57, %r9, %r8
shrq	$57, %r9

movq	%rdi, 136(%rsp)
movq	%rdx, 144(%rsp)
movq	96(%rsp), %rdi
movq	104(%rsp), %rdx

movq	%rdi, %rax
andq  	mask57, %rax
addq	%rax, %r8
adcq	$0, %r9
shrd	$57, %rdx, %rdi
shrq	$57, %rdx

movq	%rbx, %rax
andq  	mask57, %rax
addq	%rax, %rdi
adcq	$0, %rdx
shrd	$57, %rcx, %rbx
shrq	$57, %rcx

movq	%r10, %rax
andq  	mask57, %rax
addq	%rax, %rbx
adcq	$0, %rcx
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
andq  	mask55, %rax
addq	%rax, %r14
adcq	$0, %r15

movq	%rdx, 152(%rsp)
shld	$9, %rbp, %rsi
movq	$187, %rax
mulq	%rsi
addq	112(%rsp), %rax
adcq	$0, %rdx

movq	120(%rsp), %rbp
movq	128(%rsp), %rsi

shld 	$7, %rax, %rdx 
andq  	mask57, %rax

shld 	$7, %rbp, %rsi
andq  	mask57, %rbp
addq  	%rdx, %rbp

movq	%rbp, 160(%rsp)
movq	136(%rsp), %rbp
movq	144(%rsp), %rdx

shld 	$7, %rbp, %rdx
andq  	mask57, %rbp
addq  	%rsi, %rbp

shld 	$7, %r8, %r9
andq  	mask57, %r8
addq  	%rdx, %r8

movq	152(%rsp), %rsi

shld 	$7, %rdi, %rsi
andq  	mask57, %rdi
addq  	%r9, %rdi

shld 	$7, %rbx, %rcx
andq  	mask57, %rbx
addq  	%rsi, %rbx

shld 	$7, %r10, %r11
andq  	mask57, %r10
addq  	%rcx, %r10

shld 	$7, %r12, %r13
andq  	mask57, %r12
addq  	%r11, %r12

shld 	$9, %r14, %r15
andq  	mask55, %r14
addq  	%r13, %r14

imul	$187, %r15, %r15
addq	%r15, %rax

movq	160(%rsp), %rcx
movq	%rdi, %rsi

movq	%rax, %r11
andq	mask57, %rax
shrq	$57, %r11
addq	%r11, %rcx

movq	%rcx, %r11
andq	mask57, %rcx
shrq	$57, %r11
addq	%r11, %rbp

movq	%rbp, %r11
andq	mask57, %rbp
shrq	$57, %r11
addq	%r11, %r8

movq	%r8, %r11
andq	mask57, %r8
shrq	$57, %r11
addq	%r11, %rsi

movq	%rsi, %r11
andq	mask57, %rsi
shrq	$57, %r11
addq	%r11, %rbx

movq	%rbx, %r11
andq	mask57, %rbx
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
andq	mask55, %r14
shrq	$55, %r11
imul	$187, %r11, %r11
addq	%r11, %rax

movq 	56(%rsp), %rdi

movq   	%rax,  0(%rdi)
movq   	%rcx,  8(%rdi)
movq   	%rbp, 16(%rdi)
movq   	%r8,  24(%rdi)
movq   	%rsi, 32(%rdi)
movq   	%rbx, 40(%rdi)
movq   	%r10, 48(%rdi)
movq   	%r12, 56(%rdi)
movq   	%r14, 64(%rdi)

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


