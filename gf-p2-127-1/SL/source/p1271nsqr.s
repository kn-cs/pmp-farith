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


/* This is the optimized version of the  squaring assembly against the work 
   "Kummer strikes back: new DH speed records", authored by Bernstein et. al.
   Original Code-link: https://github.com/floodyberry/supercop/blob/master/crypto_scalarmult/kummer/avx2/gfe_nsquare.s
*/

.p2align 5
.global gfp1271nsqr
gfp1271nsqr:

movq 	%rsp, %r11
andq 	$31, %r11
addq 	$32, %r11
subq 	%r11, %rsp

movq 	%r11, 0(%rsp)

movq  	%rdx, %rcx
movq   	0(%rsi), %r8
movq   	8(%rsi), %rsi

.START:

movq  	%r8, %rax
mulq  	%r8
movq  	%rax, %r10
movq  	%rdx, %r11

movq  	%rsi, %rax
shlq 	$1, %rax
mulq  	%r8
addq  	%rax, %r11
movq  	$0, %r8
adcq 	%rdx, %r8

movq  	%rsi, %rax
mulq  	%rsi
addq  	%rax, %r8
adcq 	$0, %rdx

shld 	$1, %r8, %rdx
shld 	$1, %r11, %r8
andq  	mask63, %r11

addq  	%r10, %r8
adcq 	%rdx, %r11

movq  	%r11, %rsi
shrq  	$63, %r11
andq  	mask63, %rsi

addq  	%r11, %r8
adcq 	$0, %rsi

subq  	$1, %rcx

ja 	.START

movq   	%r8,  0(%rdi)
movq   	%rsi, 8(%rdi)

movq 	0(%rsp), %r11

addq 	%r11, %rsp

ret
