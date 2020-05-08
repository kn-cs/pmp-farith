/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^255-19) from the paper        |
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

#include"p25519pack.h"

void  gfp25519pack45(gfe_p25519_5L *v, const gfe_p25519_4L *u) {

	v->l[0] = ((u->l[0] & 0x0007FFFFFFFFFFFF));
	v->l[1] = ((u->l[0] & 0xFFF8000000000000) >> 51) | ((u->l[1] & 0x0000003FFFFFFFFF) << 13);
	v->l[2] = ((u->l[1] & 0xFFFFFFC000000000) >> 38) | ((u->l[2] & 0x0000000001FFFFFF) << 26);
	v->l[3] = ((u->l[2] & 0xFFFFFFFFFE000000) >> 25) | ((u->l[3] & 0x0000000000000FFF) << 39);
	v->l[4] = ((u->l[3] & 0x7FFFFFFFFFFFF000) >> 12);
}

void  gfp25519pack54(gfe_p25519_4L *v, const gfe_p25519_5L *u) {

	v->l[0] = ((u->l[0] & 0x0007FFFFFFFFFFFF))       | ((u->l[1] & 0x0000000000001FFF) << 51);
	v->l[1] = ((u->l[1] & 0x0007FFFFFFFFE000) >> 13) | ((u->l[2] & 0x0000000003FFFFFF) << 38);
	v->l[2] = ((u->l[2] & 0x0007FFFFFC000000) >> 26) | ((u->l[3] & 0x0000007FFFFFFFFF) << 25);
	v->l[3] = ((u->l[3] & 0x0007FF8000000000) >> 39) | ((u->l[4] & 0x0007FFFFFFFFFFFF) << 12);
}
