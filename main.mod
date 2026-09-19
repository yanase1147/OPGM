/*********************************************
 * OPL 12.7.1.0 Model
 * Author: fujii
 * Creation Date: 2020/02/27 at 14:54:19
 *********************************************/
main{

  	var MODE=1;		//<====  1:Intertemporal, 2:Decomposed(Serial), 3:Decomposed(Parallel), 4:Forward Calculation, 5:Report Writing
    var Model_1=0;	//<====  Intertemporal Model Operation:= 0:No, 1:Yes
    var Model_2=0;	//<====  Decomposed Model Operation:= 0:No, 1:Serial, 2:Parallel
	var Model_3=0;	//<====  Forward Calculation Model:= 0:No, 1:Yes
	var DEC=1;		//<====  Decomposed Calculation:= 0:No,1:Yes
	var LPF=0;		//<====  LP File Generation:= 0:No, 1:Yes
	var CPH=0;		//<====  Hot Start with Cutting Planes and Convex Hull:= 0:No, 1:Yes,  
	var FWD=0;		//<====  Forward Calculation Mode:= 0:No, 1:Forward, -1:Backward
	var MIP=0;		//<====  Unit Committment as MIP:= 0:No, 1:Yes
  	var REP=0;		//<====  Report Writing:= 0:No, 1:Yes
	var BDC=0;		//<====  Boundary Condition:= 0:Open, 1:Fixed
	var ITNR=100;	//<====  Interval of CPH file writing 
	var FHW=1;		//<====  Flag for Time Aggregation:= 0:No modification, 1:Modification of HW to 1 hour in init.mod
	var NHW=24;		//<====  Number of Hours for one steps in ADP
	var INI=0;		//<====  Number of time steps to estimate initial conditions
  	var NN=2;		//<====  Number of horizon time steps for forward and backward calculation
  	var MM=1;		//<====	 Number of moving time steps for forward and backword calculation
	var CRO=1;		//<====  Cross over 0:Yes, 1:No (Ver 10), 2:No (Other Version)
	var VER=0;		//<====  Version 1:12.10 0:else
	var ITN=0;		//<====  Iteration number
  	var TB1;
  	var str0="data\\";// "\\\\hizen\\adp\\opgm\\data\\";
  	var str1="res\\";// "\\\\hizen\\adp\\opgm\\res\\";
  	var str2="cph\\";// "\\\\hizen\\adp\\opgm\\cph\\";
  	var str3="cph_backup\\";// "\\\\hizen\\adp\\opgm\\cph\\";
	
	
	cplex.numericalemphasis=1;
//	cplex.simdisplay=0;
//	cplex.bardisplay=0;
	cplex.lpmethod=4;
	cplex.baralg=1; 		//0, 1, 2 or 3
	cplex.aggind=0			//-1,0
	cplex.aggfill=0;		//10,0
	cplex.prepass=0;		//-1,0
	cplex.barmaxcor=40;		//-1
	cplex.epgap=0.001;
	  	if(VER==1)cplex.solutiontype=2;else cplex.barcrossalg=-1;

	if(MODE==0){
	  	CPH=0;	LPF=1;
 	}
 	else if(MODE==1){
	  	Model_1=1;
	  	REP=1;	FHW=0; 	NHW=24; DEC=0;
		cplex.baralg=1; 		//0, 1, 2 or 3
		cplex.barepcomp=1e-4;	//1e-8
 	} 
 	else if(MODE==2){
   	  	Model_2=1;
	//	cplex.threads=16;
 	}
 	else if(MODE==3){
   	  	Model_2=2;
	//	cplex.threads=16;
  	} 	
  	else if(MODE==4){ 
   	  	Model_3=1;
	  	FWD=1; 	REP=1;
   	}
   	else if(MODE==5){REP=1;DEC=0;INI=-1;}  
   	
	//Preparation for Initialization of parameters
	var INIT_SRC= new IloOplModelSource("Init.mod");
	var INIT_DEF= new IloOplModelDefinition(INIT_SRC);
	var INIT_IN	= new IloOplDataSource("Init.dat");
	var REP_OUT	= new IloOplDataSource("Rep.dat");
	var DAT		= new IloOplDataElements;	// for OPGM
	var DAT1	= new IloOplDataElements;	// for INIT
	var DAT2	= new IloOplDataElements;	// for REPORT
	var DAT3	= new IloOplDataElements;	// for READ and WRITE

	writeln("Initialization")
	DAT1.FHW=FHW;
	DAT1.NHW=NHW;
	DAT1.DEC=DEC;
	var INIT	= new IloOplModel(INIT_DEF,cplex);
	INIT.addDataSource(DAT1);	
	INIT.addDataSource(INIT_IN);
	writeln("Reading the input files");	
	INIT.generate();
	
	var TB0,TE0;
	TB0=INIT.TB0;			TE0=INIT.TE0;
	DAT.str0=str0;			DAT.str1=str1;	
	DAT.DB=INIT.DB;			DAT.DE=INIT.DE;			DAT.H=INIT.H;		DAT.D0=INIT.D0;
	DAT.A=INIT.A;			DAT.P=INIT.P;			DAT.S=INIT.S;		DAT.R=INIT.R;
	DAT.C=INIT.C;			DAT.E=INIT.E;			DAT.B=INIT.B;		DAT.U=INIT.U; 	DAT.O=INIT.O;
	DAT.M=INIT.M;			DAT.N=INIT.N;			DAT.SM=INIT.SM;		DAT.F=INIT.F;
	DAT.VTYN=INIT.VTYN;		DAT.ETYN=INIT.ETYN; 	DAT.OTYN=INIT.OTYN;
	DAT.KD=INIT.KD;
	DAT.IK=INIT.IK;			DAT.IS=INIT.IS;			DAT.IU=INIT.IU;		DAT.FB=INIT.FB;
	DAT.LFCF=INIT.LFCF;
	DAT.TARGET=INIT.TARGET;	DAT.FHC=INIT.FHC;		DAT.FCC=INIT.FCC;
	DAT.Kmin=INIT.Kmin;		DAT.Kmax=INIT.Kmax;
	DAT.ECY=INIT.ECY;		DAT.EDT=INIT.EDT;		DAT.ECT=INIT.ECT;
	DAT.AN=INIT.AN;		
	DAT.UCAP=INIT.UCAP;		DAT.UCAS=INIT.UCAS;		DAT.URT=INIT.URT;	DAT.CRE=INIT.CRE;
	DAT.BN=INIT.BN;			DAT.NB=INIT.NB;			DAT.NBA=INIT.NBA;
	DAT.EBS=INIT.EBS;		
	DAT.MS=INIT.MS;			DAT.MO=INIT.MO;			DAT.MD=INIT.MD;
	DAT.IZ=INIT.IZ;			DAT.SLOPE=INIT.SLOPE; 	DAT.INSEC=INIT.INSEC;	DAT.LFCR=INIT.LFCR;
	DAT.MOL=INIT.MOL;		DAT.OCR=INIT.OCR;		DAT.REG=INIT.REG;		DAT.SYN=INIT.SYN;
	DAT.MSR=INIT.MSR;		DAT.LFC=INIT.LFC;
	DAT.SDR=INIT.SDR; 		DAT.SCE=INIT.SCE;		DAT.SDE=INIT.SDE;	DAT.SLFCR=INIT.SLFCR;
	DAT.RVM=INIT.RVM;		DAT.RVMN=INIT.RVMN;		DAT.SSYN=INIT.SSYN;
	DAT.EUS=INIT.EUS;		DAT.FC=INIT.FC;			DAT.RVC=INIT.RVC;		
	DAT.VU=INIT.VU;			DAT.VSUP=INIT.VSUP;		DAT.XX=INIT.XX;			DAT.MFLOW=INIT.MFLOW;
	DAT.Elec=INIT.Elec; 	DAT.Syno=INIT.Syno;		DAT.PVC=INIT.PVC;		DAT.STUC=INIT.STUC;
	DAT.CVC=INIT.CVC;		DAT.EVC=INIT.EVC;		DAT.CLFCR=INIT.CLFCR;	DAT.FPRC=INIT.FPRC;
	DAT.CSYN=INIT.CSYN;
//	DAT.OtherCost=INIT.OtherCost;  
    DAT.BLT=INIT.BLT;		DAT.BOMR=INIT.BOMR;		DAT.VLFCN=INIT.VLFCN;

	DAT.W=INIT.W;			DAT.IC=INIT.IC;		DAT.ICD=INIT.ICD;
	DAT.QN=INIT.QN;			DAT.Q=INIT.Q;		DAT.OBJ=INIT.OBJ;
	DAT.X=INIT.X;			DAT.BF=INIT.BF;
	DAT.JZD=INIT.JZD;		DAT.JZ=INIT.JZ;		//DAT.JZ0=INIT.JZ0;	DAT.JZ1=INIT.JZ1;
	DAT.IXD=INIT.IXD;		DAT.IX=INIT.IX;

	DAT.ICE1N=INIT.ICE1N; 	DAT.ICE1=INIT.ICE1; DAT.VCE1=INIT.VCE1; DAT.LOADN=INIT.LOADN;
	DAT.ICV5N=INIT.ICV5N; 	DAT.ICV5=INIT.ICV5; DAT.VCV5=INIT.VCV5; DAT.BCV5=INIT.BCV5;
	DAT.ICK2N=INIT.ICK2N; 	DAT.ICK2=INIT.ICK2; DAT.VCK2=INIT.VCK2; DAT.BCK2=INIT.BCK2;
	DAT.TDB=INIT.TDB;		DAT.TDE=INIT.TDE;
	DAT.ICCN=INIT.ICCN; 	DAT.ICC=INIT.ICC; 	DAT.VCC=INIT.VCC;
	DAT.ICAPN=INIT.ICAPN;	DAT.ICAP=INIT.ICAP;		
	DAT.IEN=INIT.IEN;		DAT.IE=INIT.IE;		DAT.ES=INIT.ES;
    DAT.LFCN=INIT.LFCN;   	DAT.LFCI=INIT.LFCI; DAT.VLFC=INIT.VLFC;
    DAT.RLFCN=INIT.RLFCN;  	DAT.RLFC=INIT.RLFC; DAT.BLFC=INIT.BLFC;
    DAT.SYNN=INIT.SYNN;		DAT.SYNI=INIT.SYNI;	DAT.BSYN=INIT.BSYN; DAT.CO2=INIT.CO2;
    DAT.VRET=INIT.VRET;		DAT.VLFCR=INIT.VLFCR;
    DAT.METICCM=INIT.METICCM;	DAT.METICCN=INIT.METICCN;	DAT.METICC=INIT.METICC;
    DAT.METVCC=INIT.METVCC;	DAT.KK=INIT.KK;		DAT.WEEK=INIT.WEEK;
    DAT.METLOAD=INIT.METLOAD;					DAT.EMC=INIT.EMC;
    DAT.NCO2=INIT.NCO2;		DAT.OTY=INIT.OTY;	DAT.CO2DE=INIT.CO2DE;	DAT.CO2Tax=INIT.CO2Tax;
    DAT.ESLFC=INIT.ESLFC;	DAT.CAPL=INIT.CAPL;	DAT.TOE=INIT.TOE;
    DAT.SynNo=INIT.SynNo;	DAT.BBSYN=INIT.BBSYN;	DAT.SYNAR=INIT.SYNAR;	DAT.KSYN=INIT.KSYN;
    DAT.E0=INIT.E0;			DAT.IEHy=INIT.IEHy;	DAT.ESHy=INIT.ESHy;		DAT.HySch=INIT.HySch;
    DAT.HyNum=INIT.HyNum;	DAT.COAL=INIT.COAL;	DAT.LNG=INIT.LNG;		DAT.NUCLEAR=INIT.NUCLEAR;
    DAT.OIL=INIT.OIL;		DAT.EXIUP=INIT.EXIUP;
    
	DAT2.str1=str1;
	DAT2.A0=INIT.A0;		DAT2.B0=INIT.B0;		DAT2.N0=INIT.N0;	DAT2.P0=INIT.P0; 	DAT2.E0=INIT.E0;
	DAT2.C0=INIT.C0;		DAT2.S0=INIT.S0;		DAT2.R0=INIT.R0; 	DAT2.L0=INIT.L0;
	DAT2.PN0=INIT.PN0;		DAT2.CN0=INIT.CN0;		DAT2.SN0=INIT.SN0;	DAT2.LN0=INIT.LN0; 	DAT2.BN0=INIT.BN0;
	DAT2.EN0=INIT.EN0;
	DAT2.DB=INIT.DB;		DAT2.DE=INIT.DE; 		DAT2.H=INIT.H;		DAT2.HW=INIT.HW;	DAT2.D0=INIT.D0;
	DAT2.PTYN=INIT.PTYN;	DAT2.CTYN=INIT.CTYN; 	DAT2.STYN=INIT.STYN;DAT2.VTYN=INIT.VTYN;
	DAT2.ETYN=INIT.ETYN;	DAT2.OTYN=INIT.OTYN;	DAT2.U=INIT.U;
	DAT2.A=INIT.A;			DAT2.B=INIT.B;			DAT2.P=INIT.P;		DAT2.S=INIT.S;		DAT2.O=INIT.O; DAT2.M=INIT.M;
	DAT2.C=INIT.C;			DAT2.R=INIT.R;			DAT2.N=INIT.N; 		DAT2.L=INIT.L; 		DAT2.E=INIT.E;
	DAT2.ZA=INIT.ZA;		DAT2.ZB=INIT.ZB;		DAT2.ZC=INIT.ZC;	DAT2.ZP=INIT.ZP;	DAT2.ZE=INIT.ZE;
	DAT2.ZS=INIT.ZS; 		DAT2.ZR=INIT.ZR;		DAT2.ZN=INIT.ZN; 	DAT2.ZL=INIT.ZL;
	DAT2.BN=INIT.BN;		DAT2.EM=INIT.EM;		DAT2.ETY=INIT.ETY;	DAT2.OTY=INIT.OTY;
	DAT2.PTY0=INIT.PTY0;	DAT2.CTY0=INIT.CTY0;	DAT2.STY0=INIT.STY0;
	DAT2.NA=INIT.NA;		DAT2.OM=INIT.OM;
	DAT2.AN=INIT.AN;		DAT2.VU=INIT.VU;		DAT2.NN=INIT.NN;
	DAT2.W=INIT.W;			DAT2.KD=INIT.KD;
	DAT2.SM=INIT.SM;		DAT2.IK=INIT.IK;		DAT2.IXD=INIT.IXD;	DAT2.IS=INIT.IS;	
	DAT2.IX=INIT.IX;
	DAT2.FC=INIT.FC;		DAT2.Kmin=INIT.Kmin;	DAT2.UCAP=INIT.UCAP;	DAT2.OCR=INIT.OCR;
	DAT2.UCAS=INIT.UCAS;	/*DAT2.RZS=INIT.RZS;*/		DAT2.SCE=INIT.SCE;	DAT2.SDE=INIT.SDE;
	DAT2.EMC=INIT.EMC;		DAT2.TARGET=INIT.TARGET;	DAT2.FPRC=INIT.FPRC; DAT2.FHC=INIT.FHC;
	DAT2.LOSS=INIT.LOSS;	DAT2.LOADA=INIT.LOADA; 	DAT2.VRES=INIT.VRES;	DAT2.M=INIT.M;	
	DAT2.Elec=INIT.Elec; 	DAT2.Syno=INIT.Syno;	DAT2.PSC=INIT.PSC; DAT2.IES=INIT.IES;	DAT2.IFD=INIT.IFD;
	DAT2.ANR=INIT.ANR;		DAT2.CO2=INIT.CO2;		DAT2.PVC=INIT.PVC;	DAT2.STUC=INIT.STUC;	DAT2.CVC=INIT.CVC;	DAT2.EVC=INIT.EVC;
	DAT2.BLFC=INIT.BLFC;	DAT2.LFCF=INIT.LFCF;	/*DAT2.OtherCost=INIT.OtherCost;*/	DAT2.FB0=INIT.FB0;	  DAT2.BSYN=INIT.BSYN;
	DAT2.VRET=INIT.VRET;	DAT2.VLFCN=INIT.VLFCN;	DAT2.KK=INIT.KK;	DAT2.CO2DE=INIT.CO2DE;	DAT2.CO2Tax=INIT.CO2Tax;
	DAT2.NCO2=INIT.NCO2;	DAT2.IE=INIT.IE;		DAT2.HyNum=INIT.HyNum;
	
	DAT3.ITN=ITN;	DAT3.path=str2;	DAT3.ICD=DAT.ICD;	DAT3.TB=TB0;  	DAT3.TE=TE0;	DAT3.Q=DAT.Q;	DAT3.X=DAT.X;

    INIT.end();
    INIT_SRC.end();
	
  	var OPGM_SRC	= new IloOplModelSource("OPGM.mod");		
	var OPGM_DEF	= new IloOplModelDefinition(OPGM_SRC);	
 	var REP_SRC		= new IloOplModelSource("Report.mod");		
	var REP_DEF		= new IloOplModelDefinition(REP_SRC);	
 	var READ_SRC	= new IloOplModelSource("Read.mod");		
	var READ_DEF	= new IloOplModelDefinition(READ_SRC);
 	var WRITE_SRC	= new IloOplModelSource("Write.mod");		
	var WRITE_DEF	= new IloOplModelDefinition(WRITE_SRC);	
//*************************

	writeln();
	if(MIP==1&&DEC==1&&BDC==0){writeln("MIP cancelled");DAT.FLAG_MIP=0;}
	writeln("DEC=",DEC," LPF=",LPF," FWD=",FWD," BDC=",BDC," CPH=",CPH," MIP=",MIP," REP=",REP);
	writeln();
	
	if(BDC==1&&CPH!=0&&INI!=-1){CPH=1;writeln("Boundary Condition is read from cph0.csv file");}
	
	DAT.FLAG_DEC=DEC;
	DAT.FLAG_LPF=LPF;
	DAT.FLAG_FWD=FWD;
	DAT.FLAG_BDC=BDC;
	DAT.FLAG_CPH=CPH;
	DAT.FLAG_MIP=MIP;
	DAT.FLAG_INI=INI;
	DAT.FLAG_REP=REP;
	
	var i,t,tt,gap;
	
	if(BDC==1||DEC==1){
		if(CPH==0){
	  		writeln("Calculation of initial condition INI=",INI);
	  		if(INI==-1){writeln("INI should be larger than -1.");end();}
	  		if(VER==1)cplex.solutiontype=0;else cplex.barcrossalg=0;
	  	//	if(VER==1)cplex.solutiontype=2;else cplex.barcrossalg=-1;
	  			cplex.barepcomp=1e-4;	//1e-8
	  	
			DAT.FLAG_DEC=0;
			DAT.FLAG_BDC=0;
			DAT.TB=TB0;
			DAT.TE=TE0;
			var OPGM = new IloOplModel(OPGM_DEF,cplex);					  		
			OPGM.addDataSource(DAT);
			OPGM.generate();
			if(cplex.solve())OPGM.postProcess();else {write("Failure");end();}					
			OPGM.end();
			writeln();
		
			DAT3.ITN=-1;
			var WRITE = new IloOplModel(WRITE_DEF,cplex);					  		
			WRITE.addDataSource(DAT3);
			WRITE.generate();
			WRITE.end;
			DAT.FLAG_DEC=DEC;
			DAT.FLAG_BDC=BDC;
			ITN=0;
  		}
  		else {
  			var READ = new IloOplModel(READ_DEF,cplex);					  		
			READ.addDataSource(DAT3);
			READ.generate();
			ITN=READ.ITN+1;
			READ.end;
			writeln();
		}
	}				
  	DAT.FLAG_INI=-1;
  	
	if(LPF==1){
	  	writeln("LP file generation mode");
	  	for(i=0;i<3;i++){
	  	  	if(i==0)t=TB0;else if(i==1)t=TB0+1;else t=TE0;
  			DAT.TB=t;
			DAT.TE=t;
			var OPGM = new IloOplModel(OPGM_DEF,cplex);					  		
			OPGM.addDataSource(DAT);
			OPGM.generate();
			str=str0+"exp"+i+".lp";
			cplex.exportModel(str);
			OPGM.end();
 		}			
  		writeln();
  		writeln("*** The LP files were SUCCESSFULLY written!!!");
	}

	if(Model_1==1){
	  	writeln("Integrated Optimization ",DAT.FLAG_DEC);
	  	if(CRO==0)writeln("Cross Over");else writeln("No Cross Over");
	  	DAT.TB=TB0;
  		DAT.TE=TE0;
		var OPGM = new IloOplModel(OPGM_DEF,cplex);					  		
		OPGM.addDataSource(DAT);
		OPGM.generate();
		if(cplex.solve())OPGM.postProcess();else{write("Failure");end();}
		OPGM.end();
	}		
	
  	var FLAG;	
    var str;
    var N;
    var v,u,PEN;
	
	cplex.barepcomp=1e-8;	//1e-8

    if(Model_2!=0){
      	writeln("Decomposed Optimization");
      	writeln("QN=",DAT.QN);
      	if(DAT.FLAG_MIP==1){writeln("MIP cancelled for dual price calculation");DAT.FLAG_MIP=0;}
      	writeln();
      	
	   	if(VER==1)cplex.solutiontype=0;else cplex.barcrossalg=0;
      	
      	if(ITN==0){
      		writeln("Initialization of CPH ",NN);	

			DAT.FLAG_FWD=1;
	 		for(t=TB0;t<=TE0;t+=MM){	
				DAT.TB=t;
				DAT.TE=Math.min(t+NN-1,TE0);
			//	if(VER==1)cplex.solutiontype=2;else cplex.barcrossalg=-1;
				var OPGM = new IloOplModel(OPGM_DEF,cplex);					  		
				OPGM.addDataSource(DAT);
				OPGM.generate();
				if(cplex.solve())OPGM.postProcess();else {
				  	write("Failure");
				  	OPGM.end();
				  	if(VER==1)cplex.solutiontype=0;else cplex.barcrossalg=0;
				  	var OPGM = new IloOplModel(OPGM_DEF,cplex);					  		
					OPGM.addDataSource(DAT);
					OPGM.generate();
					if(cplex.solve())OPGM.postProcess();else {
				  		write("Failure");
				  		OPGM.end();
				  		end();
					}
   				}		
   				OPGM.end();
				if(DAT.TE==TE0)break;
 			}

	 		writeln(); 	

			DAT.FLAG_FWD=-1;
			for(t=TE0;t>=TB0;t-=MM){	
				DAT.TE=t;
				DAT.TB=Math.max(t-NN+1,TB0);
		//		if(VER==1)cplex.solutiontype=2;else cplex.barcrossalg=-1;
				var OPGM = new IloOplModel(OPGM_DEF,cplex);					  		
				OPGM.addDataSource(DAT);
				OPGM.generate();
				if(cplex.solve())OPGM.postProcess();else {
				  	write("Failure");
				  	OPGM.end();
				  	if(VER==1)cplex.solutiontype=0;else cplex.barcrossalg=0;
				  	var OPGM = new IloOplModel(OPGM_DEF,cplex);					  		
					OPGM.addDataSource(DAT);
					OPGM.generate();
					if(cplex.solve())OPGM.postProcess();else {
				  		write("Failure");
				  		OPGM.end();
				  		end();
					}
   				}		
   				OPGM.end();
				if(DAT.TB==TB0)break;
 			}
 			 			writeln();
	//		writeln(DAT.Q);		
 			ITN=1;
  		}
 		writeln();
  	//	writeln(DAT.OBJ);

 		DAT3.ITN=0;
		var WRITE = new IloOplModel(WRITE_DEF,cplex);					  		
		WRITE.addDataSource(DAT3);
		WRITE.generate();
		WRITE.end;
		
		if(VER==1)cplex.solutiontype=0;else cplex.barcrossalg=0;
		
		DAT.FLAG_FWD=0;
    	for(i=ITN;i<10000;i++){
			writeln("Iteration: ",i);
			if(Model_2==1){
				for(t=TB0+1;t<=TE0;t++){
		  			DAT.TB=t;
		  			DAT.TE=t;
		  //			if(VER==1)cplex.solutiontype=2;else cplex.barcrossalg=-1;
					var OPGM = new IloOplModel(OPGM_DEF,cplex);					  		
					OPGM.addDataSource(DAT);
					OPGM.generate();
					if(cplex.solve())OPGM.postProcess();else {
					  	write("Failure");
					  	OPGM.end();
					  	if(VER==1)cplex.solutiontype=0;else cplex.barcrossalg=0;
					  	var OPGM = new IloOplModel(OPGM_DEF,cplex);					  		
						OPGM.addDataSource(DAT);
						OPGM.generate();
						if(cplex.solve())OPGM.postProcess();else {
				  			write("Failure");
				  			OPGM.end();
				  			end();
						}
   					}		
   					OPGM.end();
 				}
 				writeln();
 				for(t=TE0-1;t>=TB0;t--){
		  			DAT.TB=t;
		  			DAT.TE=t;
		  //			if(VER==1)cplex.solutiontype=2;else cplex.barcrossalg=-1;
					var OPGM = new IloOplModel(OPGM_DEF,cplex);					  		
					OPGM.addDataSource(DAT);
					OPGM.generate();
					if(cplex.solve())OPGM.postProcess();else {
					  	write("Failure");
					  	OPGM.end();
					  	if(VER==1)cplex.solutiontype=0;else cplex.barcrossalg=0;
					  	var OPGM = new IloOplModel(OPGM_DEF,cplex);					  		
						OPGM.addDataSource(DAT);
						OPGM.generate();
						if(cplex.solve())OPGM.postProcess();else {
				  			write("Failure");
				  			OPGM.end();
				  			end();
						}
   					}		
   					PEN=OPGM.PEN;				
					OPGM.end();
 				} 		
			}
			if(Model_2==2){
  				DAT.TB=TB0;
		  		DAT.TE=TE0;
		//  		if(VER==1)cplex.solutiontype=2;else cplex.barcrossalg=-1;
				var OPGM = new IloOplModel(OPGM_DEF,cplex);					  		
				OPGM.addDataSource(DAT);
				OPGM.generate();
				if(cplex.solve())OPGM.postProcess();else {
				  	write("Failure");
				  	OPGM.end();
				  	if(VER==1)cplex.solutiontype=0;else cplex.barcrossalg=0;
				  	var OPGM = new IloOplModel(OPGM_DEF,cplex);					  		
					OPGM.addDataSource(DAT);
					OPGM.generate();
					if(cplex.solve())OPGM.postProcess();else {
				  		write("Failure");
				  		OPGM.end();
				  		end();
					}
   				}					
				PEN=OPGM.PEN;				
				OPGM.end();
 			}						
	  		writeln(" ");
			for(t=TB0;t<TE0;t++)if(DAT.OBJ[0][t+1]+1e-3<DAT.OBJ[0][t])writeln(" **** Order Warning in obj **** ",t," ",DAT.OBJ[0][t]," ",DAT.OBJ[0][t+1]);
		//	writeln(DAT.OBJ);
	  		v=0;for(t=TB0;t<=TE0;t++)v+=DAT.OBJ[0][t];
	  		var Ave=v/(TE0-TB0+1);
	  		u=0;for(t=TB0;t<=TE0;t++)u+=(DAT.OBJ[0][t]-Ave)*(DAT.OBJ[0][t]-Ave);
			writeln(" Gap=",Math.abs(DAT.OBJ[0][TE0]-DAT.OBJ[0][TB0])," Min=",DAT.OBJ[0][TB0]," Max=",DAT.OBJ[0][TE0]," Ave=",Ave," STD=",Math.sqrt(u/(TE0-TB0+1))," PEN=",PEN);
			writeln(DAT.Q);
			
			if(i%ITNR==0){
 				DAT3.ITN=i;
				var WRITE = new IloOplModel(WRITE_DEF,cplex);					  		
				WRITE.addDataSource(DAT3);
				WRITE.generate();
				WRITE.end;
 			}			
 			if(Math.abs(DAT.OBJ[0][TE0]-DAT.OBJ[0][TB0])/Ave<1e-5)break;
		}
	}

	if(Model_3==1){
//	  	writeln();
	  	writeln("Forward Mode Calculation with Time Horizon of ",NN," days");
 		TB1=TB0;					  	
		for(t=TB1;t<=TE0;t+=MM){
		  	writeln();
		  	tt=Math.min(t+NN-1,TE0);
			if(t==TB1)DAT3.TB=t;else DAT3.TB=tt;
			DAT3.TE=tt;
 			DAT3.path=str2;
			if(CPH==1){	  	
	  			var READ = new IloOplModel(READ_DEF,cplex);					  		
				READ.addDataSource(DAT3);
				READ.generate();
				READ.end;
  			}							
			DAT.TB=t;
			DAT.TE=tt;
			for(i=t;i<=tt;i++)DAT.Q[0][1][i]=0;
			var OPGM = new IloOplModel(OPGM_DEF,cplex);					  		
			OPGM.addDataSource(DAT);
			OPGM.generate();
			if(cplex.solve()){OPGM.postProcess();}
			else {write("Failure");end();}
			if(tt==TE0)writeln("Pen=",OPGM.PEN);		
			OPGM.end();
			
			DAT3.TB=t;
 			if(tt==TE0)DAT3.TE=TE0;else DAT3.TE=t+MM-1;
 			DAT3.path=str3;
			var WRITE = new IloOplModel(WRITE_DEF,cplex);					  		
			WRITE.addDataSource(DAT3);
			WRITE.generate();
			WRITE.end;
			if(tt==TE0)break;
 		}
 	}
 	
 	if(REP==1){
  		var REP = new IloOplModel(REP_DEF,cplex);					  		
		REP.addDataSource(DAT2);
		REP.addDataSource(REP_OUT);	
		REP.generate();
		if(cplex.solve())REP.postProcess();
 	}
} 