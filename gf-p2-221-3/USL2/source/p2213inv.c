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

#include "p2213.h"
#include "p2213pack.h"

void gfp2213inv(gfe_p2213 *einv, const gfe_p2213 *e) {

	gfe_p2213 e4,einv4;

	gfp2213pack(&e4,e);
	gfp2213fltinv(&einv4,&e4);
	gfp2213reduce(&einv4);  
	gfp2213unpack(einv,&einv4);	 
        gfp2213makeunique(einv);
}

void gfp2213fltinv(gfe_p2213 *einv, const gfe_p2213 *e) {	

	gfe_p2213 t,t3,t2_4_0,t2_9_0,t2_18_0,t2_36_0,t2_45_0,t2_90_0;

	/* 2  */ gfp2213sqr(&t,e); 
	/* 3  */ gfp2213mul(&t3,&t,e); 
	/* 12 */ gfp2213nsqr(&t,&t3,2); 

	/* 2^4 - 1       */ gfp2213mul(&t2_4_0,&t,&t3);
	/* 2^5 - 2       */ gfp2213sqr(&t,&t2_4_0);
	/* 2^5 - 1       */ gfp2213mul(&t,&t,e);

	/* 2^9 - 2^4     */ gfp2213nsqr(&t,&t,4);
	/* 2^9 - 1       */ gfp2213mul(&t2_9_0,&t,&t2_4_0);

	/* 2^18 - 2^9    */ gfp2213nsqr(&t,&t2_9_0,9);
	/* 2^18 - 1      */ gfp2213mul(&t2_18_0,&t,&t2_9_0);

	/* 2^36 - 2^18   */ gfp2213nsqr(&t,&t2_18_0,18);
	/* 2^36 - 1      */ gfp2213mul(&t2_36_0,&t,&t2_18_0);

	/* 2^45 - 2^9    */ gfp2213nsqr(&t,&t2_36_0,9);
	/* 2^45 - 1      */ gfp2213mul(&t2_45_0,&t,&t2_9_0);

	/* 2^90 - 2^45   */ gfp2213nsqr(&t,&t2_45_0,45);
	/* 2^90 - 1      */ gfp2213mul(&t2_90_0,&t,&t2_45_0);

	/* 2^180 - 2^90  */ gfp2213nsqr(&t,&t2_90_0,90);
	/* 2^180 - 1     */ gfp2213mul(&t,&t,&t2_90_0);

	/* 2^216 - 2^36  */ gfp2213nsqr(&t,&t,36);
	/* 2^216 - 1     */ gfp2213mul(&t,&t,&t2_36_0);

	/* 2^218 - 2^2   */ gfp2213nsqr(&t,&t,2);
	/* 2^218 - 1     */ gfp2213mul(&t,&t,&t3);

	/* 2^221 - 2^3   */ gfp2213nsqr(&t,&t,3);
	/* 2^221 - 5     */ gfp2213mul(einv,&t,&t3); 
}
