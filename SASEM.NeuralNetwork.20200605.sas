*------------------------------------------------------------*;
* EM Version: 15.1;
* SAS Release: 9.04.01M6P110718;
* Host: odaws03-usw2.oda.sas.com;
* Project Path: ~;
* Project Name: MIS581FlightDelay;
* Diagram Id: EMWS1;
* Diagram Name: FlightDelayMay2020;
* Generated by: bionca.brown@csuglobal.edu;
* Date: 05JUN2020:14:58:33;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Macro Variables;
*------------------------------------------------------------*;
%let EM_PROJECT =;
%let EM_PROJECTNAME =;
%let EM_WSNAME =;
%let EM_WSDESCRIPTION =FlightDelayMay2020;
%let EM_SUMMARY =WORK.SUMMARY;
%let EM_NUMTASKS =SINGLE;
%let EM_EDITMODE =R;
%let EM_DEBUGVAL =;
%let EM_ACTION =run report;
*------------------------------------------------------------*;
%macro em_usedatatable;
%if ^%symexist(EM_USEDATATABLE) %then %do;
%let EM_USEDATATABLE = Y;
%end;
%if "&EM_USEDATATABLE" ne "N" %then %do;
*------------------------------------------------------------*;
* Data Tables;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
%end;
%mend em_usedatatable;
%em_usedatatable;
*------------------------------------------------------------*;
* Run Startup and Property Code;
*------------------------------------------------------------*;
%macro em_runstartupCode;
%if ^%symexist(EM_RUNSTARTUP) %then %do;
%let EM_RUNSTARTUP = Y;
%end;
%if "&EM_RUNSTARTUP" ne "N" %then %do;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"RUNSTARTUP.sas";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
put '*------------------------------------------------------------* ;';
put '* Project Property Code';
put '*------------------------------------------------------------* ;';
put '%global EM_PMML;';
put '%let EM_PMML = N;';
put '%global EM_ASSESS;';
put '%let EM_ASSESS = Y;';
put '%global EM_GROUPASSESS;';
put '%let EM_GROUPASSESS = Y;';
put '%global HPDM_NODES;';
put '%let HPDM_NODES =;';
put '%global HPDM_NTHREADS;';
put '%let HPDM_NTHREADS =;';
put '%global EM_ADVISOR_MAXOBS;';
put '%let EM_ADVISOR_MAXOBS = 1000000;';
put '%global HPDM_COMMIT;';
put '%let HPDM_COMMIT =;';
put '%global EM_DECMETA_MAXLEVELS;';
put '%let EM_DECMETA_MAXLEVELS = 32;';
put '%global EM_NUMTASK;';
put '%let EM_NUMTASK = DEFAULT;';
put '%global EM_VIEW_BUFSIZE;';
put '%let EM_VIEW_BUFSIZE = 64;';
put '%global EM_EXPLOREOBS_MAX;';
put '%let EM_EXPLOREOBS_MAX = 150000;';
put '%global HPDM_SAMPLESIZE;';
put '%let HPDM_SAMPLESIZE = 10000;';
put '%global EM_MAXGROUPASSESS;';
put '%let EM_MAXGROUPASSESS =;';
put '%global EM_TRAIN_MAXLEVELS;';
put '%let EM_TRAIN_MAXLEVELS = 512;';
run;
%end;
%mend em_runstartupCode;
%em_runstartupCode;
*------------------------------------------------------------*;
* Create workspace data set;
*------------------------------------------------------------*;
data workspace;
length property $64 value $200;
property= 'PROJECTLOCATION';
value= "&EM_PROJECT";
output;
property= 'PROJECTNAME';
value= "&EM_PROJECTNAME";
output;
property= 'WORKSPACENAME';
value= "&EM_WSNAME";
output;
property= 'WORKSPACEDESCRIPTION';
value= "&EM_WSDESCRIPTION";
output;
property= 'SUMMARYDATASET';
value= "&EM_SUMMARY";
output;
property= 'NUMTASKS';
value= "&EM_NUMTASKS";
output;
property= 'EDITMODE';
value= "&EM_EDITMODE";
output;
property= 'DEBUG';
value= "&EM_DEBUGVAL";
output;
run;
*------------------------------------------------------------*;
* Create nodes data set;
*------------------------------------------------------------*;
data nodes;
length id $12 component $32 description $64 X 8 Y 8 diagramID $32 parentID $32;
id= "Trans";
component="Transform";
description= "Transform Variables";
diagramID="_ROOT_";
parentID="";
X=256;
Y=317;
output;
id= "Stat";
component="StatExplore";
description= "StatExplore";
diagramID="_ROOT_";
parentID="";
X=221;
Y=65;
output;
id= "Repl";
component="Replace";
description= "Replacement";
diagramID="_ROOT_";
parentID="";
X=490;
Y=72;
output;
id= "Part";
component="Partition";
description= "Data Partition";
diagramID="_ROOT_";
parentID="";
X=364;
Y=65;
output;
id= "Neural";
component="NeuralNetwork";
description= "Neural Network";
diagramID="_ROOT_";
parentID="";
X=452;
Y=386;
output;
id= "Impt";
component="Impute";
description= "Impute";
diagramID="_ROOT_";
parentID="";
X=269;
Y=223;
output;
id= "FIMPORT";
component="FileImport";
description= "File Import";
diagramID="_ROOT_";
parentID="";
X=79;
Y=65;
output;
id= "CNTRL";
component="ControlPoint";
description= "Control Point";
diagramID="_ROOT_";
parentID="";
X=456;
Y=137;
output;
run;
*------------------------------------------------------------*;
* Variable Attributes for Trans;
*------------------------------------------------------------*;
data WORK.Trans_VariableAttribute;
length Variable $64 AttributeName $32 AttributeValue $64;
Variable='DAY_OF_MONTH';
AttributeName="METHOD";
AttributeValue='DUMMY';
Output;
Variable='DAY_OF_WEEK';
AttributeName="METHOD";
AttributeValue='DUMMY';
Output;
Variable='DEST_STATE_ABR';
AttributeName="METHOD";
AttributeValue='DUMMY';
Output;
Variable='MONTH';
AttributeName="METHOD";
AttributeValue='DUMMY';
Output;
Variable='MXSPD';
AttributeName="METHOD";
AttributeValue='LOG10';
Output;
Variable='PRCP';
AttributeName="METHOD";
AttributeValue='LOG10';
Output;
Variable='TAXI_IN';
AttributeName="METHOD";
AttributeValue='LOG10';
Output;
Variable='TAXI_OUT';
AttributeName="METHOD";
AttributeValue='LOG10';
Output;
Variable='TEMP';
AttributeName="METHOD";
AttributeValue='LOG10';
Output;
Variable='VISIB';
AttributeName="METHOD";
AttributeValue='LOG10';
Output;
Variable='WDSP';
AttributeName="METHOD";
AttributeValue='LOG10';
Output;
run;
*------------------------------------------------------------*;
* INTERACTION Data Set for Trans;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* FORMULA Data Set for Trans;
*------------------------------------------------------------*;
data WORK.Trans_FORMULA;
  length   Name                             $ 32
           Formula                          $ 300
           Type                             $ 1
           Length                             8
           Format                           $ 20
           Role                             $ 32
           Level                            $ 10
           Report                           $ 1
           Label                            $ 200
           nlevel                             8
           nmiss                              8
           min                                8
           max                                8
           mean                               8
           std                                8
           skewness                           8
           kurtosis                           8
           ;

  label    Name="Variable Name"
           Formula="Formula"
           Type="Type"
           Length="Length"
           Format="Format"
           Role="Role"
           Level="Measurement Level"
           Report="Report"
           Label="Label"
           nlevel="Number of Levels"
           nmiss="Missing"
           min="Minimum"
           max="Maximum"
           mean="Mean"
           std="Standard Deviation"
           skewness="Skewness"
           kurtosis="Kurtosis"
           ;
;
run;
*------------------------------------------------------------*;
* EMNOTES File for Trans;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Trans_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* CROSSTAB Data Set for Stat;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* EMNOTES File for Stat;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Stat_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* USERTRAINCODE File for Repl;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Repl_USERTRAINCODE.sas";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
run;
*------------------------------------------------------------*;
* NEWVALUES Data Set for Repl;
*------------------------------------------------------------*;
data WORK.Repl_NEWVALUES;
  length   Name                             $ 32
           LEVEL                            $ 12
           TYPE                             $ 1
           REPLACE_VALUE                    $ 200
           ;

  label    Name="Variable"
           LEVEL="Formatted Value"
           TYPE="Type"
           REPLACE_VALUE="Replacement Value"
           ;
Name="DAY_OF_MONTH";
LEVEL="_UNKNOWN_";
TYPE="N";
REPLACE_VALUE="_DEFAULT_";
output;
Name="DAY_OF_WEEK";
LEVEL="_UNKNOWN_";
TYPE="N";
REPLACE_VALUE="_DEFAULT_";
output;
Name="DEP_DEL15";
LEVEL="_UNKNOWN_";
TYPE="N";
REPLACE_VALUE="_DEFAULT_";
output;
Name="DEST_STATE_ABR";
LEVEL="_UNKNOWN_";
TYPE="C";
REPLACE_VALUE="_DEFAULT_";
output;
Name="MONTH";
LEVEL="_UNKNOWN_";
TYPE="N";
REPLACE_VALUE="_DEFAULT_";
output;
;
run;
*------------------------------------------------------------*;
* EMNOTES File for Repl;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Repl_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* EMNOTES File for Part;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Part_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* Decmeta Data Set for Neural;
*------------------------------------------------------------*;
data WORK.Neural_DEP_DEL15_DM;
  length   _TYPE_                           $ 32
           VARIABLE                         $ 32
           LABEL                            $ 256
           LEVEL                            $ 32
           EVENT                            $ 32
           ORDER                            $ 10
           FORMAT                           $ 32
           TYPE                             $ 1
           COST                             $ 32
           USE                              $ 1
           ;

  label    _TYPE_="Type"
           VARIABLE="Variable"
           LABEL="Label"
           LEVEL="Measurement Level"
           EVENT="Target Event"
           ORDER="Order"
           FORMAT="Format"
           TYPE="Type"
           COST="Cost"
           USE="Use"
           ;
_TYPE_="MATRIX";
VARIABLE="";
LABEL="";
LEVEL="PROFIT";
EVENT="";
ORDER="";
FORMAT="";
TYPE="";
COST="";
USE="N";
output;
_TYPE_="TARGET";
VARIABLE="DEP_DEL15";
LABEL="";
LEVEL="BINARY";
EVENT="1";
ORDER="";
FORMAT="BEST12.0";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="DECISION";
VARIABLE="DECISION1";
LABEL="1";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="Y";
output;
_TYPE_="DECISION";
VARIABLE="DECISION2";
LABEL="0";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="Y";
output;
_TYPE_="DATAPRIOR";
VARIABLE="DATAPRIOR";
LABEL="Data Prior";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="N";
output;
_TYPE_="TRAINPRIOR";
VARIABLE="TRAINPRIOR";
LABEL="Training Prior";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="N";
output;
_TYPE_="DECPRIOR";
VARIABLE="DECPRIOR";
LABEL="Decision Prior";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="N";
output;
_TYPE_="PREDICTED";
VARIABLE="P_DEP_DEL151";
LABEL="Predicted: DEP_DEL15=1";
LEVEL="1";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="RESIDUAL";
VARIABLE="R_DEP_DEL151";
LABEL="Residual: DEP_DEL15=1";
LEVEL="1";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="PREDICTED";
VARIABLE="P_DEP_DEL150";
LABEL="Predicted: DEP_DEL15=0";
LEVEL="0";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="RESIDUAL";
VARIABLE="R_DEP_DEL150";
LABEL="Residual: DEP_DEL15=0";
LEVEL="0";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="FROM";
VARIABLE="F_DEP_DEL15";
LABEL="From: DEP_DEL15";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="C";
COST="";
USE="";
output;
_TYPE_="INTO";
VARIABLE="I_DEP_DEL15";
LABEL="Into: DEP_DEL15";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="C";
COST="";
USE="";
output;
;
run;
*------------------------------------------------------------*;
* Decdata Data Set for Neural;
*------------------------------------------------------------*;
data WORK.Neural_DEP_DEL15_DD;
  length   DEP_DEL15                        $ 32
           COUNT                              8
           DATAPRIOR                          8
           TRAINPRIOR                         8
           DECPRIOR                           8
           DECISION1                          8
           DECISION2                          8
           ;

  label    COUNT="Level Counts"
           DATAPRIOR="Data Proportions"
           TRAINPRIOR="Training Proportions"
           DECPRIOR="Decision Priors"
           DECISION1="1"
           DECISION2="0"
           ;
  format   COUNT 10.
           ;
DEP_DEL15="1";
COUNT=11176;
DATAPRIOR=0.16478428828403;
TRAINPRIOR=0.16478428828403;
DECPRIOR=.;
DECISION1=1;
DECISION2=0;
output;
DEP_DEL15="0";
COUNT=56646;
DATAPRIOR=0.83521571171596;
TRAINPRIOR=0.83521571171596;
DECPRIOR=.;
DECISION1=0;
DECISION2=1;
output;
;
run;
*------------------------------------------------------------*;
* EMNOTES File for Neural;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Neural_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* EMNOTES File for Impt;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Impt_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* Variable Attributes for FIMPORT;
*------------------------------------------------------------*;
data WORK.FIMPORT_VariableAttribute;
length Variable $64 AttributeName $32 AttributeValue $64;
Variable='ARR_DELAY';
AttributeName="ROLE";
AttributeValue='REJECTED';
Output;
Variable='ARR_TIME';
AttributeName="ROLE";
AttributeValue='REJECTED';
Output;
Variable='CARRIER_DELAY';
AttributeName="ROLE";
AttributeValue='REJECTED';
Output;
Variable='DAY_OF_MONTH';
AttributeName="LEVEL";
AttributeValue='NOMINAL';
Output;
Variable='DEP_DEL15';
AttributeName="ROLE";
AttributeValue='TARGET';
Output;
Variable='DEP_DELAY';
AttributeName="ROLE";
AttributeValue='REJECTED';
Output;
Variable='DEP_TIME';
AttributeName="ROLE";
AttributeValue='REJECTED';
Output;
Variable='DEST_STATE_ABR';
AttributeName="ROLE";
AttributeValue='INPUT';
Output;
Variable='FRSHTT';
AttributeName="ROLE";
AttributeValue='REJECTED';
Output;
Variable='LATE_AIRCRAFT_DELAY';
AttributeName="ROLE";
AttributeValue='REJECTED';
Output;
Variable='NAS_DELAY';
AttributeName="ROLE";
AttributeValue='REJECTED';
Output;
Variable='PRCP_ATTRIBUTES';
AttributeName="ROLE";
AttributeValue='REJECTED';
Output;
Variable='PRCP_ATTRIBUTES';
AttributeName="LEVEL";
AttributeValue='NOMINAL';
Output;
Variable='SECURITY_DELAY';
AttributeName="ROLE";
AttributeValue='REJECTED';
Output;
Variable='SECURITY_DELAY';
AttributeName="LEVEL";
AttributeValue='INTERVAL';
Output;
Variable='WEATHER_DELAY';
AttributeName="ROLE";
AttributeValue='REJECTED';
Output;
run;
*------------------------------------------------------------*;
* USERTRAINCODE File for FIMPORT;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"FIMPORT_USERTRAINCODE.sas";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
run;
*------------------------------------------------------------*;
* VARIABLESETDELTA File for FIMPORT;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"FIMPORT_VARIABLESETDELTA.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
put 'if NAME="ARR_DELAY" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="INTERVAL";';
put 'ORDER="";';
put 'DROP="N";';
put 'end;';
put 'if NAME="ARR_TIME" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="INTERVAL";';
put 'ORDER="";';
put 'DROP="N";';
put 'end;';
put 'if NAME="CARRIER_DELAY" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="INTERVAL";';
put 'ORDER="";';
put 'DROP="N";';
put 'end;';
put 'if NAME="DAY_OF_MONTH" then do;';
put 'ROLE="INPUT";';
put 'LEVEL="NOMINAL";';
put 'ORDER="";';
put 'DROP="N";';
put 'end;';
put 'if NAME="DEP_DEL15" then do;';
put 'ROLE="TARGET";';
put 'LEVEL="BINARY";';
put 'ORDER="";';
put 'DROP="N";';
put 'end;';
put 'if NAME="DEP_DELAY" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="INTERVAL";';
put 'ORDER="";';
put 'DROP="N";';
put 'end;';
put 'if NAME="DEP_TIME" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="INTERVAL";';
put 'ORDER="";';
put 'DROP="N";';
put 'end;';
put 'if NAME="DEST_STATE_ABR" then do;';
put 'ROLE="INPUT";';
put 'LEVEL="NOMINAL";';
put 'ORDER="";';
put 'DROP="N";';
put 'end;';
put 'if NAME="FRSHTT" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="BINARY";';
put 'ORDER="";';
put 'DROP="N";';
put 'end;';
put 'if NAME="LATE_AIRCRAFT_DELAY" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="INTERVAL";';
put 'ORDER="";';
put 'DROP="N";';
put 'end;';
put 'if NAME="NAS_DELAY" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="INTERVAL";';
put 'ORDER="";';
put 'DROP="N";';
put 'end;';
put 'if NAME="PRCP_ATTRIBUTES" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="NOMINAL";';
put 'ORDER="";';
put 'DROP="N";';
put 'end;';
put 'if NAME="SECURITY_DELAY" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="INTERVAL";';
put 'ORDER="";';
put 'DROP="N";';
put 'end;';
put 'if NAME="WEATHER_DELAY" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="INTERVAL";';
put 'ORDER="";';
put 'DROP="N";';
put 'end;';
run;
*------------------------------------------------------------*;
* DELTACODE File for FIMPORT;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"FIMPORT_DELTACODE.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
put 'if NAME="ARR_DELAY" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="INTERVAL";';
put 'ORDER="";';
put 'end;';
put 'if NAME="ARR_TIME" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="INTERVAL";';
put 'ORDER="";';
put 'end;';
put 'if NAME="CARRIER_DELAY" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="INTERVAL";';
put 'ORDER="";';
put 'end;';
put 'if NAME="DAY_OF_MONTH" then do;';
put 'ROLE="INPUT";';
put 'LEVEL="NOMINAL";';
put 'ORDER="";';
put 'end;';
put 'if NAME="DEP_DEL15" then do;';
put 'ROLE="TARGET";';
put 'LEVEL="BINARY";';
put 'ORDER="";';
put 'end;';
put 'if NAME="DEP_DELAY" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="INTERVAL";';
put 'ORDER="";';
put 'end;';
put 'if NAME="DEP_TIME" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="INTERVAL";';
put 'ORDER="";';
put 'end;';
put 'if NAME="DEST_STATE_ABR" then do;';
put 'ROLE="INPUT";';
put 'LEVEL="NOMINAL";';
put 'ORDER="";';
put 'end;';
put 'if NAME="FRSHTT" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="BINARY";';
put 'ORDER="";';
put 'end;';
put 'if NAME="LATE_AIRCRAFT_DELAY" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="INTERVAL";';
put 'ORDER="";';
put 'end;';
put 'if NAME="NAS_DELAY" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="INTERVAL";';
put 'ORDER="";';
put 'end;';
put 'if NAME="PRCP_ATTRIBUTES" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="NOMINAL";';
put 'ORDER="";';
put 'end;';
put 'if NAME="SECURITY_DELAY" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="INTERVAL";';
put 'ORDER="";';
put 'end;';
put 'if NAME="WEATHER_DELAY" then do;';
put 'ROLE="REJECTED";';
put 'LEVEL="INTERVAL";';
put 'ORDER="";';
put 'end;';
put 'drop DROP;';
run;
*------------------------------------------------------------*;
* EMNOTES File for FIMPORT;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"FIMPORT_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* Create node properties data set;
*------------------------------------------------------------*;
data nodeprops;
length id $12 property $64 value $400;
id= "Trans";
property="DefaultMethod";
value= "NONE";
output;
id= "Trans";
property="DefaultTargetMethod";
value= "NONE";
output;
id= "Trans";
property="DefaultClassMethod";
value= "NONE";
output;
id= "Trans";
property="DefaultClassTargetMethod";
value= "NONE";
output;
id= "Trans";
property="Offset";
value= "1";
output;
id= "Trans";
property="MinOffset";
value= "Y";
output;
id= "Trans";
property="HideVariable";
value= "Y";
output;
id= "Trans";
property="RejectVariable";
value= "Y";
output;
id= "Trans";
property="GroupCutoff";
value= "0.1";
output;
id= "Trans";
property="GroupMissing";
value= "N";
output;
id= "Trans";
property="EmRandomSeed";
value= "12345";
output;
id= "Trans";
property="EmSampleSize";
value= "DEFAULT";
output;
id= "Trans";
property="EmSampleMethod";
value= "FIRSTN";
output;
id= "Trans";
property="MissingValue";
value= "USEINSEARCH";
output;
id= "Trans";
property="SummaryVariables";
value= "TRANSFORMED";
output;
id= "Trans";
property="SummaryStatistics";
value= "Y";
output;
id= "Trans";
property="UseMetaTransform";
value= "Y";
output;
id= "Trans";
property="MissingAsLevel";
value= "N";
output;
id= "Trans";
property="NumberofBins";
value= "VARIABLES";
output;
id= "Trans";
property="MaxOptimalBins";
value= "4";
output;
id= "Trans";
property="ForceRun";
value= "N";
output;
id= "Trans";
property="RunAction";
value= "Train";
output;
id= "Trans";
property="Component";
value= "Transform";
output;
id= "Trans";
property="EM_VARIABLEATTRIBUTES";
value= "WORK.Trans_VariableAttribute";
output;
id= "Trans";
property="EM_DATA_FORMULA";
value= "WORK.Trans_FORMULA";
output;
id= "Trans";
property="EM_FILE_EMNOTES";
value= "Trans_EMNOTES.txt";
output;
id= "Stat";
property="BySegment";
value= "N";
output;
id= "Stat";
property="Correlation";
value= "Y";
output;
id= "Stat";
property="Spearman";
value= "N";
output;
id= "Stat";
property="Pearson";
value= "Y";
output;
id= "Stat";
property="ChiSquare";
value= "Y";
output;
id= "Stat";
property="ChiSquareInterval";
value= "Y";
output;
id= "Stat";
property="ChiSquareIntervalNBins";
value= "5";
output;
id= "Stat";
property="MaximumVars";
value= "1000";
output;
id= "Stat";
property="HideVariable";
value= "Y";
output;
id= "Stat";
property="DropRejected";
value= "Y";
output;
id= "Stat";
property="UseValidate";
value= "N";
output;
id= "Stat";
property="UseTest";
value= "N";
output;
id= "Stat";
property="UseScore";
value= "N";
output;
id= "Stat";
property="NObs";
value= "100000";
output;
id= "Stat";
property="IntervalDistribution";
value= "Y";
output;
id= "Stat";
property="ClassDistribution";
value= "Y";
output;
id= "Stat";
property="LevelSummary";
value= "Y";
output;
id= "Stat";
property="ForceRun";
value= "N";
output;
id= "Stat";
property="RunAction";
value= "Train";
output;
id= "Stat";
property="Component";
value= "StatExplore";
output;
id= "Stat";
property="EM_FILE_EMNOTES";
value= "Stat_EMNOTES.txt";
output;
id= "Repl";
property="Location";
value= "CATALOG";
output;
id= "Repl";
property="Catalog";
value= "SASHELP.EMMDFY.REPLACE.SOURCE";
output;
id= "Repl";
property="HideVariable";
value= "N";
output;
id= "Repl";
property="UnknownLevel";
value= "NONE";
output;
id= "Repl";
property="ReplaceMethod";
value= "COMPUTED";
output;
id= "Repl";
property="CalcMethod";
value= "NONE";
output;
id= "Repl";
property="MADSCutoff";
value= "9.0";
output;
id= "Repl";
property="SpacingsCutoff";
value= "9.0";
output;
id= "Repl";
property="StddevCutoff";
value= "3.0";
output;
id= "Repl";
property="PercentsCutoff";
value= "0.5";
output;
id= "Repl";
property="CountReport";
value= "Y";
output;
id= "Repl";
property="ForceRun";
value= "N";
output;
id= "Repl";
property="RunAction";
value= "Train";
output;
id= "Repl";
property="Component";
value= "Replace";
output;
id= "Repl";
property="IntervalMethod";
value= "NONE";
output;
id= "Repl";
property="DataNeeded";
value= "Y";
output;
id= "Repl";
property="ToolType";
value= "MODIFY";
output;
id= "Repl";
property="ToolPrefix";
value= "Repl";
output;
id= "Repl";
property="EM_FILE_USERTRAINCODE";
value= "Repl_USERTRAINCODE.sas";
output;
id= "Repl";
property="EM_DATA_NEWVALUES";
value= "WORK.Repl_NEWVALUES";
output;
id= "Repl";
property="EM_FILE_EMNOTES";
value= "Repl_EMNOTES.txt";
output;
id= "Part";
property="Method";
value= "DEFAULT";
output;
id= "Part";
property="TrainPct";
value= "50";
output;
id= "Part";
property="ValidatePct";
value= "50";
output;
id= "Part";
property="TestPct";
value= "0";
output;
id= "Part";
property="RandomSeed";
value= "12345";
output;
id= "Part";
property="OutputType";
value= "DATA";
output;
id= "Part";
property="IntervalDistribution";
value= "Y";
output;
id= "Part";
property="ClassDistribution";
value= "Y";
output;
id= "Part";
property="ForceRun";
value= "N";
output;
id= "Part";
property="RunAction";
value= "Train";
output;
id= "Part";
property="Component";
value= "Partition";
output;
id= "Part";
property="EM_FILE_EMNOTES";
value= "Part_EMNOTES.txt";
output;
id= "Neural";
property="UseEstimates";
value= "N";
output;
id= "Neural";
property="NetworkArchitecture";
value= "MLP";
output;
id= "Neural";
property="DirectConnection";
value= "Y";
output;
id= "Neural";
property="Hidden";
value= "5";
output;
id= "Neural";
property="Prelim";
value= "Y";
output;
id= "Neural";
property="PreliminaryRuns";
value= "5";
output;
id= "Neural";
property="PrelimMaxiter";
value= "10";
output;
id= "Neural";
property="PrelimMaxTime";
value= "1 HOUR";
output;
id= "Neural";
property="Maxiter";
value= "50";
output;
id= "Neural";
property="Maxtime";
value= "4 HOURS";
output;
id= "Neural";
property="TrainingTechnique";
value= "DEFAULT";
output;
id= "Neural";
property="ConvDefaults";
value= "Y";
output;
id= "Neural";
property="AbsConvValue";
value= "-1.34078E154";
output;
id= "Neural";
property="AbsFValue";
value= "0";
output;
id= "Neural";
property="AbsFTime";
value= "1";
output;
id= "Neural";
property="AbsGValue";
value= "0.00001";
output;
id= "Neural";
property="AbsGTime";
value= "1";
output;
id= "Neural";
property="AbsXValue";
value= "1E-8";
output;
id= "Neural";
property="AbsXTime";
value= "1";
output;
id= "Neural";
property="FConvValue";
value= "0";
output;
id= "Neural";
property="FConvTime";
value= "1";
output;
id= "Neural";
property="GConvValue";
value= "1E-6";
output;
id= "Neural";
property="GConvTime";
value= "1";
output;
id= "Neural";
property="ModelSelectionCriterion";
value= "PROFIT/LOSS";
output;
id= "Neural";
property="SuppressOutput";
value= "N";
output;
id= "Neural";
property="Residuals";
value= "Y";
output;
id= "Neural";
property="Standardizations";
value= "N";
output;
id= "Neural";
property="HiddenUnits";
value= "N";
output;
id= "Neural";
property="TrainCode";
value= "";
output;
id= "Neural";
property="PrelimOutest";
value= "";
output;
id= "Neural";
property="Outest";
value= "";
output;
id= "Neural";
property="Outfit";
value= "";
output;
id= "Neural";
property="InitialDs";
value= "";
output;
id= "Neural";
property="CodefileRes";
value= "";
output;
id= "Neural";
property="CodefileNoRes";
value= "";
output;
id= "Neural";
property="AddHidden";
value= "Y";
output;
id= "Neural";
property="HiddenCombFunction";
value= "DEFAULT";
output;
id= "Neural";
property="HiddenActivation";
value= "DEFAULT";
output;
id= "Neural";
property="HiddenBias";
value= "Y";
output;
id= "Neural";
property="TargetCombFunction";
value= "DEFAULT";
output;
id= "Neural";
property="TargetActivation";
value= "DEFAULT";
output;
id= "Neural";
property="TargetError";
value= "DEFAULT";
output;
id= "Neural";
property="TargetBias";
value= "Y";
output;
id= "Neural";
property="InitialSeed";
value= "12345";
output;
id= "Neural";
property="RandDist";
value= "NORMAL";
output;
id= "Neural";
property="RandScale";
value= "0.1";
output;
id= "Neural";
property="RandLoc";
value= "0";
output;
id= "Neural";
property="InputStandardization";
value= "STD";
output;
id= "Neural";
property="WeightDecay";
value= "0";
output;
id= "Neural";
property="Accelerate";
value= "1.2";
output;
id= "Neural";
property="Decelerate";
value= "0.5";
output;
id= "Neural";
property="Learn";
value= "0.1";
output;
id= "Neural";
property="MaxLearn";
value= "50";
output;
id= "Neural";
property="MinLearn";
value= "0.00001";
output;
id= "Neural";
property="Momentum";
value= "0";
output;
id= "Neural";
property="MaxMomentum";
value= "1.75";
output;
id= "Neural";
property="Tilt";
value= "0";
output;
id= "Neural";
property="ForceRun";
value= "N";
output;
id= "Neural";
property="RunAction";
value= "Train";
output;
id= "Neural";
property="Component";
value= "NeuralNetwork";
output;
id= "Neural";
property="EM_DECMETA_DEP_DEL15";
value= "WORK.Neural_DEP_DEL15_DM";
output;
id= "Neural";
property="EM_DECDATA_DEP_DEL15";
value= "WORK.Neural_DEP_DEL15_DD";
output;
id= "Neural";
property="EM_FILE_EMNOTES";
value= "Neural_EMNOTES.txt";
output;
id= "Impt";
property="MethodInterval";
value= "MEDIAN";
output;
id= "Impt";
property="MethodClass";
value= "TREESURR";
output;
id= "Impt";
property="MethodTargetInterval";
value= "NONE";
output;
id= "Impt";
property="MethodTargetClass";
value= "NONE";
output;
id= "Impt";
property="ABWTuning";
value= "9";
output;
id= "Impt";
property="AHUBERTuning";
value= "1.5";
output;
id= "Impt";
property="AWAVETuning";
value= "6.2831853072";
output;
id= "Impt";
property="SpacingProportion";
value= "90";
output;
id= "Impt";
property="DefaultChar";
value= "";
output;
id= "Impt";
property="DefaultNum";
value= ".";
output;
id= "Impt";
property="RandomSeed";
value= "12345";
output;
id= "Impt";
property="Normalize";
value= "Y";
output;
id= "Impt";
property="ImputeNoMissing";
value= "N";
output;
id= "Impt";
property="MaxPctMissing";
value= "50";
output;
id= "Impt";
property="ValidateTestMissing";
value= "N";
output;
id= "Impt";
property="DistributionMissing";
value= "N";
output;
id= "Impt";
property="LeafSize";
value= "5";
output;
id= "Impt";
property="Maxbranch";
value= "2";
output;
id= "Impt";
property="Maxdepth";
value= "6";
output;
id= "Impt";
property="MinCatSize";
value= "5";
output;
id= "Impt";
property="Nrules";
value= "5";
output;
id= "Impt";
property="Nsurrs";
value= "2";
output;
id= "Impt";
property="Splitsize";
value= ".";
output;
id= "Impt";
property="Indicator";
value= "NONE";
output;
id= "Impt";
property="IndicatorRole";
value= "REJECTED";
output;
id= "Impt";
property="ReplaceVariable";
value= "N";
output;
id= "Impt";
property="HideVariable";
value= "Y";
output;
id= "Impt";
property="IndicatorSource";
value= "IMPUTED";
output;
id= "Impt";
property="ForceRun";
value= "N";
output;
id= "Impt";
property="RunAction";
value= "Train";
output;
id= "Impt";
property="Component";
value= "Impute";
output;
id= "Impt";
property="EM_FILE_EMNOTES";
value= "Impt_EMNOTES.txt";
output;
id= "FIMPORT";
property="Location";
value= "CATALOG";
output;
id= "FIMPORT";
property="Catalog";
value= "SASHELP.EMSAMP.Fimport.SOURCE";
output;
id= "FIMPORT";
property="ImportType";
value= "Local";
output;
id= "FIMPORT";
property="GuessRows";
value= "500";
output;
id= "FIMPORT";
property="Delimiter";
value= ",";
output;
id= "FIMPORT";
property="NameRow";
value= "Y";
output;
id= "FIMPORT";
property="SkipRows";
value= "0";
output;
id= "FIMPORT";
property="MaxRows";
value= "1000000";
output;
id= "FIMPORT";
property="MaxCols";
value= "10000";
output;
id= "FIMPORT";
property="FileType";
value= "csv";
output;
id= "FIMPORT";
property="Role";
value= "TRAIN";
output;
id= "FIMPORT";
property="ForceRun";
value= "N";
output;
id= "FIMPORT";
property="Summarize";
value= "N";
output;
id= "FIMPORT";
property="AdvancedAdvisor";
value= "Y";
output;
id= "FIMPORT";
property="RunAction";
value= "Train";
output;
id= "FIMPORT";
property="Component";
value= "FileImport";
output;
id= "FIMPORT";
property="IFileName";
value= "C:\Users\Bionca\Documents\FinalFlight.2020501.csv";
output;
id= "FIMPORT";
property="AccessTable";
value= "NoTableName";
output;
id= "FIMPORT";
property="UserID";
value= "NoUserID";
output;
id= "FIMPORT";
property="Password";
value= "NoPassword";
output;
id= "FIMPORT";
property="ToolType";
value= "SAMPLE";
output;
id= "FIMPORT";
property="ToolPrefix";
value= "FIMPORT";
output;
id= "FIMPORT";
property="EM_VARIABLEATTRIBUTES";
value= "WORK.FIMPORT_VariableAttribute";
output;
id= "FIMPORT";
property="EM_FILE_USERTRAINCODE";
value= "FIMPORT_USERTRAINCODE.sas";
output;
id= "FIMPORT";
property="EM_FILE_VARIABLESETDELTA";
value= "FIMPORT_VARIABLESETDELTA.txt";
output;
id= "FIMPORT";
property="EM_FILE_DELTACODE";
value= "FIMPORT_DELTACODE.txt";
output;
id= "FIMPORT";
property="EM_FILE_EMNOTES";
value= "FIMPORT_EMNOTES.txt";
output;
run;
*------------------------------------------------------------*;
* Create connections data set;
*------------------------------------------------------------*;
data connect;
length from to $12;
from="Trans";
to="Neural";
output;
from="Impt";
to="Trans";
output;
from="CNTRL";
to="Impt";
output;
from="Repl";
to="CNTRL";
output;
from="Part";
to="Repl";
output;
from="Stat";
to="Part";
output;
from="FIMPORT";
to="Stat";
output;
run;
*------------------------------------------------------------*;
* Create actions to run data set;
*------------------------------------------------------------*;
%macro emaction;
%let actionstring = %upcase(&EM_ACTION);
%if %index(&actionstring, RUN) or %index(&actionstring, REPORT) %then %do;
data actions;
length id $12 action $40;
id="Neural";
%if %index(&actionstring, RUN) %then %do;
action='run';
output;
%end;
%if %index(&actionstring, REPORT) %then %do;
action='report';
output;
%end;
run;
%end;
%mend;
%emaction;
*------------------------------------------------------------*;
* Execute the actions;
*------------------------------------------------------------*;
%em5batch(execute, workspace=workspace, nodes=nodes, connect=connect, datasources=datasources, nodeprops=nodeprops, action=actions);
