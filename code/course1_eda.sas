************************************;
* Course 1, Week 1.1: Proc Print   *;
************************************;
libname mydata " /home/dhnsingh0/cms_provider/data" access=readonly;

data inpatientrehab;
	set mydata.cms_5_inpatient_rehab;
	AvgAid=mean(ssiratio, aidratio);
	*horizontal averages;
run;

title "Providers with Average Aid Over 7.5%";

proc print data=inpatientrehab;
	var statecd msa censdivi avgaid;
	where AvgAid > 0.075;
run;

title "Average Aid by State";

proc means data=inpatientrehab mean min max maxdec=1;
	var avgaid;
	class statecd;
run;

title;

************************************;
* Course 1, Week 1.2: Formatting   *;
************************************;
libname mydata " /home/dhnsingh0/cms_provider/data" access=readonly;

data longterm;
	set mydata.cms_6_long_term_care;
	where statecd = "05";
	OOP=CostChrg*AidRatio;
run;

proc print data=longterm;
run;

******************************************************************;
* Course 1, Week 2.1 - 2.14: Proc Contents, Options, Proc Import *;
******************************************************************;
OPTIONS VALIDVARNAME=V7; * for naming convention consistency;
libname mydata " /home/dhnsingh0/cms_provider/data" access=readonly;

*LIBNAME libref XLSX "path/filename.xlsx"; * excel read ins;
*proc import datafile="s:/workshop/data/storm_damage.tab" 
			dbms=tab out=storm_damage_tab; * for tab delimited read ins;

proc contents data=mydata.cms_7_skilled_nursing_facility;
run;