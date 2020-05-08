/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^221-3) from the paper         |
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
.globl gfp2213nsqr
gfp2213nsqr:

movq 	%rsp, %r11
subq 	$64, %rsp

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

movq  	%rdx, %rcx

.START:

subq  	$1, %rcx

movq    %r8, %rax
mulq	%r8
shlq	$1, %r8
movq    %rax, %r12
movq    %rdx, %r13

movq    %r8, %rax
mulq	%r9
movq    %rax, %r14
movq    %rdx, %r15

movq    %r8, %rax
mulq	%r10
movq    %rax, %rbp
movq    %rdx, %rbx

movq    %r8, %rax
mulq	%r11
movq    %rax, %rsi
movq    %rdx, %rdi

movq    %r9, %rax
mulq	%r9
shlq	$1, %r9
addq    %rax, %rbp
adcq   	%rdx, %rbx

movq    %r9, %rax
mulq	%r10
addq    %rax, %rsi
adcq    %rdx, %rdi

movq	%r11, %r8
imul    $24, %r8, %r8
movq    %r9, %rax
mulq	%r8
addq    %rax, %r12
adcq    %rdx, %r13

movq    %r8, %rax
mulq	%r11
addq    %rax, %rbp
adcq    %rdx, %rbx

movq    %r10, %r11
shlq	$1, %r11
movq    %r8, %rax
mulq	%r11
addq    %rax, %r14
adcq    %rdx, %r15

movq	%r10, %r8
imul    $24, %r8, %r8
movq    %r10, %rax
mulq	%r8
addq    %rax, %r12
adcq    %rdx, %r13

movq	mask56, %rdx

shld 	$8, %r12, %r13
addq    %r13, %r14
adcq    $0, %r15
andq  	%rdx, %r12

movq    %r14, %r9
shld 	$8, %r9, %r15
addq    %r15, %rbp
adcq    $0, %rbx
andq  	%rdx, %r9

movq    %rbp, %r10
shld 	$8, %r10, %rbx
addq    %rbx, %rsi
adcq    $0, %rdi
andq  	%rdx, %r10

movq    %rsi, %r11
shld 	$11, %r11, %rdi
addq    %rdi, %r12
addq    %rdi, %rdi
addq    %rdi, %r12
andq  	mask53, %r11

movq    %r12, %r8
shrq    $56, %r12
addq    %r12, %r9
andq    %rdx, %r8

cmpq    $0, %rcx

jne     .START

movq 	56(%rsp), %rdi

movq   	%r8,   0(%rdi)
movq   	%r9,   8(%rdi)
movq   	%r10, 16(%rdi)
movq   	%r11, 24(%rdi)

movq 	 8(%rsp), %r12
movq 	16(%rsp), %r13
movq 	24(%rsp), %r14
movq 	32(%rsp), %r15
movq 	40(%rsp), %rbx
movq 	48(%rsp), %rbp
movq 	 0(%rsp), %rsp

ret
