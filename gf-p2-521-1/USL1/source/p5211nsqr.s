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
.globl gfp5211nsqr
gfp5211nsqr:

movq	%rsp, %r11
subq	$224, %rsp

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
movq 	32(%rsi), %r12
movq 	40(%rsi), %r13
movq 	48(%rsi), %r14
movq 	56(%rsi), %r15
movq 	64(%rsi), %rax

movq 	%r8,   0(%rdi)
movq 	%r9,   8(%rdi)
movq 	%r10, 16(%rdi)
movq 	%r11, 24(%rdi)
movq 	%r12, 32(%rdi)
movq 	%r13, 40(%rdi)
movq 	%r14, 48(%rdi)
movq 	%r15, 56(%rdi)
movq 	%rax, 64(%rdi)

movq 	%rdx, %rcx

.START:

subq  	$1, %rcx
movq	%rcx, 112(%rsp)

movq	0(%rdi), %rax
shlq    $1, %rax
movq    %rax, 120(%rsp)
mulq	40(%rdi)
movq    %rax, %r10
movq    %rdx, %r11

movq	8(%rdi), %rax
shlq    $1, %rax
movq    %rax, 128(%rsp)
mulq	32(%rdi)	
addq    %rax, %r10
adcq    %rdx, %r11

movq	16(%rdi), %rax
shlq    $1, %rax
movq    %rax, 136(%rsp)
mulq	24(%rdi)	
addq    %rax, %r10
adcq    %rdx, %r11

movq    56(%rdi), %rax
shlq    $1, %rax
movq    %rax, 144(%rsp)
mulq    56(%rdi)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    48(%rdi), %rax
shlq    $1, %rax
movq    %rax, 192(%rsp)
addq    %rax, %rax   
movq    %rax, 152(%rsp)
mulq    64(%rdi)		
addq    %rax, %r10
adcq    %rdx, %r11

shld 	$6, %r10, %r11

movq	%r10, 64(%rsp)
movq	%r11, 72(%rsp)

movq    144(%rsp), %rax
shlq    $1, %rax
mulq    64(%rdi)		
movq    %rax, %r12
movq    %rdx, %r13    		

movq	120(%rsp), %rax
mulq	48(%rdi)
addq    %rax, %r12
adcq    %rdx, %r13

movq	128(%rsp), %rax
mulq	40(%rdi)	
addq    %rax, %r12
adcq    %rdx, %r13

movq	136(%rsp), %rax
mulq	32(%rdi)	
addq    %rax, %r12
adcq    %rdx, %r13

movq	24(%rdi), %rax
mulq	24(%rdi)	
addq    %rax, %r12
adcq    %rdx, %r13

shld 	$6, %r12, %r13

movq	%r12, 80(%rsp)
movq	%r13, 88(%rsp)

movq	120(%rsp), %rax
mulq	64(%rdi)
movq    %rax, %rbp
movq    %rdx, %rsi

movq	128(%rsp), %rax
mulq	56(%rdi)	
addq    %rax, %rbp
adcq    %rdx, %rsi

movq	136(%rsp), %rax
mulq	48(%rdi)	
addq    %rax, %rbp
adcq    %rdx, %rsi

movq	24(%rdi), %rax
shlq    $1, %rax
movq    %rax, 160(%rsp)
mulq	40(%rdi)	
addq    %rax, %rbp
adcq    %rdx, %rsi

movq	32(%rdi), %rax
mulq	%rax
addq    %rax, %rbp
adcq    %rdx, %rsi

shld 	$7, %rbp, %rsi

movq	120(%rsp), %rax
mulq	56(%rdi)
movq    %rax, %r14
movq    %rdx, %r15

movq	128(%rsp), %rax
mulq	48(%rdi)	
addq    %rax, %r14
adcq    %rdx, %r15

movq	136(%rsp), %rax
mulq	40(%rdi)	
addq    %rax, %r14
adcq    %rdx, %r15

movq	160(%rsp), %rax
mulq	32(%rdi)	
addq    %rax, %r14
adcq    %rdx, %r15

movq    64(%rdi), %rax
shlq    $1, %rax
mulq    64(%rdi)		
addq    %rax, %r14
adcq    %rdx, %r15

shld 	$6, %r14, %r15    

movq	%r14, 96(%rsp)
movq	%r15, 104(%rsp)

movq    136(%rsp), %rax
shlq    $1, %rax
movq    %rax, 216(%rsp)
mulq    64(%rdi)		
movq    %rax, %r10
movq    %rdx, %r11    		

movq    160(%rsp), %rax
shlq    $1, %rax
movq    %rax, 208(%rsp)
mulq    56(%rdi)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    32(%rdi), %rax
shlq    $2, %rax
movq    %rax, 176(%rsp)
mulq    48(%rdi)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    120(%rsp), %rax
mulq    8(%rdi)		
addq    %rax, %r10
adcq    %rdx, %r11

movq    40(%rdi), %rax
shlq    $1, %rax
movq    %rax, 184(%rsp)
mulq    40(%rdi)		
addq    %rax, %r10
adcq    %rdx, %r11

shld 	$6, %r10, %r11        

movq    184(%rsp), %rax
shlq    $1, %rax
movq    %rax, 200(%rsp)
mulq    64(%rdi)		
movq    %rax, %rbx
movq    %rdx, %rcx    		

movq    152(%rsp), %rax
mulq    56(%rdi)		
addq    %rax, %rbx
adcq    %rdx, %rcx    		

movq	120(%rsp), %rax
mulq	32(%rdi)
addq    %rax, %rbx
adcq    %rdx, %rcx

movq	128(%rsp), %rax
mulq	24(%rdi)	
addq    %rax, %rbx
adcq    %rdx, %rcx

movq	16(%rdi), %rax
mulq	16(%rdi)	
addq    %rax, %rbx
adcq    %rdx, %rcx

shld 	$6, %rbx, %rcx

movq    176(%rsp), %rax
mulq    64(%rdi)		
movq    %rax, %r14
movq    %rdx, %r15    		

movq    200(%rsp), %rax
mulq    56(%rdi)		
addq    %rax, %r14
adcq    %rdx, %r15    		

movq	120(%rsp), %rax
mulq	24(%rdi)
addq    %rax, %r14
adcq    %rdx, %r15

movq	128(%rsp), %rax
mulq	16(%rdi)	
addq    %rax, %r14
adcq    %rdx, %r15

movq    192(%rsp), %rax
mulq    48(%rdi)		
addq    %rax, %r14
adcq    %rdx, %r15

shld 	$6, %r14, %r15    

movq    208(%rsp), %rax
mulq    64(%rdi)		
movq    %rax, %r12
movq    %rdx, %r13    		

movq    176(%rsp), %rax
mulq    56(%rdi)		
addq    %rax, %r12
adcq    %rdx, %r13    		

movq    200(%rsp), %rax
mulq    48(%rdi)		
addq    %rax, %r12
adcq    %rdx, %r13    		

movq	120(%rsp), %rax
mulq	16(%rdi)
addq    %rax, %r12
adcq    %rdx, %r13

movq	8(%rdi), %rax
mulq	8(%rdi)	
addq    %rax, %r12
adcq    %rdx, %r13

shld 	$6, %r12, %r13

movq    128(%rsp), %rax
shlq    $1, %rax
mulq    64(%rdi)		
movq    %rax, %r8
movq    %rdx, %r9    		

movq    216(%rsp), %rax
mulq    56(%rdi)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    208(%rsp), %rax
mulq    48(%rdi)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    176(%rsp), %rax
mulq    40(%rdi)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq	0(%rdi), %rax
mulq	0(%rdi)
addq    %rax, %r8
adcq    %rdx, %r9

shld 	$6, %r8, %r9

movq	64(%rsp), %rdx
movq	80(%rsp), %rax

movq	mask58, %rdi

andq  	%rdi, %r8
andq  	%rdi, %r10
andq  	%rdi, %r12
andq  	%rdi, %r14
andq  	%rdi, %rbx
andq  	%rdi, %rdx
andq  	%rdi, %rax
andq  	mask57, %rbp

addq  	%r9, %r10
addq  	%r11, %r12
addq  	%r13, %r14
addq  	%r15, %rbx
addq  	%rcx, %rdx
addq  	72(%rsp), %rax

movq	88(%rsp), %r9
movq	96(%rsp), %r13
andq  	%rdi, %r13
addq  	%r9, %r13

movq	104(%rsp), %r15
addq  	%r15, %rbp

addq  	%rsi, %r8

movq	%r8, %r11
shrq	$58, %r11
addq	%r10, %r11
andq	%rdi, %r8

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
addq	%rbx, %r11
andq	%rdi, %r14

movq	%r11, %rbx
shrq	$58, %r11
addq	%rdx, %r11
andq	%rdi, %rbx

movq	%r11, %rdx
shrq	$58, %r11
addq	%rax, %r11
andq	%rdi, %rdx

movq	%r11, %rax
shrq	$58, %r11
addq	%r13, %r11
andq	%rdi, %rax

movq	%r11, %r13
shrq	$58, %r11
addq	%rbp, %r11
andq	%rdi, %r13

movq	%r11, %rbp
andq	mask57, %rbp
shrq	$57, %r11
addq	%r11, %r8

movq 	56(%rsp), %rdi

movq   	%r8,   0(%rdi)
movq   	%r10,  8(%rdi)
movq   	%r12, 16(%rdi)
movq   	%r14, 24(%rdi)
movq   	%rbx, 32(%rdi)
movq   	%rdx, 40(%rdi)
movq   	%rax, 48(%rdi)
movq   	%r13, 56(%rdi)
movq   	%rbp, 64(%rdi)

movq	112(%rsp), %rcx
cmpq    $0, %rcx

jne     .START

movq 	 0(%rsp), %r11
movq 	 8(%rsp), %r12
movq 	16(%rsp), %r13
movq 	24(%rsp), %r14
movq 	32(%rsp), %r15
movq 	40(%rsp), %rbx
movq 	48(%rsp), %rbp

movq	%r11, %rsp

ret
