/*********************************************
 * OPL 12.7.1.0 Model
 * Author: fujii
 * Creation Date: 2020/02/27 at 14:53:24
 *********************************************/

int FLAG_DEC=...;
int FLAG_BDC=...;
int FLAG_INI=...;
int FLAG_FWD=...;
int FLAG_MIP=...;
int FLAG_REP=...;
int FLAG_CPH=...;
int FLAG_LPF=...;
string str0=...;
string str1=...;
range dum=0..0;

int DB=...;
int DE=...;
int VTYN=...;
int ETYN=...;
int OTYN=...;
int H=...;
int HB=H*(DB-1); 
int HE=H*DE-1;
range DR=DB-1..DE-1;
range HR=HB..HE;
range VR=0..VTYN-1;
range IR=0..1;
float TARGET[0..2]=...; //CO2Max, SynOil Max, SynOil Min
float D0=...;
int A=...;
int P=...;
int S=...;
int R=...;
int C=...;
int E=...;
int O=...;
int B=...;
int NB=...;
int M=...;
int N=...;
int F=...;
range AR=0..A-1;
range NR=0..N-1;
range PR=0..P-1;
range SR=0..S-1;
range RR=0..R-1;
range CR=0..C-1;
range ER=0..E-1;
range OR=0..O-1;
range BR=0..B-1;
range MR=0..M-1;
range FR=0..F-1;
range NBR=0..NB-1;
float OCR[PR]=...;
float UCAP[PR]=...;
float MOL[PR]=...;
float PVC[PR]=...;
float STUC[PR]=...;
float LFCR[PR]=...;
float SYN[PR]=...;
int MS[PR]=...;
int MO[PR]=...;
int MD=...;
int REG[IR][PR]=...;
float CVC[CR]=...;
float CRE[DR][CR]=...;
float CLFCR[CR]=...;
float CSYN[CR]=...;
float VU[HR][NR][VR]=...;
int VSUP[VR]=...;
int VLFCN=...;
range VLFCNR=0..VLFCN-1;
int VRET[0..VTYN-1]=...;
float VLFCR[0..VLFCN-1]=...;
int AN[NR]=...;
float UCAS[SR]=...;
float MSR[SR][IR]=...;
float SDR[RR]=...;
float SCE[SR]=...;
float SDE[SR]=...;
float SLFCR[SR]=...;
float SSYN[SR]=...;
int RVMN[RR]=...;
int RVM[RR][SR]=...;
int BN[BR][IR]=...;
int NBA[NBR]=...;
float XX[BR]=...;             
float MFLOW[BR][IR]=...;       
int FB[BR]=...;
int EBS[MR]=...;
float EUS[ER]=...;

int U=...;
range UR=0..U-1;
range OTR=0..OTYN-1;
float ECY[UR]=...;
float EDT[UR]=...;
float ECT[UR]=...;
int ICAPN[ER]=...;
int ICAP[ER][OTR]=...;
int IEN[UR]=...;
int IE[UR][OTR]=...;
float ES[UR][OTR]=...;

float FPRC[FR]=...;			// Fuel Price [JPY/Mcal]
float FHC[FR]=...;
float FCC[FR]=...;

int IK[dum][dum]=...;
int KD=...;
range KR=0..KD-1;
float FC[KR]=...;
int IS[dum][dum]=...;
int IZ[IR][dum]=...;
int IU[0..1][UR]=...;
int SM=...;
range ISR=0..SM+1;
float URT[DR][PR]=...;			// Availability of Thermal Plants by Date
float SLOPE[PR]=...;
float INSEC[PR]=...;
int LFC[PR]=...;
float LFCF=...;
float Kmax[KR]=...;
float Kmin[KR]=...;
float RVC[RR]=...;
float EVC[OR]=...;
int Elec=...;
int Syno=...;
float CO2[PR]=...;

int W=...;
range WR=0..W-1;
int TB0=HB div W;
int TE0=HE div W;
range TR0=TB0..TE0;
int Q[dum][IR][TR0]=...;
int QN[IR]=...;
range QNR=0..max(i in IR)QN[i];
int ICD[IR]=...;
int IC[dum]=...;
range ICR=0..ICD[1]+1;
range ICR0=0..ICD[0]-1;
range ICR1=0..ICD[1]-1;
int IM=R+U+MD;
int ICD2=ICD[0]-IM;
range ICR2=ICD2..ICD[0]-1;
range ICR3=ICD[0]..ICD[1]-1;

float X[IR][ICR][TR0][dum]=...;
float BF[IR][dum][TR0]=...;
float OBJ[dum][TR0]=...;

int TB=...;
int TE=...;
range TR=TB..TE;

int IXD=...;
range IXR=0..IXD-1;
int IX[dum][dum]=...;

int JZD=...;
range JZR=0..JZD-1;
int JZ[dum][dum][dum]=...;

int ICE1N[NR][MR]=...;
int ICE1[NR][MR][dum]=...;
float VCE1[NR][MR][dum]=...;
float LOADN[HR][NR]=...;

int ICV5N[AR]=...;
int ICV5[AR][dum]=...;
float VCV5[AR][dum]=...;
float BCV5[HR][AR]=...;

int ICK2N[AR]=...;
int ICK2[AR][dum]=...;
float VCK2[DR][AR][dum]=...;
float BCK2[DR][AR]=...;
int TDB[TR0]=...;
int TDE[TR0]=...;

range UR1=0..U+1;
range UR2=0..U+2+A-1;
int ICCN[UR1]=...;
int ICC[UR1][dum]=...;
float VCC[UR1][dum]=...;
int METICCM=...;
int METICC[AR][dum]=...;
int METICCN[AR]=...;
float METVCC[AR][dum]=...;
float METLOAD[DR][AR]=...;

int LFCN[AR][IR]=...; 
int LFCI[AR][dum][IR]=...; 
float VLFC[AR][dum][IR]=...;
int RLFCN[AR][VLFCNR]=...; 
int RLFC[AR][VLFCNR][dum]=...;
float BLFC[HR][AR]=...;
int SYNN[AR]=...;
int SYNI[AR][dum]=...;
int IEHy[UR]=...;
int ESHy[UR]=...;

int KK=...;
range WKR=0..KK;
range WKR1=0..KK-1;
int WEEK[WKR]=...;
float EMC[MR][OTR]=...;	
int NCO2=...;
int OTY[OTR]=...;
int CO2DE[OTR]=...;
float CO2Tax=...; 
float ESLFC[UR][OTR]=...;
int CAPL[UR]=...;
int TOE[OR]=...;

float BSYN[AR]=...;
float BLT=...;
float BOMR=...;
int SynNo=...;
range SY=0..SynNo-1;
float BBSYN[SY]=...;
int SYNAR[SY][AR]=...;
int KSYN[SY]=...;
int E0=...;
range ER0=0..E0-1;
range ER02=0..2*E0-1;
float HySch[DR][ER0]=...;
int HyNum=...;


int COAL=...;
int LNG=...;
int NUCLEAR=...;
int OIL=...;
int PP=COAL+LNG+NUCLEAR+OIL;
range NHR=PP..PP+COAL-1;
range NHR2=PP+COAL..PP+2*COAL-1;
range HHR=PP+2*COAL..PP+2*COAL+LNG-1;
range HHR2=PP+2*COAL+LNG..PP+2*COAL+2*LNG-1;
range CLR=0..COAL-1;
range LNR=COAL..COAL+LNG-1;
float EXIUP[PR]=...;

range ZR=0..MD-1;

execute LPF{
  	var t,i,w;
	var ofile;
	var str;
  	if(FLAG_LPF==1&&TB==TB0){
		str=str0+"SYS.csv";
  	  	ofile=new IloOplOutputFile(str);
  	  	ofile.writeln(TB0,",",TE0,",",W,",",N,",",P,",",C,",",VTYN,",",A,",",SM+2);
  	  	for(i in PR)ofile.write(IK[0][i],",");
	  	ofile.writeln();
	  	for(i in CR)ofile.write(IK[2][i],",");
	  	ofile.writeln();
		for(i in AR)for(j in VR)ofile.write(IK[4][j*A+i],",");
  		ofile.writeln();
  		for(a in AR)ofile.write(ICK2N[a],",");
  		ofile.writeln();  		
  	  	ofile.close();
  	  	
  	  	for(t in TR0){
  	  	  	str=str0+"DATA"+t+".csv";
  	  	  	ofile=new IloOplOutputFile(str);
			for(w in WR){
				for(i in NR)ofile.write(BCE1[t*W+w][i][0],",");
		  		ofile.writeln();				
		  		d=Math.floor((t*W+w)/H);
				for(i in PR)ofile.write(URT[d][i],",");
		  		ofile.writeln();
		  		d=Math.floor((t*W+w)/H);
				for(i in CR)ofile.write(CRE[d][i],",");
		  		ofile.writeln();
				for(i in NR)for(j in VR)ofile.write(VU[t*W+w][ND[i]][j],",");
		  		ofile.writeln();
				for(i in AR)ofile.write(BCV5[t*W+w][i],",");
		  		ofile.writeln();
		  		for(i in AR)ofile.write(BLFC[t*W+w][i],",");
		  		ofile.writeln();
  			}
  			for(d=TDB[t];d<=TDE[t];d++){
  			  	for(a in AR){ofile.write(BCK2[d][a],",");for(i=0;i<=ICK2N[a];i++)ofile.write(VCK2[d][a][i],",");}  			  	  	
		  		ofile.writeln();
  			}
		  	ofile.close();
  		}
  	}
 }  	
 
int PSTEP[t in TR]=t-1;
int NSTEP[t in TR]=t+1;
int TBF[TR];
int TEF[TR];
int SELECT[t in TR]=1;
int WW[WR];
int ML[MR];
float DS=(DE-DB+1)/D0;
float zero=1e-8;

execute PPP{
  	var t,q,i,j;
 	PSTEP[TB]=TE;
 	NSTEP[TE]=TB;
 	WW[W-1]=1;
 	ML[0]=1;
 	if(TB==TB0)TBF[TB]=1;
 	if(TE==TE0)TEF[TE]=1;
 	if(FLAG_INI>0){
 	  	NSTEP[TB]=TE;
 	  	for(t in TR)if(t>TB0+FLAG_INI-1&&t<TE0-FLAG_INI+1)SELECT[t]=0;
 	  	DS=2*FLAG_INI/D0;
 	}
  	for(t in TR)if(SELECT[t]==1){
  		for(j in IR)if(BF[j][ICD[1]+2][t]!=0){
			if(Q[0][j][t]==(q=Q[1][j][t]))Q[0][j][t]++;
			for(i in ICR){if(Math.abs(v=BF[j][i][t])<zero)v=0;X[j][i][t][q]=v;}
			if(FLAG_FWD!=0){
				if(j==0&&TB!=TB0&&X[0][ICD[1]+1][TB-1][0]==0)for(i in ICR)X[0][i][TB-1][0]=BF[0][i][t];
				if(j==1&&TE!=TE0&&X[1][ICD[1]  ][TE+1][0]==0)for(i in ICR)X[1][i][TE+1][0]=BF[1][i][t];
  			}			
  		   	BF[j][ICD[1]+2][t]=0;
      	}  		   	
   		write(t," ");
 	}
}


dvar float  obj[TR];
dvar float+ x[WR][TR][IXR];
dvar float  y[WR][TR][NR];
dvar float+ z[TR][JZR];
dvar int    zi[TR][JZR] in 0..1;
dvar float  s1[TR][ISR];					// State Variables post(IK:Capacity, IS0:Pumping Reservoir, IS1:Battery SOC, IS2:Battery Cumulative Charge, IS3:CO2 adn SynOil, IZ:UC)
dvar float  s0[TR][ISR];					// State Variables pre (IK:Capacity, IS0:Pumping Reservoir, IS1:Battery SOC, IS2:Battery Cumulative Charge, IS3:CO2 adn SynOil, IZ:UC)
dvar float ss0[TR][ICR];
dvar float ss1[TR][ICR];
dvar float  cost[TR];
dvar float+ r[IR][TR][QNR];
dvar float+ obuy;
dvar float+ slack1[WR][TR][NR][MR];
dvar float+ slack2[WR][TR][PR];
dvar float+ kb[TR][BR][IR];
dvar float+ pp[IR][ZR];
dvar float+ px[IR][ICR1];
dvar float  aug[TR];
dvar float J;
dvar float+ pen;
dvar float+ IMPLNG[DR][AR];

constraint cts0[TR][ICR];
constraint cts1[TR][ICR];
constraint cts2[TR][ICR];
constraint cts3[TR][ICR];
constraint ce1[TR][WR][NR][MR];
constraint cp1[TR][WR][PR];
constraint cp2[TR][WR][PR];
constraint cp3[TR][WR][PR];
constraint cp4[TR][WR][PR];
constraint cp5[TR][WR][PR];
constraint cp6[TR][WR][PR];
constraint cp7[TR][WR][PR];
constraint cp8[TR][WR][PR];
constraint cp9[TR][WR][PR];
constraint cp10[TR][WR][PR];
constraint cp11[TR][IR][WR][PR];
constraint cp12[TR][IR][WR][PR];
constraint cp13[TR][IR][WR][PR];
constraint cs1[TR][WR][SR];
constraint cs2[TR][WR][SR];
constraint cs3[TR][WR][SR][IR];
constraint cs4[TR][WR][SR][IR];
constraint cs5[TR][WR][SR][IR];
constraint ch1[TR][WR][ER];
constraint ch2[TR][WR][UR];
constraint cc1[TR][WR][CR];  
constraint cc2[TR][WR][CR];  
constraint cc3[TR][WR][CR];  
constraint cv1[TR][WR][NR][VR];
constraint ca1[TR][WR][AR];
constraint ca2[TR][WR][AR][IR];
constraint ca3[TR][WR][AR][IR];
constraint ca4[TR][WR][AR][IR][VR];
constraint ca5[TR][0..max(t in TR)(TDE[t]-TDB[t])][AR];
constraint cb1[TR][WR][BR];
constraint cb2[TR][WR][BR][IR];
constraint cb3[TR][BR][IR];
constraint cr1[TR][WR][RR];
constraint cr2[TR][WR][RR];
constraint cr3[TR][WR][RR];


minimize  J+sum(t in TR)SELECT[t]*aug[t];				//[Million Yen] Objective Function

subject to{
  	J==sum(t in TR)SELECT[t]*obj[t];
  	pen==FLAG_DEC*sum(i in ZR,j in IR)pp[j][i];
  	
 	forall(t in TR)if(SELECT[t]==1){
		forall(i in JZR)if(FLAG_MIP==1)z[t][i]==zi[t][i];else z[t][i]<=1;

		if(t==TB0)s0[t][SM+1]==0;
		if(t==TE0)s1[t][SM+1]==0;
  		forall(i in UR2)if(IS[2][i]!=-1&&t==TB0)s0[t][IS[2][i]]==0;
  		
		cost[t]==1/DS*sum(w in WR)(sum(i in PR)(PVC[i]*x[w][t][IX[1][i]]+STUC[i]*x[w][t][IX[12][i]])     //火力の可変費、起動費
				 		    +sum(i in CR)CVC[i]*x[w][t][IX[4][i]]+sum(i in OR)EVC[i]*x[w][t][IX[9][i]]   //非変動再エネの可変費、貯蔵設備の貯蔵コスト(yen/kWh)
				 		    +LFCF*sum(a in AR,i in IR)x[w][t][IX[28+i][a]]                              //LFC調整力のkW単価
				 		    +sum(i in OR)x[w][t][IX[9][i]]*EMC[NCO2][OTY[i]]*CO2DE[OTY[i]]*CO2Tax				 //CCSで貯留したCO2分の炭素税
				 		    +sum(i in ER02)x[w][t][IX[39][i]]*8.4375)									//輸入水素コスト(Myen/GWh)
				 		    //+sum(n in NR)x[w][t][IX[40][n]]*1.e4)									//penalty factor
				 		    +TEF[t]*1/DS*sum(w in WKR1)sum(a in AR)IMPLNG[WEEK[w+1]][a]*FPRC[0]*1.00144*10		 //import LNG (Myen/ktoe)
			   				+sum(i in KR)FC[i]*(s1[t][i]+(TBF[t]-1)*s0[t][i])							 //各種固定費
			   				+TEF[t]*(pen+/*FHC[1]*FPRC[1]*/1.e2*obuy);			   				
			   						
		obj[t]==cost[t]+s0[t][SM+1]-s1[t][SM+1];
		
	// Initial Setting
		if(FLAG_FWD==1&&TE!=TE0&&t==TE)aug[t]==sum(i in IR,j in ICR1)10*px[i][j];
		else if(FLAG_FWD==-1&&TB!=TB0&&t==TB)aug[t]== sum(i in ICR1)X[0][i][t-1][0]*s0[t][IC[i]];else aug[t]==0;
		forall(i in ICR1)if(FLAG_FWD==1&&TE!=TE0&&t==TE)s1[t][IC[i]]==X[1][i][t+1][0]+px[0][i]-px[1][i];
	// Boundary Condition
  		forall(i in ICR2)if(t==TB0&&FLAG_BDC==1)s0[TB0][IC[i]]==X[1][i][TB0][0];
	  	forall(i in ICR2)if(FLAG_DEC==1){
 	  		if(t==TB0)s0[t][IC[i]]==s0[t][IC[IM+i]];
  			if(t==TE0)s1[t][IC[i]]==s1[t][IC[IM+i]];
  			s1[t][IC[IM+i]]==s0[t][IC[IM+i]];
   		}	
//----------------------------------------------------------------------------------------------------------------- 	    
	// State Equations of the State Variables
	   	forall(i in KR){
	   	  	if(Kmin[i]==Kmax[i])s0[t][i]==Kmin[i];else if(t==TB0)s0[t][i]>=Kmin[i];
	   	  	if(Kmin[i]==Kmax[i])s1[t][i]==Kmax[i];else s1[t][i]<=Kmax[i];
	   	  	if(Kmin[i]!=Kmax[i])s1[t][i]>=s0[t][i];
  		}
  	  	forall(i in RR){																			// Reservoirs for Pumping-up Stations
  	  		s0[t][IS[0][i]]==x[0][t][IX[10][i]];
			s1[t][IS[0][i]]<=RVC[i];
  		}
     	forall(i in UR){	
  	  		s0[t][IS[1][i]]==x[0][t][IX[9][IE[i][0]]];
			s1[t][IS[1][i]]<=EUS[i]*s1[t][IK[3][IU[0][i]]];
			if(EDT[i]>0)EDT[i]*s1[t][IK[3][IU[1][i]]]>=s1[t][IK[3][IU[0][i]]];												// Duration Time Constraints of Energy Storage Facilites
			if(ECT[i]>0)ECT[i]*s1[t][IK[3][IU[0][i]]]>=s1[t][IK[3][IU[1][i]]];												// C-Rate Constraints of Energy Storage Facilites
	  		if(ECY[i]>0)ECY[i]*s1[t][IK[3][IU[0][i]]]>=s1[t][IS[2][i]];	else s1[t][IS[2][i]]==0;							// Life Time Constraints	
      	}
		forall(i in ZR){
      	  	s1[t][IS[5][i]]==z[t][IZ[1][i]]+FLAG_DEC*TEF[t]*(pp[0][i]-pp[1][i]);
      	  	s0[t][IS[5][i]]==z[t][IZ[0][i]];
      	  	if(t==TE0)s1[t][IS[5][i]]<=1;
 		}
 		forall(i in ICR2)s1[t][IC[i]]>=0;
   		forall(i in UR1)s1[t][IS[2][i]]==s0[t][IS[2][i]]+1/DS*sum(w in WR,j in 0..ICCN[i])VCC[i][j]*x[w][t][ICC[i][j]];					// Cumulative Constraints  	    
   		forall(a in AR)s1[t][IS[2][U+2+a]]==s0[t][IS[2][U+2+a]]+sum(w in WR,j in 0..METICCN[a])METVCC[a][j]*x[w][t][METICC[a][j]];
  	    if(TARGET[0]>=0)s1[t][IS[2][U]]+1/DS*sum(w in WKR1,a in AR)IMPLNG[WEEK[w+1]][a]*1.00144*10*FCC[0]/FHC[0]<=TARGET[0];else s1[t][IS[2][U]]==0;  //[kton-CO2]
  	    s1[t][IS[2][U+1]]<=max(i in 1..2)TARGET[i];
		if(t==TE0) s1[t][IS[2][U+1]]+obuy>=TARGET[2];
		
		 forall(w in WKR1)forall(a in AR)s1[WEEK[w+1]][IS[2][U+2+a]]+sum(j in 0..w)IMPLNG[WEEK[j+1]][a]>=sum(j in 0..w)METLOAD[WEEK[j+1]][a];		//City Gas supply constraint
		 
		
   		if(FLAG_FWD==-1){
   		  	forall(i in KR)s0[t][i]>=Kmin[i];
   			forall(i in RR)s1[t][IS[3][i]]<=RVC[i];
       		forall(i in UR)s1[t][IS[4][i]]<=EUS[i]*s1[t][IK[3][IU[0][i]]];
       		forall(i in ZR)s1[t][IS[6][i]]<=1;
       		forall(i in ICR2)s0[t][IC[IM+i]]>=0;
       		forall(i in UR2)if(IS[2][i]!=-1)s0[t][IS[2][i]]>=0;
   		}
  	    forall(i in ICR){
  	      	cts1[t][i]:ss0[t][i]==s0[t][IC[i]];
  	      	cts0[t][i]:s1[t][IC[i]]==ss1[t][i];
       	}
		s1[t][SM]==1;
		s0[t][SM]==1;
		if((FLAG_DEC==0||FLAG_FWD!=0)&&t!=TE)s0[t][SM+1]+cost[t]==s1[t][SM+1];
		forall(i in BR,j in IR)cb3[t][i][j]:if(MFLOW[i][j]>=0)kb[t][i][j]==MFLOW[i][j];else kb[t][i][j]==s1[t][IK[5][i]];
		
		forall(i in CLR)s1[t][IK[0][i]]+s1[t][IK[0][PP+i]]+s1[t][IK[0][PP+COAL+i]]<=Kmax[i];										// NH3 mixed fuel capacity constraint
		forall(i in LNR)s1[t][IK[0][i]]+s1[t][IK[0][PP+COAL+i]]+s1[t][IK[0][PP+LNG+COAL+i]]<=Kmax[i];								// H2 mixed fuel capacity constraint 
		forall(i in CLR)s0[t][IK[0][i]]+s0[t][IK[0][PP+i]]+s0[t][IK[0][PP+COAL+i]]>=EXIUP[i];
		forall(i in LNR)s0[t][IK[0][i]]+s0[t][IK[0][PP+COAL+i]]+s0[t][IK[0][PP+COAL+LNG+i]]>=EXIUP[i];
//-----------------------------------------------------------------------------------------------------------------
  		forall(w in WR){
    		forall(n in NR){
    		  	forall(j in MR)ce1[t][w][n][j]:sum(i in 0..ICE1N[n][j])VCE1[n][j][i]*x[w][t][ICE1[n][j][i]]==EBS[j]*slack1[w][t][n][j]+ML[j]*LOADN[t*W+w][n];
    		  	forall(j in VR)cv1[t][w][n][j]:x[w][t][IX[11][n+N*j]]+VSUP[j]*x[w][t][IX[31][n+N*j]]==VU[t*W+w][n][j]*s1[t][IK[4][j*A+AN[n]]];		// Constraints of Maximum Operation Levels of VRE
       		}    		  	
			forall(i in NBR)y[w][t][NBA[i]]==0;
			forall(i in PR){
				cp1[t][w][i]:z[t][JZ[w][0][i]]+LFC[i]*slack2[w][t][i]==URT[(t*W+w) div H][i]*s1[t][IK[0][i]]; 				// Must-run constraint
  	 			cp2[t][w][i]:MS[i]*(1-x[w][t][IX[12][i]])>=sum(j in 1..MS[i])z[t][JZ[w-j][0][i]];							// Plant must be stopped MS steps before start-up.
				cp3[t][w][i]:MO[i]*   x[w][t][IX[13][i]] <=sum(j in 1..MO[i])z[t][JZ[w-j][0][i]];							// Plant must be operated MO Steps before shut-down.
            	cp4[t][w][i]:x[w][t][IX[12][i]]<=  z[t][JZ[w][0][i]];															// Plant must be operated after start-up.
            	cp5[t][w][i]:x[w][t][IX[13][i]]<=1-z[t][JZ[w][0][i]];														// Plant must be stopped  after shut-down.
     	 		cp6[t][w][i]:x[w][t][IX[12][i]]-x[w][t][IX[13][i]]==z[t][JZ[w][0][i]]-z[t][JZ[w-1][0][i]];					// Detection of Start Up and Shut Down 
      	 		cp7[t][w][i]:x[w][t][IX[1][i]]==SLOPE[i]*x[w][t][IX[0][i]]+INSEC[i]*z[t][JZ[w][0][i]]-0.86*x[w][t][IX[2][i]];// Heat Requirement [Mcal]
 				cp8[t][w][i]:x[w][t][IX[0][i]]-x[w][t][IX[15][i]]>=MOL[i] *z[t][JZ[w][0][i]];								// Constraints of Minimum Operation Levels
	     		cp9[t][w][i]:x[w][t][IX[0][i]]+x[w][t][IX[14][i]]<=UCAP[i]*z[t][JZ[w][0][i]];								// Constraints of Maximum Operation Levels
				cp10[t][w][i]:sum(j in IR)x[w][t][IX[2+j][i]]-(1-OCR[i])*x[w][t][IX[0][i]]<=UCAP[i]*z[t][JZ[w][0][i]];		// Constratins of Receiving Power Facilities at Power Station
         		forall(j in IR){
         		  	cp11[t][j][w][i]:x[w][t][IX[2+j][i]]+x[w][t][IX[26+j][i]]<=REG[j][i]*s1[t][IK[6+j][i]];					// Consumption at Resistance in Boiler
					cp12[t][j][w][i]:x[w][t][IX[2+j][i]]-x[w][t][IX[24+j][i]]>=0;
					cp13[t][j][w][i]:LFCR[i]*UCAP[i]>=x[w][t][IX[14+j][i]];
   				}
   				x[w][t][IX[32][i]]==SYN[i]*UCAP[i]/0.9*z[t][JZ[w][0][i]];														//SYN constraint		
   				x[w][t][IX[36][i]]<=x[w][t][IX[1][i]]*CO2[i]*0.9;															// CCS [kton] 
   				x[w][t][IX[36][i]]<=s1[t][IK[8][i]]/8.76*0.9;      				 
			}	

			forall(i in SR)	{
  		  		cs1[t][w][i]:x[w][t][IX[5][i]]+x[w][t][IX[6][i]]<=UCAS[i]*s1[t][IK[1][i]];
   				cs2[t][w][i]:z[t][JZ[w][1][i]]+z[t][JZ[w][2][i]]<=        s1[t][IK[1][i]];
   				forall(j in IR){
   				  	cs3[t][w][i][j]:x[w][t][IX[5+j][i]]+x[w][t][IX[17-j][i]]<=UCAS[i]    *z[t][JZ[w][1+j][i]];
   					cs4[t][w][i][j]:x[w][t][IX[5+j][i]]-x[w][t][IX[16+j][i]]>=MSR[i][1-j]*z[t][JZ[w][1+j][i]];
					cs5[t][w][i][j]:x[w][t][IX[16+j][i]]<=SLFCR[i]*UCAS[i];													
				}
				x[w][t][IX[33][i]]==sum(j in IR)SSYN[i]*UCAS[i]/0.9*z[t][JZ[w][1+j][i]];										//SYN constraint
	   		}   			
   			forall(i in RR){
   		  		cr1[t][w][i]:(1-WW[w])*x[minl(w+1,W-1)][t][IX[10][i]]+WW[w]*s1[t][IS[0][i]]==SDR[i]*x[w][t][IX[10][i]]
   		  			+sum(j in 0..RVMN[i])(SCE[RVM[i][j]]*x[w][t][IX[5][RVM[i][j]]]-SDE[RVM[i][j]]*x[w][t][IX[6][RVM[i][j]]]);
    			cr2[t][w][i]:sum(j in 0..RVMN[i])SCE[RVM[i][j]]*x[w][t][IX[17][RVM[i][j]]]+x[w][t][IX[10][i]]<=RVC[i];
				cr3[t][w][i]:sum(j in 0..RVMN[i])SDE[RVM[i][j]]*x[w][t][IX[16][RVM[i][j]]]<=SDR[i]*x[w][t][IX[10][i]];    	//pump up (up)
     		}   		  
 			forall(i in CR){
 			  	cc1[t][w][i]:x[w][t][IX[4][i]]+x[w][t][IX[18][i]]<=CRE[(t*W+w)div H][i]*s1[t][IK[2][i]];					// Constraints of Maximum Operation Levels
            	cc2[t][w][i]:x[w][t][IX[4][i]]>=x[w][t][IX[19][i]];
            	cc3[t][w][i]:forall(j in IR)CLFCR[i]*s1[t][IK[2][i]]>=x[w][t][IX[18+j][i]];
            	x[w][t][IX[34][i]]==CSYN[i]/0.9*s1[t][IK[2][i]];																//SYN constraint																
     		} 			  	
   			forall(i in ER)ch1[t][w][i]:sum(j in 0..ICAPN[i])x[w][t][IX[9][ICAP[i][j]]]<=EUS[i]*s1[t][IK[3][i]];
  	  		forall(i in UR)ch2[t][w][i]:(1-WW[w])*x[minl(w+1,W-1)][t][IX[9][IE[i][0]]]+WW[w]*s1[t][IS[1][i]]
  	  		==sum(j in 0..IEN[i])ES[i][j]*x[w][t][IX[9][IE[i][j]]]+ESHy[i]*x[w][t][IX[39][IEHy[i]]];	//State Equations for Energy Storages in Distributed Energy Systems
  	  		forall(i in ER0){
  	  		  	  if(w != 0){sum(j in 0..HyNum-1)x[w][t][IX[39][i+E0*j]]<=0;}
  	  		  	  else{sum(j in 0..HyNum-1)x[w][t][IX[39][i+E0*j]]<=HySch[t][i];}
    		}  	  		
 	  		forall(i in UR)forall(k in IR)x[w][t][IX[37+k][i]]+sum(j in 1..IEN[i])ESLFC[i][j]*x[w][t][IX[9][IE[i][j]]]*pow(-1,k)<=CAPL[i]*EUS[IU[1][i]]*s1[t][IK[3][IU[1][i]]];		//LFC constraint of Battery
  	  		forall(i in UR)x[w][t][IX[38][i]]/(pow(0.85,0.5))+CAPL[i]*x[w][t][IX[9][IE[i][0]]]<=CAPL[i]*EUS[IU[0][i]]*s1[t][IK[3][IU[0][i]]];
	  	 	forall(i in UR)x[w][t][IX[37][i]]/(pow(0.85,0.5))<=CAPL[i]*x[w][t][IX[9][IE[i][0]]];
	  	 	forall(i in UR)forall(j in IR)x[w][t][IX[37+j][i]]<=0.2*s1[t][IK[3][IU[1][i]]];
 	  		
			forall(i in BR){
	 			cb1[t][w][i]:if(XX[i]!=0)y[w][t][BN[i][1]]-y[w][t][BN[i][0]]==XX[i]*(x[w][t][IX[7][i]]-x[w][t][IX[8][i]]);	// Power Flows
 				forall(j in IR)cb2[t][w][i][j]:sum(k in IR)(pow(-1,j+k)*x[w][t][IX[7+k][i]]+FB[i]*x[w][t][IX[20+j+2*k][i]])<=kb[t][i][j];	// 
   			} 				
			forall(a in AR){
			/*  	ca1[t][w][a]:if(ICV5N[a]>=0)sum(i in 0..ICV5N[a])VCV5[a][i]*x[w][t][ICV5[a][i]]>=BCV5[t*W+w][a];			// Constraint of Share of Non-synchronous Power	  			*/
            	forall(j in VLFCNR)x[w][t][IX[30][a+A*j]]==VLFCR[j]*sum(i in 0..RLFCN[a][j])x[w][t][RLFC[a][j][i]];
            	forall(k in IR){
           	  		ca2[t][w][a][k]:x[w][t][IX[28+k][a]]==sum(i in 0..LFCN[a][k])VLFC[a][i][k]*x[w][t][LFCI[a][i][k]];
             	  	ca3[t][w][a][k]:x[w][t][IX[28+k][a]]>=BLFC[t*W+w][a]; 													   			//LFC UP Area constraint (Load)
           			forall(j in VLFCNR)ca4[t][w][a][k][j]:x[w][t][IX[28+k][a]]>=x[w][t][IX[30][a+A*j]]; 						//LFC UP Area constraint (VRE)
				}
				x[w][t][IX[35][a]]==sum(i in 0..SYNN[a])x[w][t][SYNI[a][i]];
			//	x[w][t][IX[35][a]]>=BSYN[a];
			
 			}
 			forall(s in SY){
				sum(i in 0..KSYN[s])x[w][t][IX[35][SYNAR[s][i]]]>=BBSYN[s];
 			}
		}
		forall(d in TDB[t]..TDE[t],a in AR)ca5[t][d-TDB[t]][a]:if(ICK2N[a]>=0)sum(i in 0..ICK2N[a])VCK2[d][a][i]*s1[t][ICK2[a][i]]>=BCK2[d][a];	// Capacity Reserve Constraints for Control Areas   
	//*****************************************************************
		if(FLAG_LPF==0){
			forall(i in ICR )if((FLAG_DEC==0||FLAG_FWD!=0)&&t <TE)ss1[t][i]==ss0[NSTEP[t]][i];							// Intertemporal Connection
			forall(i in ICR2)if( FLAG_DEC==0              &&t==TE)ss1[t][i]==ss0[NSTEP[t]][i];
			if(FLAG_DEC==1){
				forall(i in ICR            )if(t>TB0&&FLAG_FWD!=-1&&(t==TB||FLAG_FWD==0))sum(q in 0..Q[0][1][t]-1)X[1][i][t][q]*r[1][t][q]==ss0[t][i];
				forall(q in 0..Q[0][0][t]-1)if(t<TE0&&FLAG_FWD!= 1&&(t==TE||FLAG_FWD==0))sum(i in ICR            )X[0][i][t][q]*ss1[t][i]==r[0][t][q];	// Cutting Planes
				if((FLAG_FWD== 1)&&t<TE0&&t==TE)ss1[t][ICD[1]+1]==0;
				if((FLAG_FWD==-1)&&t>TB0&&t==TB)ss0[t][ICD[1]+1]==0; 
			}
		}
	}
}

float PEN=pen;

execute postprocess{
  	var i,j,q,q0,q1,v,v0,p,t,tt,i0,h,w,zero,u;
	v=PEN; // Suppression of warnings

	if(FLAG_DEC==1){
      	for(t in TR)if(SELECT[t]==1)for(j in IR){
      	  	if(((t<TE0&&j==0&&FLAG_FWD!=1)||(t>TB0&&j==1&&FLAG_FWD!=-1))&&FLAG_MIP==0){
	   			for(i in ICR)if(j==0)X[0][i][t][0]=cts0[t][i].dual;else X[1][i][t][0]=Math.max(0,ss0[t][i]);	//Surrogate Cutting Plane and Extreme Point of Convex Hull			
	   			q0=Q[0][j][t];
				if(q0<QN[j])Q[1][j][t]=q0;
				else{v0=1;for(q=1;q<q0;q++)if((v=Math.pow(-1,j)*(r[j][t][q].reducedCost-r[j][t][q]))<=v0){v0=v;Q[1][j][t]=q;}}	//Selection of discarded CP or CH
			}
			if((tt=2*j-1+t)>=TB0&&tt<=TE0){
			  	if(FLAG_FWD==0||(j==0&&FLAG_FWD==-1)||(j==1&&FLAG_FWD==1)){
   					for(i in ICR)if(j==0)BF[j][i][tt]=cts1[t][i].dual;else{if(i==ICD[1]+1)BF[j][i][tt]=ss1[t][i];else BF[j][i][tt]=Math.max(0,ss1[t][i])};									// j=0:Cutting Plane, j=1:Convex Hull
   					if(j==0&&FLAG_FWD!=0){v=-J;for(i in ICR)if(i!=ICD[1])v-=ss0[t][i]*cts1[t][i].dual;BF[0][ICD[1]][tt]=v;}
   					else BF[j][ICD[1]+j][tt]+=(2*j-1)*obj[t];
   					BF[j][ICD[1]+2][tt]=1;
       			}
      		}
      	}      		       	
	   	for(t in TR){OBJ[0][t]=obj[t];OBJ[1][t]=s0[t][SM+1];OBJ[2][t]=cost[t];OBJ[3][t]=-s1[t][SM+1];}    	
		if(FLAG_FWD!=0)writeln(J);
   	}
   	else {
   	  	var ofile;
   		var str;
   	  	writeln();
 		writeln("Objective=",J);
 		writeln("CO2 Shadow Price [yen/ton-CO2] ",cts0[TE0][IS[2][U]].dual);
		for(i in ICR2){
	  	  	if((v=ss0[TB0][i])<zero)v=0;;
	  	  	for(t in TR)if(SELECT[t]==1)X[1][i+IM][t][0]=v;
	  	  	if(FLAG_MIP==1||Math.abs(v=-cts0[TE0][i].dual)<zero)v=0;
	  	  	for(t in TR)if(SELECT[t]==1)X[0][i+IM][t][0]=v;
       	}        		  	  	  	
	  	for(t in TR)if(SELECT[t]==1){
	  	  	for(i in ICR0){
	  	  	  	if((v=ss0[t][i])<zero)v=0;X[1][i][t][0]=v;
	  	  		if(FLAG_MIP==1||Math.abs(v=cts0[t][i].dual)<zero)v=0;X[0][i][t][0]=v;
	  	  	}
	  		X[0][ICD[1]+1][t][0]=-1;
	  		X[1][ICD[1]  ][t][0]= 1;
  		}
   	} 	  		
	
   	if(FLAG_REP==1&&FLAG_INI==-1){
   		var str;
   		writeln("Writing res#.csv files");
  		for(t in TR){
   	  		var ofile;
  		  	str=str1+"res"+t+".csv";
  			ofile = new IloOplOutputFile(str);
  			for(w in WR){for(i in IXR)ofile.write(x[w][t][i],",");ofile.writeln();}  			  	
			for(i in ISR)ofile.write(s0[t][i],",");ofile.writeln();				
			for(i in ISR)ofile.write(s1[t][i],",");ofile.writeln();					
	  		for(j in IR){for(i in BR)ofile.write(-cb3[t][i][j].dual,",");ofile.writeln();}
	  		for(j in IR){for(i in BR)ofile.write(kb[t][i][j],",");ofile.writeln();}
			ofile.close();
			write(t," ");
			if((t+1)%10==0)writeln();
    	}       
    	writeln();	
    }
}

 