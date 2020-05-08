/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^221-3) from the paper         |
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
.global gfp2213nsqr
gfp2213nsqr:

push    %rbp
push    %rbx
push    %r12
push    %r13
push    %r14
push    %r15
push    %rdi

movq    0(%rsi),  %rbx  
movq    8(%rsi),  %rbp  
movq    16(%rsi), %rax
movq    24(%rsi), %rsi

movq    %rdx, %rdi

.START:

subq   $1, %rdi

movq    %rbx, %rdx
xorq    %r13, %r13
    
mulx    %rbp, %r9, %r10

mulx    %rax, %rcx, %r11
adcx    %rcx, %r10
    
mulx    %rsi, %rcx, %r12
adcx    %rcx, %r11
adcx    %r13, %r12

movq    %rbp, %rdx
xorq    %r14, %r14
    
mulx    %rax, %rcx, %r15
adcx    %rcx, %r11
adox    %r15, %r12
    
mulx    %rsi, %rcx, %r15
adcx    %rcx, %r12
adox    %r15, %r13
adcx    %r14, %r13

movq    %rax, %rdx
    
mulx    %rsi, %rcx, %r14
addq    %rcx, %r13
adc     $0, %r14

shld    $1, %r13, %r14
shld    $1, %r12, %r13
shld    $1, %r11, %r12
shld    $1, %r10, %r11
shld    $1, %r9, %r10
shlq    $1, %r9
     
movq    %rbx, %rdx
mulx    %rdx, %r8, %r15
addq    %r15, %r9

movq    %rbp, %rdx
mulx    %rdx, %rcx, %r15
adcq    %rcx, %r10
adcq    %r15, %r11

movq    %rax, %rdx
mulx    %rdx, %rcx, %r15
adcq    %rcx, %r12
adcq    %r15, %r13

movq    %rsi, %rdx
mulx    %rdx, %rcx, %r15
adcq    %rcx, %r14

movq    threex2e35, %rdx    		

mulx    %r12, %rbx, %rbp 
mulx    %r13, %rcx, %rax
addq    %rcx, %rbp     

mulx    %r14, %rcx, %rsi
adcq    %rcx, %rax    
adcq    $0, %rsi 

movq    $0, %r15  
addq    %r8,  %rbx
adcq    %r9,  %rbp			
adcq    %r10, %rax
adcq    %r11, %rsi
adcq    $0, %r15

shld    $35, %rsi, %r15
andq	mask29, %rsi

//imul    $3, %r15, %r15
movq    %r15, %r14
addq    %r14, %r14
addq    %r14, %r15
addq    %r15, %rbx
adcq    $0, %rbp
adcq    $0, %rax
adcq    $0, %rsi	
 
cmpq    $0, %rdi

jne    .START

pop     %rdi

movq    %rbx,  0(%rdi)
movq    %rbp,  8(%rdi)
movq    %rax, 16(%rdi)
movq    %rsi, 24(%rdi)

pop     %r15
pop     %r14
pop     %r13
pop     %r12
pop     %rbx
pop     %rbp

ret
