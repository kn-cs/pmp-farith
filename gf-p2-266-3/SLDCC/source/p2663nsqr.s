/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^266-3) from the paper         |
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
.global gfp2663nsqr
gfp2663nsqr:

push    %rbp
push    %rbx
push    %r12
push    %r13
push    %r14
push    %r15

movq    0(%rsi),  %rbx
movq    8(%rsi),  %rbp
movq    16(%rsi), %rax
movq    24(%rsi), %rcx
movq    32(%rsi), %rsi

movq    %rax, 16(%rdi)
movq    %rcx, 24(%rdi)
movq    %rsi, 32(%rdi)

movq    %rdx, %rax

.START:

subq    $1, %rax

xorq    %rdx, %rdx
movq    %rbx, %rdx
    
mulx    %rbp, %r9, %r10

mulx    16(%rdi), %rcx, %r11
adcx    %rcx, %r10
    
mulx    24(%rdi), %rcx, %r12
adcx    %rcx, %r11

mulx    32(%rdi), %rcx, %r13
adcx    %rcx, %r12
adcq    $0, %r13

xorq    %r14, %r14
movq    %rbp, %rdx
    
mulx    16(%rdi), %rcx, %rsi
adcx    %rcx, %r11
adox    %rsi, %r12

mulx    24(%rdi), %rcx, %rsi
adcx    %rcx, %r12
adox    %rsi, %r13

mulx    32(%rdi), %rcx, %rsi
adcx    %rcx, %r13
adox    %rsi, %r14
adc	    $0, %r14
    
xorq    %r15, %r15
movq    16(%rdi), %rdx
    
mulx    24(%rdi), %rcx, %rsi
adcx    %rcx, %r13
adox    %rsi, %r14

mulx    32(%rdi), %rcx, %rsi
adcx    %rcx, %r14
adox    %rsi, %r15
adcq    $0, %r15
   
movq    24(%rdi), %rdx
    
mulx    32(%rdi), %rcx, %rsi
addq    %rcx, %r15
adcq    $0, %rsi

shld    $1, %r15, %rsi
shld    $1, %r14, %r15
shld    $1, %r13, %r14
shld    $1, %r12, %r13
shld    $1, %r11, %r12
shld    $1, %r10, %r11
shld    $1, %r9, %r10
shlq    $1, %r9
    
xorq    %rdx, %rdx
movq    %rbx, %rdx
mulx    %rdx, %r8, %rdx
adcx    %rdx, %r9

movq    %rbp, %rdx
mulx    %rdx, %rcx, %rdx
adcx    %rcx, %r10
adcx    %rdx, %r11

movq    16(%rdi), %rdx
mulx    %rdx, %rcx, %rdx
adcx    %rcx, %r12
adcx    %rdx, %r13

movq    24(%rdi), %rdx
mulx    %rdx, %rcx, %rdx
adcx    %rcx, %r14
adcx    %rdx, %r15

movq    32(%rdi), %rdx
mulx    %rdx, %rcx, %rdx
adcx    %rcx, %rsi

movq    threex2e54, %rdx

xorq    %rcx, %rcx
mulx    %r13, %rbx, %rcx
adcx    %r8, %rbx
adox    %r9, %rcx

mulx    %r14, %rbp, %r14
adcx    %rcx, %rbp
adox    %r14, %r10

mulx    %r15, %rcx, %r15
adcx    %rcx, %r10
adox    %r15, %r11

mulx    %rsi, %rsi, %r15
adcx    %rsi, %r11
adox    %r15, %r12

movq    $0, %r13
adcx    zero, %r12
adox    zero, %r13
adcx    zero, %r13

shld    $54, %r12, %r13
andq	mask10, %r12

imul    $3, %r13, %r13
//movq    %r13, %r14
//addq    %r13, %r13
//addq    %r14, %r13
addq    %r13, %rbx
adcq    $0, %rbp
adcq    $0, %r10
movq    %r10, 16(%rdi)
adcq    $0, %r11
movq    %r11, 24(%rdi)
adcq    $0, %r12
movq    %r12, 32(%rdi)

cmpq    $0, %rax

jne     .START
 
movq    %rbx,  0(%rdi)
movq    %rbp,  8(%rdi)

pop     %r15
pop     %r14
pop     %r13
pop     %r12
pop     %rbx
pop     %rbp

ret
