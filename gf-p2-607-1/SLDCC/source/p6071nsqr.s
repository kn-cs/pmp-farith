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

movq    %rsp, %r11
subq    $152, %rsp

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
movq    48(%rsi), %r14
movq    56(%rsi), %r15
movq    64(%rsi), %rax
movq    72(%rsi), %rbx

movq    %r8,   0(%rdi)	
movq    %r9,   8(%rdi)	
movq    %r10, 16(%rdi)	
movq    %r11, 24(%rdi)
movq    %r12, 32(%rdi)
movq    %r13, 40(%rdi)
movq    %r14, 48(%rdi)
movq    %r15, 56(%rdi)
movq    %rax, 64(%rdi)
movq    %rbx, 72(%rdi)

movq    %rdx, %rbx

.START:

subq    $1, %rbx
movq    %rbx, 144(%rsp)

xorq    %rdx, %rdx
movq    0(%rdi), %rdx
    
mulx    8(%rdi), %r9, %r10

mulx    16(%rdi), %rcx, %r11
adcx    %rcx, %r10

mulx    24(%rdi), %rcx, %r12
adcx    %rcx, %r11

mulx    32(%rdi), %rcx, %r13
adcx    %rcx, %r12

mulx    40(%rdi), %rcx, %r14
adcx    %rcx, %r13

mulx    48(%rdi), %rcx, %r15
adcx    %rcx, %r14

mulx    56(%rdi), %rcx, %rax
adcx    %rcx, %r15
    
mulx    64(%rdi), %rcx, %rsi
adcx    %rcx, %rax

mulx    72(%rdi), %rcx, %r8
adcx    %rcx, %rsi
adcq    $0, %r8			

movq    %r9, 64(%rsp)

xorq    %r9, %r9
movq    8(%rdi), %rdx
    
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

mulx    48(%rdi), %rcx, %rbp
adcx    %rcx, %r15
adox    %rbp, %rax

mulx    56(%rdi), %rcx, %rbp
adcx    %rcx, %rax
adox    %rbp, %rsi
    
mulx    64(%rdi), %rcx, %rbp
adcx    %rcx, %rsi
adox    %rbp, %r8

mulx    72(%rdi), %rcx, %rbp
adcx    %rcx, %r8
adox    %rbp, %r9
adcq    $0, %r9

movq    %r10, 72(%rsp)

xorq    %r10, %r10
movq    16(%rdi), %rdx

mulx    24(%rdi), %rcx, %rbp
adcx    %rcx, %r13
adox    %rbp, %r14

mulx    32(%rdi), %rcx, %rbp
adcx    %rcx, %r14
adox    %rbp, %r15

mulx    40(%rdi), %rcx, %rbp
adcx    %rcx, %r15
adox    %rbp, %rax

mulx    48(%rdi), %rcx, %rbp
adcx    %rcx, %rax
adox    %rbp, %rsi

mulx    56(%rdi), %rcx, %rbp
adcx    %rcx, %rsi
adox    %rbp, %r8
    
mulx    64(%rdi), %rcx, %rbp
adcx    %rcx, %r8
adox    %rbp, %r9

mulx    72(%rdi), %rcx, %rbp
adcx    %rcx, %r9
adox    %rbp, %r10
adcq    $0, %r10

movq    %r11, 80(%rsp)

xorq    %r11, %r11
movq    24(%rdi), %rdx

mulx    32(%rdi), %rcx, %rbp
adcx    %rcx, %r15
adox    %rbp, %rax

mulx    40(%rdi), %rcx, %rbp
adcx    %rcx, %rax
adox    %rbp, %rsi

mulx    48(%rdi), %rcx, %rbp
adcx    %rcx, %rsi
adox    %rbp, %r8

mulx    56(%rdi), %rcx, %rbp
adcx    %rcx, %r8
adox    %rbp, %r9
    
mulx    64(%rdi), %rcx, %rbp
adcx    %rcx, %r9
adox    %rbp, %r10

mulx    72(%rdi), %rcx, %rbp
adcx    %rcx, %r10
adox    %rbp, %r11
adcq    $0, %r11

movq    %r12, 88(%rsp)

xorq    %r12, %r12
movq    32(%rdi), %rdx

mulx    40(%rdi), %rcx, %rbp
adcx    %rcx, %rsi
adox    %rbp, %r8

mulx    48(%rdi), %rcx, %rbp
adcx    %rcx, %r8
adox    %rbp, %r9

mulx    56(%rdi), %rcx, %rbp
adcx    %rcx, %r9
adox    %rbp, %r10
    
mulx    64(%rdi), %rcx, %rbp
adcx    %rcx, %r10
adox    %rbp, %r11

mulx    72(%rdi), %rcx, %rbp
adcx    %rcx, %r11
adox    %rbp, %r12
adcq    $0, %r12

movq    %r13, 96(%rsp)

xorq    %r13, %r13
movq    40(%rdi), %rdx

mulx    48(%rdi), %rcx, %rbp
adcx    %rcx, %r9
adox    %rbp, %r10

mulx    56(%rdi), %rcx, %rbp
adcx    %rcx, %r10
adox    %rbp, %r11
    
mulx    64(%rdi), %rcx, %rbp
adcx    %rcx, %r11
adox    %rbp, %r12

mulx    72(%rdi), %rcx, %rbp
adcx    %rcx, %r12
adox    %rbp, %r13
adcq    $0, %r13

movq    %r14, 104(%rsp)

xorq    %r14, %r14
movq    48(%rdi), %rdx

mulx    56(%rdi), %rcx, %rbp
adcx    %rcx, %r11
adox    %rbp, %r12
 
mulx    64(%rdi), %rcx, %rbp
adcx    %rcx, %r12
adox    %rbp, %r13

mulx    72(%rdi), %rcx, %rbp
adcx    %rcx, %r13
adox    %rbp, %r14
adcq    $0, %r14	
    
movq    %r15, 112(%rsp)

xorq    %r15, %r15
movq    56(%rdi), %rdx

mulx    64(%rdi), %rcx, %rbp
adcx    %rcx, %r13
adox    %rbp, %r14

mulx    72(%rdi), %rcx, %rbp
adcx    %rcx, %r14
adox    %rbp, %r15
adcq    $0, %r15	

movq    %rax, 120(%rsp) 
   
xorq    %rax, %rax
movq    64(%rdi), %rdx

mulx    72(%rdi), %rcx, %rax
adcx    %rcx, %r15
adcq    $0, %rax		     

movq    104(%rsp), %rbp
movq    112(%rsp), %rcx
movq    120(%rsp), %rdx	     

shld    $1, %r15, %rax
shld    $1, %r14, %r15
shld    $1, %r13, %r14
shld    $1, %r12, %r13
shld    $1, %r11, %r12
shld    $1, %r10, %r11
shld    $1, %r9,  %r10
shld    $1, %r8,  %r9
shld    $1, %rsi, %r8
shld    $1, %rdx, %rsi
shld    $1, %rcx, %rdx
shld    $1, %rbp, %rcx
movq    %rcx, 104(%rsp)
movq    %rdx, 112(%rsp)
movq    %rsi, 120(%rsp)
movq    %r8,  128(%rsp)
movq    %r9,  136(%rsp)
movq    64(%rsp), %rcx
movq    72(%rsp), %rdx
movq    80(%rsp), %rsi
movq    88(%rsp), %r8
movq    96(%rsp), %r9
shld    $1, %r9,  %rbp
shld    $1, %r8,  %r9
shld    $1, %rsi, %r8
shld    $1, %rdx, %rsi
shld    $1, %rcx, %rdx
shlq    $1, %rcx

movq    %rcx, 64(%rsp)		
movq    %rdx, 72(%rsp)		
movq    %rsi, 80(%rsp)		
movq    %r8,  88(%rsp)	
movq    %r9,  96(%rsp)
  
xorq    %rdx, %rdx
movq    0(%rdi), %rdx
mulx    %rdx, %r8, %rsi
movq    64(%rsp), %r9
adcx    %rsi, %r9 	 

movq    8(%rdi), %rdx
mulx    %rdx, %rcx, %rsi
adcx    72(%rsp), %rcx
adcx    80(%rsp), %rsi
movq    %rcx, 72(%rsp)
movq    %rsi, 80(%rsp)

movq    16(%rdi), %rdx
mulx    %rdx, %rcx, %rsi
adcx    88(%rsp), %rcx
adcx    96(%rsp), %rsi
movq    %rcx, 88(%rsp)
movq    %rsi, 96(%rsp)

movq    24(%rdi), %rdx
mulx    %rdx, %rcx, %rsi
adcx    %rcx, %rbp
adcx    104(%rsp), %rsi
movq    %rsi, 104(%rsp)

movq    32(%rdi), %rdx
mulx    %rdx, %rcx, %rsi
adcx    112(%rsp), %rcx
adcx    120(%rsp), %rsi
movq    %rcx, 112(%rsp)
movq    %rsi, 120(%rsp)

movq    40(%rdi), %rdx
mulx    %rdx, %rcx, %rsi
adcx    128(%rsp), %rcx
adcx    136(%rsp), %rsi
movq    %rcx, 128(%rsp)
movq    %rsi, 136(%rsp)

movq    48(%rdi), %rdx
mulx    %rdx, %rcx, %rsi
adcx    %rcx, %r10
adcx    %rsi, %r11

movq    56(%rdi), %rdx
mulx    %rdx, %rcx, %rsi
adcx    %rcx, %r12
adcx    %rsi, %r13

movq    64(%rdi), %rdx
mulx    %rdx, %rcx, %rsi
adcx    %rcx, %r14
adcx    %rsi, %r15

movq    72(%rdi), %rdx
mulx    %rdx, %rcx, %rsi
adcx    %rcx, %rax

movq    120(%rsp), %rdi
movq    128(%rsp), %rcx
movq    136(%rsp), %rsi

movq    $0,  %rdx
shld    $33, %rax, %rdx
shld    $33, %r15, %rax
shld    $33, %r14, %r15
shld    $33, %r13, %r14
shld    $33, %r12, %r13
shld    $33, %r11, %r12
shld    $33, %r10, %r11
shld    $33, %rsi, %r10
shld    $33, %rcx, %rsi
shld    $33, %rdi, %rcx

andq	mask31, %rdi

adcx    %rcx, %r8
adcx    %rsi, %r9
adcx    72(%rsp),  %r10
adcx    80(%rsp),  %r11
adcx    88(%rsp),  %r12
adcx    96(%rsp),  %r13
adcx    %rbp, %r14
adcx    104(%rsp), %r15
adcx    112(%rsp), %rax
adcx    %rdi, %rdx

movq    %rdx, %rbx
shrq    $31, %rbx
andq	mask31, %rdx

addq    %rbx, %r8
adcq    $0, %r9
adcq    $0, %r10
adcq    $0, %r11
adcq    $0, %r12
adcq    $0, %r13
adcq    $0, %r14
adcq    $0, %r15
adcq    $0, %rax
adcq    $0, %rdx 

movq    56(%rsp), %rdi

movq    %r8,   0(%rdi)
movq    %r9,   8(%rdi)
movq    %r10, 16(%rdi)
movq    %r11, 24(%rdi)
movq    %r12, 32(%rdi)
movq    %r13, 40(%rdi)
movq    %r14, 48(%rdi)
movq    %r15, 56(%rdi)
movq    %rax, 64(%rdi)
movq    %rdx, 72(%rdi)

movq    144(%rsp), %rbx
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
