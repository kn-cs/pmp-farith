/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^127-1) from the paper         |
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

#include "p1271.h"

/* Routine taken from the work "Kummer strikes back: new DH speed records", authored by Bernstein et. al.
   Paper-link: https://link.springer.com/chapter/10.1007/978-3-662-45611-8_17
   Code-link:  https://github.com/floodyberry/supercop/tree/master/crypto_scalarmult/kummer/avx2/gfe.c
*/

void gfp1271inv(gfe_p1271 *einv, const gfe_p1271 *e) {

	gfe_p1271 z2,z3,z12,z15,z30,t;
	gfe_p1271 z2_5_0,z2_10_0,z2_20_0,z2_40_0,z2_80_0,z2_120_0,z2_125_0;

 	/* 2   */ gfp1271sqr(&z2,e); 
  	/* 3   */ gfp1271mul(&z3,&z2,e);           
  	/* 12  */ gfp1271nsqr(&z12,&z3,2);         
  	/* 15  */ gfp1271mul(&z15,&z12,&z3);        
  	/* 30  */ gfp1271sqr(&z30,&z15);           

  	/* 2^5   -  1    */  gfp1271mul(&z2_5_0,&z30,e);
  
  	/* 2^10  -  2^5  */  gfp1271nsqr(&t,&z2_5_0,5); 
  	/* 2^10  -  1    */  gfp1271mul(&z2_10_0,&t,&z2_5_0);

  	/* 2^20  -  2^10 */  gfp1271nsqr(&t,&z2_10_0,10);     
  	/* 2^20  -  1    */  gfp1271mul(&z2_20_0,&t,&z2_10_0); 

  	/* 2^40  -  2^20 */  gfp1271nsqr(&t,&z2_20_0,20);   
  	/* 2^40  -  1    */  gfp1271mul(&z2_40_0,&t,&z2_20_0);     

  	/* 2^80  -  2^40 */  gfp1271nsqr(&t,&z2_40_0,40);     
  	/* 2^80  -  1    */  gfp1271mul(&z2_80_0,&t,&z2_40_0);     

  	/* 2^120 -  2^40 */  gfp1271nsqr(&t,&z2_80_0,40);    
  	/* 2^120 -  1    */  gfp1271mul(&z2_120_0,&t,&z2_40_0);   

  	/* 2^125 -  2^5  */  gfp1271nsqr(&t,&z2_120_0,5);     
 	/* 2^125 -  1    */  gfp1271mul(&z2_125_0,&t,&z2_5_0);    

  	/* 2^127 -  2^2  */  gfp1271nsqr(&t,&z2_125_0,2);     
  	/* 2^127 -  3    */  gfp1271mul(einv,&t,e);
}
