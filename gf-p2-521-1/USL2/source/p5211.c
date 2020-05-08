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

#include "p5211.h"
#include "p5211pack.h"

void gfp5211inv(gfe_p5211 *einv, const gfe_p5211 *e) {

	gfe_p5211 e9,einv9;
	
	gfp5211pack(&e9,e); 
	gfp5211fltinv(&einv9,&e9);
	gfp5211reduce(&einv9);  
        gfp5211unpack(einv,&einv9);
}


void gfp5211fltinv(gfe_p5211 *einv, const gfe_p5211 *e) {

	gfe_p5211 t,t7,t2_7_0,t2_8_0,t2_16_0,t2_32_0,t2_64_0,t2_128_0,t2_256_0;

	/* 2  */ gfp5211sqr(&t,e);
	/* 3  */ gfp5211mul(&t,&t,e);
	/* 6  */ gfp5211sqr(&t,&t);
	/* 7  */ gfp5211mul(&t7,&t,e);
    	/* 14 */ gfp5211sqr(&t,&t7);
    	/* 15 */ gfp5211mul(&t,&t,e); 

    	/* 2^7 - 2^3     */ gfp5211nsqr(&t,&t,3);
    	/* 2^7 - 1       */ gfp5211mul(&t2_7_0,&t,&t7);

    	/* 2^8 - 2       */ gfp5211sqr(&t,&t2_7_0);
    	/* 2^8 - 1       */ gfp5211mul(&t2_8_0,&t,e); 

    	/* 2^16 - 2^8    */ gfp5211nsqr(&t,&t2_8_0,8);
    	/* 2^16 - 1      */ gfp5211mul(&t2_16_0,&t,&t2_8_0);

    	/* 2^32 - 2^16   */ gfp5211nsqr(&t,&t2_16_0,16);
    	/* 2^32 - 1      */ gfp5211mul(&t2_32_0,&t,&t2_16_0);

    	/* 2^64 - 2^32   */ gfp5211nsqr(&t,&t2_32_0,32);
    	/* 2^64 - 1      */ gfp5211mul(&t2_64_0,&t,&t2_32_0);

    	/* 2^128 - 2^64  */ gfp5211nsqr(&t,&t2_64_0,64);
    	/* 2^128 - 1     */ gfp5211mul(&t2_128_0,&t,&t2_64_0);

    	/* 2^256 - 2^128 */ gfp5211nsqr(&t,&t2_128_0,128);
    	/* 2^256 - 1     */ gfp5211mul(&t2_256_0,&t,&t2_128_0);

    	/* 2^512 - 2^256 */ gfp5211nsqr(&t,&t2_256_0,256);
    	/* 2^512 - 1     */ gfp5211mul(&t,&t,&t2_256_0);

    	/* 2^519 - 2^7   */ gfp5211nsqr(&t,&t,7);
    	/* 2^519 - 1     */ gfp5211mul(&t,&t,&t2_7_0);

    	/* 2^521 - 2^2   */ gfp5211nsqr(&t,&t,2);
    	/* 2^521 - 3     */ gfp5211mul(einv,&t,e);
}
