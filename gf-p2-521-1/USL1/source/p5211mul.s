/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^521-1) from the paper         |
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
.globl gfp5211mul
gfp5211mul:

movq 	%rsp, %r11
subq 	$200, %rsp

movq 	%r11,  0(%rsp)
movq 	%r12,  8(%rsp)
movq 	%r13, 16(%rsp)
movq 	%r14, 24(%rsp)
movq 	%r15, 32(%rsp)
movq 	%rbx, 40(%rsp)
movq 	%rbp, 48(%rsp)
movq 	%rdi, 56(%rsp)

movq	%rdx, %rcx

movq    8(%rsi), %rax
addq    %rax, %rax
movq    %rax, 136(%rsp)
mulq	64(%rcx)		
movq    %rax, %r8
movq    %rdx, %r9

movq    16(%rsi), %rax
addq    %rax, %rax
movq    %rax, 144(%rsp)
mulq    56(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    24(%rsi), %rax
addq    %rax, %rax
movq    %rax, 152(%rsp)
mulq    48(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    32(%rsi), %rax
addq    %rax, %rax
movq    %rax, 160(%rsp)
mulq    40(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    40(%rsi), %rax
addq    %rax, %rax
movq    %rax, 168(%rsp)
mulq    32(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    48(%rsi), %rax
addq    %rax, %rax
movq    %rax, 176(%rsp)
mulq    24(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    56(%rsi), %rax
addq    %rax, %rax
movq    %rax, 184(%rsp)
mulq    16(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    64(%rsi), %rax
addq    %rax, %rax
movq    %rax, 192(%rsp)
mulq    8(%rcx)		
addq    %rax, %r8
adcq    %rdx, %r9

movq	0(%rsi), %rax
mulq	0(%rcx)
addq    %rax, %r8	
adcq    %rdx, %r9

shld    $6, %r8, %r9

movq    144(%rsp), %rax
mulq    64(%rcx)		
movq    %rax, %r10
movq    %rdx, %r11    		

movq    152(%rsp), %rax
mulq    56(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    160(%rsp), %rax
mulq    48(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    168(%rsp), %rax
mulq    40(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    176(%rsp), %rax
mulq    32(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    184(%rsp), %rax
mulq    24(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    192(%rsp), %rax
mulq    16(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11
  		
movq	0(%rsi), %rax
mulq	8(%rcx)
addq    %rax, %r10
adcq    %rdx, %r11

movq	8(%rsi), %rax
mulq	0(%rcx)
addq    %rax, %r10
adcq    %rdx, %r11

shld    $6, %r10, %r11

movq	%r10, 64(%rsp)
movq	%r11, 72(%rsp)

movq    152(%rsp), %rax
mulq    64(%rcx)		
movq    %rax, %r12
movq    %rdx, %r13    		

movq    160(%rsp), %rax
mulq    56(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13    		

movq    168(%rsp), %rax
mulq    48(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13    		

movq    176(%rsp), %rax
mulq    40(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13    		

movq    184(%rsp), %rax
mulq    32(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13    		

movq    192(%rsp), %rax
mulq    24(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13

movq	0(%rsi), %rax
mulq	16(%rcx)
addq    %rax, %r12
adcq    %rdx, %r13

movq	8(%rsi), %rax
mulq	8(%rcx)	
addq    %rax, %r12
adcq    %rdx, %r13

movq	16(%rsi), %rax
mulq	0(%rcx)	
addq    %rax, %r12
adcq    %rdx, %r13

shld    $6, %r12, %r13

movq	%r12, 80(%rsp)
movq	%r13, 88(%rsp)

movq    160(%rsp), %rax
mulq    64(%rcx)		
movq    %rax, %r14
movq    %rdx, %r15    		

movq    168(%rsp), %rax
mulq    56(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15    		

movq    176(%rsp), %rax
mulq    48(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15    		

movq    184(%rsp), %rax
mulq    40(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15    		

movq    192(%rsp), %rax
mulq    32(%rcx)		
addq    %rax, %r14
adcq    %rdx, %r15

movq	0(%rsi), %rax
mulq	24(%rcx)
addq    %rax, %r14
adcq    %rdx, %r15

movq	8(%rsi), %rax
mulq	16(%rcx)	
addq    %rax, %r14
adcq    %rdx, %r15

movq	16(%rsi), %rax
mulq	8(%rcx)	
addq    %rax, %r14
adcq    %rdx, %r15

movq	24(%rsi), %rax
mulq	0(%rcx)	
addq    %rax, %r14
adcq    %rdx, %r15

shld    $6, %r14, %r15

movq	%r14, 96(%rsp)
movq	%r15, 104(%rsp)

movq    168(%rsp), %rax
mulq    64(%rcx)		
movq    %rax, %rbp
movq    %rdx, %rbx    		

movq    176(%rsp), %rax
mulq    56(%rcx)		
addq    %rax, %rbp
adcq    %rdx, %rbx    		

movq    184(%rsp), %rax
mulq    48(%rcx)		
addq    %rax, %rbp
adcq    %rdx, %rbx    		

movq    192(%rsp), %rax
mulq    40(%rcx)		
addq    %rax, %rbp
adcq    %rdx, %rbx    		

movq	0(%rsi), %rax
mulq	32(%rcx)
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	8(%rsi), %rax
mulq	24(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	16(%rsi), %rax
mulq	16(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	24(%rsi), %rax
mulq	8(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	32(%rsi), %rax
mulq	0(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

shld 	$6, %rbp, %rbx

movq	%rbp, 112(%rsp)	
movq	%rbx, 120(%rsp)

movq    176(%rsp), %rax
mulq    64(%rcx)		
movq    %rax, %r10
movq    %rdx, %r11    		

movq    184(%rsp), %rax
mulq    56(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    192(%rsp), %rax
mulq    48(%rcx)		
addq    %rax, %r10
adcq    %rdx, %r11

movq	0(%rsi), %rax
mulq	40(%rcx)
addq    %rax, %r10
adcq    %rdx, %r11

movq	8(%rsi), %rax
mulq	32(%rcx)	
addq    %rax, %r10
adcq    %rdx, %r11

movq	16(%rsi), %rax
mulq	24(%rcx)	
addq    %rax, %r10
adcq    %rdx, %r11

movq	24(%rsi), %rax
mulq	16(%rcx)	
addq    %rax, %r10
adcq    %rdx, %r11

movq	32(%rsi), %rax
mulq	8(%rcx)	
addq    %rax, %r10
adcq    %rdx, %r11

movq	40(%rsi), %rax
mulq	0(%rcx)	
addq    %rax, %r10
adcq    %rdx, %r11

shld 	$6, %r10, %r11

movq    184(%rsp), %rax
mulq    64(%rcx)		
movq    %rax, %r12
movq    %rdx, %r13    		

movq    192(%rsp), %rax
mulq    56(%rcx)		
addq    %rax, %r12
adcq    %rdx, %r13    		

movq	0(%rsi), %rax
mulq	48(%rcx)
addq    %rax, %r12
adcq    %rdx, %r13

movq	8(%rsi), %rax
mulq	40(%rcx)	
addq    %rax, %r12
adcq    %rdx, %r13

movq	16(%rsi), %rax
mulq	32(%rcx)	
addq    %rax, %r12
adcq    %rdx, %r13

movq	24(%rsi), %rax
mulq	24(%rcx)	
addq    %rax, %r12
adcq    %rdx, %r13

movq	32(%rsi), %rax
mulq	16(%rcx)	
addq    %rax, %r12
adcq    %rdx, %r13

movq	40(%rsi), %rax
mulq	8(%rcx)	
addq    %rax, %r12
adcq    %rdx, %r13

movq	48(%rsi), %rax
mulq	0(%rcx)	
addq    %rax, %r12
adcq    %rdx, %r13

shld 	$6, %r12, %r13

movq    192(%rsp), %rax
mulq    64(%rcx)		
movq    %rax, %r14
movq    %rdx, %r15    		

movq	0(%rsi), %rax
mulq	56(%rcx)
addq    %rax, %r14
adcq    %rdx, %r15

movq	8(%rsi), %rax
mulq	48(%rcx)	
addq    %rax, %r14
adcq    %rdx, %r15

movq	16(%rsi), %rax
mulq	40(%rcx)	
addq    %rax, %r14
adcq    %rdx, %r15

movq	24(%rsi), %rax
mulq	32(%rcx)	
addq    %rax, %r14
adcq    %rdx, %r15

movq	32(%rsi), %rax
mulq	24(%rcx)	
addq    %rax, %r14
adcq    %rdx, %r15

movq	40(%rsi), %rax
mulq	16(%rcx)	
addq    %rax, %r14
adcq    %rdx, %r15

movq	48(%rsi), %rax
mulq	8(%rcx)	
addq    %rax, %r14
adcq    %rdx, %r15

movq	56(%rsi), %rax
mulq	0(%rcx)	
addq    %rax, %r14
adcq    %rdx, %r15

shld 	$6, %r14, %r15

movq	0(%rsi), %rax
mulq	64(%rcx)
movq    %rax, %rbp
movq    %rdx, %rbx

movq	8(%rsi), %rax
mulq	56(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	16(%rsi), %rax
mulq	48(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	24(%rsi), %rax
mulq	40(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	32(%rsi), %rax
mulq	32(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	40(%rsi), %rax
mulq	24(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	48(%rsi), %rax
mulq	16(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	56(%rsi), %rax
mulq	8(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

movq	64(%rsi), %rax
mulq	0(%rcx)	
addq    %rax, %rbp
adcq    %rdx, %rbx

shld 	$7, %rbp, %rbx

movq	64(%rsp), %rsi

movq	80(%rsp), %rcx
movq	88(%rsp), %rdx

movq	96(%rsp), %rax

movq	mask58, %rdi

andq  	%rdi, %r8
andq  	%rdi, %rsi
andq  	%rdi, %rcx
andq  	%rdi, %rax
andq  	%rdi, %r10
andq  	%rdi, %r12
andq  	%rdi, %r14
andq  	mask57, %rbp

addq  	%r9, %rsi
addq  	72(%rsp), %rcx
addq  	%rdx, %rax
movq	112(%rsp), %rdx
andq  	mask58, %rdx
movq	104(%rsp), %r9
addq  	%r9, %rdx
addq  	120(%rsp), %r10
addq  	%r11, %r12
addq  	%r13, %r14
addq  	%r15, %rbp
addq  	%rbx, %r8

movq	%r8, %r11
shrq	$58, %r11
addq	%rsi, %r11
andq	%rdi, %r8

movq	%r11, %rsi
shrq	$58, %r11
addq	%rcx, %r11
andq	%rdi, %rsi

movq	%r11, %rcx
shrq	$58, %r11
addq	%rax, %r11
andq	%rdi, %rcx

movq	%r11, %rax
shrq	$58, %r11
addq	%rdx, %r11
andq	%rdi, %rax

movq	%r11, %rdx
shrq	$58, %r11
addq	%r10, %r11
andq	%rdi, %rdx

movq	%r11, %r10
shrq	$58, %r11
addq	%r12, %r11
andq	%rdi, %r10

movq	%r11, %r12
shrq	$58, %r11
addq	%r14, %r11
andq	%rdi, %r12

movq	%r11, %r14
shrq	$58, %r11
addq	%rbp, %r11
andq	%rdi, %r14

movq	%r11, %rbp
shrq	$57, %r11
addq	%r11, %r8
andq	mask57, %rbp

movq 	56(%rsp), %rdi

movq   	%r8,   0(%rdi)
movq   	%rsi,  8(%rdi)
movq   	%rcx, 16(%rdi)
movq   	%rax, 24(%rdi)
movq   	%rdx, 32(%rdi)
movq   	%r10, 40(%rdi)
movq   	%r12, 48(%rdi)
movq   	%r14, 56(%rdi)
movq   	%rbp, 64(%rdi)

movq 	 0(%rsp), %r11
movq 	 8(%rsp), %r12
movq 	16(%rsp), %r13
movq 	24(%rsp), %r14
movq 	32(%rsp), %r15
movq 	40(%rsp), %rbx
movq 	48(%rsp), %rbp

movq	%r11, %rsp

ret



.p2align 5
.globl gfp5211reduce
gfp5211reduce:

movq	%rsp, %r11
subq	$40, %rsp

movq 	%r11,  0(%rsp)
movq 	%r12,  8(%rsp)
movq 	%r13, 16(%rsp)
movq 	%r14, 24(%rsp)
movq 	%r15, 32(%rsp)

movq 	0(%rdi), %r8
movq 	8(%rdi), %r9
movq 	16(%rdi), %r10
movq 	24(%rdi), %r11
movq 	32(%rdi), %r12
movq 	40(%rdi), %r13
movq 	48(%rdi), %r14
movq 	56(%rdi), %r15
movq 	64(%rdi), %rsi

movq 	mask58, %rax

movq	%r8, %rdx
shrq	$58, %rdx
addq	%r9, %rdx
andq	%rax, %r8

movq	%rdx, %r9
shrq	$58, %rdx
addq	%r10, %rdx
andq	%rax, %r9

movq	%rdx, %r10
shrq	$58, %rdx
addq	%r11, %rdx
andq	%rax, %r10

movq	%rdx, %r11
shrq	$58, %rdx
addq	%r12, %rdx
andq	%rax, %r11

movq	%rdx, %r12
shrq	$58, %rdx
addq	%r13, %rdx
andq	%rax, %r12

movq	%rdx, %r13
shrq	$58, %rdx
addq	%r14, %rdx
andq	%rax, %r13

movq	%rdx, %r14
shrq	$58, %rdx
addq	%r15, %rdx
andq	%rax, %r14

movq	%rdx, %r15
shrq	$58, %rdx
addq	%rsi, %rdx
andq	%rax, %r15

movq	%rdx, %rsi
shrq	$57, %rdx
addq	%r8, %rdx
andq	mask57, %rsi

movq	%rdx, %r8
shrq	$58, %rdx
addq	%rdx, %r9
andq	%rax, %r8

movq 	%r8,   0(%rdi)
movq 	%r9,   8(%rdi)
movq 	%r10, 16(%rdi)
movq 	%r11, 24(%rdi)
movq 	%r12, 32(%rdi)
movq 	%r13, 40(%rdi)
movq 	%r14, 48(%rdi)
movq 	%r15, 56(%rdi)
movq 	%rsi, 64(%rdi)

movq 	 0(%rsp), %r11
movq 	 8(%rsp), %r12
movq 	16(%rsp), %r13
movq 	24(%rsp), %r14
movq 	32(%rsp), %r15

mov 	%r11, %rsp

ret

