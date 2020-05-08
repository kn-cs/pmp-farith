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

movq    %rsp, %r11
subq    $128, %rsp

movq    %r11,  0(%rsp)
movq    %r12,  8(%rsp)
movq    %r13, 16(%rsp)
movq    %r14, 24(%rsp)
movq    %r15, 32(%rsp)
movq    %rbp, 40(%rsp)
movq    %rbx, 48(%rsp)
movq    %rdi, 56(%rsp)
    
movq    %rdx, %rbx
    
xorq    %rdx, %rdx
movq    0(%rbx), %rdx    

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

mulx    56(%rsi), %rcx, %rax
adcx    %rcx, %r15

mulx    64(%rsi), %rcx, %rdi
adcx    %rcx, %rax
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
adox    %rbp, %rax

mulx    56(%rsi), %rcx, %rbp
adcx    %rcx, %rax
adox    %rbp, %rdi
    
mulx    64(%rsi), %rcx, %rbp
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
adox    %rbp, %rax

mulx    48(%rsi), %rcx, %rbp
adcx    %rcx, %rax
adox    %rbp, %rdi

mulx    56(%rsi), %rcx, %rbp
adcx    %rcx, %rdi
adox    %rbp, %r8
    
mulx    64(%rsi), %rcx, %rbp
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
adox    %rbp, %rax

mulx    40(%rsi), %rcx, %rbp
adcx    %rcx, %rax
adox    %rbp, %rdi

mulx    48(%rsi), %rcx, %rbp
adcx    %rcx, %rdi
adox    %rbp, %r8

mulx    56(%rsi), %rcx, %rbp
adcx    %rcx, %r8
adox    %rbp, %r9
    
mulx    64(%rsi), %rcx, %rbp
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
adox    %rbp, %rax

mulx    32(%rsi), %rcx, %rbp
adcx    %rcx, %rax
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
    
mulx    64(%rsi), %rcx, %rbp
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
adox    %rbp, %rax

mulx    24(%rsi), %rcx, %rbp
adcx    %rcx, %rax
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
    
mulx    64(%rsi), %rcx, %rbp
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
adox    %rbp, %rax
    
mulx    16(%rsi), %rcx, %rbp
adcx    %rcx, %rax
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
    
mulx    64(%rsi), %rcx, %rbp
adcx    %rcx, %r12
adox    %rbp, %r13			
adcq    $0, %r13			

movq    %r14, 112(%rsp)

xorq    %r14, %r14
movq    56(%rbx), %rdx
    
mulx    0(%rsi), %rcx, %rbp
adcx    %rcx, %r15
adox    %rbp, %rax
    
mulx    8(%rsi), %rcx, %rbp
adcx    %rcx, %rax
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
  
mulx    64(%rsi), %rcx, %rbp
adcx    %rcx, %r13
adox    %rbp, %r14			
adcq    $0, %r14 	    
   
movq    %r15, 120(%rsp)

xorq    %r15, %r15
movq    64(%rbx), %rdx
    
mulx    0(%rsi), %rcx, %rbp
adcx    %rcx, %rax
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
  
mulx    64(%rsi), %rcx, %rbp
adcx    %rcx, %r14   	

shld    $55, %r14, %r15
shld    $55, %r13, %r14
shld    $55, %r12, %r13
shld    $55, %r11, %r12
shld    $55, %r10, %r11
shld    $55, %r9,  %r10
shld    $55, %r8,  %r9
shld    $55, %rdi, %r8
shld    $55, %rax, %rdi

andq	mask9, %rax

adcx    64(%rsp), %rdi
adcx    72(%rsp), %r8
adcx    80(%rsp), %r9
adcx    88(%rsp), %r10
adcx    96(%rsp), %r11
adcx    104(%rsp), %r12
adcx    112(%rsp), %r13
adcx    120(%rsp), %r14
adcx    %rax, %r15

movq    %r15, %rcx
andq	mask9, %r15
shrq    $9, %rcx

addq    %rdi, %rcx
adcq    $0, %r8
adcq    $0, %r9
adcq    $0, %r10
adcq    $0, %r11
adcq    $0, %r12
adcq    $0, %r13
adcq    $0, %r14
adcq    $0, %r15

movq    56(%rsp), %rdi

movq    %rcx,  0(%rdi)
movq    %r8,  8(%rdi)
movq    %r9,  16(%rdi)
movq    %r10, 24(%rdi)
movq    %r11, 32(%rdi)
movq    %r12, 40(%rdi)
movq    %r13, 48(%rdi)
movq    %r14, 56(%rdi)
movq    %r15, 64(%rdi)

movq    0(%rsp), %r11
movq    8(%rsp), %r12
movq    16(%rsp), %r13
movq    24(%rsp), %r14
movq    32(%rsp), %r15
movq    40(%rsp), %rbp
movq    48(%rsp), %rbx

movq    %r11, %rsp
 
ret
