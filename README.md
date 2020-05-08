## Efficient 64-bit arithmetic in Mersenne and pseudo-Mersenne prime order fields targeting the Intel architectures

This is the source code repository of the work [Efficient Arithmetic in (Pseudo-)Mersenne Prime Order Fields](https://eprint.iacr.org/2018/985.pdf), authored by [Kaushik Nath](kaushikn_r@isical.ac.in) & [Palash Sarkar](palash@isical.ac.in) of [Indian Statistical Institute, Kolkata, India](https://www.isical.ac.in).
This work focuses on efficient arithmetic in cryptographically relevant Mersenne and pseudo-Mersenne prime order fields, targeting the various Intel architectures. A total of 14 primes has been worked with, covering various security levels. 

To report a bug or make a comment regarding the implementations please drop a mail to: [Kaushik Nath](kaushikn_r@isical.ac.in).

---

### Compilation and execution of programs 
    
* Please compile the ```makefile``` in the **test** directory and execute the generated executable file. 
* One can change the architecture accordingly in the makefile before compilation. Default provided is ```Skylake```.
---

### Terminology for denoting various algorithms

* Meanings of the basic abbreviations:
    * **SL**: Saturated limb.
    
    * **USL**: Unsaturated limb.
    
    * **SCC**: Single carry chain.
    
    * **DCC**: Double (independent) carry chains.
    
    * **MP**: Mersenne prime.
    
    * **PMP**: Pseudo-Mersenne prime.
    
    * **maa**: Algorithms implemented using only ```mul```, ```imul```, ```add``` and ```adc``` assembly instructions.
    
    * **maax**: Algorithms which also use the ```mulx```, ```adcx```, ```adox``` instructions along with ```mul```, ```imul```, ```add``` and ```adc```.
    
* Algorithms for the saturated limb representation:
    * **mulSCC**: Multiply a word whose value is less than 2^64 to an integer given by a saturated limb representation using a single carry chain.
    
    * **mulSLDCC**: Multiply two integers given in saturated limb representations using double (independent) carry chains.
    
    * **sqrSLDCC**: Square an integer given in saturated limb representation using double carry chains.
    
    * **reduceSLMP**: Reduction algorithm to be applied to the outputs of mulSLDCC or sqrSLDCC when the underlying prime is a Mersenne prime.
    
    * **reduceSLPMP**: Reduction algorithm to be applied to the outputs of mulSLDCC or sqrSLDCC when the underlying prime is a pseudo-Mersenne prime.
    
    * **reduceSLPMPa**: A partial reduction algorithm to be applied to the outputs of mulSLDCC or sqrSLDCC when the underlying prime is a pseudo-Mersenne prime.
    
    * **mulSLa**: Multiply two integers given in saturated limb representations and perform an initial step of the reduction.
    
    * **sqrSLa**: Square an integer given in saturated limb representation and perform an initial step of the
reduction.

    * **reduceSL**: A generic reduction algorithm to be applied to the outputs of mulSLa/sqrSLa.
    
    * **farith-SLa**: Denotes the algorithm triplet which computes a field multiplication, squaring and inverse using mulSLa, sqrSLa and reduceSL.
    
    * **farith-SLMP**: Denotes the algorithm triplet which computes a field multiplication, squaring and inverse using mulSL, sqrSL and reduceSLMP. See the remark below for mulSL and sqrSL.
    
    * **farithx-SLMP**: Denotes the algorithm triplet which computes a field multiplication, squaring and inverse using mulSLDCC, sqrSLDCC and reduceSLMP.
    
    * **farithx-SLPMP**: Denotes the algorithm triplet which computes a field multiplication, squaring and inverse
using mulSLDCC, sqrSLDCC and reduceSLPMP.

    * **Remark**: 
    The output of mulSLDCC is the product of the two integers and the output of sqrSLDCC is the square of an integer. Algorithms mulSLDCC/sqrSLDCC utilize double carry chains to perform the computations. The product of two integers in the saturated limb representation can also be performed
without using double carry chains and similarly, the square of an integer in the saturated limb representation can be performed without using double carry chains. For the prime 2^255 - 19, the 4-limb [implementation](https://github.com/floodyberry/supercop/tree/master/crypto_sign/ed25519/amd64-64-24k) of [High-speed high-security signatures](https://link.springer.com/article/10.1007/s13389-012-0027-1) perform such computations. The underline algorithm of this implementation can be extended to work for arbitrary limb representations. We will denote the resulting multiplication and squaring algorithms by mulSL and sqrSL. Note that mulSL/sqrSL are different from mulSLa/sqrSLa since mulSLa/sqrSLa also perform an initial step of reduction while this is not done by mulSL/sqrSL.

* Algorithms for the unsaturated limb representation:
    * **mulUSL**: Multiply two integers given in unsaturated limb representations and perform an initial step of the reduction.
    
    * **sqrUSL**: Square an integer given in unsaturated limb representation and perform an initial step of the reduction.
    
    * **mulUSLa**: Multiply two integers given in unsaturated limb representations and perform an initial step of the reduction. This is a variant of mulUSL which is to be used when mulUSL leads to overflows.
    
    * **sqrUSLa**: Square an integer given in unsaturated limb representation and perform an initial step of the reduction. This is a variant of sqrUSL which is to be used when sqrUSL leads to overflows.
    
    * **reduceUSL**: A generic reduction algorithm to be applied to the outputs of mulUSL/sqrUSL or mulUSLa/sqrUSLa.
    
    * **reduceUSLA**: An algorithm to be applied to the outputs of mulUSL/sqrUSL or mulUSLa/sqrUSLa when the prime is of type A. For such primes, reduceUSLA is more efficient than reduceUSL.
    
    * **reduceUSLB**: An algorithm to be applied to the outputs of mulUSL/sqrUSL or mulUSLa/sqrUSLa when the prime is of type B. For such primes, reduceUSLB is more efficient than reduceUSL or reduceUSLA.
    
    * **farith-USL**: Denotes the algorithm triplet which computes a field multiplication, squaring and inverse using mulUSL, sqrUSL and reduceUSL.
    
    * **farith-USLA**: Denotes the algorithm triplet which computes a field multiplication, squaring and inverse using mulUSLA, sqrSLA and reduceUSLA.
    
    * **farith-USLB**: Denotes the algorithm triplet which computes a field multiplication, squaring and inverse using mulUSLB, sqrUSLB and reduceUSLB.
    
    * **farith-USLa**: Denotes the algorithm triplet which computes a field multiplication, squaring and inverse using mulUSLa, sqrUSLa and reduceUSLA.
    
* Grouping the implementations of various algorithms:
    * **Algorithms in the maa setting**: The algorithms farith-SLa, farith-USL, farith-USLA, farith-USLB and farith-USLa have been implemented in assembly using only the instructions ```mul```, ```imul```, ```add``` and ```adc``` to do arithmetic. These implementations are downward compatible with previous generations of Intel processors.
    
    * **Algorithms in the maax setting**: The implementations of the algorithms farithx-SLMP and farithx-SLPMP also use the instructions ```mulx```, ```adcx``` and ```adox``` for doing arithmetic. These implementations work on the Broadwell and later generation processors.

---

### Overview of various implementations in the repository

* **gf-p2-127-1**: Implementations in GF[2^127-1].
    * **SL**  : Saturated limb implementation using farith-SLMP. 
    * **SLDCC** : Saturated limb implementation using farithx-SLMP.
    
* **gf-p2-221-3**: Implementations in GF[2^221-3].
    * **SLDCC** : Saturated limb implementation using farithx-SLPMP.
    * **USL1** : Unsaturated limb implementation using farith-USLA.
    * **USL2** : Unsaturated limb implementation using farith-USL.
 
* **gf-p2-222-117**: Implementations in GF[2^222-117].
    * **SLDCC** : Saturated limb implementation using farithx-SLPMP.
    * **USL1** : Unsaturated limb implementation using farith-USLA.
    * **USL2** : Unsaturated limb implementation using farith-USL.

* **gf-p2-251-9**: Implementations in GF[2^251-9].
    * **SL** : Saturated limb implementation using farith-SLa.
    * **SLDCC** : Saturated limb implementation using farithx-SLPMP.
    * **USL1** : Unsaturated limb implementation using farith-USLA.
    * **USL2** : Unsaturated limb implementation using farith-USL.
    
* **gf-p2-255-19**: Implementations in GF[2^255-19].
    * **SL** : Saturated limb implementation using farith-SLa.
    * **SLDCC** : Saturated limb implementation using farithx-SLPMP.
    * **USL1** : Unsaturated limb implementation using farith-USLA.
    * **USL2** : Unsaturated limb implementation using farith-USL.
    
* **gf-p2-256-32-977**: Implementations in GF[2^256-2^32-977].
    * **SL** : Saturated limb implementation using farith-SLa.
    * **SLDCC** : Saturated limb implementation using farithx-SLPMP.
    * **USL1** : Unsaturated limb implementation using farith-USLA.
    * **USL2** : Unsaturated limb implementation using farith-USL.

* **gf-p2-266-3**: Implementations in GF[2^266-3].
    * **SL** : Saturated limb implementation using farith-SLa.
    * **SLDCC** : Saturated limb implementation using farithx-SLPMP.
    * **USL1** : Unsaturated limb implementation using farith-USLA.
    * **USL2** : Unsaturated limb implementation using farith-USL.

* **gf-p2-382-105**: Implementations in GF[2^382-105].
    * **SL** : Saturated limb implementation using farith-SLa.
    * **SLDCC** : Saturated limb implementation using farithx-SLPMP.
    * **USL1** : Unsaturated limb implementation using farith-USLB.
    * **USL2** : Unsaturated limb implementation using farith-USL.
    
* **gf-p2-383-187**: Implementations in GF[2^383-187].
    * **SL** : Saturated limb implementation using farith-SLa.
    * **SLDCC** : Saturated limb implementation using farithx-SLPMP.
    * **USL1** : Unsaturated limb implementation using farith-USLB.
    * **USL2** : Unsaturated limb implementation using farith-USL.

* **gf-p2-414-17**: Implementations in GF[2^414-17].
    * **SL** : Saturated limb implementation using farith-SLa.
    * **SLDCC** : Saturated limb implementation using farithx-SLPMP.
    * **USL1** : Unsaturated limb implementation using farith-USLA.
    * **USL2** : Unsaturated limb implementation using farith-USL.
    * **USL3** : Unsaturated limb implementation using farith-USLa.

* **gf-p2-511-187**: Implementations in GF[2^511-187].
    * **SLDCC** : Saturated limb implementation using farithx-SLPMP.
    * **USL1** : Unsaturated limb implementation using the reduction algorithm reduceUSL.
    * **USL2** : Unsaturated limb implementation using similar to farith-USLB. An extra iteration is needed in the reduction to manage overfull situations.
    
* **gf-p2-512-569**: Implementations in GF[2^512-569].
    * **SLDCC** : Saturated limb implementation using farithx-SLPMP.
    * **USL1** : Unsaturated limb implementation using farith-USL.
    * **USL2** : Unsaturated limb implementation using similar to farith-USLB. An extra iteration is needed in the reduction to manage overfull situations.

* **gf-p2-521-1**: Implementations in GF[2^521-1].
    * **SLDCC** : Saturated limb implementation using farithx-SLMP.
    * **USL1** : Unsaturated limb implementation using farith-USLA.
    * **USL2** : Unsaturated limb implementation using farith-USL.
    
* **gf-p2-607-1**: Implementations in GF[2^607-1].
    * **SLDCC** : Saturated limb implementation using farithx-SLMP.
    * **USL1** : Unsaturated limb implementation using farith-USL.
    * **USL2** : Unsaturated limb implementation using similar to farith-USLB. An extra iteration is needed in the reduction to manage overfull situations.

---    
