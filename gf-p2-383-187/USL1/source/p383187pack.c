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

#include"p383187pack.h"

void  gfp383187pack67(gfe_p383187_7L *v, const gfe_p383187_6L *u) {

	v->l[0] = ((u->l[0] & 0x007FFFFFFFFFFFFF));
	v->l[1] = ((u->l[0] & 0xFF80000000000000) >> 55) | ((u->l[1] & 0x00003FFFFFFFFFFF) <<  9);
	v->l[2] = ((u->l[1] & 0xFFFFC00000000000) >> 46) | ((u->l[2] & 0x0000001FFFFFFFFF) << 18);
	v->l[3] = ((u->l[2] & 0xFFFFFFE000000000) >> 37) | ((u->l[3] & 0x000000000FFFFFFF) << 27);
	v->l[4] = ((u->l[3] & 0xFFFFFFFFF0000000) >> 28) | ((u->l[4] & 0x000000000007FFFF) << 36);
	v->l[5] = ((u->l[4] & 0xFFFFFFFFFFF80000) >> 19) | ((u->l[5] & 0x00000000000003FF) << 45);
	v->l[6] = ((u->l[5] & 0x7FFFFFFFFFFFFC00) >> 10);
}

void  gfp383187pack76(gfe_p383187_6L *v, const gfe_p383187_7L *u) {

	v->l[0] = ((u->l[0] & 0x007FFFFFFFFFFFFF))       | ((u->l[1] & 0x00000000000001FF) << 55);
	v->l[1] = ((u->l[1] & 0x007FFFFFFFFFFE00) >>  9) | ((u->l[2] & 0x000000000003FFFF) << 46);	
	v->l[2] = ((u->l[2] & 0x007FFFFFFFFC0000) >> 18) | ((u->l[3] & 0x0000000007FFFFFF) << 37);	
	v->l[3] = ((u->l[3] & 0x007FFFFFF8000000) >> 27) | ((u->l[4] & 0x0000000FFFFFFFFF) << 28);
	v->l[4] = ((u->l[4] & 0x007FFFF000000000) >> 36) | ((u->l[5] & 0x00001FFFFFFFFFFF) << 19);
	v->l[5] = ((u->l[5] & 0x007FE00000000000) >> 45) | ((u->l[6] & 0x001FFFFFFFFFFFFF) << 10);
}
