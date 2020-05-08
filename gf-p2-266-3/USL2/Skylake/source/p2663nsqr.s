/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^266-3) from the paper         |
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
.global gfp2663nsqr
gfp2663nsqr:

movq   %rsp, %r11
subq   $72, %rsp

movq   %r11,  0(%rsp)
movq   %r12,  8(%rsp)
movq   %r13, 16(%rsp)
movq   %r14, 24(%rsp)
movq   %r15, 32(%rsp)
movq   %rbx, 40(%rsp)
movq   %rbp, 48(%rsp)

movq   0(%rsi),   %r8
movq   8(%rsi),   %r9
movq   16(%rsi), %r10
movq   24(%rsi), %r11
movq   32(%rsi), %r12

movq   %r10, 16(%rdi)
movq   %r11, 24(%rdi)
movq   %r12, 32(%rdi)

movq   %rdx, %rsi

.START:

subq   $1, %rsi

movq   %r8, %rax
mulq   %r8
movq   %rax, %r10
movq   %rdx, %r11

shlq   $1, %r8
movq   %r8, %rax
mulq   %r9
movq   %rax, %r12
movq   %rdx, %r13

movq   %r8, %rax
mulq   16(%rdi)
movq   %rax, %r14
movq   %rdx, %r15

movq   %r9, %rax
mulq   %r9
addq   %rax, %r14
adcq   %rdx, %r15

movq   %r8, %rax
mulq   24(%rdi)
movq   %rax, %rbx
movq   %rdx, %rbp

shlq   $1, %r9
movq   %r9, %rax
mulq   16(%rdi)
addq   %rax, %rbx
adcq   %rdx, %rbp

movq   %r8, %rax
mulq   32(%rdi)
movq   %rax, %r8
movq   %rdx, %rcx

movq   %r9, %rax
mulq   24(%rdi)
addq   %rax, %r8
adcq   %rdx, %rcx

movq   16(%rdi), %rax
mulq   %rax
addq   %rax, %r8
adcq   %rdx, %rcx

imul   $48, 24(%rdi), %rax
movq   %rax, 56(%rsp)
mulq   24(%rdi)
addq   %rax, %r12
adcq   %rdx, %r13

imul   $48, 32(%rdi), %rax
movq   %rax, 64(%rsp)
mulq   32(%rdi)
addq   %rax, %rbx
adcq   %rdx, %rbp

movq   64(%rsp), %rax
mulq   %r9
addq   %rax, %r10
adcq   %rdx, %r11

movq   56(%rsp), %rax
shlq   $1, %rax
mulq   16(%rdi)
addq   %rax, %r10
adcq   %rdx, %r11

movq   64(%rsp), %rax
shlq   $1, %rax
movq   %rax, 64(%rsp)
mulq   24(%rdi)
addq   %rax, %r14
adcq   %rdx, %r15

movq   64(%rsp), %rax
mulq   16(%rdi)
addq   %rax, %r12
adcq   %rdx, %r13

movq   mask54, %rdx

shld   $10, %r10, %r11
addq   %r11, %r12
adcq   $0, %r13
andq   %rdx, %r10

movq   %r12, %r9
shld   $10, %r9, %r13
addq   %r13, %r14
adcq   $0, %r15
andq   %rdx, %r9

shld   $10, %r14, %r15
addq   %r15, %rbx
adcq   $0, %rbp
andq   %rdx, %r14
movq   %r14, 16(%rdi)

shld   $10, %rbx, %rbp
addq   %rbp, %r8
adcq   $0, %rcx
andq   %rdx, %rbx
movq   %rbx, 24(%rdi)

shld   $14, %r8, %rcx
addq   %rcx, %r10
shlq   $1, %rcx
addq   %rcx, %r10
andq   mask50, %r8
movq   %r8, 32(%rdi)

movq   %r10,  %r8
shrq   $54,  %r10
addq   %r10, %r9
andq   %rdx,  %r8

cmpq   $0, %rsi

jne    .START

movq   %r8, 0(%rdi)
movq   %r9, 8(%rdi)

movq   0(%rsp),  %r11
movq   8(%rsp),  %r12
movq   16(%rsp), %r13
movq   24(%rsp), %r14
movq   32(%rsp), %r15
movq   40(%rsp), %rbx
movq   48(%rsp), %rbp

movq   %r11, %rsp

ret
