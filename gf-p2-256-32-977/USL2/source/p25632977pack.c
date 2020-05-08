/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^256-2^32-977) from the paper  |
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

#include"p25632977pack.h"

void  gfp25632977pack45(gfe_p25632977_5L *v, const gfe_p25632977_4L *u) {

	v->l[0] = ((u->l[0] & 0x000FFFFFFFFFFFFF));
	v->l[1] = ((u->l[0] & 0xFFF0000000000000) >> 52) | ((u->l[1] & 0x000000FFFFFFFFFF) << 12);
	v->l[2] = ((u->l[1] & 0xFFFFFF0000000000) >> 40) | ((u->l[2] & 0x000000000FFFFFFF) << 24);
	v->l[3] = ((u->l[2] & 0xFFFFFFFFF0000000) >> 28) | ((u->l[3] & 0x000000000000FFFF) << 36);
	v->l[4] = ((u->l[3] & 0xFFFFFFFFFFFF0000) >> 16);
}

void  gfp25632977pack54(gfe_p25632977_4L *v, const gfe_p25632977_5L *u) {

	v->l[0] = ((u->l[0] & 0x000FFFFFFFFFFFFF))       | ((u->l[1] & 0x0000000000000FFF) << 52);
	v->l[1] = ((u->l[1] & 0x000FFFFFFFFFF000) >> 12) | ((u->l[2] & 0x0000000000FFFFFF) << 40);
	v->l[2] = ((u->l[2] & 0x000FFFFFFF000000) >> 24) | ((u->l[3] & 0x0000000FFFFFFFFF) << 28);
	v->l[3] = ((u->l[3] & 0x000FFFF000000000) >> 36) | ((u->l[4] & 0x0000FFFFFFFFFFFF) << 16);	
}
