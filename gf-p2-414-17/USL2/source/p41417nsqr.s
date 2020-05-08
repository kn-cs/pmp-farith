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
.globl gfp41417nsqr
gfp41417nsqr:

movq 	%rsp, %r11
subq 	$184, %rsp

movq 	%r11,  0(%rsp)
movq 	%r12,  8(%rsp)
movq 	%r13, 16(%rsp)
movq 	%r14, 24(%rsp)
movq 	%r15, 32(%rsp)
movq 	%rbp, 40(%rsp)
movq 	%rbx, 48(%rsp)
movq 	%rdi, 56(%rsp)

movq 	 0(%rsi), %r8	
movq 	 8(%rsi), %r9	
movq 	16(%rsi), %r10	
movq 	24(%rsi), %r11
movq 	32(%rsi), %r12
movq 	40(%rsi), %r13
movq 	48(%rsi), %r14
movq 	56(%rsi), %r15

movq 	%r8,   0(%rdi)
movq 	%r9,   8(%rdi)
movq 	%r10, 16(%rdi)
movq 	%r11, 24(%rdi)
movq 	%r12, 32(%rdi)
movq 	%r13, 40(%rdi)
movq 	%r14, 48(%rdi)
movq 	%r15, 56(%rdi)

mov  	%rdx, %rcx

.START:

subq  	$1, %rcx
movq 	%rcx, 152(%rsp)

movq    0(%rdi), %rax
mulq	0(%rdi)		
movq    %rax, %r8
movq    %rdx, %r9

movq    8(%rdi), %rdx
imul    $136, %rdx, %rax		
mulq	56(%rdi)		
addq    %rax, %r8
adcq    %rdx, %r9

movq    16(%rdi), %rdx
imul    $136, %rdx, %rax
movq    %rax, 64(%rsp)
mulq    48(%rdi)		
addq    %rax, %r8
adcq    %rdx, %r9    

movq    24(%rdi), %rdx
imul    $136, %rdx, %rax
movq    %rax, 72(%rsp)
mulq    40(%rdi)	
addq    %rax, %r8
adcq    %rdx, %r9 

movq    32(%rdi), %rdx
imul    $68, %rdx, %rax
movq    %rax, 80(%rsp)
mulq    32(%rdi)	
addq    %rax, %r8
adcq    %rdx, %r9 

movq    0(%rdi), %rax
shlq	$1, %rax
movq    %rax, 160(%rsp)
mulq	8(%rdi)
movq    %rax, %r10
movq    %rdx, %r11

movq    64(%rsp), %rax
mulq	56(%rdi)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    72(%rsp), %rax
mulq    48(%rdi)		
addq    %rax, %r10
adcq    %rdx, %r11    

movq    80(%rsp), %rax
shlq	$1, %rax
movq    %rax, 80(%rsp)
mulq    40(%rdi)	
addq    %rax, %r10
adcq    %rdx, %r11 

movq    160(%rsp), %rax
mulq	16(%rdi)
movq    %rax, %r12
movq    %rdx, %r13

movq    8(%rdi), %rax
mulq	8(%rdi)
addq    %rax, %r12
adc    	%rdx, %r13

movq    72(%rsp), %rax
mulq	56(%rdi)		
addq    %rax, %r12
adcq    %rdx, %r13

movq    80(%rsp), %rax
mulq    48(%rdi)		
addq    %rax, %r12
adcq    %rdx, %r13    

movq    40(%rdi), %rdx
imul    $68, %rdx, %rax
movq    %rax, 88(%rsp)
mulq    40(%rdi)	
addq    %rax, %r12
adcq    %rdx, %r13 

movq    160(%rsp), %rax
mulq	24(%rdi)		
movq    %rax, %r14
movq    %rdx, %r15

movq    8(%rdi), %rax
shlq	$1, %rax
movq    %rax, 168(%rsp)
mulq	16(%rdi)		
addq    %rax, %r14
adcq    %rdx, %r15

movq    80(%rsp), %rax
mulq    56(%rdi)		
addq    %rax, %r14
adcq    %rdx, %r15   

movq    88(%rsp), %rax
shlq	$1, %rax
movq    %rax, 88(%rsp)
mulq    48(%rdi)		
addq    %rax, %r14
adcq    %rdx, %r15

movq    160(%rsp), %rax
mulq	32(%rdi)		
movq    %rax, %rbp
movq    %rdx, %rbx

movq    168(%rsp), %rax
mulq	24(%rdi)		
addq    %rax, %rbp
adcq    %rdx, %rbx

movq    16(%rdi), %rax
mulq	16(%rdi)		
addq    %rax, %rbp
adcq    %rdx, %rbx

movq    88(%rsp), %rax		
mulq    56(%rdi)		
addq    %rax, %rbp
adcq    %rdx, %rbx   

movq    48(%rdi), %rdx
imul    $68, %rdx, %rax
movq    %rax, 96(%rsp)
mulq    48(%rdi)		
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	%rbp, 104(%rsp)		
movq	%rbx, 112(%rsp)		

movq    160(%rsp), %rax
mulq	40(%rdi)		
movq    %rax, %rbp
movq    %rdx, %rbx

movq    168(%rsp), %rax
mulq	32(%rdi)		
addq    %rax, %rbp
adcq    %rdx, %rbx

movq    16(%rdi), %rax
shlq	$1, %rax
movq    %rax, 176(%rsp)
mulq	24(%rdi)		
addq    %rax, %rbp
adcq    %rdx, %rbx

movq    96(%rsp), %rax
shlq	$1, %rax
mulq    56(%rdi)		
addq    %rax, %rbp
adcq    %rdx, %rbx   

movq	%rbp, 120(%rsp)		
movq	%rbx, 128(%rsp)		

movq    160(%rsp), %rax
mulq	48(%rdi)		
movq    %rax, %rbp
movq    %rdx, %rbx

movq    168(%rsp), %rax
mulq	40(%rdi)		
addq    %rax, %rbp
adcq    %rdx, %rbx

movq    176(%rsp), %rax
mulq	32(%rdi)		
addq    %rax, %rbp
adcq    %rdx, %rbx

movq    24(%rdi), %rax
mulq	24(%rdi)		
addq    %rax, %rbp
adcq    %rdx, %rbx

movq    56(%rdi), %rdx
imul    $68, %rdx, %rax
mulq    56(%rdi)		
addq    %rax, %rbp
adcq    %rdx, %rbx   

movq	%rbp, 136(%rsp)		
movq	%rbx, 144(%rsp)		

movq    160(%rsp), %rax
mulq	56(%rdi)		
movq    %rax, %rbp
movq    %rdx, %rbx

movq    168(%rsp), %rax
mulq	48(%rdi)		
addq    %rax, %rbp
adcq    %rdx, %rbx

movq    176(%rsp), %rax
mulq	40(%rdi)		
addq    %rax, %rbp
adcq    %rdx, %rbx

movq    24(%rdi), %rax
shlq	$1, %rax
mulq	32(%rdi)		
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	104(%rsp), %rax
movq	112(%rsp), %rdx

movq	120(%rsp), %rcx
movq	128(%rsp), %rsi

movq	mask52, %rdi

shld    $12, %r8, %r9
addq    %r9, %r10
adcq    $0, %r11
andq    %rdi, %r8

shld    $12, %r10, %r11
addq    %r11, %r12
adcq    $0, %r13
andq    %rdi, %r10

shld    $12, %r12, %r13
addq    %r13, %r14
adcq    $0, %r15
andq    %rdi, %r12

shld    $12, %r14, %r15
addq    %r15, %rax
adcq    $0, %rdx
andq    %rdi, %r14

shld    $12, %rax, %rdx
addq    %rdx, %rcx
adcq    $0, %rsi
andq    %rdi, %rax

shld    $12, %rcx, %rsi
addq    136(%rsp), %rsi
movq    144(%rsp), %r9
adcq    $0, %r9
andq    %rdi, %rcx

shld    $12, %rsi, %r9
addq    %r9, %rbp
adcq    $0, %rbx
andq    %rdi, %rsi

shld    $14, %rbp, %rbx
imul    $17, %rbx, %rbx
//addq    %rbx, %r8
//shlq    $4, %rbx
addq    %rbx, %r8
andq    mask50, %rbp

movq	%r8, %r9
shrq 	$52, %r9
addq	%r9, %r10
andq	%rdi, %r8

movq   	56(%rsp), %rdi

movq   	%r8,   0(%rdi)
movq   	%r10,  8(%rdi)
movq   	%r12, 16(%rdi)
movq   	%r14, 24(%rdi)
movq   	%rax, 32(%rdi)
movq   	%rcx, 40(%rdi)
movq   	%rsi, 48(%rdi)
movq   	%rbp, 56(%rdi)

movq 	152(%rsp), %rcx
cmpq    $0, %rcx

jne     .START

movq 	 0(%rsp), %r11
movq 	 8(%rsp), %r12
movq 	16(%rsp), %r13
movq 	24(%rsp), %r14
movq 	32(%rsp), %r15
movq 	40(%rsp), %rbp
movq 	48(%rsp), %rbx

movq 	%r11, %rsp

ret
