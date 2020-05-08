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

#include "p2663.h"

void gfp2663inv(gfe_p2663 *einv,const gfe_p2663 *e) {

	gfp2663fltinv(einv,e);
	gfp2663reduce(einv);
	gfp2663makeunique(einv);
}

/* Routine taken from the work "Kummer for genus one over prime order fields" by Sabyasachi Karati and Palash Sarkar.
   Code-link: https://github.com/skarati/KummerLineV02/blob/master/KummerLine2663(260%2C139)/kummer.h
*/
void gfp2663fltinv(gfe_p2663 *einv, const gfe_p2663 *e) {
	
	gfe_p2663 t,z3,z6,z12,z15,z2_7_3,z2_8_0,z2_16_0,z2_32_0,z2_64_0,z2_128_0;
	
	/* 2  */ gfp2663sqr(&t,e);
	/* 3  */ gfp2663mul(&z3,&t,e);
	/* 6  */ gfp2663sqr(&z6,&z3);
	/* 12 */ gfp2663sqr(&t,&z6);

	/* 2^4   -  1    */ gfp2663mul(&z15,&t,&z3);

	/* 2^7   -  2^3  */ gfp2663nsqr(&z2_7_3,&z15,3);
	/* 2^8   -  2^4  */ gfp2663sqr(&t,&z2_7_3);
	/* 2^8   -  1    */ gfp2663mul(&z2_8_0,&t,&z15);
							
	/* 2^16  -  2^8  */ gfp2663nsqr(&t,&z2_8_0,8);
	/* 2^16  -  1    */ gfp2663mul(&z2_16_0,&t,&z2_8_0);

	/* 2^32  -  2^16 */ gfp2663nsqr(&t,&z2_16_0,16);
	/* 2^32  -  1    */ gfp2663mul(&z2_32_0,&t,&z2_16_0);

	/* 2^64  -  2^32 */ gfp2663nsqr(&t,&z2_32_0,32);
	/* 2^64  -  1    */ gfp2663mul(&z2_64_0,&t,&z2_32_0);

	/* 2^128 -  2^64 */ gfp2663nsqr(&t,&z2_64_0,64);
	/* 2^128 -  1    */ gfp2663mul(&z2_128_0,&t,&z2_64_0);

	/* 2^256 -  2^128*/ gfp2663nsqr(&t,&z2_128_0,128);
	/* 2^256 -  1    */ gfp2663mul(&t,&t,&z2_128_0);

	/* 2^263 -  2^7  */ gfp2663nsqr(&t,&t,7);
	/* 2^263 -  2^3  */ gfp2663mul(&t,&t,&z2_7_3);
	/* 2^263 -  2    */ gfp2663mul(&t,&t,&z6);
	/* 2^263 -  1    */ gfp2663mul(&t,&t,e);

	/* 2^266 -  2^3  */ gfp2663nsqr(&t,&t,3);
	/* 2^266 -  5    */ gfp2663mul(einv,&t,&z3);
}
