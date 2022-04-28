*---------------------------------------------------------*
* Author: Kaylyn Sanbower
* Date Created: August 22, 2019
*---------------------------------------------------------*
set more off
set maxvar 10000

*--- Import Data ---*
use "C:\Users\ksanbow\Documents\AHRF-local\ahrf2018stata.dta"

*--- Select Variables to Keep ---*

 #delim ;
 
keep f00011 
	f00012    
	f11984*
	f0453010
	f13191*
	f06795*
	f13321*
	f15474*
	f14751*
	f06795*
	f13226*
	f15550* ;
	
*--- Export Data as CSV ---*
export delimited using "C:\Users\ksanbow\Dropbox\AHRF\Data\AHRF-condensed.csv", replace
