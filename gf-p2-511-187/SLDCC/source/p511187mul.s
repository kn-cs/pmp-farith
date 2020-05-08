/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^511-187) from the paper       |
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
.globl gfp511187mul
gfp511187mul:

movq    %rsp, %r11
subq    $200, %rsp

movq    %r11,  0(%rsp)
movq    %r12,  8(%rsp)
movq    %r13, 16(%rsp)
movq    %r14, 24(%rsp)
movq    %r15, 32(%rsp)
movq    %rbp, 40(%rsp)
movq    %rbx, 48(%rsp)
movq    %rdi, 56(%rsp)
    
movq    %rdx, %rbx
    
movq    0(%rbx), %rdx    
xorq    %r8, %r8

mulx    0(%rsi), %r8, %r9
mulx    8(%rsi), %rcx, %r10		
adcx    %rcx, %r9

mulx    16(%rsi), %rcx, %r11	
adcx    %rcx, %r10

mulx    24(%rsi), %rcx, %r12	
adcx    %rcx, %r11

mulx    32(%rsi), %rcx, %r13	
adcx    %rcx, %r12

mulx    40(%rsi), %rcx, %r14	
adcx    %rcx, %r13 

mulx    48(%rsi), %rcx, %r15	
adcx    %rcx, %r14 

mulx    56(%rsi), %rcx, %rdi	
adcx    %rcx, %r15
adcq    $0, %rdi    		

movq    %r8, 64(%rsp)

xorq    %r8, %r8
movq    8(%rbx), %rdx
   
mulx    0(%rsi), %rcx, %rbp
adcx    %rcx, %r9
adox    %rbp, %r10
    
mulx    8(%rsi), %rcx, %rbp
adcx    %rcx, %r10
adox    %rbp, %r11
    
mulx    16(%rsi), %rcx, %rbp
adcx    %rcx, %r11
adox    %rbp, %r12

mulx    24(%rsi), %rcx, %rbp
adcx    %rcx, %r12
adox    %rbp, %r13

mulx    32(%rsi), %rcx, %rbp
adcx    %rcx, %r13
adox    %rbp, %r14

mulx    40(%rsi), %rcx, %rbp
adcx    %rcx, %r14
adox    %rbp, %r15

mulx    48(%rsi), %rcx, %rbp
adcx    %rcx, %r15
adox    %rbp, %rdi
    
mulx    56(%rsi), %rcx, %rbp
adcx    %rcx, %rdi
adox    %rbp, %r8			
adcq    $0, %r8			

movq    %r9, 72(%rsp)

xorq    %r9, %r9
movq    16(%rbx), %rdx
    
mulx    0(%rsi), %rcx, %rbp
adcx    %rcx, %r10
adox    %rbp, %r11
    
mulx    8(%rsi), %rcx, %rbp
adcx    %rcx, %r11
adox    %rbp, %r12
    
mulx    16(%rsi), %rcx, %rbp
adcx    %rcx, %r12
adox    %rbp, %r13

mulx    24(%rsi), %rcx, %rbp
adcx    %rcx, %r13
adox    %rbp, %r14

mulx    32(%rsi), %rcx, %rbp
adcx    %rcx, %r14
adox    %rbp, %r15

mulx    40(%rsi), %rcx, %rbp
adcx    %rcx, %r15
adox    %rbp, %rdi

mulx    48(%rsi), %rcx, %rbp
adcx    %rcx, %rdi
adox    %rbp, %r8
    
mulx    56(%rsi), %rcx, %rbp
adcx    %rcx, %r8
adox    %rbp, %r9
adcq    $0, %r9			

movq    %r10, 80(%rsp)

xorq    %r10, %r10
movq    24(%rbx), %rdx
    
mulx    0(%rsi), %rcx, %rbp
adcx    %rcx, %r11
adox    %rbp, %r12
    
mulx    8(%rsi), %rcx, %rbp
adcx    %rcx, %r12
adox    %rbp, %r13
    
mulx    16(%rsi), %rcx, %rbp
adcx    %rcx, %r13
adox    %rbp, %r14

mulx    24(%rsi), %rcx, %rbp
adcx    %rcx, %r14
adox    %rbp, %r15

mulx    32(%rsi), %rcx, %rbp
adcx    %rcx, %r15
adox    %rbp, %rdi

mulx    40(%rsi), %rcx, %rbp
adcx    %rcx, %rdi
adox    %rbp, %r8

mulx    48(%rsi), %rcx, %rbp
adcx    %rcx, %r8
adox    %rbp, %r9
    
mulx    56(%rsi), %rcx, %rbp
adcx    %rcx, %r9
adox    %rbp, %r10			
adcq    $0, %r10			

movq    %r11, 88(%rsp)

xorq    %r11, %r11
movq    32(%rbx), %rdx
    
mulx    0(%rsi), %rcx, %rbp
adcx    %rcx, %r12
adox    %rbp, %r13
    
mulx    8(%rsi), %rcx, %rbp
adcx    %rcx, %r13
adox    %rbp, %r14
    
mulx    16(%rsi), %rcx, %rbp
adcx    %rcx, %r14
adox    %rbp, %r15

mulx    24(%rsi), %rcx, %rbp
adcx    %rcx, %r15
adox    %rbp, %rdi

mulx    32(%rsi), %rcx, %rbp
adcx    %rcx, %rdi
adox    %rbp, %r8

mulx    40(%rsi), %rcx, %rbp
adcx    %rcx, %r8
adox    %rbp, %r9

mulx    48(%rsi), %rcx, %rbp
adcx    %rcx, %r9
adox    %rbp, %r10
    
mulx    56(%rsi), %rcx, %rbp
adcx    %rcx, %r10
adox    %rbp, %r11			
adcq    $0, %r11			

movq    %r12, 96(%rsp)

xorq    %r12, %r12
movq    40(%rbx), %rdx
    
mulx    0(%rsi), %rcx, %rbp
adcx    %rcx, %r13
adox    %rbp, %r14
    
mulx    8(%rsi), %rcx, %rbp
adcx    %rcx, %r14
adox    %rbp, %r15
    
mulx    16(%rsi), %rcx, %rbp
adcx    %rcx, %r15
adox    %rbp, %rdi

mulx    24(%rsi), %rcx, %rbp
adcx    %rcx, %rdi
adox    %rbp, %r8

mulx    32(%rsi), %rcx, %rbp
adcx    %rcx, %r8
adox    %rbp, %r9

mulx    40(%rsi), %rcx, %rbp
adcx    %rcx, %r9
adox    %rbp, %r10

mulx    48(%rsi), %rcx, %rbp
adcx    %rcx, %r10
adox    %rbp, %r11
    
mulx    56(%rsi), %rcx, %rbp
adcx    %rcx, %r11
adox    %rbp, %r12			
adcq    $0, %r12			

movq    %r13, 104(%rsp)

xorq    %r13, %r13
movq    48(%rbx), %rdx
    
mulx    0(%rsi), %rcx, %rbp
adcx    %rcx, %r14
adox    %rbp, %r15
    
mulx    8(%rsi), %rcx, %rbp
adcx    %rcx, %r15
adox    %rbp, %rdi
    
mulx    16(%rsi), %rcx, %rbp
adcx    %rcx, %rdi
adox    %rbp, %r8

mulx    24(%rsi), %rcx, %rbp
adcx    %rcx, %r8
adox    %rbp, %r9

mulx    32(%rsi), %rcx, %rbp
adcx    %rcx, %r9
adox    %rbp, %r10

mulx    40(%rsi), %rcx, %rbp
adcx    %rcx, %r10
adox    %rbp, %r11

mulx    48(%rsi), %rcx, %rbp
adcx    %rcx, %r11
adox    %rbp, %r12
    
mulx    56(%rsi), %rcx, %rbp
adcx    %rcx, %r12
adox    %rbp, %r13			
adcq    $0, %r13			

movq    %r14, 112(%rsp)

xorq    %r14, %r14
movq    56(%rbx), %rdx
    
mulx    0(%rsi), %rcx, %rbp
adcx    %rcx, %r15
adox    %rbp, %rdi
    
mulx    8(%rsi), %rcx, %rbp
adcx    %rcx, %rdi
adox    %rbp, %r8
    
mulx    16(%rsi), %rcx, %rbp
adcx    %rcx, %r8
adox    %rbp, %r9

mulx    24(%rsi), %rcx, %rbp
adcx    %rcx, %r9
adox    %rbp, %r10

mulx    32(%rsi), %rcx, %rbp
adcx    %rcx, %r10
adox    %rbp, %r11

mulx    40(%rsi), %rcx, %rbp
adcx    %rcx, %r11
adox    %rbp, %r12

mulx    48(%rsi), %rcx, %rbp
adcx    %rcx, %r12
adox    %rbp, %r13
  
mulx    56(%rsi), %rcx, %rbp
adcx    %rcx, %r13
adox    %rbp, %r14			
adcq    $0, %r14

movq    $374, %rdx    		

xorq    %rax, %rax
mulx    %rdi, %rax, %rdi

mulx    %r8,  %rcx, %r8
adcx    %rcx, %rdi     

mulx    %r9, %rcx, %r9
adcx    %rcx, %r8

mulx    %r10, %rcx, %r10
adcx    %rcx, %r9

mulx    %r11, %rcx, %r11
adcx    %rcx, %r10

mulx    %r12, %rcx, %r12
adcx    %rcx, %r11

mulx    %r13, %rcx, %r13
adcx    %rcx, %r12

mulx    %r14, %rcx, %r14
adcx    %rcx, %r13
adcq    $0, %r14

addq    64(%rsp), %rax
adcq    72(%rsp), %rdi
adcq    80(%rsp), %r8
adcq    88(%rsp), %r9
adcq    96(%rsp), %r10
adcq    104(%rsp), %r11
adcq    112(%rsp), %r12
adcq    %r15, %r13
adcq    $0, %r14   			
   
shld    $1, %r13, %r14
andq	mask63, %r13

movq    $0, %rsi
imul    $187, %r14, %r14
addq    %r14, %rax
adcq    %rdi, %rsi
adcq    $0, %r8
adcq    $0, %r9
adcq    $0, %r10
adcq    $0, %r11
adcq    $0, %r12
adcq    $0, %r13

movq    56(%rsp), %rdi

movq    %rax,  0(%rdi)
movq    %rsi,  8(%rdi)
movq    %r8,  16(%rdi)
movq    %r9,  24(%rdi)
movq    %r10, 32(%rdi)
movq    %r11, 40(%rdi)
movq    %r12, 48(%rdi)
movq    %r13, 56(%rdi)

movq    8(%rsp),  %r12
movq    16(%rsp), %r13
movq    24(%rsp), %r14
movq    32(%rsp), %r15
movq    40(%rsp), %rbp
movq    48(%rsp), %rbx
movq    0(%rsp),  %rsp
 
ret


.p2align 5
.globl gfp511187reduce
gfp511187reduce:

movq    0(%rdi),   %r8
movq    8(%rdi),   %r9
movq    56(%rdi), %r10

movq    %r10, %r11
shrq    $63, %r11
andq	mask63, %r10

imul    $187, %r11, %r11
addq    %r11, %r8
adcq    $0, %r9

movq    %r8,   0(%rdi)
movq    %r9,   8(%rdi)
movq    %r10, 56(%rdi)

ret
