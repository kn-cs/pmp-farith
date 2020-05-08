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
.global gfp382105nsqr
gfp382105nsqr:

movq   %rsp, %r11
subq   $96, %rsp

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
movq   40(%rsi), %rsi

movq   %r8,   0(%rdi)
movq   %r9,   8(%rdi)
movq   %r10, 16(%rdi)
movq   %r11, 24(%rdi)
movq   %r12, 32(%rdi)

.START:

subq   $1, %rdx
movq   %rdx, 56(%rsp)

movq   %rsi, %rax
mulq   %rsi
movq   %rax, %rbx
xorq   %rbp, %rbp

movq   c420, %rax
mulq   %rdx
movq   %rax, 64(%rsp)
movq   %rdx, 72(%rsp)

shlq   $1, %rsi

movq   8(%rdi), %rax
mulq   %rsi
movq   %rax, %r8
xorq   %r9, %r9
movq   %rdx, %r10
xorq   %r11, %r11

movq   16(%rdi), %rax
mulq   32(%rdi)
addq   %rax, %r8
adcq   $0, %r9
addq   %rdx, %r10
adcq   $0, %r11
addq   %rax, %r8
adcq   $0, %r9
addq   %rdx, %r10
adcq   $0, %r11

movq   24(%rdi), %rax
mulq   %rax
addq   %rax, %r8
adcq   $0, %r9
addq   %rdx, %r10
adcq   $0, %r11

movq   16(%rdi), %rax
mulq   %rsi
addq   %rax, %r10
adcq   $0, %r11
movq   %rdx, %r12
xorq   %r13, %r13

movq   24(%rdi), %rax
mulq   32(%rdi)
addq   %rax, %r10
adcq   $0, %r11
addq   %rdx, %r12
adcq   $0, %r13
addq   %rax, %r10
adcq   $0, %r11
addq   %rdx, %r12
adcq   $0, %r13

movq   c420, %rax
mulq   %r10
imul   c420, %r11
movq   %rax, %r10
addq   %rdx, %r11

movq   24(%rdi), %rax
mulq   %rsi
addq   %rax, %r12
adcq   $0, %r13
movq   %rdx, %r14
xorq   %r15, %r15

movq   32(%rdi), %rax
mulq   %rax
addq   %rax, %r12
adcq   $0, %r13
addq   %rdx, %r14
adcq   $0, %r15

movq   c420, %rax
mulq   %r12
imul   c420, %r13
movq   %rax, %r12
addq   %rdx, %r13

movq   0(%rdi), %rax
mulq   8(%rdi)
addq   %rax, %r10
adcq   $0, %r11
addq   %rdx, %r12
adcq   $0, %r13
addq   %rax, %r10
adcq   $0, %r11
addq   %rdx, %r12
adcq   $0, %r13

movq   %r10, 80(%rsp)
movq   %r11, 88(%rsp)

movq   32(%rdi), %rax
mulq   %rsi
addq   %rax, %r14
adcq   $0, %r15
addq   %rdx, %rbx
adcq   $0, %rbp

movq   c420, %rax
mulq   %r14
imul   c420, %r15
movq   %rax, %r14
addq   %rdx, %r15

movq   c420, %rax
mulq   %rbx
imul   c420, %rbp
movq   %rax, %rbx
addq   %rdx, %rbp

movq   0(%rdi), %rax
mulq   16(%rdi)
addq   %rax, %r12
adcq   $0, %r13
addq   %rdx, %r14
adcq   $0, %r15
addq   %rax, %r12
adcq   $0, %r13
addq   %rdx, %r14
adcq   $0, %r15

movq   8(%rdi), %rax
mulq   8(%rdi)
addq   %rax, %r12
adcq   $0, %r13
addq   %rdx, %r14
adcq   $0, %r15

movq   0(%rdi), %rax
mulq   24(%rdi)
addq   %rax, %r14
adcq   $0, %r15
addq   %rdx, %rbx
adcq   $0, %rbp
addq   %rax, %r14
adcq   $0, %r15
addq   %rdx, %rbx
adcq   $0, %rbp

movq   8(%rdi), %rax
mulq   16(%rdi)
addq   %rax, %r14
adcq   $0, %r15
addq   %rdx, %rbx
adcq   $0, %rbp
addq   %rax, %r14
adcq   $0, %r15
addq   %rdx, %rbx
adcq   $0, %rbp

movq   64(%rsp), %r10
movq   72(%rsp), %r11

movq   0(%rdi), %rax
mulq   32(%rdi)
addq   %rax, %rbx
adcq   $0, %rbp
addq   %rdx, %r10
adcq   $0, %r11
addq   %rax, %rbx
adcq   $0, %rbp
addq   %rdx, %r10
adcq   $0, %r11

movq   8(%rdi), %rax
mulq   24(%rdi)
addq   %rax, %rbx
adcq   $0, %rbp
addq   %rdx, %r10
adcq   $0, %r11
addq   %rax, %rbx
adcq   $0, %rbp
addq   %rdx, %r10
adcq   $0, %r11

movq   16(%rdi), %rax
mulq   %rax
addq   %rax, %rbx
adcq   $0, %rbp
addq   %rdx, %r10
adcq   $0, %r11

movq   0(%rdi), %rax
mulq   %rsi
addq   %rax, %r10
adcq   $0, %r11
addq   %rdx, %r8
adcq   $0, %r9

movq   8(%rdi), %rax
mulq   32(%rdi)
addq   %rax, %r10
adcq   $0, %r11
addq   %rdx, %r8
adcq   $0, %r9
addq   %rax, %r10
adcq   $0, %r11
addq   %rdx, %r8
adcq   $0, %r9

movq   16(%rdi), %rax
mulq   24(%rdi)
addq   %rax, %r10
adcq   $0, %r11
addq   %rdx, %r8
adcq   $0, %r9
addq   %rax, %r10
adcq   $0, %r11
addq   %rdx, %r8
adcq   $0, %r9

movq   c420, %rax
mulq   %r8
imul   c420, %r9
movq   %rax, %r8
addq   %rdx, %r9

movq   0(%rdi), %rax
mulq   %rax
addq   %rax, %r8
adcq   $0, %r9
movq   88(%rsp), %rax
addq   80(%rsp), %rdx
adcq   $0, %rax

addq   %r9, %rdx
adcq   $0, %rax

addq   %rax, %r12
adcq   $0, %r13

addq   %r13, %r14
adcq   $0, %r15

addq   %r15, %rbx
adcq   $0, %rbp

addq   %rbp, %r10 
adcq   $0, %r11

shld   $2, %r10, %r11
andq   mask62, %r10

imul   $105, %r11, %r11

addq   %r11, %r8
adcq   $0, %rdx
adcq   $0, %r12
adcq   $0, %r14
adcq   $0, %rbx
adcq   $0, %r10

movq   %r8,   0(%rdi)
movq   %rdx,  8(%rdi)
movq   %r12, 16(%rdi)
movq   %r14, 24(%rdi)
movq   %rbx, 32(%rdi)
movq   %r10, %rsi

movq   56(%rsp), %rdx
cmpq   $0, %rdx

jne    .START

movq   %rsi, 40(%rdi)

movq   0(%rsp),  %r11
movq   8(%rsp),  %r12
movq   16(%rsp), %r13
movq   24(%rsp), %r14
movq   32(%rsp), %r15
movq   40(%rsp), %rbx
movq   48(%rsp), %rbp

movq   %r11, %rsp

ret
