/*********************************************
 * OPL 12.7.1.0 Model
 * Author: fujii
 * Creation Date: 2020/02/27 at 14:58:09
 *********************************************/
string str1=...;

range IR=0..1;
int P0=...;				// The Number of Thermal Power Plants
int S0=...; 			// The Number of Storage Plants
int R0=...;				// The Number of Reservoirs
int C0=...; 			// The Number of Constant Renewable Electricity Plants
int A0=...;				// The Number of Control Areas
int N0=...; 			// The Number of Nodes
int B0=...; 			// The Number of Branches
int L0=...;				// The Number of Demand Nodes 
int E0=...;				// The Number of Distributed Energy System Nodes

range AR0=0..A0-1;
range PR0=0..P0-1;
range SR0=0..S0-1;
range CR0=0..C0-1;
range NR0=0..N0-1;
range BR0=0..B0-1;
range RR0=0..R0-1;
range LR0=0..L0-1;
range ER0=0..E0-1;

int PN0[PR0]=...;			// Thermal Plant Node
int SN0[SR0]=...;			// Storage Node
int CN0[CR0]=...;			// Constant Renewable Node
int EN0[ER0]=...;			// Heat Storage Node
int LN0[LR0]=...;			// Demand Node
int BN0[BR0][IR]=...;

int D0=...; 			// The Number of Days of the year
int DB=...; 			// The Biginning Day
int DE=...;				// The Ending Day
int H=...;
int HB=H*(DB-1); 
int HE=H*DE-1;
range DR=DB-1..DE-1;
range HR=HB..HE;
int HW=...;
int H0=HW*H;				// Time Slots Aggregation Number (Divisor of 24)
range HR0=0..H0*DE-1;
float RDS=D0/(DE-DB+1);

int PTYN=...;			// The Number of Thermal Plant Types
int STYN=...;			// The Number of Storage Types
int CTYN=...;			// The Number of Cosntant Renewable Tyeps
int VTYN=...;			// The Number of Variable Renewable Types
int ETYN=...;			// The Number of Energy Systems Technology Types
int OTYN=...;

range VTR=0..VTYN-1;
range ETR=0..ETYN-1;
range OTR=0..OTYN-1;

int A=...;
int P=...;
int B=...;
int C=...;
int S=...;
int R=...;
int N=...;
int L=...;
int E=...;
int O=...;
int M=...;
int U=...;
int Elec=...;
int Syno=...;

range AR=0..A-1;
range PR=0..P-1;
range CR=0..C-1;
range SR=0..S-1;
range BR=0..B-1;
range RR=0..R-1;
range NR=0..N-1;
range LR=0..L-1;
range ER=0..E-1;
range OR=0..O-1;
range MR=0..M-1;
range UR=0..U-1;

int ZA[AR]=...;
int ZP[PR]=...;
int ZB[BR]=...;
int ZC[CR]=...;
int ZS[SR]=...;
int ZR[RR]=...;
int ZN[NR]=...;
int ZL[LR]=...;
int ZE[ER]=...;
int EM[ER]=...;
int ETY[ER]=...;
int OTY[OR]=...;
int BN[BR][IR]=...;

int PTY0[PR0]=...;
int CTY0[CR0]=...;
int STY0[SR0]=...;
int NA[NR0]=...;
int AN[NR]=...;
int OM[OR]=...;
float VU[HR][NR][VTR]=...;
int ANR[NR0][AR0]=...;

range dum=0..0;
int W=...;
range WR=0..W-1;
int TB0=HB div W;
int TE0=HE div W;
range TR0=TB0..TE0;
int KD=...;
range KR=0..KD-1;
int IK[dum][dum]=...;
int IX[dum][dum]=...;
int IS[dum][dum]=...;
float Kmin[KR]=...;
float FC[KR]=...;
float UCAP[PR]=...;
float CO2[PR]=...;
float OCR[PR]=...;
float UCAS[SR]=...;
float LOSS[BR]=...;
float LOADA[HR][AR]=...;
float PVC[PR]=...;
float STUC[PR]=...;
float CVC[CR]=...;
float EVC[OR]=...;
float VRES[NR0][VTR]=...;
float TARGET[0..2]=...;
float FPRC[dum]=...;
int NN[NR0]=...;

float SCE[SR]=...;
float SDE[SR]=...;
float EMC[MR][OTR]=...;
int PSC[ETR]=...;	
int IFD[OTR]=...;
int IES[ETR]=...;
float BLFC[HR][AR]=...;
float LFCF=...;
float OtherValue[0..2];
int FB0[BR0]=...;
float FHC[dum]=...;

int IXD=...;
range IXR=0..IXD-1;
int SM=...;
range ISR=0..SM+1;
float X0[WR][TR0][IXR];
float s0[TR0][ISR];
float s1[TR0][ISR];
float SP[TR0][BR][IR];
float KB[TR0][BR][IR];

int BA=sum(i in MR,j in OTR)ftoi(ceil(abs(EMC[i][j])/(1+abs(EMC[i][j]))));
int BB=CTYN+PTYN+2*VTYN+2*STYN+6;
int BC=sum(i in ETR)IES[i];

float ARCO2[AR0];
float ARCOST[AR0][0..10];
float TRCOST[AR0][AR0];			  
float T_Y[HR0][0..BA*(A0+1)-1];
float T_YS[HR0][0..BC*(A0+1)-1];
float T_X[HR0][0..BB*(A0+1)-1];
//float T_X2[HR0][0..17*(A0+1)-1];
float T_RS[HR0][RR0];
float T_KP[0..2*N0-1][0..PTYN-1];
float T_KR[0..2*N0-1];
float T_KS[0..2*N0-1][0..STYN-1];
float T_KC[0..2*N0-1][0..CTYN-1];
float T_KV[0..2*N0-1][0..VTYN-1];
float T_KE[0..2*N0-1];
float T_KD[0..2*A0-1][0..ETYN-1];
float T_TC[BR0][IR];
float T_XH[HR0][AR0];
//float T_XPEN[HR0][NR0];

int VRET[VTR]=...;
int VLFCN=...;
range VLFCNR=0..VLFCN-1;
int BBLFC=CTYN+PTYN+STYN+4+VLFCN+1;
int BBSYN=CTYN+PTYN+STYN+1;
float T_XLFCU[HR0][0..BBLFC*(A0+1)-1];
float T_XLFCD[HR0][0..BBLFC*(A0+1)-1];
float T_XSYN[HR0][0..BBSYN*(A0+1)-1];
float T_XCCS[HR0][PR0];
int FBT=sum(i in BR0)FB0[i];
float T_BLFC[HR0][0..7*FBT-1];
int IFB[BR];
int IFB0[0..FBT-1];
int IFBD;
int IE1[MR][OTR];
int IE2[OR];
float SYOIL;
float BSYN[AR]=...;
int KK=...;
range WKR1=0..KK-1;
int CO2DE[OTR]=...;
float CO2Tax=...; 
int NCO2=...;
int IE[UR][OTR]=...;
int HyNum=...;
range HYR=0..HyNum-1;


execute ReportWrite {
	var f = new IloOplInputFile();
	var d,h,v,u,i,j,t,h1,h0,i0,j0,hh,g,n,ssmin,w,a0,a1;
	var A1,A2,A3,A4,A5,A6,A7,A8,A9,A10;
	var str,sub;
	i0=0;
	for(i in BR0)if(FB0[i]==1)IFB0[i0++]=i;
	IFBD=0;for(i in BR)if(FB0[ZB[i]]==1)IFB[IFBD++]=i;
	A1=CTYN;
	A2=A1+PTYN;
	A3=A2+VTYN;
	A4=A3+STYN+1;
	A5=A4+STYN+1;
	A6=A5+VTYN;
	A7=A6+1;
	A8=A7+1;
	A9=A8+1;
	A10=A9+1;
	
	writeln("Reading");
	for(t in TR0){
		str=str1+"res"+t+".csv";
	   	f.open(str);
   		if (f.exists) {
    		write(t," ");
			for(w in WR){
				str=f.readline();
  				sub=str.split(",");
	  			for(i in IXR)X0[w][t][i]=sub[i];
    		}	  			
			str=f.readline();
			sub=str.split(",");
  			for(i in ISR)s0[t][i]=sub[i];
			str=f.readline();
			sub=str.split(",");
  			for(i in ISR)s1[t][i]=sub[i];
  			for(j in IR){
				str=f.readline();
  				sub=str.split(",");
	  			for(i in BR)SP[t][i][j]=sub[i];
			}  	
			for(j in IR){
				str=f.readline();
  				sub=str.split(",");
	  			for(i in BR)KB[t][i][j]=sub[i];
			}  				
			f.close();
			if((t+1)%10==0)writeln();
		}
	}
	writeln();

	i0=0;
	for(i in MR)for(j in OTR)if(EMC[i][j]!=0)IE1[i][j]=i0++;
	i0=0;
	for(i in OR)if(IES[IFD[OTY[i]]]==1)IE2[i]=i0++;
	
	writeln("Accounting");
	for(d in DR){
	  	for(hh=0;hh<H;hh++){
	  		h1=hh+H*d;
	  		h0=hh*HW+H0*d;
			t=Opl.floor(h1/W);
			w=h1-W*t;
			for(i in MR)for(j in OR)if(EMC[i][OTY[j]]!=0) T_Y[h0][BA*NA[EN0[OM[j]]]+IE1[i][OTY[j]]]+=EMC[i][OTY[j]]*X0[w][t][IX[9][j]];
			for(j in OR)if(IES[IFD[OTY[j]]]==1)T_YS[h0][(A0+1)*IE2[OTY[j]]+NA[EN0[OM[j]]]]+=X0[w][t][IX[9][j]];
			for(i in CR) T_X[h0][BB*NA[CN0[ZC[i]]]+CTY0[ZC[i]] ]+=X0[w][t][IX[4][i]];
			for(i in PR) T_X[h0][BB*NA[PN0[ZP[i]]]+PTY0[ZP[i]]+A1]+=(1-OCR[i])*X0[w][t][IX[0][i]];
			for(i in NR)for(j in VTR)T_X[h0][BB*NA[ZN[i]]+j+A2]+=X0[w][t][IX[11][i+N*j]];
			for(i in SR) T_X[h0][BB*NA[SN0[ZS[i]]]+A3]-=X0[w][t][IX[5][i]];
			for(j in OR)if(EMC[Elec][OTY[j]]<0)T_X[h0][BB*NA[EN0[OM[j]]]+A3+1]+=EMC[Elec][OTY[j]]*X0[w][t][IX[9][j]];
			for(i in SR) T_X[h0][BB*NA[SN0[ZS[i]]]+A4]+=X0[w][t][IX[6][i]];
			for(j in OR)if(EMC[Elec][OTY[j]]>0)T_X[h0][BB*NA[EN0[OM[j]]]+A4+1]+=EMC[Elec][OTY[j]]*X0[w][t][IX[9][j]];
			for(i in NR)for(j in VTR)T_X[h0][BB*NA[ZN[i]]+j+A5]+=X0[w][t][IX[31][i+N*j]];
			for(i in BR) T_X[h0][BB*NA[BN0[ZB[i]][0]]+A6]+=X0[w][t][IX[7][i]]-X0[w][t][IX[8][i]];
			for(i in BR) T_X[h0][BB*NA[BN0[ZB[i]][1]]+A6]+=X0[w][t][IX[8][i]]-X0[w][t][IX[7][i]];
			for(i in BR) T_X[h0][BB*NA[BN0[ZB[i]][0]]+A7]-=LOSS[i]*(X0[w][t][IX[7][i]]+X0[w][t][IX[8][i]]);
			for(i in BR) T_X[h0][BB*NA[BN0[ZB[i]][1]]+A7]-=LOSS[i]*(X0[w][t][IX[8][i]]+X0[w][t][IX[7][i]]);
			for(i in AR) T_X[h0][BB*ZA[i]+A8]+=LOADA[h1][i];
			for(i in PR) T_X[h0][BB*NA[PN0[ZP[i]]]+A9]-=X0[w][t][IX[2][i]]+X0[w][t][IX[3][i]];
			//for(n in NR) T_XPEN[h0][ZN[n]]+=X0[w][t][IX[40][n]];
			for(i in ER0)for(j in HYR)T_XH[h0][NA[EN0[i]]]+=X0[w][t][IX[39][i+E0*j]];
			
			//LFC Outputs
			for(i in CR) T_XLFCU[h0][BBLFC*NA[CN0[ZC[i]]]+CTY0[ZC[i]]]+=X0[w][t][IX[18][i]];
			for(i in PR) T_XLFCU[h0][BBLFC*NA[PN0[ZP[i]]]+PTY0[ZP[i]]+A1]+=X0[w][t][IX[14][i]];
			for(i in SR) T_XLFCU[h0][BBLFC*NA[SN0[ZS[i]]]+A2]+=X0[w][t][IX[16][i]];
			for(i in BR)if(AN[BN[i][0]] != AN[BN[i][1]])T_XLFCU[h0][BBLFC*NA[BN0[ZB[i]][0]]+A2+1]+=X0[w][t][IX[20][i]]-X0[w][t][IX[21][i]];
			for(i in BR)if(AN[BN[i][0]] != AN[BN[i][1]])T_XLFCU[h0][BBLFC*NA[BN0[ZB[i]][1]]+A2+1]+=X0[w][t][IX[21][i]]-X0[w][t][IX[20][i]];
			for(i in PR) T_XLFCU[h0][BBLFC*NA[PN0[ZP[i]]]+A2+2]+=X0[w][t][IX[24][i]];
			for(i in PR) T_XLFCU[h0][BBLFC*NA[PN0[ZP[i]]]+A2+3]+=X0[w][t][IX[25][i]];
			for(i in UR) T_XLFCU[h0][BBLFC*NA[EN0[OM[IE[i][0]]]]+A2+4]+=X0[w][t][IX[37][i]];
			for(i in AR) for(j in VLFCNR)T_XLFCU[h0][BBLFC*ZA[i]+A2+5+j]+=X0[w][t][IX[30][j*A+i]];
			for(i in AR) T_XLFCU[h0][BBLFC*ZA[i]+A2+5+VLFCN]+=BLFC[h1][i];
			
			for(i in CR) T_XLFCD[h0][BBLFC*NA[CN0[ZC[i]]]+CTY0[ZC[i]] ]+=X0[w][t][IX[19][i]];
			for(i in PR) T_XLFCD[h0][BBLFC*NA[PN0[ZP[i]]]+PTY0[ZP[i]]+A1]+=X0[w][t][IX[15][i]];
			for(i in SR) T_XLFCD[h0][BBLFC*NA[SN0[ZS[i]]]+A2]+=X0[w][t][IX[17][i]];
			for(i in BR)if(AN[BN[i][0]] != AN[BN[i][1]])T_XLFCD[h0][BBLFC*NA[BN0[ZB[i]][0]]+A2+1]+=X0[w][t][IX[23][i]]-X0[w][t][IX[22][i]];
			for(i in BR)if(AN[BN[i][0]] != AN[BN[i][1]])T_XLFCD[h0][BBLFC*NA[BN0[ZB[i]][1]]+A2+1]+=X0[w][t][IX[22][i]]-X0[w][t][IX[23][i]];
			for(i in PR) T_XLFCD[h0][BBLFC*NA[PN0[ZP[i]]]+A2+2]+=X0[w][t][IX[26][i]];
			for(i in PR) T_XLFCD[h0][BBLFC*NA[PN0[ZP[i]]]+A2+3]+=X0[w][t][IX[27][i]];
			for(i in UR) T_XLFCD[h0][BBLFC*NA[EN0[OM[IE[i][0]]]]+A2+4]+=X0[w][t][IX[38][i]];
			for(i in AR) for(j in VLFCNR)T_XLFCD[h0][BBLFC*ZA[i]+A2+5+j]+=X0[w][t][IX[30][j*A+i]];
			for(i in AR) T_XLFCD[h0][BBLFC*ZA[i]+A2+5+VLFCN]+=BLFC[h1][i];
			
			//SYN output
			for(i in CR) T_XSYN[h0][BBSYN*NA[CN0[ZC[i]]]+CTY0[ZC[i]]]+=X0[w][t][IX[34][i]];
			for(i in PR) T_XSYN[h0][BBSYN*NA[PN0[ZP[i]]]+PTY0[ZP[i]]+A1]+=X0[w][t][IX[32][i]];
			for(i in SR) T_XSYN[h0][BBSYN*NA[SN0[ZS[i]]]+A2]+=X0[w][t][IX[33][i]];
			for(i in AR) T_XSYN[h0][BBSYN*ZA[i]+A2+STYN]+=BSYN[i];
			
			for(i=0;i<IFBD;i++){
			  	T_BLFC[h0][7*IFB0[ZB[IFB[i]]]  ]=X0[w][t][IX[8][IFB[i]]]-X0[w][t][IX[7][IFB[i]]];
				T_BLFC[h0][7*IFB0[ZB[IFB[i]]]+1]=X0[w][t][IX[21][IFB[i]]]-X0[w][t][IX[20][IFB[i]]];
				T_BLFC[h0][7*IFB0[ZB[IFB[i]]]+2]=X0[w][t][IX[23][IFB[i]]]-X0[w][t][IX[22][IFB[i]]];
				T_BLFC[h0][7*IFB0[ZB[IFB[i]]]+3]=-KB[t][IFB[i]][0];
				T_BLFC[h0][7*IFB0[ZB[IFB[i]]]+4]= KB[t][IFB[i]][1];
				T_BLFC[h0][7*IFB0[ZB[IFB[i]]]+5]=-KB[t][IFB[i]][0]-Math.max(0,X0[w][t][IX[8][IFB[i]]]-X0[w][t][IX[7][IFB[i]]]);
				T_BLFC[h0][7*IFB0[ZB[IFB[i]]]+6]= KB[t][IFB[i]][1]+Math.max(0,X0[w][t][IX[7][IFB[i]]]-X0[w][t][IX[8][IFB[i]]]);
			}			
			for(i=0;i<BA;i++)for(j in AR)T_Y[h0][BA*A0+i]+=T_Y[h0][BA*ZA[j]+i];
			for(i=0;i<BA*(A0+1);i++)if((v=T_Y[h0][i])!=0)for(h=h0+1;h<h0+HW;h++)T_Y[h][i]=v;
			for(i=0;i<BC;i++)for(j in AR)T_YS[h0][(A0+1)*i+A0]+=T_YS[h0][(A0+1)*i+ZA[j]];
			for(i=0;i<BC*(A0+1);i++)if((v=T_YS[h0][i])!=0)for(h=h0+1;h<h0+HW;h++)T_YS[h][i]=v;
			
			for(i=0;i<BB;i++)for(j in AR)T_X[h0][BB*A0+i]+=T_X[h0][BB*ZA[j]+i];
			for(i=0;i<BB*(A0+1);i++)if((v=T_X[h0][i])!=0)for(h=h0+1;h<h0+HW;h++)T_X[h][i]=v;

			for(i in RR) T_RS[h0][ZR[i]]=X0[w][t][IX[10][i]];
			for(i in RR)if((v=T_RS[h0][ZR[i]])!=0)for(h=h0+1;h<h0+HW;h++)T_RS[h][ZR[i]]=v;
			
			for(i in PR) T_XCCS[h0][ZP[i]]=X0[w][t][IX[36][i]];
			for(i in PR)if((v=T_XCCS[h0][ZP[i]])!=0)for(h=h0+1;h<h0+HW;h++)T_XCCS[h][ZP[i]]=v;
			
			for(i=0;i<BBLFC;i++)for(j in AR)T_XLFCU[h0][BBLFC*A0+i]+=T_XLFCU[h0][BBLFC*ZA[j]+i];
			for(i=0;i<BBLFC;i++)for(j in AR)T_XLFCD[h0][BBLFC*A0+i]+=T_XLFCD[h0][BBLFC*ZA[j]+i];
			for(i=0;i<BBLFC*(A0+1);i++)if((v=T_XLFCU[h0][i])!=0)for(h=h0+1;h<h0+HW;h++)T_XLFCU[h][i]=v;
			for(i=0;i<BBLFC*(A0+1);i++)if((v=T_XLFCD[h0][i])!=0)for(h=h0+1;h<h0+HW;h++)T_XLFCD[h][i]=v;
			
			for(i=0;i<BBSYN;i++)for(j in AR)T_XSYN[h0][BBSYN*A0+i]+=T_XSYN[h0][BBSYN*ZA[j]+i];
			for(i=0;i<BBSYN*(A0+1);i++)if((v=T_XSYN[h0][i])!=0)for(h=h0+1;h<h0+HW;h++)T_XSYN[h][i]=v;
			
		}
		write(d," ");
		if((d+1)%10==0)writeln();
	}

	for(i in PR)T_KP[PN0[ZP[i]]+N0][PTY0[ZP[i]]]+=UCAP[i]*Kmin[IK[0][i]];
	for(i in PR)T_KP[PN0[ZP[i]]][PTY0[ZP[i]]]+=UCAP[i]*s1[TE0][IK[0][i]];
	for(i in SR)T_KS[SN0[ZS[i]]+N0][STY0[ZS[i]]]+=UCAS[i]*Kmin[IK[1][i]];
	for(i in SR)T_KS[SN0[ZS[i]]][STY0[ZS[i]]]+=UCAS[i]*s1[TE0][IK[1][i]];
  	for(i in CR)T_KC[CN0[ZC[i]]+N0][CTY0[ZC[i]]]+=Kmin[IK[2][i]];
  	for(i in CR)T_KC[CN0[ZC[i]]   ][CTY0[ZC[i]]]+=s1[TE0][IK[2][i]];
 	for(i in NR0)if(NN[i]!=-1)for(j in VTR)T_KV[i+N0][j]+=VRES[i][j]*Kmin[IK[4][j*A+AN[NN[i]]]];
 	for(i in NR0)if(NN[i]!=-1)for(j in VTR)T_KV[i   ][j]+=VRES[i][j]*s1[TE0][IK[4][j*A+AN[NN[i]]]];
	for(i in PR)T_KR[PN0[ZP[i]]+N0]=0;
	for(i in PR)T_KR[PN0[ZP[i]]   ]+=s1[TE0][IK[6][i]]+s1[TE0][IK[7][i]];
	for(i in ER)T_KE[EN0[EM[i]]+N0]+=PSC[ETY[i]]*Kmin[IK[3][i]];
	for(i in ER)T_KE[EN0[EM[i]]]+=PSC[ETY[i]]*s1[TE0][IK[3][i]];
	for(i in ER)T_KD[NA[EN0[EM[i]]]+A0][ETY[i]]+=Kmin[IK[3][i]];
	for(i in ER)T_KD[NA[EN0[EM[i]]]][ETY[i]]+=s1[TE0][IK[3][i]];
	
	for(i in PR){CO2[i]*=RDS; PVC[i]*=RDS; STUC[i]*=RDS;}
	for(i in CR)CVC[i]*=RDS;
	for(i in OR)EVC[i]*=RDS;
	LFCF*=RDS;
	for(t in TR0)for(w in WR){
	  	for(i in PR)ARCO2[NA[PN0[ZP[i]]]]+=CO2[i]*X0[w][t][IX[1][i]]/1000;
		for(i in PR)ARCOST[NA[PN0[ZP[i]]]][0]+=PVC[i]*X0[w][t][IX[1][i]];
		for(i in OR)ARCOST[NA[EN0[OM[i]]]][0]-=EMC[NCO2][OTY[i]]*CO2DE[OTY[i]]*CO2Tax*X0[w][t][IX[9][i]];
		for(i in PR)ARCOST[NA[PN0[ZP[i]]]][1]+=STUC[i]*X0[w][t][IX[12][i]];
		for(i in CR)ARCOST[NA[CN0[ZC[i]]]][2]+=CVC[i]*X0[w][t][IX[4][i]];
		for(i in OR)ARCOST[NA[EN0[OM[i]]]][3]+=EVC[i]*X0[w][t][IX[9][i]];
		for(i in AR)ARCOST[i][10]+=LFCF*(X0[w][t][IX[28][i]]+X0[w][t][IX[29][i]]);
	}		
	for(i in PR)ARCOST[NA[PN0[ZP[i]]]][4]+=FC[IK[0][i]]*s1[TE0][IK[0][i]];
	for(i in SR)ARCOST[NA[SN0[ZS[i]]]][5]+=FC[IK[1][i]]*s1[TE0][IK[1][i]];
	for(i in CR)ARCOST[NA[CN0[ZC[i]]]][6]+=FC[IK[2][i]]*s1[TE0][IK[2][i]];
	for(i in ER)ARCOST[NA[EN0[EM[i]]]][7]+=FC[IK[3][i]]*s1[TE0][IK[3][i]];
	for(i in VTR)for(j in AR)ARCOST[ZA[j]][8]+=FC[IK[4][i*A+j]]*s1[TE0][IK[4][i*A+j]];
	for(i in PR)ARCOST[NA[PN0[ZP[i]]]][9]+=(FC[IK[6][i]]*s1[TE0][IK[6][i]]+FC[IK[7][i]]*s1[TE0][IK[7][i]]);
	
	for(i in BR){
	  	if(NA[BN0[ZB[i]][0]]<=NA[BN0[ZB[i]][1]]){a0=NA[BN0[ZB[i]][0]];a1=NA[BN0[ZB[i]][1]];}
	  	else {a0=NA[BN0[ZB[i]][1]];a1=NA[BN0[ZB[i]][0]];}
	  	TRCOST[a0][a1]+=FC[IK[5][i]]*s1[TE0][IK[5][i]];
  	}
  	for(i in AR0)for(j=0;j<11;j++)ARCOST[i][j]/=1000;
  	for(i in AR0)for(j in AR0)TRCOST[i][j]/=1000;
  	for(i in BR)for(j in IR)for(t in TR0)T_TC[ZB[i]][j]+=SP[t][i][j];
  	CO2PRICE=
  	OtherValue[0]=(TARGET[2]-s1[TE0][IS[2][U+1]])*FHC[1]*FPRC[1]/1000;
  	OtherValue[1]=s1[TE0][IS[2][U+1]]/1000;
  	OtherValue[2]=1/RDS;
  	writeln();
	writeln("Writing");	
}


 