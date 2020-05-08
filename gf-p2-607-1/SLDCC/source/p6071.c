/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^607-1) from the paper         |
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


#include "p6071.h"

void gfp6071inv(gfe_p6071 *einv, const gfe_p6071 *e) {

	gfe_p6071 t,t3,t12,t15,t2_9_0,t2_18_0,t2_36_0,t2_72_0,t2_144_0,t2_288_0;

	/* 2  */ gfp6071sqr(&t,e);  
	/* 3  */ gfp6071mul(&t3,&t,e);
    	/* 12 */ gfp6071nsqr(&t12,&t3,2);
    	/* 15 */ gfp6071mul(&t15,&t12,&t3); 
    	/* 30 */ gfp6071sqr(&t,&t15); 

    	/* 2^5 - 1       */ gfp6071mul(&t,&t,e); 

    	/* 2^9 - 2^4     */ gfp6071nsqr(&t,&t,4);
    	/* 2^9 - 1       */ gfp6071mul(&t2_9_0,&t,&t15); 

    	/* 2^18 - 2^9    */ gfp6071nsqr(&t,&t2_9_0,9); 
    	/* 2^18 - 1      */ gfp6071mul(&t2_18_0,&t,&t2_9_0); 

    	/* 2^36 - 2^18   */ gfp6071nsqr(&t,&t2_18_0,18);
    	/* 2^36 - 1      */ gfp6071mul(&t2_36_0,&t,&t2_18_0);

    	/* 2^72 - 2^36   */ gfp6071nsqr(&t,&t2_36_0,36);
    	/* 2^72 - 1      */ gfp6071mul(&t2_72_0,&t,&t2_36_0);

    	/* 2^144 - 2^72  */ gfp6071nsqr(&t,&t2_72_0,72);
    	/* 2^144 - 1     */ gfp6071mul(&t2_144_0,&t,&t2_72_0);

    	/* 2^288 - 2^144 */ gfp6071nsqr(&t,&t2_144_0,144);
    	/* 2^288 - 1     */ gfp6071mul(&t2_288_0,&t,&t2_144_0);

    	/* 2^576 - 2^288 */ gfp6071nsqr(&t,&t2_288_0,288);
    	/* 2^576 - 1     */ gfp6071mul(&t,&t,&t2_288_0);

    	/* 2^594 - 2^18  */ gfp6071nsqr(&t,&t,18);
    	/* 2^594 - 1     */ gfp6071mul(&t,&t,&t2_18_0);

    	/* 2^603 - 2^9   */ gfp6071nsqr(&t,&t,9);
    	/* 2^603 - 1     */ gfp6071mul(&t,&t,&t2_9_0);

    	/* 2^607 - 2^4   */ gfp6071nsqr(&t,&t,4);
    	/* 2^607 - 4     */ gfp6071mul(&t,&t,&t12);
    	/* 2^607 - 3     */ gfp6071mul(einv,&t,e);
}
