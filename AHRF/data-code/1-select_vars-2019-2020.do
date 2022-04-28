*---------------------------------------------------------*
* Author: Kaylyn Sanbower
* Date Created: June 29, 2021
*---------------------------------------------------------*
set more off

*--- Import Data ---*

clear 
 #delim ;
 
import sas  f00011 
			f00012 
			f1198419 f1198418 f1198417 f1198416 f1198415 f1198414 f1198413 f1198412 f1198411 
			f0453010 
			f1319119 f1319118 f1319117 f1319116 f1319115 f1319114 f1319113 f1319112 f1319111 f1319110 
			f0679519 f0679518 f0679517 f0679516 f0679515 f0679514 f0679513 f0679512 f0679511 f0679510 
			f1332118 f1332117 f1332116 f1332115 f1332114 f1332113 f1332112 f1332111 f1332110 
			f1547418 f1547417 f1547416 f1547415 
			f1475110 
			f1322618 f1322617 f1322616 f1322615 f1322614 f1322613 f1322612 f1322611 f1322610 
			f1555018 f1555017 f1555016 f1555015 f1555014 f1555013 f1555012 f1555011 
			
			using "/Users/kaylynsanbower/Dropbox/Data-Public_Access/AHRF/Data/ahrf2020.sas7bdat"

;

	
*--- Export Data as CSV ---*
export delimited using "/Users/kaylynsanbower/Dropbox/Data-Public_Access/AHRF/Data/ahrf2020.csv"
