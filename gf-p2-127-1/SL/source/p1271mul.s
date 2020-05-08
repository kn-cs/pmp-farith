/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^127-1) from the paper         |
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

/* This is the optimized version of the  multiplication assembly against the work 
   "Kummer strikes back: new DH speed records", authored by Bernstein et. al.
   Original Code-link: https://github.com/floodyberry/supercop/blob/master/crypto_scalarmult/kummer/avx2/gfe_mul.s
*/

.p2align 5
.global gfp1271mul
gfp1271mul:

movq 	%rsp,%r11
andq 	$31,%r11
addq 	$0,%r11
subq 	%r11,%rsp

movq  	%rdx, %rcx

movq   	0(%rsi), %r8
movq   	0(%rcx), %rax
mulq  	%r8

movq  	%rax, %r9
movq  	%rdx, %r10

movq   	8(%rcx), %rax
mulq  	%r8
addq  	%rax, %r10
movq  	$0, %r8
adcq 	%rdx, %r8

movq   	8(%rsi), %rsi
movq   	0(%rcx), %rax
mulq  	%rsi
addq  	%rax, %r10
adcq 	%rdx, %r8

movq   	8(%rcx), %rax
mulq  	%rsi
addq  	%rax, %r8
movq  	$0, %rsi
adcq 	%rdx, %rsi

shld 	$1, %r8, %rsi
shld 	$1, %r10, %r8

andq  	mask63, %r10
addq  	%r8, %r9
adcq 	%rsi,%r10

movq  	%r10, %rsi
shrq  	$63, %rsi
andq  	mask63, %r10
addq  	%rsi, %r9

movq  	$0, %rsi
adcq 	%rsi, %r10

movq    %r9,  0(%rdi)
movq    %r10, 8(%rdi)

addq 	%r11,%rsp

ret
