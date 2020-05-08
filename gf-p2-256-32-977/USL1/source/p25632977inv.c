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

#include "p25632977.h"
#include "p25632977pack.h"

void gfp25632977inv(gfe_p25632977_4L *einv, const gfe_p25632977_4L *e) {

	gfe_p25632977_5L e5,einv5;

	gfp25632977pack45(&e5,e);
	gfp25632977fltinv(&einv5,&e5);
	gfp25632977reduce(&einv5);  
	gfp25632977pack54(einv,&einv5);
	gfp25632977makeunique(einv);
}

void gfp25632977fltinv(gfe_p25632977_5L *einv, const gfe_p25632977_5L *e) {

	gfe_p25632977_5L t,t3,t7,t2_6_0,t2_9_0,t2_11_0,t2_22_0,t2_44_0,t2_88_0;

 	/* 2  */ gfp25632977sqr(&t,e);
    	/* 3  */ gfp25632977mul(&t3,&t,e);
    	/* 6  */ gfp25632977sqr(&t,&t3);
    	/* 7  */ gfp25632977mul(&t7,&t,e);
        /* 56 */ gfp25632977nsqr(&t,&t7,3);

    	/* 2^6   - 1    */ gfp25632977mul(&t2_6_0,&t,&t7);

        /* 2^9   - 2^3  */ gfp25632977nsqr(&t,&t2_6_0,3);
        /* 2^9   - 1    */ gfp25632977mul(&t2_9_0,&t,&t7);

        /* 2^11  - 2^2  */ gfp25632977nsqr(&t,&t2_9_0,2);
        /* 2^11  - 1    */ gfp25632977mul(&t2_11_0,&t,&t3);

       	/* 2^22  - 2^11 */ gfp25632977nsqr(&t,&t2_11_0,11);
    	/* 2^22  - 1    */ gfp25632977mul(&t2_22_0,&t,&t2_11_0);

       	/* 2^44  - 2^22 */ gfp25632977nsqr(&t,&t2_22_0,22);
    	/* 2^44  - 1    */ gfp25632977mul(&t2_44_0,&t,&t2_22_0);

       	/* 2^88  - 2^44 */ gfp25632977nsqr(&t,&t2_44_0,44);
    	/* 2^88  - 1    */ gfp25632977mul(&t2_88_0,&t,&t2_44_0);

       	/* 2^176 - 2^88 */ gfp25632977nsqr(&t,&t2_88_0,88);
    	/* 2^176 - 1    */ gfp25632977mul(&t,&t,&t2_88_0);

       	/* 2^220 - 2^44 */ gfp25632977nsqr(&t,&t,44);
    	/* 2^220 - 1    */ gfp25632977mul(&t,&t,&t2_44_0);

       	/* 2^223 - 2^3  */ gfp25632977nsqr(&t,&t,3);
    	/* 2^223 - 1    */ gfp25632977mul(&t,&t,&t7);

       	/* 2^246 - 2^23 */ gfp25632977nsqr(&t,&t,23);
    	/* 2^246 - 2^22 - 1 */ gfp25632977mul(&t,&t,&t2_22_0);
       	/* 2^251 - 2^27 - 2^5 */ gfp25632977nsqr(&t,&t,5);
    	/* 2^251 - 2^27 - 2^5 + 1 */ gfp25632977mul(&t,&t,e);
       	/* 2^254 - 2^30 - 2^8 + 2^3 */ gfp25632977nsqr(&t,&t,3);
    	/* 2^254 - 2^30 - 2^8 + 2^3 + 2^2 - 1 */ gfp25632977mul(&t,&t,&t3);
       	/* 2^256 - 2^32 - 2^10 + 2^5 + 2^4 - 2^2 */ gfp25632977nsqr(&t,&t,2);
    	/* 2^256 - 2^32 - 2^10 + 2^5 + 2^4 - 2^2 + 1 */ gfp25632977mul(einv,&t,e);
}
