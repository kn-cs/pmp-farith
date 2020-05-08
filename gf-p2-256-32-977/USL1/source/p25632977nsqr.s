/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^256-2^32-977) from the paper  |
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
.globl gfp25632977nsqr
gfp25632977nsqr:

movq    %rsp, %r11
subq    $80, %rsp

movq    %r11,  0(%rsp)
movq    %r12,  8(%rsp)
movq    %r13, 16(%rsp)
movq    %r14, 24(%rsp)
movq    %r15, 32(%rsp)
movq    %rbp, 40(%rsp)
movq    %rbx, 48(%rsp)

movq    0(%rsi),  %rcx
movq    8(%rsi),  %r15
movq    16(%rsi), %r9
movq    24(%rsi), %r11
movq    32(%rsi), %r12

movq    %r15,  8(%rdi)
movq    %r9,  16(%rdi)
movq    %r11, 24(%rdi)
movq    %r12, 32(%rdi)

movq    %rdx, %rsi

.START:

decq    %rsi

movq 	8(%rdi), %rax
addq    %rax, %rax
movq    %rax, 56(%rsp)
mulq 	32(%rdi)
movq 	%rax, %r8
movq 	%rdx, %rbx

movq 	16(%rdi), %rax
addq    %rax, %rax
movq    %rax, 64(%rsp)
mulq 	24(%rdi)
addq 	%rax, %r8
adcq 	%rdx, %rbx

movq 	64(%rsp),%rax
mulq 	32(%rdi)
movq 	%rax, %r10
movq 	%rdx, %r11

movq 	24(%rdi),%rax
mulq 	%rax
addq 	%rax, %r10
adcq 	%rdx, %r11

movq 	24(%rdi),%rax
addq    %rax, %rax
mulq 	32(%rdi)
movq 	%rax, %r12
movq 	%rdx, %r13

movq 	32(%rdi),%rax
mulq 	%rax
movq 	%rax, %r14
movq 	%rdx, %r15

shld    $12, %r8, %rbx
shld    $12, %r10, %r11
shld    $12, %r12, %r13
shld    $12, %r14, %r15

andq	mask52, %r8
andq	mask52, %r10
andq	mask52, %r12
andq	mask52, %r14

addq    %rbx, %r10
addq    %r11, %r12
addq    %r13, %r14

movq    %r8, %rax
mulq    twoe32p977x16
movq    %rax, %r8
movq    %rdx, %r9

movq 	%rcx, %rax
mulq 	%rax
addq 	%rax, %r8
adcq 	%rdx, %r9

movq    %r10, %rax
mulq    twoe32p977x16
movq    %rax, %r10
movq    %rdx, %r11

movq 	%rcx, %rax
addq    %rax, %rax
movq    %rax, 72(%rsp)
mulq 	8(%rdi)
addq 	%rax, %r10
adcq 	%rdx, %r11

movq    %r12, %rax
mulq    twoe32p977x16
movq    %rax, %r12
movq    %rdx, %r13

movq 	72(%rsp),%rax
mulq 	16(%rdi)
addq 	%rax, %r12
adcq 	%rdx, %r13

movq 	8(%rdi),%rax
mulq 	%rax
addq 	%rax, %r12
adcq 	%rdx, %r13

movq    %r14, %rax
mulq    twoe32p977x16
movq    %rax, %rbx
movq    %rdx, %rbp

movq 	72(%rsp),%rax
mulq 	24(%rdi)
addq 	%rax, %rbx
adcq 	%rdx, %rbp

movq 	56(%rsp),%rax
mulq 	16(%rdi)
addq 	%rax, %rbx
adcq 	%rdx, %rbp

movq    %r15, %rax
mulq    twoe32p977x16
movq    %rax, %r14
movq    %rdx, %r15

movq 	72(%rsp),%rax
mulq 	32(%rdi)
addq 	%rax, %r14
adcq 	%rdx, %r15

movq 	56(%rsp),%rax
mulq 	24(%rdi)
addq 	%rax, %r14
adcq 	%rdx, %r15

movq 	16(%rdi),%rax
mulq 	%rax
addq 	%rax, %r14
adcq 	%rdx, %r15

shld    $12, %r8, %r9
shld    $12, %r10, %r11
shld    $12, %r12, %r13
shld    $12, %rbx, %rbp
shld    $16, %r14, %r15

andq	mask52, %r8
andq	mask52, %r10
andq	mask52, %r12
andq	mask52, %rbx
andq	mask48, %r14

addq    %r9, %r10
addq    %r11, %r12
addq    %r13, %rbx
addq    %rbp, %r14

movq    %r15, %rax
mulq    twoe32p977
addq    %rax, %r8
adcq    $0, %rdx

shld    $12, %r8, %rdx
addq    %r10, %rdx
andq	mask52, %r8

movq    %rdx, %r10
shrq    $52, %rdx
addq    %r12, %rdx
andq	mask52, %r10

movq    %rdx, %r12
shrq    $52, %rdx
addq    %rbx, %rdx
andq	mask52, %r12

movq    %rdx, %rcx
shrq    $52, %rcx
addq    %r14, %rcx
andq	mask52, %rdx

movq    %rcx, %r14
shrq    $48, %rcx
imul    twoe32p977, %rcx
addq    %r8, %rcx
andq	mask48, %r14

movq 	%r10,  8(%rdi)
movq 	%r12, 16(%rdi)
movq 	%rdx, 24(%rdi)
movq 	%r14, 32(%rdi)

cmpq    $0, %rsi

jne     .START

movq    %rcx, 0(%rdi)

movq 	 8(%rsp), %r12
movq 	16(%rsp), %r13
movq 	24(%rsp), %r14
movq 	32(%rsp), %r15
movq 	40(%rsp), %rbp
movq 	48(%rsp), %rbx
movq 	 0(%rsp), %rsp

ret
