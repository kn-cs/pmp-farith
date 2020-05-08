/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^414-17) from the paper        |
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

#include"p41417pack.h"

void  gfp41417pack(gfe_p41417 *v, const gfe_p41417 *u) {

	v->l[0] = ((u->l[0] & 0x0FFFFFFFFFFFFFFF));
	v->l[1] = ((u->l[0] & 0xF000000000000000) >> 60) | ((u->l[1] & 0x00FFFFFFFFFFFFFF) <<  4);
	v->l[2] = ((u->l[1] & 0xFF00000000000000) >> 56) | ((u->l[2] & 0x000FFFFFFFFFFFFF) <<  8);
	v->l[3] = ((u->l[2] & 0xFFF0000000000000) >> 52) | ((u->l[3] & 0x0000FFFFFFFFFFFF) << 12);
	v->l[4] = ((u->l[3] & 0xFFFF000000000000) >> 48) | ((u->l[4] & 0x00000FFFFFFFFFFF) << 16);
	v->l[5] = ((u->l[4] & 0xFFFFF00000000000) >> 44) | ((u->l[5] & 0x000000FFFFFFFFFF) << 20);
	v->l[6] = ((u->l[5] & 0xFFFFFF0000000000) >> 40) | ((u->l[6] & 0x000000003FFFFFFF) << 24);
}

void  gfp41417unpack(gfe_p41417 *v, const gfe_p41417 *u) {									

	v->l[0] = ((u->l[0] & 0x0FFFFFFFFFFFFFFF))       | ((u->l[1] & 0x000000000000000F) << 60);
	v->l[1] = ((u->l[1] & 0x0FFFFFFFFFFFFFF0) >>  4) | ((u->l[2] & 0x00000000000000FF) << 56);
	v->l[2] = ((u->l[2] & 0x0FFFFFFFFFFFFF00) >>  8) | ((u->l[3] & 0x0000000000000FFF) << 52);
	v->l[3] = ((u->l[3] & 0x0FFFFFFFFFFFF000) >> 12) | ((u->l[4] & 0x000000000000FFFF) << 48);
	v->l[4] = ((u->l[4] & 0x0FFFFFFFFFFF0000) >> 16) | ((u->l[5] & 0x00000000000FFFFF) << 44);
	v->l[5] = ((u->l[5] & 0x0FFFFFFFFFF00000) >> 20) | ((u->l[6] & 0x0000000000FFFFFF) << 40);
	v->l[6] = ((u->l[6] & 0x003FFFFFFF000000) >> 24);
}
