/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^512-569) from the paper       |
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

#include "p512569.h"

void gfp512569inv(gfe_p512569 *einv,const gfe_p512569 *e) {

	gfp512569fltinv(einv,e);
	gfp512569makeunique(einv);
}

void gfp512569fltinv(gfe_p512569 *einv, const gfe_p512569 *e) {

	gfe_p512569 t,t7,t2_6_0,t2_7_0,t2_8_0,t2_15_0,t2_30_0,t2_60_0,t2_120_0,t2_240_0;

 	/* 2   */  gfp512569sqr(&t,e);
  	/* 3   */  gfp512569mul(&t,&t,e);
  	/* 6   */  gfp512569sqr(&t,&t);
  	/* 7   */  gfp512569mul(&t7,&t,e);
  	/* 56  */  gfp512569nsqr(&t,&t7,3);

  	/* 2^6   -  1    */  gfp512569mul(&t2_6_0,&t,&t7);

  	/* 2^7   -  2    */  gfp512569sqr(&t,&t2_6_0);
  	/* 2^7   -  1    */  gfp512569mul(&t2_7_0,&t,e);

  	/* 2^8   -  2    */  gfp512569sqr(&t,&t2_7_0);
  	/* 2^8   -  1    */  gfp512569mul(&t2_8_0,&t,e);        

  	/* 2^15  -  2^7  */  gfp512569nsqr(&t,&t2_8_0,7); 
  	/* 2^15  -  1    */  gfp512569mul(&t2_15_0,&t,&t2_7_0); 

  	/* 2^30  -  2^15 */  gfp512569nsqr(&t,&t2_15_0,15);     
  	/* 2^30  -  1    */  gfp512569mul(&t2_30_0,&t,&t2_15_0); 

  	/* 2^60  -  2^30 */  gfp512569nsqr(&t,&t2_30_0,30);   
  	/* 2^60  -  1    */  gfp512569mul(&t2_60_0,&t,&t2_30_0);     

  	/* 2^120 - 2^60  */  gfp512569nsqr(&t,&t2_60_0,60);     
  	/* 2^120 -  1    */  gfp512569mul(&t2_120_0,&t,&t2_60_0);     

  	/* 2^240 -  2^120*/  gfp512569nsqr(&t,&t2_120_0,120);    
  	/* 2^240 -  1    */  gfp512569mul(&t2_240_0,&t,&t2_120_0);   

  	/* 2^480 -  2^240*/  gfp512569nsqr(&t,&t2_240_0,240);     
 	/* 2^480 -  1    */  gfp512569mul(&t,&t,&t2_240_0);

	/* 2^495 -  2^15 */  gfp512569nsqr(&t,&t,15);
 	/* 2^495 -  1    */  gfp512569mul(&t,&t,&t2_15_0);

	/* 2^502 -  2^7  */  gfp512569nsqr(&t,&t,7);
 	/* 2^502 -  1    */  gfp512569mul(&t,&t,&t2_7_0);

	/* 2^512 -  2^10 */  gfp512569nsqr(&t,&t,10);
 	/* 2^512 -  769  */  gfp512569mul(&t,&t,&t2_8_0);
 	/* 2^512 -  642  */  gfp512569mul(&t,&t,&t2_7_0);
 	/* 2^512 -  579  */  gfp512569mul(&t,&t,&t2_6_0);
 	/* 2^512 -  572  */  gfp512569mul(&t,&t,&t7);
 	/* 2^512 -  571  */  gfp512569mul(einv,&t,e);
}
