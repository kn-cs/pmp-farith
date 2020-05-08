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

void  gfp41417pack78(gfe_p41417_8L *uprime, const gfe_p41417_7L *u) {

	uprime->l[0] = ((u->l[0] & 0x000FFFFFFFFFFFFF));
	uprime->l[1] = ((u->l[0] & 0xFFF0000000000000) >> 52) | ((u->l[1] & 0x000000FFFFFFFFFF) << 12);
	uprime->l[2] = ((u->l[1] & 0xFFFFFF0000000000) >> 40) | ((u->l[2] & 0x000000000FFFFFFF) << 24);
	uprime->l[3] = ((u->l[2] & 0xFFFFFFFFF0000000) >> 28) | ((u->l[3] & 0x000000000000FFFF) << 36);
	uprime->l[4] = ((u->l[3] & 0xFFFFFFFFFFFF0000) >> 16) | ((u->l[4] & 0x000000000000000F) << 48);
	uprime->l[5] = ((u->l[4] & 0x00FFFFFFFFFFFFF0) >>  4);
	uprime->l[6] = ((u->l[4] & 0xFF00000000000000) >> 56) | ((u->l[5] & 0x00000FFFFFFFFFFF) <<  8);
	uprime->l[7] = ((u->l[5] & 0xFFFFF00000000000) >> 44) | ((u->l[6] & 0x000000003FFFFFFF) << 20);
}

void  gfp41417pack87(gfe_p41417_7L *u, const gfe_p41417_8L *uprime) {

	u->l[0] = ((uprime->l[0] & 0x000FFFFFFFFFFFFF))       | ((uprime->l[1] & 0x0000000000000FFF) << 52);		
	u->l[1] = ((uprime->l[1] & 0x000FFFFFFFFFF000) >> 12) | ((uprime->l[2] & 0x0000000000FFFFFF) << 40);	
	u->l[2] = ((uprime->l[2] & 0x000FFFFFFF000000) >> 24) | ((uprime->l[3] & 0x0000000FFFFFFFFF) << 28);	
	u->l[3] = ((uprime->l[3] & 0x000FFFF000000000) >> 36) | ((uprime->l[4] & 0x0000FFFFFFFFFFFF) << 16);
	u->l[4] = ((uprime->l[4] & 0x000F000000000000) >> 48) | ((uprime->l[5] & 0x000FFFFFFFFFFFFF) <<  4) | ((uprime->l[6] & 0x00000000000000FF) << 56);
	u->l[5] = ((uprime->l[6] & 0x000FFFFFFFFFFF00) >>  8) | ((uprime->l[7] & 0x00000000000FFFFF) << 44);
	u->l[6] = ((uprime->l[7] & 0x0003FFFFFFF00000) >> 20);
}
