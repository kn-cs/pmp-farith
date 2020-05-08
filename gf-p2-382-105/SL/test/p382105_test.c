/*
+-----------------------------------------------------------------------------+
| This code corresponds to the Galois field F(2^382-105) from the paper       |
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

#include<stdio.h>
#include<math.h>
#include"datatype.h"
#include"p382105.h"
#include"measure.h"

#define change_input(x,y,z)  {x.l[0] = y.l[0]^z.l[0];}
#define FILE stdout
void print_elem(const gfe_p382105 *);

int main() {

	gfe_p382105 e = {0xFFFFFFFFFFFFFF96,-1,-1,-1,-1,0x3FFFFFFFFFFFFFFF}; 

	//gfe_p382105 e = {0xFFFFFFFFFFFFFF95,-1,-1,-1,-1,0x3FFFFFFFFFFFFFFF}; 
	//gfe_p382105 e = {0xFFFFFFFFFFFFFF94,-1,-1,-1,-1,0x3FFFFFFFFFFFFFFF}; 
	//gfe_p382105 e = {0xFFFFFFFFFFFFFF93,-1,-1,-1,-1,0x3FFFFFFFFFFFFFFF}; 
	//gfe_p382105 e = {2,0,0,0,0,0};
	//gfe_p382105 e = {1,1,1,1,1,1};
	//gfe_p382105 e = {2,0,0,0,0,0};
	//gfe_p382105 e = {3,2,5,5,3,5};

	gfe_p382105 einv;
	
	fprintf(FILE,"\nThe field element is:\t\t"); print_elem(&e);  
	gfp382105inv(&einv,&e);
	fprintf(FILE,"The found inverse is:\t\t"); print_elem(&einv);  

	gfe_p382105 t;
	gfp382105mul(&t,&e,&einv); gfp382105reduce(&t); gfp382105makeunique(&t);
	fprintf(FILE,"The cross check value is:\t"); print_elem(&t);  

	fprintf(FILE,"Computing CPU-cycles. It will take some time. Please wait!\n\n");
	MEASURE_TIME({gfp382105mul(&t,&e,&e);change_input(e,t,e);});
	fprintf(FILE,"CPU-cycles for a single field-multiplication is:%6.0lf\n\n", ceil(((get_median())/(double)(N))));
	MEASURE_TIME({gfp382105sqr(&t,&e);change_input(e,t,e);});
	fprintf(FILE,"CPU-cycles for a single field-squaring is:%6.0lf\n\n", ceil(((get_median())/(double)(N))));
	MEASURE_TIME({gfp382105inv(&einv,&e);change_input(e,einv,e);});
	fprintf(FILE,"CPU-cycles for a single field-inversion is:%6.0lf\n\n", ceil(((get_median())/(double)(N))));
	
	return 0;
}


void print_elem(const gfe_p382105 *e){

	uchar8  i;

	for (i=NLIMBS-1; i>0; --i) 
		fprintf(FILE,"%16llX ",e->l[i]);
	fprintf(FILE,"%16llX \n\n",e->l[0]);
}

