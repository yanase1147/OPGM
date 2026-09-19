/*********************************************
 * OPL 12.7.1.0 Model
 * Author: fujii
 * Creation Date: 2020/02/27 at 14:55:04
 *********************************************/
 

int DEC=...;
int H0=...; 			// The Number of Time Zones per Day
int P0=...;				// The Number of Thermal Power Plants
int F=...;				// The Number of Energy Resources
int S0=...; 			// The Number of Storage Plants
int R0=...;				// The Number of Reservoirs
int C0=...; 			// The Number of Constant Renewable Electricity Plants
int N0=...; 			// The Number of Nodes
int B0=...; 			// The Number of Branches
int D0=...; 			// The Number of Days of the year
int DB=...; 			// The Biginning Day
int DE=...;				// The Ending Day
int A0=...;				// The Number of Control Areas
int L0=...;				// The Number of Demand Nodes 
int E0=...;				// The Number of Distributed Energy System Nodes
int PTYN=...;			// The Number of Thermal Plant Types
int STYN=...;			// The Number of Storage Types
int CTYN=...;			// The Number of Cosntant Renewable Tyeps
int VTYN=...;			// The Number of Variable Renewable Types
int ETYN=...;			// The Number of Distributed Energy Systems Technology Types
int OTYN=...;			// The Number of Distributed Energy Systems Operation Types



range MTHR=1..12;		// Index for months (Maintenance date) 
int NMD[MTHR]=...;		// The Number of Days of the months
float SOLMIN=...;		// Synthetic Oil minimun
float SOLMAX=...;		// Synthetic Oil maximun

int D=DE-DB+1;			// Duration in Days

range IR=0..1;
range PR0=0..P0-1;
range FR=0..F-1;
range SR0=0..S0-1;
range RR0=0..R0-1;
range CR0=0..C0-1;
range DR=DB-1..DE-1;
range HR0=0..D0*H0-1;
range DR0=0..D0-1;
range NR0=0..N0-1;
range BR0=0..B0-1;
range LR0=0..L0-1;
range ER0=0..E0-1;
range AR0=0..A0-1;
range PTR=0..PTYN-1;
range CTR=0..CTYN-1;
range VTR=0..VTYN-1;
range ETR=0..ETYN-1;
range OTR=0..OTYN-1;
range STR=0..STYN-1;

int ARF[AR0]=...;			// Flag for Selected Areas
int ANR[NR0][AR0]=...;		// Mapping between Node and Area
int PN0[PR0]=...;			// Thermal Plant Node
int SN0[SR0]=...;			// Storage Node
int CN0[CR0]=...;			// Constant Renewable Node
int EN0[ER0]=...;			// Distributed Energy System Node
int LN0[LR0]=...;			// Demand Node
int AN0[n in NR0]=sum(a in AR0)a*ANR[n][a];

float CO2Tax=...;           // CO2 Tax
float CO2Max=...;			// CO2 Maximum
float DELTA=...;			// Capacity Reserve Ratio
float AIR=...;				// Annual Interest Rate
float FATX=...;				// Fixed Assets Tax Rate
float SVR=...;              // Salvage Value Ratio   
float MAX_SNSP[AR0]=...;	// Maximum of the share of non-synchronous power 
float SCALE=...;			// Scaling for objective function
float LFCF0=...;			// LFC Control Reserve Market Fee [Yen/kW]
int QN[IR]=...;

// Electricity Demand
float LOADC[HR0][AR0]=...;	// Electric Power Demand by Company[GW]
float LOADS[LR0]=...;		// Electric Power Demand Share in Company[GW]
float LOAD0[h in HR0][i in LR0]=LOADC[h][AN0[LN0[i]]]*LOADS[i];
float DLFCR[AR0]=...;
float DSYNR[AR0]=...;

// Thermal and Nuclear Power Plants
float PUC[PTR]=...;			// Unit Construction Cost [k Yen/kW]
float PLT[PTR]=...;			// Life Time of Plant [year]
float POM[PTR]=...;			// O&M Cost Ratio
int BTY[PTR]=...;			// Type of Energy Resrouce
int REG0[IR][PTR]=...;     // Flag for Availability of Resistance
int MS0[PTR]=...;			// Minimum Shut-down Periods [hour]
int MO0[PTR]=...;			// Minimum Operation Periods [hour]
int MDY[PTR]=...;			// Maintenance Period [day]
int LFC0[PTR]=...;			// Load Following Capability
float CCSC[PTR]=...;		// CCS construction cost [kyen/(ton/year)]
float CCSLT[PTR]=...;		// CCS life time 
float CCSEL[PTR]=...;		// Electircity Consumption with CCS [kWh/t]

int PTY0[PR0]=...;			// Type of Power Plants
float MOL0[PR0]=...;		// Minimum Output Level
float OCR0[PR0]=...;		// Operation and Maintenance Cost Ratio
float UCAP0[PR0]= ...;		// Unit Capacity [GW]
float HRT0[PR0][IR]=...;	// Heat Rate of Thermal Power Plants
int KPmax[PR0]=...;			// Number of Units (Maximum Unitis)
int KPmin[PR0]=...;			// Number of Units (Existing Unitis)
float STUC0[PR0]=...;		// Start-up Cost [million Yen]
float LFCR0[PR0]=...;
float SYN0[PR0]=...;			//Synchronous Inertia [s]
float CO2F[PR0]=...;		// CO2 maximum flow [Mton/year]

int FTY[FR]=...;
float FCT[FR]=...;			// Unit Fuel Price [yen/specific unit]
float FHC[FR]=...;			// Heat Content [Mcal/specific unit]
float FCC[FR]=...;			// Carbon Content [kg-C/specific unit]
float RFC0[IR]=...;			// Cost of Resistance
int MSD[PR0]=...;
int COAL0=...;
int LNG0=...;
int NUCLEAR0=...;
int OIL0=...;
int EXIU[PR0]=...;

// Electricity Storage Facilities
int STY0[SR0]=...;			// Type 	
float UCAS0[SR0]=...;      	// Maximum Capacity
int UNS0[SR0]=...;      	// Minimum Capacity
int RVN[SR0]=...;			// No. of the Corresponding Reservoir
int KSmax[SR0]=...;
int KSmin[SR0]=...;
float MSR0[SR0][IR]=...;
float SLFCR0[SR0]=...;		// LFC Regulation Rate
float SSYN0[SR0]=...;		//Synchronous Inertia [s]
float RVC0[RR0]=...;
float CEF[SR0]=...;			// Cycle Efficiency
float SDC[STR]=...;			// Self Discharge Rate [1/hour]
float SLT[STR]=...;			// Life Time
float ZLT[STR]=...;			// Life Time
float SUC[STR]=...;			// Unit Construction Cost
float ZUC[STR]=...;			// Unit Construction Cost
float SOM[STR]=...;			// O&M Cost Ratio
float ZOM[STR]=...;			// O&M Cost Ratio


// Constant Renewables
int CTY0[CR0]=...;			//
float KCmax[CR0]=...;    	//    
float KCmin[CR0]=...;   	//    	
float CRE0[DR0][CR0]= ...;	// Usage rate
float CLT[CTR]=...;			//
float COM[CTR]=...;			//
float CUC[CTR]=...;			//
float CVC0[CTR]=...;		//
float CLFCR0[CTR]=...;		// LFC Regulation Rate
float CSYN0[CTR]=...;		// Synchronous Inertia [s]


// Variable Renewables
int VLFCN=...;
range VLFCNR=0..VLFCN-1;
int VRET[0..VTYN-1]=...;
int VSUP[VTR]=...;
float KVmax[AR0][VTR]=...;
float KVmin[AR0][VTR]=...;
float VIT[VTR]=...;
float VLT[VTR]=...;
float VOM[VTR]=...;
float VUC[VTR]=...;
float VLFCR[0..VLFCN-1]=...;
float VU0[HR0][0..N0*VTYN-1]=...;
float VRES[NR0][VTR]=...;


// Power Transmission Networks
int BN0[BR0][IR]=...;
float XX0[BR0]=...;             
float MFLOW0[BR0][IR]=...;             
float TFC0[BR0]=...;             
float LOSS0[BR0]=...;             
float KBmax[BR0]=...;             
float KBmin[BR0]=...;
float BLT=...;
float BOMR=...;

// Heat Storage System & DAC & WEL & FT & HST
int M=...;						// The Number of Energy Carriers
int G=...;						// The Number of Stored Energy Media
range MR=0..M-1;
range GR=0..G-1;
float EUC[ETR]=...;      	    // Unit Construction Cost
float ELT[ETR]=...;          	// Life Time
float EOM[ETR]=...;		        // O&M Cost Ratio
float EUS0[ETR]=...;          	// Usage Rate
float ECY0[ETR]=...;			// Life Cycle
float EDT0[ETR]=...;			// Duration Time
float ECT0[ETR]=...;			// C Rate
float ETU0[ETR]=...;          	// Temporal Unit Conversion
int PSC[ETR]=...;				// Flag for Power Supply Capability Constraints
int IES[ETR]=...;				// Flag for Storage Facility
float KEmax[ER0][ETR]=...;     	// Maximum Capacity
float KEmin[ER0][ETR]=...;  	// Minimum Capacoty

float EMC[MR][OTR]=...;			// Conversion Coefficienet
float ESC[GR][OTR]=...;			// Storage Coefficient
float EVC0[OTR]=...;			// Variable Cost
int EBS[MR]=...;				// Balance Constraints Sign
int Elec=...;					// Carrier No. of Electricity
int Hyd=...;					// Carrier No. of H2
int NCO2=...;					// Carrier No. of CO2
int Syno=...;					// Carrier No. of Synhtetic Oil
int IFD[OTR]=...;
int HyFlag[GR]=...;
int HyNum=sum(i in GR)minl(1,HyFlag[i]);

// Ranges of Parameters of the Selected Areas
int NA[n in NR0]=sum(a in AR0)a*ANR[n][a];					// Mapping from Node to Area
int A=sum(i in AR0)minl(1,ARF[i]);							// Number of Selected Areas
int P=sum(i in PR0)minl(1,ARF[NA[PN0[i]]]);					// Number of Selected Thermal Plants
int S=sum(i in SR0)minl(1,ARF[NA[SN0[i]]]);					// Number of Selected Pumping Stations
int C=sum(i in CR0)minl(1,ARF[NA[CN0[i]]]);					// Number of Selected Constant Renewables
int E=sum(i in ER0,j in ETR)minl(1,ARF[NA[EN0[i]]])*ftoi(ceil(abs(KEmax[i][j])/(1+abs(KEmax[i][j]))));  //Number of selected Dist.Ene. (è[ï˙ìdãÊï Ç»Çµ)
int O=sum(i in ER0,j in OTR)minl(1,ARF[NA[EN0[i]]])*ftoi(ceil(abs(KEmax[i][IFD[j]])/(1+abs(KEmax[i][IFD[j]]))));  //Number of selected Dist.Ene. (è[ï˙ìdãÊï Ç†ÇË)
int L=sum(i in LR0)minl(1,ARF[NA[LN0[i]]]);					// Number of Selected Loads

int COAL=sum(i in 0..COAL0-1)minl(1,ARF[NA[PN0[i]]]);
int LNG=sum(i in 0..LNG0-1)minl(1,ARF[NA[PN0[i+COAL0]]]);
int NUCLEAR=sum(i in 0..NUCLEAR0-1)minl(1,ARF[NA[PN0[i+COAL0+LNG0]]]);
int OIL=sum(i in 0..OIL0-1)minl(1,ARF[NA[PN0[i+COAL0+LNG0+NUCLEAR0]]]);

int PP=COAL+LNG+NUCLEAR+OIL;
range NHR=PP..PP+COAL-1;
range NHR2=PP+COAL..PP+2*COAL-1;
range HHR=PP+2*COAL..PP+2*COAL+LNG-1;
range HHR2=PP+2*COAL+LNG..PP+2*COAL+2*LNG-1;

range AR=0..A-1;
range PR=0..P-1;
range SR=0..S-1;
range CR=0..C-1;
range ER=0..E-1;
range OR=0..O-1;
range LR=0..L-1;

int ZA[AR];				// Mapping from Selected areas to original ones
int ZP[PR];				// Mapping from Selected thermal plants to original ones
int ZS[SR];				// Mapping from Selected pumping stations to original ones
int ZC[CR];				// Mapping from Selected Constant Renewables to original ones
int ZE[ER];				// Mapping from Selected energy systems to original ones
int ZO[OR];				// Mapping from Selected energy systems to original ones
int ZL[LR];				// Mapping from Selected loads to original ones
int ZB[BR0];			// Mapping from Selected branches to original ones
int RVM0[RR0][SR];		// Selected Pumping Stations by Reservoir
int RVMN0[i in RR0]=-1;	// Number of the Selected Pumping Stations by Reservoir 
int ZR[RR0];			// Mapping from Selected Reservoirs to original ones
int R;					// Number of Selected Reservoirs
int NF[a in AR0]=-1;
int N;
int NN[i in NR0]=-1;
int ZN[NR0];			// Mapping from Selected nodes to original ones
int B;

int NNRD[n in NR0]=-1;
int NNR[NR0][NR0];
int LNRD[n in NR0]=-1;
int LNR[NR0][LR];

execute Selection{
  	var i,j,k,g,t,i0,a,n,a0,a1;
	writeln("Regional Selection:",ARF);
	j=0;for(i in AR0)if(ARF[i]!=0)ZA[j++]=i;			if(j!=A)writeln("Error in A",j," ",A);	
	j=0;for(i in PR0)if(ARF[NA[PN0[i]]]!=0)ZP[j++]=i;	if(j!=P)writeln("Error in P",j," ",P);
	j=0;for(i in CR0)if(ARF[NA[CN0[i]]]!=0)ZC[j++]=i;	if(j!=C)writeln("Error in C",j," ",C);
	j=0;for(i in SR0)if(ARF[NA[SN0[i]]]!=0)ZS[j++]=i;	if(j!=S)writeln("Error in S",j," ",S);
	j=0;for(i in ER0)for(k in ETR)if(ARF[NA[EN0[i]]]!=0&&KEmax[i][    k ]!=0)ZE[j++]=ETYN*i+k;	if(j!=E)writeln("Error in E",j," ",E);
	j=0;for(i in ER0)for(k in OTR)if(ARF[NA[EN0[i]]]!=0&&KEmax[i][IFD[k]]!=0)ZO[j++]=OTYN*i+k;	if(j!=O)writeln("Error in O",j," ",O);
	j=0;for(i in LR0)if(ARF[NA[LN0[i]]]!=0)ZL[j++]=i;	if(j!=L)writeln("Error in L",j," ",L);
	for(i in SR)RVM0[RVN[ZS[i]]][++RVMN0[RVN[ZS[i]]]]=i;
	for(i in RR0)if(RVMN0[i]!=-1)ZR[R++]=i;
	
	for(n in NR0)
		if(ARF[NA[n]]==1){ZN[N]=n;NN[n]=N++;}
		else if(ARF[NA[n]]>=2){ZN[N]=n;if(NF[NA[n]]==-1)NF[NA[n]]=N++;NN[n]=NF[NA[n]];}
	for(i in LR)LNR[NN[LN0[ZL[i]]]][++LNRD[NN[LN0[ZL[i]]]]]=i;
	for(i in NR0)if(NN[i]!=-1)NNR[NN[i]][++NNRD[NN[i]]]=i;

	for(i in BR0){
		a0=NA[BN0[i][0]];a1=NA[BN0[i][1]];
		if(ARF[a0]!=1||ARF[a1]!=1){LOSS0[i]=0;XX0[i]=0;}	
		if(ARF[a0]==0||ARF[a1]==0||(ARF[a0]>=2&&a0==a1)){KBmax[i]=0;KBmin[i]=0;}
		else ZB[B++]=i;
   		if(ARF[a0]>=3&&ARF[a0]==ARF[a1]&&a0!=a1){KBmax[i]=-1;TFC0[i]=0;MFLOW0[i][0]=-1;MFLOW0[i][1]=-1;}
	}
	writeln("A=",A," N=",N," P=",P," C=",C," S=",S," E=",E," O=",O," OTYN=",OTYN," L=",L," B=",B," R=",R);
	writeln("PP=",PP," COAL=",COAL," LNG=",LNG," NUCLAER=",NUCLEAR," OIL=",OIL);
}

int NYD[0..12];
float URT[DR0][PR];				// Availability of Thermal Plants by Date

execute TIME{
 	var m,i,d,ds,de;
	for(m=1;m<=12;m++)NYD[m]+=NYD[m-1]+NMD[m];
	for(i in PR)if(MSD[ZP[i]]!=0){
		ds=NYD[Math.floor(MSD[ZP[i]]/100)-1]+(MSD[ZP[i]]%100)-1;
		de=ds+MDY[PTY0[ZP[i]]];
		for(d=0;d<NYD[12];d++)URT[d][i]=1;
		for(d=ds;d<Math.min(de,NYD[12]);d++)URT[d][i]=0;
		for(d=0;d<de-NYD[12];d++)URT[d][i]=0;
 	}
}

range BR=0..B-1;
range RR=0..R-1;
range NR=0..N-1;
int AN[n in NR]=sum(a in AR)a*ANR[ZN[n]][ZA[a]];

int NC[NR];				// Index of Separated Networks by Selected Node
int AM[NR][NR];			// Adjacency Matrix of AC Networks
int NS[NR];				// Index of Separated Networks by Selected Node
int NB;					// Number of Swing Nodes
int NBA[NR];			// Swing Nodes of Separated Networks by Selected Node
int FB[BR];				// Flag for inter-connecting links
int FB0[BR0];
int BN[i in BR][j in IR]=NN[BN0[ZB[i]][j]];
float XX[b in BR]=XX0[ZB[b]];             

execute Network{
	var i,j,n,f,i0,t,n0,n1;
	for(i in BR0)if(AN0[BN0[i][0]]!=AN0[BN0[i][1]])FB0[i]=1;
	for(i in BR )if(AN [BN [i][0]]!=AN [BN [i][1]])FB [i]=1;
	
//  Searching Connectivity of the Networks 
	for(i in BR)if(XX[i]>0){n0=BN[i][0];n1=BN[i][1];AM[n0][n1]=1;AM[n1][n0]=1;}
	for(i in NR)NC[i]=N;
	f=1;
	while(f==1){
		f=0;n=0;
		for(i in NR){
			for(j=0;j<i;j++)if(AM[i][j]==1&&NC[j]<NC[i]){NC[i]=NC[j];f=1;}
			for(j=0;j<i;j++)if(AM[i][j]==1){
				if(NC[i]==N)NC[i]=n++; 
				NC[j]=NC[i];
 			}
		}
	}
//	Searching Swing Nodes of AC Networks and Non-synchronous Nodes
	NB=0;NS[0]=0;
	for(i in NR){
		if(NC[i]!=N){
			f=1;
			for(j=0;j<NB;j++)if(NC[i]==NS[j])f=0;
			if(f==1){NBA[NB]=i;NS[NB++]=NC[i];}
		}
		else {NBA[NB]=i;NS[NB++]=-1;}
	}
	i0=0;
	for(i=0;i<NB;i++)if(NS[i]>=0){
	  	write(" The node set of No.",i0++," AC Network:");
		for(j in NR)if(NC[j]==NS[i])write(" ",ZN[j]);
		writeln();
 	}
	write(" The set of non-synchronous node:");
 	for(i=0;i<NB;i++)if(NS[i]<0)write(" ",ZN[NBA[i]]);
	writeln();
}

float OCR[i in PR]=OCR0[ZP[i]];
float HRT[i in PR][j in IR]=HRT0[ZP[i]][j];
float STUC[i in PR]=STUC0[ZP[i]];
float LFCR[i in PR]=LFCR0[ZP[i]];
float SYN[i in PR]=SYN0[ZP[i]];
float UCAP[i in PR]=UCAP0[ZP[i]];
float MOL[i in PR]=UCAP0[ZP[i]]*MOL0[ZP[i]];
float FPRC[i in FR]=(FCT[i]+CO2Tax*FCC[i])/FHC[i];// Unit fuel price [yen/Mcal]

int LFC[i in PR]=LFC0[PTY0[ZP[i]]];
int REG[j in IR][i in PR]=REG0[j][PTY0[ZP[i]]];

float CRE[d in DR][i in CR]=CRE0[d][ZC[i]];
float CLFCR[i in CR]=CLFCR0[CTY0[ZC[i]]];
float CSYN[i in CR]=CSYN0[CTY0[ZC[i]]];

float UCAS[i in SR]=UCAS0[ZS[i]];
float MSR[i in SR][j in IR]=UCAS0[ZS[i]]*MSR0[ZS[i]][j];
float SLFCR[i in SR]=SLFCR0[ZS[i]];
float SSYN[i in SR]=SSYN0[ZS[i]];
float RVC[i in RR]=RVC0[ZR[i]];
int RVMN[i in RR]=RVMN0[ZR[i]];
int RVM[i in RR][j in SR]=RVM0[ZR[i]][j];

float MFLOW[b in BR][i in IR]=MFLOW0[ZB[b]][i]; // Maximum Flow
float LOSS[b in BR]=0.5*LOSS0[ZB[b]];			// Transmission Losses (modified)

int EM[i in ER]=ZE[i] div ETYN;					// Site Number of Distributed Energy System Elements
int EN[i in ER]=NN[EN0[EM[i]]];					// New Node Number of Energy System Elements
int ETY[i in ER]=ZE[i] mod ETYN;				// Type of Energy System Facilities
int OM[i in OR]=ZO[i] div OTYN;					// Site Number of Distributed Energy System Elements
int ON[i in OR]=NN[EN0[OM[i]]];					// New Node Number of Energy System Elements
int OTY[i in OR]=ZO[i] mod OTYN;				// Type of Energy System Operations
float EUS[i in ER]=EUS0[ETY[i]]/ETU0[ETY[i]];	// Usage Rate including Temporal Unit Conversion
int U=sum(i in ER)IES[ETY[i]];					// The Number of Energy Storing Technologies
range UR=0..U-1;

int IEN[UR];
float ES0[UR][OTR];
int IE[UR][OTR];
float ECY[UR];		// Life Cycle
float EDT[UR];		// Duration Time
float ECT[UR];		// C-Rate
int IU[0..1][UR];
int ICAPN[i in ER]=-1;
int ICAP[ER][OTR];
float TARGET[0..2];
float METRE=...;
float METLOADN[DR0][AR0]=...;
float METLOAD[d in DR][a in AR]=METRE*METLOADN[d][ZA[a]];
float HySchN[DR0][ER0]=...;
float HySch[d in DR][e in ER0]=HySchN[d][e];
int CO2DE[OTR]=...;
int CCS=...;
int TOE[OR];
float DLFCC[OTR]=...;  //coefficient for LFC constraint (Battery)
float ESLFC[UR][OTR];
int CAPL[i in 0..U-1]=1;
int SynNo=...;
range SY=0..SynNo-1;
float SynAr0[AR0]=...;
float SynAr[a in AR]=SynAr0[ZA[a]];
int IEHy[UR];
int ESHy[i in 0..U-1]=0;

execute Distributed_ES{
	var i,j,k,v,i0,j0;
   	i0=0;
   	for(i in OR)if(IES[IFD[OTY[i]]]==1)for(j in GR)if(ESC[j][OTY[i]]!=0){
  		IE[i0][0]=i;ES0[i0][0]=ESC[j][OTY[i]]; 										// Modification of Storage Coefficients 
  			if(HyFlag[j]>=1){  			
  				IEHy[i0]=OM[i]+E0*(HyFlag[j]-1);
  				ESHy[i0]=1;
  			 }  			
 	  	for(k in OR)if(IES[IFD[OTY[k]]]==0&&ON[i]==ON[k]){
	 		if(ESC[j][OTY[k]]!=0){IE[i0][++IEN[i0]]=k;ES0[i0][IEN[i0]]=ESC[j][OTY[k]];ESLFC[i0][IEN[i0]]=DLFCC[OTY[k]];		// Coefficient for Discharge
    			if(DLFCC[OTY[k]]==0)CAPL[i0]=0;			//LFC reserve only for Battery   			
    		}     	
     	}
     	j0=IFD[OTY[i]];
     	ECY[i0]=ECY0[j0]/ELT[j0];
		EDT[i0]=EDT0[j0];
		ECT[i0]=ECT0[j0];
	  	for(k in ER)if(EN[k]==ON[i]&&ETY[k]==j0)IU[0][i0]=k;
	  	for(k in ER)if(EN[k]==ON[i]&&ETY[k]==IFD[OTY[IE[i0][1]]])IU[1][i0]=k;
     	i0++; 	  			
   	}
    for(i in OR)for(j in ER)if(EN[j]==ON[i]&&ETY[j]==IFD[OTY[i]])ICAP[j][++ICAPN[j]]=i;
    for(i in ER)for(j in OR)if(EN[i]==ON[j]&&ETY[i]==IFD[OTY[j]])TOE[j]=i;
    

    TARGET[0]=CO2Max*1000;	// kton of CO2
    TARGET[1]=SOLMAX*1000;  // Conversion from MTOE to Million kg of oil equivalent
    TARGET[2]=SOLMIN*1000;	// Conversion from MTOE to Million kg of oil equivalent 
}

int KM=maxl(P,S,C,E,N*VTYN,B);
int IKD=9;
int IK[0..IKD-1][0..KM-1];
int KD=4*P+S+C+E+A*VTYN+B;
range KR=0..KD-1;
float v0=1-SVR;
float v1=AIR+FATX;
float v2=1/AIR;
float v3=1+AIR;
float SLOPE[PR];
float INSEC[PR];
float FC[KR];
float Kmax[KR];
float Kmin[KR];
float EXIUP[PR];

execute Fixed_Cost{
  	var i,j,i0,j0,k0,f0;
  	k0=0;
 	for(i in PR){
 	  	i0=ZP[i];
 	  	j0=PTY0[i0];
 	  	FC[k0]=(v0/PLT[j0]*(1-v1*(v2-PLT[j0]/(Math.pow(v3,PLT[j0])-1)))+v1+POM[j0])*PUC[j0]*UCAP[i];
 		Kmax[k0]=KPmax[i0];
 		Kmin[k0]=KPmin[i0];
 		EXIUP[k0]=EXIU[i0];
		if(MOL0[i0]<1)SLOPE[i]=(HRT[i][1]-HRT[i][0])/(1-MOL0[i0])+HRT[i][0];else SLOPE[i]=HRT[i][1]; // Mcal/kWh
 		INSEC[i]=UCAP[i]*(HRT[i][1]-SLOPE[i]);
 	  	IK[0][i]=k0++;
 	}
 	for(i in SR){
 	  	i0=ZS[i];
 	  	j0=STY0[i0];
 	  	FC[k0]=(v0/SLT[j0]*(1-v1*(v2-SLT[j0]/(Math.pow(v3,SLT[j0])-1)))+v1+SOM[j0])*SUC[j0]*UCAS[i];
 	  	Kmax[k0]=KSmax[i0];
 	  	Kmin[k0]=KSmin[i0];
 	  	IK[1][i]=k0++;
 	}
 	for(i in CR){
 	  	i0=ZC[i];
 	  	j0=CTY0[i0];
 	  	FC[k0]=(v0/CLT[j0]*(1-v1*(v2-CLT[j0]/(Math.pow(v3,CLT[j0])-1)))+v1+COM[j0])*CUC[j0];
 		Kmax[k0]=KCmax[i0];
 		Kmin[k0]=KCmin[i0];
 		IK[2][i]=k0++;
 	}
 	for(i in ER){
 	  	i0=EM[i];
 	  	j0=ETY[i];
 	  	FC[k0]=(v0/ELT[j0]*(1-v1*(v2-ELT[j0]/(Math.pow(v3,ELT[j0])-1)))+v1+EOM[j0])*EUC[j0];
 	  	Kmax[k0]=KEmax[i0][j0];
 	  	Kmin[k0]=KEmin[i0][j0];
 	  	IK[3][i]=k0++;
 	}
 	for(i in AR)for(j in VTR){
 	  	FC[k0]=(v0/VLT[j]*(1-v1*(v2-VLT[j]/(Math.pow(v3,VLT[j])-1)))+v1+VOM[j])*VUC[j];
 	  	Kmax[k0]=KVmax[ZA[i]][j];
		Kmin[k0]=KVmin[ZA[i]][j];
 	  	if(Kmin[k0]>Kmax[k0])writeln("Error in VRE1");
 	  	if(Kmin[k0]<0||Kmax[k0]<0)writeln("Error in VRE2");
 	  	IK[4][A*j+i]=k0++;
	}
 	for(i in BR){
 	  	i0=ZB[i];
 	  //	FC[k0]=TFC0[i0];
 	    FC[k0]=(v0/BLT*(1-v1*(v2-BLT/(Math.pow(v3,BLT)-1)))+v1+BOMR)*TFC0[i0];
 	  	Kmax[k0]=KBmax[i0];
 	  	Kmin[k0]=KBmin[i0];
 	  	IK[5][i]=k0++;
 	}
 	for(i in PR){
 	  	FC[k0]=RFC0[0];
 	  	Kmax[k0]=KPmax[ZP[i]];
 	  	Kmin[k0]=0;
 	  	IK[6][i]=k0++;
 	}
 	for(i in PR){
 	  	FC[k0]=RFC0[1];
 	  	Kmax[k0]=KPmax[ZP[i]];
 	  	Kmin[k0]=0;
 	  	IK[7][i]=k0++;
 	} 
 	for(i in PR){  //CCS equipment
 	  	i0=ZP[i];
 	  	j0=PTY0[i0];
 	  	if(CCSLT[j0]>0)FC[k0]=(v0/CCSLT[j0]*(1-v1*(v2-CCSLT[j0]/Math.pow(v3,CCSLT[j0]-1)))+v1+POM[j0])*CCSC[j0];else FC[k0]=0;
 	  	Kmax[k0]=CO2F[i0];
 	  	Kmin[k0]=0;
 	  	IK[8][i]=k0++;
	} 	
 	  	  	
 	writeln("KD=",k0," ",KD);
 	for(i in KR)FC[i]*=1000;
}

int MM0[i in PR]=maxl(MS0[PTY0[ZP[i]]],MO0[PTY0[ZP[i]]]);
int MD=sum(i in PR)MM0[i];
int SM=KD+2*(R+U+MD)+U+2+A;
int ISD=7;
range MDR=0..MD-1;
int IS[0..ISD-1][0..maxl(R,U+3,MD)-1];
range ISR=0..SM+1;
int ICD[IR];
int IC[ISR];

execute INDEXING3{	
  	var i,i0;
  	
   	i0=KD;
   	for(i in RR)IS[0][i]=i0++;
   	for(i in UR)IS[1][i]=i0++;
   	for(i in MDR)IS[5][i]=i0++;
   	for(i in UR)IS[2][i]=i0++;
 	IS[2][U]=i0++;			// CO2
   	IS[2][U+1]=i0++;		// Synthetic Oil
   	for(i in AR)IS[2][U+2+i]=i0++;		// Methane
  	for(i in RR)IS[3][i]=i0++;
	for(i in UR)IS[4][i]=i0++;
   	for(i in MDR)IS[6][i]=i0++;
   	writeln("SM=",i0," ",SM);
   	SM=i0;
   	
   	i0=0;
 	for(i in KR)if(Kmax[i]!=Kmin[i])IC[i0++]=i;
 	for(i=0;i<U+2+A;i++)IC[i0++]=IS[2][i];
 	for(i in RR)IC[i0++]=IS[0][i];
   	for(i in UR)IC[i0++]=IS[1][i];
   	for(i in MDR)IC[i0++]=IS[5][i];
   	ICD[0]=i0;
  	for(i in RR)IC[i0++]=IS[3][i];
	for(i in UR)IC[i0++]=IS[4][i];
	for(i in MDR)IC[i0++]=IS[6][i];
	//for(i=0;i<U+2+A;i++)IC[i0++]=IS[2][i];
	ICD[1]=i0;  		
   	IC[i0]=SM;
   	IC[i0+1]=SM+1;
   	writeln("ICD=",ICD);
}

int IXD=(4*P+C+2*S+2*B+O+R+2*N*VTYN+4*P)+(4*P+2*C+2*S+4*sum(i in BR)FB[i]+2*A+A*VLFCN)+(P+S+C+A)+P+2*U+2*E0;//+N;
int IX[0..39][0..maxl(P,C,S,B,R,U,O,N,N*VTYN,2,A*VTYN)-1];
range ER02=0..HyNum*E0-1;

execute Continuous_Variable_Index{
	var i,j,i0;
	i0=0;
	writeln("VRET[VTYN-1]=",VRET[VTYN-1])
	for(i in PR){
	  	IX[0][i]=i0++;						// Thermal Power Plants Electricity Generation
		IX[1][i]=i0++;						// Thermal Power Plants Fuel Consumption
		IX[2][i]=i0++;						// Resistance 1 (boiler)
		IX[3][i]=i0++;						// Resistance 2 (Condenser)
	} 			
 	for(i in CR)IX[4][i]=i0++;				// Constant Renewable Energy
 	for(i in SR){
 	  	IX[5][i]=i0++;						// Pumped Storage  (pump up)
 		IX[6][i]=i0++;						// Pumped Storage
 	} 		
 	for(i in BR){
 	  	IX[7][i]=i0++;						// Transmission
 		IX[8][i]=i0++;						// Transmission
 	} 		
 	for(i in OR)IX[9][i]=i0++;					// Distributed Energy Systems
 	for(i in RR)IX[10][i]=i0++; 					// Pumped Storage Reservoir
 	for(i in NR)for(j in VTR)IX[11][i+N*j]=i0++; // Variable Renewable Energy
 	for(i in NR)for(j in VTR)IX[31][i+N*j]=i0++; // Curtailed Variable Renewable Energy
 	for(i in PR){
 	  	IX[12][i]=i0++;						// Thermal Power Plants Start up
 		IX[13][i]=i0++;						// Thermal Power Plants Shut down
 		IX[14][i]=i0++;						// Control Reserve Up
 		IX[15][i]=i0++;						// Control Reserve Down
  	} 			
 	for(i in SR){
 	  	IX[16][i]=i0++;						// Control Reserve Up
 		IX[17][i]=i0++;						// Control Reserve Down
 	} 		
 	for(i in CR){
 	  	IX[18][i]=i0++;						// Control Reserve Up
 		IX[19][i]=i0++;						// Control Reserve Down
  	} 			
 	for(i in BR)if(FB[i]==1){
 	  	IX[20][i]=i0++;						// Control Reserve Up (Plus)
 		IX[21][i]=i0++;						// Control Reserve Up (Minus)
 		IX[22][i]=i0++;						// Control Reserve Down (Plus)
 		IX[23][i]=i0++;						// Control Reserve Down (Minus)
  	} 			
 	for(i in PR){
 	  	IX[24][i]=i0++;						// Control Reserve Up (resistance in boiler)
 		IX[25][i]=i0++;						// Control Reserve Up (resistance in condenser)
 	  	IX[26][i]=i0++;						// Control Reserve Down (resistance in boiler)
 		IX[27][i]=i0++;						// Control Reserve Down	(resistance in condenser)
 	} 	
 	for(i in AR){
 	  	IX[28][i]=i0++;						// Control Reserve Total Supply (Up)
 		IX[29][i]=i0++;						// Control Reserve Total Supply (Down)
 		for(j in VLFCNR)IX[30][i+A*j]=i0++;	// Control Reserve Demand by Renewables
  	} 
  	for(i in PR)IX[32][i]=i0++;				//Synchronous inertia
   	for(i in SR)IX[33][i]=i0++;				//Synchronous inertia
   	for(i in CR)IX[34][i]=i0++;	  			//Synchronous inertia
   	for(i in AR)IX[35][i]=i0++;				//Synchronous inertia Total Supply
    for(i in PR)IX[36][i]=i0++;				//Carbon Capture Amount [kton-CO2]
    for(i in UR)IX[37][i]=i0++;				//Control Reserve Up (Battery)
    for(i in UR)IX[38][i]=i0++;				//Control Reserve Down (Battery)
    for(i in ER02)IX[39][i]=i0++;			//Import H2[GWh]
    //for(i in OR)IX[39][i]=i0++;			//Import H2[GWh]
    //for(i in NR)IX[40][i]=i0++;				//for penalty factor (take away after testing)
    
 	writeln("IXR=",i0," ",IXD);
}

int ICE1M=4*P+2*S+C+2*N*VTYN+2*B+2*E;
int ICE1N[i in NR][j in MR]=-1;	int ICE1[NR][MR][0..ICE1M-1]; float VCE1[NR][MR][0..ICE1M-1];

execute MCE1{
  	var i,j,h,t,n,n0,n1,v,k,m;
  	writeln("Energy Balance Constraints");
	for(i in PR){
	  	n=NN[PN0[ZP[i]]];
	  	ICE1[n][Elec][++ICE1N[n][Elec]]=IX[0][i]; 	VCE1[n][Elec][ICE1N[n][Elec]]=(1-OCR[i]);
	  	for(j in IR){ICE1[n][Elec][++ICE1N[n][Elec]]=IX[2+j][i];VCE1[n][Elec][ICE1N[n][Elec]]=-1;}
	}
	for(i in CR){
	  	n=NN[CN0[ZC[i]]];
  	  	ICE1[n][Elec][++ICE1N[n][Elec]]=IX[4][i];  VCE1[n][Elec][ICE1N[n][Elec]]=1;
	}
	for(i in SR){
	  	n=NN[SN0[ZS[i]]];
  	  	for(j in IR){ICE1[n][Elec][++ICE1N[n][Elec]]=IX[5+j][i]; VCE1[n][Elec][ICE1N[n][Elec]]=-1+2*j;}
  	}
	for(n in NR)for(j in VTR){ICE1[n][Elec][++ICE1N[n][Elec]]=IX[11][n+N*j];VCE1[n][Elec][ICE1N[n][Elec]]=1;}
	
	for(i in BR)for(j in IR){
	  	n=BN[i][j];
	  	for(k in IR){ICE1[n][Elec][++ICE1N[n][Elec]]=IX[7+k][i];VCE1[n][Elec][ICE1N[n][Elec]]=Math.pow(-1,j+k)-LOSS[i];}
	}
	for(i in OR){
	  	n=ON[i];
	  	for(j in MR)if((v=EMC[j][OTY[i]])!=0){ICE1[n][j][++ICE1N[n][j]]=IX[9][i];VCE1[n][j][ICE1N[n][j]]=v;}
   	}
   	for(i in PR){  //CCS electricity consumption
   	  	n=NN[PN0[ZP[i]]];
   	  	ICE1[n][Elec][++ICE1N[n][Elec]]=IX[36][i]; VCE1[n][Elec][ICE1N[n][Elec]]=-CCSEL[PTY0[ZP[i]]]/1000;
    }   	  	
    for(i in PR){	//CCS CO2 storage
        n=NN[PN0[ZP[i]]];
        m=0;
        for(j in ER0){
          /*		if(NA[PN0[ZP[i]]]==NA[EN0[j]] && m>=1){
          		for(k in 1..m){VCE1[NN[EN0[j-k]]][NCO2][ICE1N[NN[EN0[j-k]]][NCO2]]*=(m/(m+1));
        		writeln("m/m+1=",m/(m+1));}
          		ICE1[NN[EN0[j]]][NCO2][++ICE1N[NN[EN0[j]]][NCO2]]=IX[36][i]; VCE1[NN[EN0[j]]][NCO2][ICE1N[NN[EN0[j]]][NCO2]]=1/(m+1);
          		m++;
           }          	  */
           	if(NA[PN0[ZP[i]]]==NA[EN0[j]] && m==1){
           	  VCE1[NN[EN0[j-1]]][NCO2][ICE1N[NN[EN0[j-1]]][NCO2]]*=1/2;
           	  ICE1[NN[EN0[j]]][NCO2][++ICE1N[NN[EN0[j]]][NCO2]]=IX[36][i]; VCE1[NN[EN0[j]]][NCO2][ICE1N[NN[EN0[j]]][NCO2]]=1/2;
           	  m++;
            }
                       	  
        	if(NA[PN0[ZP[i]]]==NA[EN0[j]] && m==0){ICE1[NN[EN0[j]]][NCO2][++ICE1N[NN[EN0[j]]][NCO2]]=IX[36][i]; VCE1[NN[EN0[j]]][NCO2][ICE1N[NN[EN0[j]]][NCO2]]=1; m=1;}  
       }        	
	}
	
/*	for(i in ER0){
		n=NN[EN0[i]]
		ICE1[n][Hyd][++ICE1N[n][Hyd]]=IX[39][i];	VCE1[n][Hyd][ICE1N[n][Hyd]]=1;
	}  		*/
	for(i in HHR){
		n=NN[PN0[ZP[i]]];
		m=0;
		for(j in ER0){
		/* if(NA[PN0[ZP[i]]]==NA[EN0[j]] && m>=1){
			for(k in 1..m){VCE1[NN[EN0[j-k]]][Hyd][ICE1N[NN[EN0[j-k]]][Hyd]]*=m/(m+1);}
			ICE1[NN[EN0[j]]][Hyd][++ICE1N[NN[EN0[j]]][Hyd]]=IX[0][i]; VCE1[NN[EN0[j]]][Hyd][ICE1N[NN[EN0[j]]][Hyd]]=-2.5*0.1183*1/(m+1);
			m++;
 		}			*/
 		if(NA[PN0[ZP[i]]]==NA[EN0[j]] && m==1){
 		  VCE1[NN[EN0[j-1]]][Hyd][ICE1N[NN[EN0[j-1]]][Hyd]]*=1/2;
 		  ICE1[NN[EN0[j]]][Hyd][++ICE1N[NN[EN0[j]]][Hyd]]=IX[0][i]; VCE1[NN[EN0[j]]][Hyd][ICE1N[NN[EN0[j]]][Hyd]]=-2.5*0.1183*1/2; m++;
   	} 		  
		if(NA[PN0[ZP[i]]]==NA[EN0[j]] && m==0){ICE1[NN[EN0[j]]][Hyd][++ICE1N[NN[EN0[j]]][Hyd]]=IX[0][i]; VCE1[NN[EN0[j]]][Hyd][ICE1N[NN[EN0[j]]][Hyd]]=-2.5*0.1183; m=1;}		//êÖëfî≠ìdÇ…ÇÊÇÈêÖëfè¡îÔ(î≠ìdå¯ó¶:40%, îMó î‰ó¶11.83%)	
		}		
	}
	for(i in HHR2){
		n=NN[PN0[ZP[i]]];
		m=0;
		for(j in ER0){
		/*if(NA[PN0[ZP[i]]]==NA[EN0[j]] && m>=1){
			for(k in 1..m){VCE1[NN[EN0[j-k]]][Hyd][ICE1N[NN[EN0[j-k]]][Hyd]]*=m/(m+1);}
			ICE1[NN[EN0[j]]][Hyd][++ICE1N[NN[EN0[j]]][Hyd]]=IX[0][i]; VCE1[NN[EN0[j]]][Hyd][ICE1N[NN[EN0[j]]][Hyd]]=-2.5*1/(m+1);
			m++;
 		}			*/
 		if(NA[PN0[ZP[i]]]==NA[EN0[j]] && m==1){
 		  VCE1[NN[EN0[j-1]]][Hyd][ICE1N[NN[EN0[j-1]]][Hyd]]*=1/2;
 		  ICE1[NN[EN0[j]]][Hyd][++ICE1N[NN[EN0[j]]][Hyd]]=IX[0][i]; VCE1[NN[EN0[j]]][Hyd][ICE1N[NN[EN0[j]]][Hyd]]=-2.5*1/2; m++;
  	 } 		  
		if(NA[PN0[ZP[i]]]==NA[EN0[j]] && m==0){ICE1[NN[EN0[j]]][Hyd][++ICE1N[NN[EN0[j]]][Hyd]]=IX[0][i]; VCE1[NN[EN0[j]]][Hyd][ICE1N[NN[EN0[j]]][Hyd]]=-2.5; m=1;}		//êÖëfî≠ìdÇ…ÇÊÇÈêÖëfè¡îÔ(î≠ìdå¯ó¶:40%, îMó î‰ó¶100%)	
		}			
	}
	/*for(n in NR){		//for penalty factor
	  	ICE1[n][Elec][++ICE1N[n][Elec]]=IX[40][n]; VCE1[n][Elec][ICE1N[n][Elec]]=1;
	}	  */
	
	
	
}
int ICV5M=2*P+S+N*VTYN+2*B+2*E;
int ICV5N[i in AR]=-1;	int ICV5[AR][0..ICV5M-1]; float VCV5[AR][0..ICV5M-1];

execute MCV5{
  	var i,j,h,a,a0,a1,v;
  	writeln("SNSP Constraints");
	for(i in PR){
	  	a=AN[NN[PN0[ZP[i]]]];
  		ICV5[a][++ICV5N[a]]=IX[2][i];		VCV5[a][ICV5N[a]]=MAX_SNSP[ZA[a]];
  		ICV5[a][++ICV5N[a]]=IX[3][i];		VCV5[a][ICV5N[a]]=MAX_SNSP[ZA[a]];
   	}  
   	for(i in SR){a=AN[NN[SN0[ZS[i]]]];ICV5[a][++ICV5N[a]]=IX[5][i];	VCV5[a][ICV5N[a]]=MAX_SNSP[ZA[a]];}
	for(i in NR)for(j in VTR){a=AN[i];ICV5[a][++ICV5N[a]]=IX[11][i+N*j];VCV5[a][ICV5N[a]]=-1;}		
	for(i in BR)if((a0=AN[BN[i][0]])!=(a1=AN[BN[i][1]])){
  		ICV5[a0][++ICV5N[a0]]=IX[8][i];	VCV5[a0][ICV5N[a0]]=MAX_SNSP[ZA[a0]];
  		ICV5[a1][++ICV5N[a1]]=IX[7][i];	VCV5[a1][ICV5N[a1]]=MAX_SNSP[ZA[a1]];
	}
	for(i in OR)if((v=EMC[Elec][OTY[i]])!=0){
	  	a=AN[ON[i]];
		ICV5[a][++ICV5N[a]]=IX[9][i];VCV5[a][ICV5N[a]]=-MAX_SNSP[ZA[a]]*v;
   	}
 	for(a in AR)if(MAX_SNSP[ZA[a]]<0)ICV5N[a]=-1;
}

int ICK2M=P+S+C+E;
int ICK2N[i in AR]=-1;	int ICK2[AR][0..ICK2M-1]; float VCK2[DR][AR][0..ICK2M-1]; 

execute MCK2{
  	var i,j,t,a,v,d,h;
	writeln("Supply Capability Constraints");
	
	if(DELTA>=0){
		for(i in PR){a=AN[NN[PN0[ZP[i]]]];	ICK2[a][++ICK2N[a]]=IK[0][i];	for(d in DR)VCK2[d][a][ICK2N[a]]=UCAP[i]*URT[d][i];}
		for(i in CR){a=AN[NN[CN0[ZC[i]]]];	ICK2[a][++ICK2N[a]]=IK[2][i];	for(d in DR)VCK2[d][a][ICK2N[a]]=CRE[d][i];}
		for(i in SR){a=AN[NN[SN0[ZS[i]]]];	ICK2[a][++ICK2N[a]]=IK[1][i];	for(d in DR)VCK2[d][a][ICK2N[a]]=UCAS[i];}
  		for(i in ER)
  		if(PSC[ETY[i]]==1){a=AN[EN[i]];		ICK2[a][++ICK2N[a]]=IK[3][i];	for(d in DR)VCK2[d][a][ICK2N[a]]=EUS[i];}
 	} 		
}

int LFCM=3*P+C+S+4*B+U;
int LFCN[i in AR][j in IR]=-1; int LFCI[AR][0..LFCM-1][j in IR]; float VLFC[AR][0..LFCM-1][j in IR];
int RLFCN[i in AR][j in VLFCNR]=-1; int RLFC[AR][VLFCNR][0..2*N-1];

execute MLFC{
  	var i,j,h,a,a0,a1,t,n,b,k;
  	writeln("LFC Constraints");

  	for(i in PR){
	  	a=AN[NN[PN0[ZP[i]]]];
	  	for(j in IR){
	  	  	LFCI[a][++LFCN[a][j]][j]=IX[14+j][i];VLFC[a][LFCN[a][j]][j]=1;
 	  		for(k in IR){LFCI[a][++LFCN[a][j]][j]=IX[24+k+2*j][i];VLFC[a][LFCN[a][j]][j]=1;}
    	} 	  		
   	}  
  	for(i in SR){a=AN[NN[SN0[ZS[i]]]];for(j in IR){LFCI[a][++LFCN[a][j]][j]=IX[16+j][i];VLFC[a][LFCN[a][j]][j]=1;}}
  	for(i in CR){a=AN[NN[CN0[ZC[i]]]];for(j in IR){LFCI[a][++LFCN[a][j]][j]=IX[18+j][i];VLFC[a][LFCN[a][j]][j]=1;}}
  	for(i in UR){a=AN[ON[IE[i][0]]];for(j in IR){LFCI[a][++LFCN[a][j]][j]=IX[37+j][i];VLFC[a][LFCN[a][j]][j]=1;}}
  	for(b in BR)if(FB[b]==1)for(i in IR){
		a=AN[BN[b][i]];
		for(j in IR)for(k in IR){LFCI[a][++LFCN[a][k]][k]=IX[20+j+2*k][b];VLFC[a][LFCN[a][k]][k]=Math.pow(-1,i+j+k);}
   	}
   	for(n in NR)for(j in VTR)RLFC[AN[n]][VRET[j]][++RLFCN[AN[n]][VRET[j]]]=IX[11][n+N*j];	// variable renewable of Area
}

int SYNM=P+S+C;
int SYNN[i in AR]=-1; int SYNI[AR][0..SYNM-1];
int SYNAR[SY][AR];	  int KSYN[i in SY]=-1;
execute MSYN{
  var i,a,s;
  writeln("Synchronous Inertia");
  
  for(i in PR){a=AN[NN[PN0[ZP[i]]]];  SYNI[a][++SYNN[a]]=IX[32][i];}
  for(i in SR){a=AN[NN[SN0[ZS[i]]]];  SYNI[a][++SYNN[a]]=IX[33][i];}
  for(i in CR){a=AN[NN[CN0[ZC[i]]]];  SYNI[a][++SYNN[a]]=IX[34][i];}
  for(a in AR) SYNAR[SynAr[a]][++KSYN[SynAr[a]]]=a;
}

int NHW=...;
int TB0=(DB-1)*H0 div NHW;
int TE0=DE*H0 div NHW-1;
range TR0=TB0..TE0;
int TDB[t in TR0]=NHW*t div H0;
int TDE[t in TR0]=(NHW*(t+1)-1)div H0;
float X[IR][0..ICD[1]+1][TR0][0..max(i in IR)QN[i]];
float BF[IR][0..ICD[1]+2][TR0];
int Q[0..1][IR][TR0];
float OBJ[0..3][TR0];
int KK=(TE0-TB0+1) div (7*H0 div NHW);
range WKR=0..KK;
int WEEK[w in WKR]=TB0+7*H0*w div NHW-1;

execute XXX{
	var i;
   	for(t in TR0){
    	X[0][ICD[1]+1][t][0]=-1;
  		X[1][ICD[1]  ][t][0]= 1;
  		Q[0][0][t]=1;
  		Q[0][1][t]=1;
	}  
	writeln("WEEK=",WEEK);
}


int FHW=...; 
int HW=...;				// Time Slots Aggregation Number (Divisor of 24)
execute pre{if(FHW!=0)HW=FHW;} 
int W=NHW div HW;
int H=H0 div HW;		// The Number of Time Slots per Day
int HB=H*(DB-1);		// Begining Time 
int HE=H*DE-1;			// End Time
range HR=HB..HE;

int IZ[IR][0..MD-1];
int MS[i in PR]=ftoi(ceil(MS0[PTY0[ZP[i]]]/HW));	
int MO[i in PR]=ftoi(ceil(MO0[PTY0[ZP[i]]]/HW));
int MM[i in PR]=maxl(MS[i],MO[i]);
int JZ[-max(i in PR)MM[i]..W-1][0..2][0..maxl(P,S)-1];
int JZD=W*(P+2*S)+sum(i in PR)MM[i];


execute Integer_Variable_Index{ 	
	var i,j,i0,w;
 	i0=0;
 	for(w=0;w<W;w++){
 	  	for(i in PR)JZ[w][0][i]=i0++;
 	  	for(i in SR){JZ[w][1][i]=i0++;JZ[w][2][i]=i0++;} 	  	
  	}
  	for(i in PR)for(j=1;j<=MM[i];j++)JZ[-j][0][i]=i0++;
 	writeln("JZD=",i0," ",JZD);
 	i0=0;
 	for(i in PR)for(j=1;j<=MM0[i];j++){
  	  	j0=Math.ceil(j/HW);
  	  	IZ[1][i0]=JZ[W-j0][0][i];
  	  	IZ[0][i0]=JZ[ -j0][0][i];
  	  	i0++;
    } 
}

float VU[h in HR][i in NR][j in VTR]=1/HW*maxl(0,sum(n in 0..NNRD[i])VRES[NNR[i][n]][j]*sum(k in 0..HW-1)VU0[k+HW*h][NNR[i][n]+N0*j]);
float LOADN[h in HR][n in NR]=1/HW*sum(i in 0..LNRD[n])sum(j in 0..HW-1)LOAD0[j+HW*h][ZL[LNR[n][i]]];
float LOADA[h in HR][a in AR]=sum(n in NR)ANR[ZN[n]][ZA[a]]*LOADN[h][n];
float BCV5[h in HR][a in AR]=-MAX_SNSP[ZA[a]]*LOADA[h][a];
float BCK2[d in DR][a in AR]=(1+DELTA)*max(h in H*d..H*(d+1)-1)LOADA[h][a];
float BLFC[h in HR][a in AR]=DLFCR[ZA[a]]*LOADA[h][a];
float BSYN[a in AR]=DSYNR[ZA[a]]; //Synchronous Inertia [GW*s]
float BBSYN[SY];
execute SSSYN{
  var a;
  for(a in AR)BBSYN[SynAr[a]]+=BSYN[a];
}

int ICCM=maxl(P+O,2);
int ICCN[i in 0..U+1]=-1;	int ICC[i in 0..U+1][0..ICCM-1]; float VCC[i in 0..U+1][0..ICCM-1];

float LFCF;
float PVC[PR];		// Variable cost of thermal power plant	[yen/Mcal]
float CVC[CR];		// Variable cost of renewable power plant [yen/kWh]
float EVC[OR];
float ES[UR][OTR];
float CO2[PR];

execute CUMU{
  	var i,j,i0,n;
	LFCF=HW*LFCF0;
	for(i in PR)PVC[i]=HW*FPRC[BTY[PTY0[ZP[i]]]];
	for(i in HHR)PVC[i]=PVC[i]*0.8817;			//H2 mixed fuel (30vol%)
	for(i in HHR2)PVC[i]=PVC[i]*0;	  			//H2 fuel (100vol%)
   	for(i in CR)CVC[i]=HW*CVC0[CTY0[ZC[i]]];
	for(i in OR)EVC[i]=HW*EVC0[OTY[i]];
	for(i in PR)CO2[i]=HW*FCC[BTY[PTY0[ZP[i]]]]/FHC[BTY[PTY0[ZP[i]]]];   //CO2 [kg-carbon/Mcal]
	for(i in HHR)CO2[i]=CO2[i]*0.8817;			//H2 mixed fuel (30vol%)
	for(i in HHR2)CO2[i]=CO2[i]*0;				//H2 fuel (100vol%)
	
	//writeln("PVC=",PVC);
	
	for(i in UR){
	  	ES[i][0]=Math.pow(ES0[i][0],HW); 
	  	for(j=1;j<=IEN[i];j++)ES[i][j]=HW*ES0[i][j];
	  	if(ECY[i]>0)for(j=1;j<=IEN[i];j++)if(ES[i][j]>0){ICC[i][++ICCN[i]]=IX[9][IE[i][j]];VCC[i][ICCN[i]]=ES[i][j];}
 	}	  
	if(CO2Max>=0){
	for(i in PR){ICC[U][++ICCN[U]]=IX[1][i];VCC[U][ICCN[U]]=CO2[i];}
	for(i in OR)if(CO2DE[OTY[i]]>=1){ICC[U][++ICCN[U]]=IX[9][i];VCC[U][ICCN[U]]=HW*EMC[NCO2][OTY[i]];} //captured CO2[kton],CCSï™ÇCO2îrèoó Ç©ÇÁå∏Ç∂ÇÈ
	}		
	if(SOLMAX>=0||SOLMIN>0){
	  	i0=U+1;
	  	for(n in NR)for(i=0;i<=ICE1N[n][Syno];i++){ICC[i0][++ICCN[i0]]=ICE1[n][Syno][i];VCC[i0][ICCN[i0]]=HW*VCE1[n][Syno][i];}
	}
	for(i in OTR)CO2DE[i]*=HW;		  	
}

float SDR[i in RR]=pow(1-SDC[0],HW);
float SCE[i in SR]=HW*pow(CEF[ZS[i]],0.5);
float SDE[i in SR]=HW*pow(CEF[ZS[i]],-0.5);

int METICCM=E0;
int METICCN[a in AR]=-1;		int METICC[a in AR][0..METICCM-1];	float METVCC[a in AR][0..METICCM-1];

execute METCUMU{
  var i,n,a;
  for(n in NR)for(i=0;i<=ICE1N[n][Syno];i++){METICC[AN[n]][++METICCN[AN[n]]]=ICE1[n][Syno][i];METVCC[AN[n]][METICCN[AN[n]]]=HW*VCE1[n][Syno][i];}
}


