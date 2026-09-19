/*********************************************
 * OPL 12.7.1.0 Model
 * Author: fujii
 * Creation Date: 2020/02/27 at 14:56:50
 *********************************************/
string path=...;
range dum=0..0;
int ITN=...;
int TB=...;
int TE=...;
range IR=0..1;
int ICD[IR]=...;
range ICR=0..ICD[1]+1;
int Q[dum][IR][dum]=...;
float X[IR][ICR][dum][dum]=...;

execute ReadCPH{
    var f = new IloOplInputFile();
    var str,sub,i,t,j,q;
    for(t=TB;t<=TE;t++){
	  	str=path+"cph"+t+".csv";
		f.open(str);
   		if (f.exists) {
    		writeln("Reading ",str,"");
    		str=f.readline();
   		  	ITN=Opl.intValue(str);
    		for(j in IR){
    		  	str=f.readline();
    		  	Q[0][j][t]=Opl.intValue(str);
				for(q=0;q<=Q[0][j][t];q++){
	  				str=f.readline();
     	  			sub=str.split(",");
     		  		for(i in ICR)X[j][i][t][q]=sub[i];
        		}     			  		
			}
  		}				
		f.close();
	}
}