/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^607-1) from the paper         |
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
.globl gfp6071nsqr
gfp6071nsqr:

movq 	%rsp, %r11
subq 	$312, %rsp

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
movq 	72(%rsi), %rbx

movq 	%r8,   0(%rdi)
movq 	%r9,   8(%rdi)
movq 	%r10, 16(%rdi)
movq 	%r11, 24(%rdi)
movq 	%r12, 32(%rdi)
movq 	%r13, 40(%rdi)
movq 	%r14, 48(%rdi)
movq 	%r15, 56(%rdi)
movq 	%rax, 64(%rdi)
movq 	%rbx, 72(%rdi)

movq  	%rdx, %rcx

.START:

subq  	$1, %rcx
movq	%rcx, 184(%rsp)

movq    48(%rdi), %rax
shlq    $3, %rax
movq    %rax, 192(%rsp)
movq    72(%rdi), %rdx
addq	%rdx, %rdx
movq    %rdx, 200(%rsp)
mulq    %rdx
movq    %rax, %r10
movq    %rdx, %r11

movq    56(%rdi), %rax
shlq    $3, %rax
movq    %rax, 208(%rsp)
movq    64(%rdi), %rdx
addq	%rdx, %rdx
movq    %rdx, 216(%rsp)
mulq    %rdx
addq    %rax, %r10
adcq    %rdx, %r11

movq	0(%rdi), %rax
addq    %rax, %rax
movq    %rax, 224(%rsp)
mulq	40(%rdi)
movq    %rax, %r8
movq    %rdx, %r9

movq	8(%rdi), %rax
addq    %rax, %rax
movq    %rax, 232(%rsp)
mulq	32(%rdi)	
addq    %rax, %r8
adcq    %rdx, %r9

movq	16(%rdi), %rax
addq    %rax, %rax
movq    %rax, 240(%rsp)
mulq	24(%rdi)	
addq    %rax, %r8
adcq    %rdx, %r9

addq    %r8, %r10
adcq    %r9, %r11

movq	%r10, 64(%rsp)
movq	%r11, 72(%rsp)

movq    208(%rsp), %rax
mulq    200(%rsp)		
movq    %rax, %r12
movq    %rdx, %r13    		

movq    64(%rdi), %rax
shlq    $3, %rax
movq    %rax, 248(%rsp)
mulq    64(%rdi)		
addq    %rax, %r12
adcq    %rdx, %r13    		

movq	224(%rsp), %rax
mulq	48(%rdi)
movq    %rax, %r8
movq    %rdx, %r9

movq	232(%rsp), %rax
mulq	40(%rdi)	
addq    %rax, %r8
adcq    %rdx, %r9

movq	240(%rsp), %rax
mulq	32(%rdi)	
addq    %rax, %r8
adcq    %rdx, %r9

movq	24(%rdi), %rax
mulq	24(%rdi)	
addq    %rax, %r8
adcq    %rdx, %r9

addq    %r8, %r12
adcq    %r9, %r13

movq	%r12, 80(%rsp)
movq	%r13, 88(%rsp)

movq    248(%rsp), %rax
mulq    200(%rsp)		
movq    %rax, %r14
movq    %rdx, %r15    		

movq	224(%rsp), %rax
mulq	56(%rdi)
movq    %rax, %r8
movq    %rdx, %r9

movq	232(%rsp), %rax
mulq	48(%rdi)	
addq    %rax, %r8
adcq    %rdx, %r9

movq	240(%rsp), %rax
mulq	40(%rdi)	
addq    %rax, %r8
adcq    %rdx, %r9

movq	24(%rdi), %rax
addq    %rax, %rax
movq    %rax, 256(%rsp)
mulq	32(%rdi)	
addq    %rax, %r8
adcq    %rdx, %r9

addq    %r8, %r14
adcq    %r9, %r15 

movq	%r14, 96(%rsp)
movq	%r15, 104(%rsp)

movq    72(%rdi), %rax
shlq    $3, %rax
movq    %rax, 264(%rsp)
mulq    72(%rdi)		
movq    %rax, %r14
movq    %rdx, %r15    

movq	224(%rsp), %rax
mulq	64(%rdi)
movq    %rax, %r8
movq    %rdx, %r9

movq	232(%rsp), %rax
mulq	56(%rdi)	
addq    %rax, %r8
adcq    %rdx, %r9

movq	240(%rsp), %rax
mulq	48(%rdi)	
addq    %rax, %r8
adcq    %rdx, %r9

movq	256(%rsp), %rax
mulq	40(%rdi)	
addq    %rax, %r8
adcq    %rdx, %r9

movq	32(%rdi), %rax
mulq	32(%rdi)	
addq    %rax, %r8
adcq    %rdx, %r9

addq    %r8, %r14
adcq    %r9, %r15

movq	%r14, 112(%rsp)
movq	%r15, 120(%rsp)

movq    232(%rsp), %rax
mulq    264(%rsp)		
movq    %rax, %r8
movq    %rdx, %r9    		

movq    240(%rsp), %rax
mulq    248(%rsp)
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    256(%rsp), %rax
mulq    208(%rsp)		
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    32(%rdi), %rax
addq    %rax, %rax  
movq    %rax, 272(%rsp)
mulq    192(%rsp)
addq    %rax, %r8
adcq    %rdx, %r9    		

movq    40(%rdi), %rax
shlq    $3, %rax
movq    %rax, 280(%rsp)	
mulq    40(%rdi)
addq    %rax, %r8
adcq    %rdx, %r9

movq	0(%rdi), %rax
mulq	%rax
addq    %rax, %r8
adcq    %rdx, %r9

movq    240(%rsp), %rax
mulq    264(%rsp)
movq    %rax, %r10
movq    %rdx, %r11    		

movq    256(%rsp), %rax
mulq    248(%rsp)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    272(%rsp), %rax
mulq    208(%rsp)		
addq    %rax, %r10
adcq    %rdx, %r11    		

movq    40(%rdi), %rax
addq    %rax, %rax
movq    %rax, 288(%rsp)
movq    48(%rdi), %rdx
shlq    $3, %rdx
movq    %rdx, 296(%rsp)
mulq    %rdx

addq    %rax, %r10
adcq    %rdx, %r11    		

movq    224(%rsp), %rax
mulq    8(%rdi)	

addq    %rax, %r10
adcq    %rdx, %r11

movq    256(%rsp), %rax
mulq    264(%rsp)		
movq    %rax, %r12
movq    %rdx, %r13    		

movq    272(%rsp), %rax
mulq    248(%rsp)		
addq    %rax, %r12
adcq    %rdx, %r13    		

movq    288(%rsp), %rax
mulq    208(%rsp)		
addq    %rax, %r12
adcq    %rdx, %r13

movq    296(%rsp), %rax
mulq    48(%rdi)		
addq    %rax, %r12
adcq    %rdx, %r13

movq	224(%rsp), %rax
mulq	16(%rdi)

addq    %rax, %r12
adcq    %rdx, %r13

movq	8(%rdi), %rax
mulq	%rax
addq    %rax, %r12
adcq    %rdx, %r13

movq    272(%rsp), %rax
mulq    264(%rsp)		
movq    %rax, %r14
movq    %rdx, %r15    		

movq    288(%rsp), %rax
mulq    248(%rsp)		
addq    %rax, %r14
adcq    %rdx, %r15    		

movq    48(%rdi), %rax
addq    %rax, %rax
movq    %rax, 304(%rsp)	
mulq    208(%rsp)		
addq    %rax, %r14
adcq    %rdx, %r15    		

movq	224(%rsp), %rax
mulq	24(%rdi)
movq    %rax, %rbp
movq    %rdx, %rsi

movq	232(%rsp), %rax
mulq	16(%rdi)	
addq    %rax, %rbp
adcq    %rdx, %rsi

addq    %rbp, %r14
adcq    %rsi, %r15

movq    288(%rsp), %rax
mulq    264(%rsp)		
movq    %rax, %rbx
movq    %rdx, %rcx    		

movq    304(%rsp), %rax
mulq    248(%rsp)		
addq    %rax, %rbx
adcq    %rdx, %rcx    		

movq    208(%rsp), %rax
mulq    56(%rdi)		
addq    %rax, %rbx
adcq    %rdx, %rcx    		

movq	224(%rsp), %rax
mulq	32(%rdi)
movq    %rax, %rbp
movq    %rdx, %rsi

movq	232(%rsp), %rax
mulq	24(%rdi)	
addq    %rax, %rbp
adcq    %rdx, %rsi

movq	16(%rdi), %rax
mulq	%rax
addq    %rax, %rbp
adcq    %rdx, %rsi

addq    %rbp, %rbx
adcq    %rsi, %rcx

movq	224(%rsp), %rax
mulq	72(%rdi)
movq    %rax, %rbp
movq    %rdx, %rsi

movq	232(%rsp), %rax
mulq	64(%rdi)	
addq    %rax, %rbp
adcq    %rdx, %rsi

movq	240(%rsp), %rax
mulq	56(%rdi)	
addq    %rax, %rbp
adcq    %rdx, %rsi

movq	256(%rsp), %rax
mulq	48(%rdi)	
addq    %rax, %rbp
adcq    %rdx, %rsi

movq	272(%rsp), %rax
mulq	40(%rdi)	
addq    %rax, %rbp
adcq    %rdx, %rsi

movq	64(%rsp), %rdx
movq	72(%rsp), %rdi

movq	%r8, %rax
andq  	mask61, %rax
shrd	$61, %r9, %r8
shrq	$61, %r9

movq	%rax, 128(%rsp)

movq	%r10, %rax
andq  	mask61, %rax
addq	%rax, %r8
adcq	$0, %r9
shrd	$61, %r11, %r10
shrq	$61, %r11

movq	%r12, %rax
andq  	mask61, %rax
addq	%rax, %r10
adcq	$0, %r11
shrd	$61, %r13, %r12
shrq	$61, %r13

movq	%r14, %rax
andq  	mask61, %rax
addq	%rax, %r12
adcq	$0, %r13
shrd	$61, %r15, %r14
shrq	$61, %r15

movq	%rbx, %rax
andq  	mask61, %rax
addq	%rax, %r14
adcq	$0, %r15
shrd	$61, %rcx, %rbx
shrq	$61, %rcx

movq	%rdx, %rax
andq  	mask61, %rax
addq	%rax, %rbx
adcq	$0, %rcx
shrd	$61, %rdi, %rdx
shrq	$61, %rdi

movq	%r14, 136(%rsp)
movq	%r15, 144(%rsp)

movq	80(%rsp), %r14
movq	88(%rsp), %r15

movq	%r14, %rax
andq  	mask61, %rax
addq	%rax, %rdx
adcq	$0, %rdi
shrd	$61, %r15, %r14
shrq	$61, %r15

movq	%rbx, 152(%rsp)
movq	%rcx, 160(%rsp)

movq	96(%rsp), %rbx
movq	104(%rsp), %rcx

movq	%rbx, %rax
andq  	mask61, %rax
addq	%rax, %r14
adcq	$0, %r15
shrd	$61, %rcx, %rbx
shrq	$61, %rcx

movq	%rdx, 168(%rsp)
movq	%rdi, 176(%rsp)

movq	112(%rsp), %rdx
movq	120(%rsp), %rdi

movq	%rdx, %rax
andq  	mask61, %rax
addq	%rax, %rbx
adcq	$0, %rcx
shrd	$61, %rdi, %rdx
shrq	$61, %rdi

movq	%rbp, %rax
andq  	mask58, %rax
addq	%rax, %rdx
adcq	$0, %rdi
shrd	$58, %rsi, %rbp
shrq	$58, %rsi

addq	128(%rsp), %rbp
adcq	$0, %rsi

shld 	$3, %rbp, %rsi 
andq  	mask61, %rbp

shld 	$3, %r8, %r9
andq  	mask61, %r8
addq  	%rsi, %r8

shld 	$3, %r10, %r11
andq  	mask61, %r10
addq  	%r9, %r10

shld 	$3, %r12, %r13
andq  	mask61, %r12
addq  	%r11, %r12

movq	136(%rsp), %r9
movq	144(%rsp), %rsi

shld 	$3, %r9, %rsi
andq  	mask61, %r9
addq  	%r13, %r9

movq	152(%rsp), %r11
movq	160(%rsp), %r13

shld 	$3, %r11, %r13
andq  	mask61, %r11
addq  	%rsi, %r11

movq	168(%rsp), %rax
movq	176(%rsp), %rsi

shld 	$3, %rax, %rsi
andq  	mask61, %rax
addq  	%r13, %rax

shld 	$3, %r14, %r15
andq  	mask61, %r14
addq  	%rsi, %r14

shld 	$3, %rbx, %rcx
andq  	mask61, %rbx
addq  	%r15, %rbx

shld 	$6, %rdx, %rdi
andq  	mask58, %rdx
addq  	%rcx, %rdx

addq	%rdi, %rbp

movq	%rbp, %r13
andq	mask61, %rbp
shrq	$61, %r13
addq	%r13, %r8

movq	%r8, %r13
andq	mask61, %r8
shrq	$61, %r13
addq	%r13, %r10

movq	%r10, %r13
andq	mask61, %r10
shrq	$61, %r13
addq	%r13, %r12

movq	%r12, %r13
andq	mask61, %r12
shrq	$61, %r13
addq	%r13, %r9

movq	%r9, %r13
andq	mask61, %r9
shrq	$61, %r13
addq	%r13, %r11

movq	%r11, %r13
andq	mask61, %r11
shrq	$61, %r13
addq	%r13, %rax

movq	%rax, %r13
andq	mask61, %rax
shrq	$61, %r13
addq	%r13, %r14

movq	%r14, %r13
andq	mask61, %r14
shrq	$61, %r13
addq	%r13, %rbx

movq	%rbx, %r13
andq	mask61, %rbx
shrq	$61, %r13
addq	%r13, %rdx

movq	%rdx, %r13
andq	mask58, %rdx
shrq	$58, %r13
addq	%r13, %rbp

movq 	56(%rsp), %rdi

movq   	%rbp,  0(%rdi)
movq   	%r8,   8(%rdi)
movq   	%r10, 16(%rdi)
movq   	%r12, 24(%rdi)
movq   	%r9,  32(%rdi)
movq   	%r11, 40(%rdi)
movq   	%rax, 48(%rdi)
movq   	%r14, 56(%rdi)
movq   	%rbx, 64(%rdi)
movq   	%rdx, 72(%rdi)

movq	184(%rsp), %rcx
cmpq    $0, %rcx

jne     .START

movq 	 0(%rsp), %r11
movq 	 8(%rsp), %r12
movq 	16(%rsp), %r13
movq 	24(%rsp), %r14
movq 	32(%rsp), %r15
movq 	40(%rsp), %rbx
movq 	48(%rsp), %rbp

mov 	%r11, %rsp

ret
