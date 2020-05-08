/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^383-187) from the paper       |
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
.globl gfp383187nsqr
gfp383187nsqr:

movq    %rsp, %r11
subq    $80, %rsp

movq    %r11,  0(%rsp)
movq    %r12,  8(%rsp)
movq    %r13, 16(%rsp)
movq    %r14, 24(%rsp)
movq    %r15, 32(%rsp)
movq    %rbp, 40(%rsp)
movq    %rbx, 48(%rsp)
movq    %rdi, 56(%rsp)

movq    0(%rsi),  %r8
movq    8(%rsi),  %r9  
movq    16(%rsi), %r10
movq    24(%rsi), %r11
movq    32(%rsi), %r12
movq    40(%rsi), %r13

movq    %r8,   0(%rdi)	
movq    %r9,   8(%rdi)	
movq    %r10, 16(%rdi)	
movq    %r11, 24(%rdi)
movq    %r12, 32(%rdi)
movq    %r13, 40(%rdi)

movq    %rdx, %rbx

.START:

subq    $1, %rbx

movq    0(%rdi), %rdx
xorq    %r15, %r15
    
mulx    8(%rdi), %r9, %r10

mulx    16(%rdi), %rcx, %r11
adcx    %rcx, %r10

mulx    24(%rdi), %rcx, %r12
adcx    %rcx, %r11

mulx    32(%rdi), %rcx, %r13
adcx    %rcx, %r12

mulx    40(%rdi), %rcx, %r14
adcx    %rcx, %r13
adcx    %r15, %r14
   
movq    8(%rdi), %rdx
xorq    %r8, %r8
    
mulx    16(%rdi), %rcx, %rbp
adcx    %rcx, %r11
adox    %rbp, %r12

mulx    24(%rdi), %rcx, %rbp
adcx    %rcx, %r12
adox    %rbp, %r13

mulx    32(%rdi), %rcx, %rbp
adcx    %rcx, %r13
adox    %rbp, %r14

mulx    40(%rdi), %rcx, %rbp
adcx    %rcx, %r14
adox    %rbp, %r15
adcx    %r8, %r15
   
movq    16(%rdi), %rdx
xorq    %rsi, %rsi

mulx    24(%rdi), %rcx, %rbp
adcx    %rcx, %r13
adox    %rbp, %r14

mulx    32(%rdi), %rcx, %rbp
adcx    %rcx, %r14
adox    %rbp, %r15

mulx    40(%rdi), %rcx, %rbp
adcx    %rcx, %r15
adox    %rbp, %r8
adcx    %rsi, %r8

movq    24(%rdi), %rdx
xorq    %rax, %rax

mulx    32(%rdi), %rcx, %rbp
adcx    %rcx, %r15
adox    %rbp, %r8

mulx    40(%rdi), %rcx, %rbp
adcx    %rcx, %r8
adox    %rbp, %rsi
adcx    %rax, %rsi

movq    32(%rdi), %rdx

mulx    40(%rdi), %rcx, %rax
addq    %rcx, %rsi
adcq    $0, %rax

movq    $0, %rbp
shld    $1, %rax, %rbp
shld    $1, %rsi, %rax
shld    $1, %r8, %rsi
shld    $1, %r15, %r8
shld    $1, %r14, %r15
shld    $1, %r13, %r14
shld    $1, %r12, %r13
shld    $1, %r11, %r12
shld    $1, %r10, %r11
shld    $1, %r9, %r10
addq    %r9, %r9	

movq    %rax, 64(%rsp)
movq    %rbp, 72(%rsp)

xorq    %rdx, %rdx
movq    0(%rdi), %rdx
mulx    %rdx, %rbp, %rax
adcx    %rax, %r9

movq    8(%rdi), %rdx
mulx    %rdx, %rcx, %rax
adcx    %rcx, %r10
adcx    %rax, %r11

movq    16(%rdi), %rdx
mulx    %rdx, %rcx, %rax
adcx    %rcx, %r12
adcx    %rax, %r13

movq    24(%rdi), %rdx
mulx    %rdx, %rcx, %rax
adcx    %rcx, %r14
adcx    %rax, %r15

movq    32(%rdi), %rdx
mulx    %rdx, %rcx, %rax
adcx    %rcx, %r8
adcx    %rax, %rsi

movq    40(%rdi), %rdx
mulx    %rdx, %rcx, %rax
adcx    64(%rsp), %rcx
adcx    72(%rsp), %rax

movq    %rbp, 64(%rsp)

movq    $374, %rdx

xorq    %rbp, %rbp
mulx    %r14, %r14, %rdi  

mulx    %r15, %r15, %rbp	
adcx    %rdi, %r15     

mulx    %r8, %r8, %rdi
adcx    %rbp, %r8

mulx    %rsi, %rsi, %rbp
adcx    %rdi, %rsi

mulx    %rcx, %rcx, %rdi
adcx    %rbp, %rcx

mulx    %rax, %rax, %rbp
adcx    %rdi, %rax
adcq    $0, %rbp

addq    64(%rsp), %r14
adcq    %r15, %r9
adcq    %r8, %r10
adcq    %rsi, %r11
adcq    %rcx, %r12
adcq    %rax, %r13
adcq    $0, %rbp
   
shld    $1, %r13, %rbp
andq	mask63, %r13

imul    $187, %rbp, %rbp
addq    %rbp, %r14
adcq    $0, %r9
adcq    $0, %r10
adcq    $0, %r11
adcq    $0, %r12
adcq    $0, %r13

movq    56(%rsp), %rdi

movq    %r14, 0(%rdi)
movq    %r9,  8(%rdi)
movq    %r10, 16(%rdi)
movq    %r11, 24(%rdi)
movq    %r12, 32(%rdi)
movq    %r13, 40(%rdi)

cmpq    $0, %rbx

jne     .START

movq    8(%rsp), %r12
movq    16(%rsp), %r13
movq    24(%rsp), %r14
movq    32(%rsp), %r15
movq    40(%rsp), %rbp
movq    48(%rsp), %rbx
movq    0(%rsp), %rsp 

ret
