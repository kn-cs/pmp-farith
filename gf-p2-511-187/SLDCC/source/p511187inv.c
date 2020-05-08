/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^511-187) from the paper       |
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

#include "p511187.h"

void gfp511187inv(gfe_p511187 *einv,const gfe_p511187 *e) {

	gfp511187fltinv(einv,e);
	gfp511187reduce(einv);
	gfp511187makeunique(einv);
}

void gfp511187fltinv(gfe_p511187 *einv, const gfe_p511187 *e) {

	gfe_p511187 t,t2,t3,t5,t7,t67,t2_5_0,t2_10_0,t2_20_0,t2_40_0,t2_125_0,t2_250_0;

 	/* 2   */  gfp511187sqr(&t2,e);
  	/* 3   */  gfp511187mul(&t3,&t2,e);
  	/* 5   */  gfp511187mul(&t5,&t3,&t2);
  	/* 7   */  gfp511187mul(&t7,&t5,&t2);
  	/* 28  */  gfp511187nsqr(&t,&t7,2);
  	/* 31  */  gfp511187mul(&t2_5_0,&t,&t3);
  	/* 62  */  gfp511187sqr(&t,&t2_5_0);
  	/* 67  */  gfp511187mul(&t67,&t,&t5);  

  	/* 2^10  -  2^5  */  gfp511187nsqr(&t,&t,4); 
  	/* 2^10  -  1    */  gfp511187mul(&t2_10_0,&t,&t2_5_0); 

  	/* 2^20  -  2^10 */  gfp511187nsqr(&t,&t2_10_0,10);     
  	/* 2^20  -  1    */  gfp511187mul(&t2_20_0,&t,&t2_10_0); 

  	/* 2^40  -  2^20 */  gfp511187nsqr(&t,&t2_20_0,20);   
  	/* 2^40  -  1    */  gfp511187mul(&t2_40_0,&t,&t2_20_0);     

  	/* 2^80  -  2^40 */  gfp511187nsqr(&t,&t2_40_0,40);     
  	/* 2^80  -  1    */  gfp511187mul(&t,&t,&t2_40_0);     

  	/* 2^120 -  2^40 */  gfp511187nsqr(&t,&t,40);    
  	/* 2^120 -  1    */  gfp511187mul(&t,&t,&t2_40_0);   

  	/* 2^125 -  2^5  */  gfp511187nsqr(&t,&t,5);     
 	/* 2^125 -  1    */  gfp511187mul(&t2_125_0,&t,&t2_5_0);

	/* 2^250 -  2^125*/  gfp511187nsqr(&t,&t2_125_0,125);
 	/* 2^250 -  1    */  gfp511187mul(&t2_250_0,&t,&t2_125_0);

	/* 2^500 -  2^250*/  gfp511187nsqr(&t,&t2_250_0,250);
 	/* 2^500 -  1    */  gfp511187mul(&t,&t,&t2_250_0);

	/* 2^503 -  2^3  */  gfp511187nsqr(&t,&t,3);
 	/* 2^503 -  1    */  gfp511187mul(&t,&t,&t7);

	/* 2^511 -  2^8  */  gfp511187nsqr(&t,&t,8);
 	/* 2^511 -  189  */  gfp511187mul(einv,&t,&t67);
}
