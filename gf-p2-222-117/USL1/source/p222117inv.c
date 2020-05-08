/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^222-117) from the paper       |
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

#include "p222117.h"
#include "p222117pack.h"

void gfp222117inv(gfe_p222117 *einv, const gfe_p222117 *e) {

	gfe_p222117 e4,einv4;

	gfp222117pack(&e4,e);
	gfp222117fltinv(&einv4,&e4);
	gfp222117reduce(&einv4);  
	gfp222117unpack(einv,&einv4);	 
}

void gfp222117fltinv(gfe_p222117 *einv, const gfe_p222117 *e) {	

	gfe_p222117 t,t4,t9,t2_5_0,t2_10_0,t2_20_0,t2_40_0,t2_80_0;

	/* 4  */ gfp222117nsqr(&t4,e,2); 
	/* 8  */ gfp222117sqr(&t,&t4);  
	/* 9  */ gfp222117mul(&t9,&t,e); 
	/* 18 */ gfp222117sqr(&t,&t9);
	/* 27 */ gfp222117mul(&t,&t,&t9);  

	/* 2^5 - 1       */ gfp222117mul(&t2_5_0,&t,&t4);

	/* 2^10 - 2^5    */ gfp222117nsqr(&t,&t2_5_0,5);
	/* 2^10 - 1      */ gfp222117mul(&t2_10_0,&t,&t2_5_0);

	/* 2^20 - 2^10   */ gfp222117nsqr(&t,&t2_10_0,10);
	/* 2^20 - 1      */ gfp222117mul(&t2_20_0,&t,&t2_10_0);

	/* 2^40 - 2^20   */ gfp222117nsqr(&t,&t2_20_0,20);
	/* 2^40 - 1      */ gfp222117mul(&t2_40_0,&t,&t2_20_0);

	/* 2^80 - 2^40   */ gfp222117nsqr(&t,&t2_40_0,40);
	/* 2^80 - 1      */ gfp222117mul(&t2_80_0,&t,&t2_40_0);

	/* 2^160 - 2^80  */ gfp222117nsqr(&t,&t2_80_0,80);
	/* 2^160 - 1     */ gfp222117mul(&t,&t,&t2_80_0);

	/* 2^200 - 2^40  */ gfp222117nsqr(&t,&t,40);
	/* 2^200 - 1     */ gfp222117mul(&t,&t,&t2_40_0);

	/* 2^210 - 2^10  */ gfp222117nsqr(&t,&t,10);
	/* 2^210 - 1     */ gfp222117mul(&t,&t,&t2_10_0);

	/* 2^215 - 2^5   */ gfp222117nsqr(&t,&t,5);
	/* 2^215 - 1     */ gfp222117mul(&t,&t,&t2_5_0);

	/* 2^222 - 2^7   */ gfp222117nsqr(&t,&t,7);
	/* 2^222 - 119   */ gfp222117mul(einv,&t,&t9); 
}
