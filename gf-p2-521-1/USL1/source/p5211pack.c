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

#include"p5211pack.h"

void  gfp5211pack(gfe_p5211 *v, const gfe_p5211 *u) {

	v->l[0] = ((u->l[0] & 0x03FFFFFFFFFFFFFF));
	v->l[1] = ((u->l[0] & 0xFC00000000000000) >> 58) | ((u->l[1] & 0x000FFFFFFFFFFFFF) << 6);
	v->l[2] = ((u->l[1] & 0xFFF0000000000000) >> 52) | ((u->l[2] & 0x00003FFFFFFFFFFF) << 12);
	v->l[3] = ((u->l[2] & 0xFFFFC00000000000) >> 46) | ((u->l[3] & 0x000000FFFFFFFFFF) << 18);
	v->l[4] = ((u->l[3] & 0xFFFFFF0000000000) >> 40) | ((u->l[4] & 0x00000003FFFFFFFF) << 24);
	v->l[5] = ((u->l[4] & 0xFFFFFFFC00000000) >> 34) | ((u->l[5] & 0x000000000FFFFFFF) << 30);
	v->l[6] = ((u->l[5] & 0xFFFFFFFFF0000000) >> 28) | ((u->l[6] & 0x00000000003FFFFF) << 36);
	v->l[7] = ((u->l[6] & 0xFFFFFFFFFFC00000) >> 22) | ((u->l[7] & 0x000000000000FFFF) << 42);
	v->l[8] = ((u->l[7] & 0xFFFFFFFFFFFF0000) >> 16) | ((u->l[8] & 0x00000000000001FF) << 48);
}

void  gfp5211unpack(gfe_p5211 *v, const gfe_p5211 *u) {									

	v->l[0] = ((u->l[0] & 0x03FFFFFFFFFFFFFF))       | ((u->l[1] & 0x000000000000003F) << 58);
	v->l[1] = ((u->l[1] & 0x03FFFFFFFFFFFFC0) >>  6) | ((u->l[2] & 0x0000000000000FFF) << 52);
	v->l[2] = ((u->l[2] & 0x03FFFFFFFFFFF000) >> 12) | ((u->l[3] & 0x000000000003FFFF) << 46);
	v->l[3] = ((u->l[3] & 0x03FFFFFFFFFC0000) >> 18) | ((u->l[4] & 0x0000000000FFFFFF) << 40);
	v->l[4] = ((u->l[4] & 0x03FFFFFFFF000000) >> 24) | ((u->l[5] & 0x000000003FFFFFFF) << 34);
	v->l[5] = ((u->l[5] & 0x03FFFFFFC0000000) >> 30) | ((u->l[6] & 0x0000000FFFFFFFFF) << 28);
	v->l[6] = ((u->l[6] & 0x03FFFFF000000000) >> 36) | ((u->l[7] & 0x000003FFFFFFFFFF) << 22);
	v->l[7] = ((u->l[7] & 0x03FFFC0000000000) >> 42) | ((u->l[8] & 0x0000FFFFFFFFFFFF) << 16);
	v->l[8] = ((u->l[8] & 0x01FF000000000000) >> 48);
}
