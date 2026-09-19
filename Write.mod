/*********************************************
 * OPL 12.5 Model
 * Author: fujii
 * Creation Date: 2020/10/13 at 14:12:12
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

execute WriteCPH{
	var i,j,t,q;
	var ofile;
   	var str;
   	write("Writing ",path);
  	for(t=TB;t<=TE;t++){
  	//  write("cph",t,".csv ");
	  	str=path+"cph"+t+".csv";
	  	ofile = new IloOplOutputFile(str);
	  	ofile.writeln(ITN);
  		for(j in IR){
			ofile.writeln(Q[0][j][t]);
			for(q=0;q<=Q[0][j][t];q++){
				for(i in ICR)ofile.write(X[j][i][t][q],",");
				ofile.writeln();
			}	
		}
		ofile.close();
	}
	writeln();
}			