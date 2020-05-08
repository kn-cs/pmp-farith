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

#include"p2213pack.h"

void  gfp2213pack(gfe_p2213 *v, const gfe_p2213 *u) {

	v->l[0] = ((u->l[0] & 0x00FFFFFFFFFFFFFF));
	v->l[1] = ((u->l[0] & 0xFF00000000000000) >> 56) | ((u->l[1] & 0x0000FFFFFFFFFFFF) <<  8);
	v->l[2] = ((u->l[1] & 0xFFFF000000000000) >> 48) | ((u->l[2] & 0x000000FFFFFFFFFF) << 16);
	v->l[3] = ((u->l[2] & 0xFFFFFF0000000000) >> 40) | ((u->l[3] & 0x000000001FFFFFFF) << 24);
}

void  gfp2213unpack(gfe_p2213 *v, const gfe_p2213 *u) {

	v->l[0] = ((u->l[0] & 0x00FFFFFFFFFFFFFF))       | ((u->l[1] & 0x00000000000000FF) << 56);
	v->l[1] = ((u->l[1] & 0x00FFFFFFFFFFFF00) >>  8) | ((u->l[2] & 0x000000000000FFFF) << 48);
	v->l[2] = ((u->l[2] & 0x00FFFFFFFFFF0000) >> 16) | ((u->l[3] & 0x0000000000FFFFFF) << 40);
	v->l[3] = ((u->l[3] & 0x001FFFFFFF000000) >> 24);
}
