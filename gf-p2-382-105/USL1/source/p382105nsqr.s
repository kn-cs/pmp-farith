/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^382-105) from the paper       |
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
.globl gfp382105nsqr
gfp382105nsqr:

movq 	%rsp, %r11
subq 	$192, %rsp

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

movq 	%r8,   0(%rdi)
movq 	%r9,   8(%rdi)
movq 	%r10, 16(%rdi)
movq 	%r11, 24(%rdi)
movq 	%r12, 32(%rdi)
movq 	%r13, 40(%rdi)
movq 	%r14, 48(%rdi)

movq  	%rdx, %rcx

.START:

subq  	$1, %rcx
movq 	%rcx, 184(%rsp)

movq    0(%rdi), %rax
movq	48(%rdi), %rdx
shlq	$1, %rdx
movq	%rdx, 104(%rsp)
mulq	%rdx
movq    %rax, %rbp
movq    %rdx, %rbx

movq    8(%rdi), %rax
movq	40(%rdi), %rdx
shlq	$1, %rdx
movq	%rdx, 112(%rsp)
mulq	%rdx
addq    %rax, %rbp
adcq    %rdx, %rbx

movq    16(%rdi), %rax
movq	32(%rdi), %rdx
shlq	$1, %rdx
movq	%rdx, 120(%rsp)
mulq	%rdx
addq    %rax, %rbp
adcq    %rdx, %rbx

movq    24(%rdi), %rax
mulq	%rax
addq    %rax, %rbp
adcq    %rdx, %rbx

movq    0(%rdi), %rax
mulq	112(%rsp)		
movq    %rax, %r14
movq    %rdx, %r15

movq    8(%rdi), %rax
mulq	120(%rsp)		
addq    %rax, %r14
adcq    %rdx, %r15

movq    16(%rdi), %rax
movq	24(%rdi), %rdx
shlq	$1, %rdx
movq	%rdx, 128(%rsp)
mulq	%rdx
addq    %rax, %r14
adcq    %rdx, %r15

movq    48(%rdi), %rdx
imul    $420, %rdx, %rax	
movq	%rax, 64(%rsp)
mulq	104(%rsp)
addq    %rax, %r14
adcq    %rdx, %r15

movq	%r14, 160(%rsp)		
movq	%r15, 168(%rsp)		

movq    0(%rdi), %rax
mulq	120(%rsp)		
movq    %rax, %r14
movq    %rdx, %r15

movq    8(%rdi), %rax
mulq	128(%rsp)		
addq    %rax, %r14
adcq    %rdx, %r15

movq    16(%rdi), %rax
mulq	%rax
addq    %rax, %r14
adcq    %rdx, %r15

movq    40(%rdi), %rdx
imul    $420, %rdx, %rax	
movq	%rax, 72(%rsp)
movq	104(%rsp), %rdx
shlq	$1, %rdx
movq	%rdx, 104(%rsp)
mulq	%rdx	
addq    %rax, %r14
adcq    %rdx, %r15

movq	%r14, 144(%rsp)		
movq	%r15, 152(%rsp)		

movq    0(%rdi), %rax
mulq	128(%rsp)		
movq    %rax, %r14
movq    %rdx, %r15

movq    8(%rdi), %rax
movq	16(%rdi), %rdx
shlq	$1, %rdx
movq	%rdx, 136(%rsp)
mulq	%rdx		
addq    %rax, %r14
adcq    %rdx, %r15

movq    32(%rdi), %rdx
imul    $420, %rdx, %rax	
movq	%rax, 80(%rsp)
mulq	104(%rsp)	
addq    %rax, %r14
adcq    %rdx, %r15

movq    72(%rsp), %rax
mulq	112(%rsp)
addq    %rax, %r14
adcq    %rdx, %r15

movq    0(%rdi), %rax
mulq	136(%rsp)
movq    %rax, %r12
movq    %rdx, %r13

movq    8(%rdi), %rax
mulq	%rax
addq    %rax, %r12
adcq   	%rdx, %r13

movq    24(%rdi), %rdx
imul    $420, %rdx, %rax	
movq	%rax, 88(%rsp)
mulq	104(%rsp)	
addq    %rax, %r12
adcq    %rdx, %r13

movq    80(%rsp), %rax
movq	112(%rsp), %rdx
shlq	$1, %rdx
movq	%rdx, 112(%rsp)
mulq	%rdx
addq    %rax, %r12
adcq    %rdx, %r13

movq    0(%rdi), %rax
movq	8(%rdi), %rdx
shlq	$1, %rdx
mulq	%rdx
movq    %rax, %r10
movq    %rdx, %r11

movq    16(%rdi), %rdx
imul    $420, %rdx, %rax	
movq	%rax, 96(%rsp)
mulq	104(%rsp)	
addq    %rax, %r10
adcq    %rdx, %r11

movq    88(%rsp), %rax
mulq    112(%rsp)		
addq    %rax, %r10
adcq    %rdx, %r11    

movq    80(%rsp), %rax
mulq	120(%rsp)
addq    %rax, %r10
adcq    %rdx, %r11

movq    0(%rdi), %rax
mulq	%rax		
movq    %rax, %r8
movq    %rdx, %r9

movq    8(%rdi), %rdx
imul    $420, %rdx, %rax
mulq	104(%rsp)	
addq    %rax, %r8
adcq    %rdx, %r9

movq    96(%rsp), %rax
mulq	112(%rsp)	
addq    %rax, %r8
adcq    %rdx, %r9

movq    88(%rsp), %rax
movq	120(%rsp), %rdx	
shlq	$1, %rdx
mulq	%rdx
addq    %rax, %r8
adcq    %rdx, %r9

movq	144(%rsp), %rax
movq	152(%rsp), %rdx

movq	mask55, %rdi

movq	%r8, %rsi
andq	%rdi, %rsi
shrd	$55, %r9, %r8
shrq 	$55, %r9

movq	%r10, %rcx
andq	%rdi, %rcx
addq	%rcx, %r8
adcq 	$0, %r9
shrd	$55, %r11, %r10
shrq 	$55, %r11

movq	%r12, %rcx
andq	%rdi, %rcx
addq	%rcx, %r10
adcq 	$0, %r11
shrd	$55, %r13, %r12
shrq 	$55, %r13

movq	%r14, %rcx
andq	%rdi, %rcx
addq	%rcx, %r12
adcq 	$0, %r13
shrd	$55, %r15, %r14
shrq 	$55, %r15

shld	$9, %rax, %rdx
andq	%rdi, %rax
addq	%rax, %r14
adcq 	$0, %r15

movq	%r10, 176(%rsp)

movq	160(%rsp), %rcx
movq	168(%rsp), %r10

shld	$9, %rcx, %r10
andq	%rdi, %rcx
addq	%rdx, %rcx

shld	$12, %rbp, %rbx
andq	mask52, %rbp
addq	%r10, %rbp

movq	$105, %rax
mulq	%rbx
addq	%rax, %rsi
adcq 	$0, %rdx

movq	176(%rsp), %rax

shld	$9, %rsi, %rdx
andq	%rdi, %rsi

shld	$9, %r8, %r9
andq	%rdi, %r8
addq	%rdx, %r8

shld	$9, %rax, %r11
andq	%rdi, %rax
addq	%r9, %rax

shld	$9, %r12, %r13
andq	%rdi, %r12
addq	%r11, %r12

shld	$9, %r14, %r15
andq	%rdi, %r14
addq	%r13, %r14

addq	%r15, %rcx

movq	%rcx, %rdx
andq	%rdi, %rcx
shrq 	$55, %rdx
addq	%rdx, %rbp

movq	%rbp, %rdx
andq	mask52, %rbp
shrq 	$52, %rdx
imul	$105, %rdx, %rdx
addq	%rdx, %rsi

movq   	56(%rsp), %rdi

movq   	%rsi,  0(%rdi)
movq   	%r8,   8(%rdi)
movq   	%rax, 16(%rdi)
movq   	%r12, 24(%rdi)
movq   	%r14, 32(%rdi)
movq   	%rcx, 40(%rdi)
movq   	%rbp, 48(%rdi)

movq 	184(%rsp), %rcx
cmpq    $0, %rcx

jne 	.START

movq 	 0(%rsp), %r11
movq 	 8(%rsp), %r12
movq 	16(%rsp), %r13
movq 	24(%rsp), %r14
movq 	32(%rsp), %r15
movq 	40(%rsp), %rbp
movq 	48(%rsp), %rbx

movq 	%r11, %rsp

ret
