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
.globl gfp382105mul
gfp382105mul:

movq    %rsp, %r11
subq    $200, %rsp

movq    %r11,  0(%rsp)
movq    %r12,  8(%rsp)
movq    %r13, 16(%rsp)
movq    %r14, 24(%rsp)
movq    %r15, 32(%rsp)
movq    %rbp, 40(%rsp)
movq    %rbx, 48(%rsp)
    
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
adcq    $0, %r14

xorq    %r15, %r15
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
adcq    $0, %r15

movq    %r8, 64(%rsp)

xorq    %r8, %r8
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
adox    %rbp, %r8
adcq    $0, %r8

movq    %r9, 72(%rsp)

xorq    %r9, %r9
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
adox    %rbp, %r8

mulx    40(%rsi), %rcx, %rbp
adcx    %rcx, %r8
adox    %rbp, %r9
adcq    $0, %r9

movq    %r10, 80(%rsp)

xorq    %r10, %r10
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
adox    %rbp, %r8

mulx    32(%rsi), %rcx, %rbp
adcx    %rcx, %r8
adox    %rbp, %r9

mulx    40(%rsi), %rcx, %rbp
adcx    %rcx, %r9
adox    %rbp, %r10
adcq    $0, %r10

xorq    %rax, %rax
movq    40(%rbx), %rdx
    
mulx    0(%rsi), %rcx, %rbp
adcx    %rcx, %r13
adox    %rbp, %r14
    
mulx    8(%rsi), %rcx, %rbp
adcx    %rcx, %r14
adox    %rbp, %r15
    
mulx    16(%rsi), %rcx, %rbp
adcx    %rcx, %r15
adox    %rbp, %r8

mulx    24(%rsi), %rcx, %rbp
adcx    %rcx, %r8
adox    %rbp, %r9

mulx    32(%rsi), %rcx, %rbp
adcx    %rcx, %r9
adox    %rbp, %r10

mulx    40(%rsi), %rcx, %rbp
adcx    %rcx, %r10
adox    %rbp, %rax
adcq    $0, %rax

movq    $420, %rdx    		

xorq    %rsi, %rsi
mulx    %r14, %r14, %rcx 

mulx    %r15,  %r15, %rsi
adcx    %rcx, %r15

mulx    %r8, %r8, %rcx
adcx    %rsi, %r8

mulx    %r9, %r9, %rsi
adcx    %rcx, %r9

mulx    %r10, %r10, %rcx
adcx    %rsi, %r10

mulx    %rax, %rax, %rsi
adcx    %rcx, %rax
adcq    $0, %rsi
  
addq    64(%rsp), %r14
adcq    72(%rsp), %r15
adcq    80(%rsp), %r8
adcq    %r11, %r9
adcq    %r12, %r10
adcq    %rax, %r13
adcq    $0, %rsi
  
shld    $2, %r13, %rsi
andq	mask62, %r13

imul    $105, %rsi, %rsi
addq    %rsi, %r14
adcq    $0, %r15
adcq    $0, %r8
adcq    $0, %r9
adcq    $0, %r10
adcq    $0, %r13

movq    %r14,  0(%rdi)
movq    %r15,  8(%rdi)
movq    %r8,  16(%rdi)
movq    %r9,  24(%rdi)
movq    %r10, 32(%rdi)
movq    %r13, 40(%rdi)

movq    8(%rsp), %r12
movq    16(%rsp), %r13
movq    24(%rsp), %r14
movq    32(%rsp), %r15
movq    40(%rsp), %rbp
movq    48(%rsp), %rbx
movq    0(%rsp), %rsp
 
ret


.p2align 5
.globl gfp382105reduce
gfp382105reduce:

movq    0(%rdi),   %r8
movq    8(%rdi),   %r9
movq    40(%rdi), %r10

movq    %r10, %r11
shrq    $62, %r11
andq	mask62, %r10

imul    $105, %r11, %r11
addq    %r11, %r8
adcq    $0, %r9

movq    %r8,   0(%rdi)
movq    %r9,   8(%rdi)
movq    %r10, 40(%rdi)

ret
