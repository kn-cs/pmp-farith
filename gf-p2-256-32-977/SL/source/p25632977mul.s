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
.globl gfp25632977mul
gfp25632977mul:

movq   %rsp, %r11
subq   $40, %rsp

movq   %r11,  0(%rsp)
movq   %r12,  8(%rsp)
movq   %r13, 16(%rsp)
movq   %r14, 24(%rsp)
movq   %r15, 32(%rsp)

movq   %rdx, %rcx

movq   8(%rsi), %rax
mulq   24(%rcx)
movq   %rax, %r8
xorq   %r9, %r9
movq   %rdx, %r10
xorq   %r11, %r11

movq   16(%rsi), %rax
mulq   16(%rcx)
addq   %rax, %r8
adcq   $0, %r9
addq   %rdx, %r10
adcq   $0, %r11

movq   24(%rsi), %rax
mulq   8(%rcx)
addq   %rax, %r8
adcq   $0, %r9
addq   %rdx, %r10
adcq   $0, %r11

movq   16(%rsi), %rax
mulq   24(%rcx)
addq   %rax, %r10
adcq   $0, %r11
movq   %rdx, %r12
xorq   %r13, %r13

movq   24(%rsi), %rax
mulq   16(%rcx)
addq   %rax, %r10
adcq   $0, %r11
addq   %rdx, %r12
adcq   $0, %r13

movq   twoe32p977, %rax
mulq   %r10
imul   twoe32p977, %r11
movq   %rax, %r10
addq   %rdx, %r11

movq   24(%rsi), %rax
mulq   24(%rcx)
addq   %rax, %r12
adcq   $0, %r13

movq   twoe32p977, %rax
mulq   %rdx
movq   %rax, %r14
movq   %rdx, %r15

movq   twoe32p977, %rax
mulq   %r12
imul   twoe32p977, %r13
movq   %rax, %r12
addq   %rdx, %r13

movq   0(%rsi), %rax
mulq   24(%rcx)
addq   %rax, %r14
adcq   $0, %r15
addq   %rdx, %r8
adcq   $0, %r9

movq   8(%rsi), %rax
mulq   16(%rcx)
addq   %rax, %r14
adcq   $0, %r15
addq   %rdx, %r8
adcq   $0, %r9

movq   16(%rsi), %rax
mulq   8(%rcx)
addq   %rax, %r14
adcq   $0, %r15
addq   %rdx, %r8
adcq   $0, %r9

movq   24(%rsi), %rax
mulq   0(%rcx)
addq   %rax, %r14
adcq   $0, %r15
addq   %rdx, %r8
adcq   $0, %r9

movq   twoe32p977, %rax
mulq   %r8
imul   twoe32p977, %r9
movq   %rax, %r8
addq   %rdx, %r9

movq   0(%rsi), %rax
mulq   0(%rcx)
addq   %rax, %r8
adcq   $0, %r9
addq   %rdx, %r10
adcq   $0, %r11

movq   0(%rsi), %rax
mulq   8(%rcx)
addq   %rax, %r10
adcq   $0, %r11
addq   %rdx, %r12
adcq   $0, %r13

movq   8(%rsi), %rax
mulq   0(%rcx)
addq   %rax, %r10
adcq   $0, %r11
addq   %rdx, %r12
adcq   $0, %r13

movq   0(%rsi), %rax
mulq   16(%rcx)
addq   %rax, %r12
adcq   $0, %r13
addq   %rdx, %r14
adcq   $0, %r15

movq   8(%rsi), %rax
mulq   8(%rcx)
addq   %rax, %r12
adcq   $0, %r13
addq   %rdx, %r14
adcq   $0, %r15

movq   16(%rsi), %rax
mulq   0(%rcx)
addq   %rax, %r12
adcq   $0, %r13
addq   %rdx, %r14
adcq   $0, %r15

addq   %r9, %r10
adcq   $0, %r11

addq   %r11, %r12
adcq   $0, %r13

addq   %r13, %r14
adcq   $0, %r15

movq   twoe32p977, %rax
mulq   %r15

xorq   %r11, %r11
addq   %rax, %r8
adcq   %rdx, %r10
adcq   $0, %r12
adcq   $0, %r14

cmovc  twoe32p977, %r11

addq   %r11, %r8
adcq   $0, %r10

movq   %r8,   0(%rdi)
movq   %r10,  8(%rdi)
movq   %r12, 16(%rdi)
movq   %r14, 24(%rdi)

movq   0(%rsp),  %r11
movq   8(%rsp),  %r12
movq   16(%rsp), %r13
movq   24(%rsp), %r14
movq   32(%rsp), %r15

movq   %r11, %rsp

ret
