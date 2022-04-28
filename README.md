# general_hospital_data


Each of the folders in this repository have subfolders that follow the same structure, which is defined as follows. 

* **data** -- this folder will contain two subfolders, "input" and "output." The former contains the raw data files, and the latter contains the data files that are produced using the code in the "data-code" file. Note that I have not uploaded any of input data to the publicly available raw data files to github, but the URLs to the data sources are given below. For data that is not publicly available, there are no output files made available. 
* **data-code** -- this folder contains the code files that are used to produce the files in the data/output folder. The first number in the file name indicates the order in which the code should be run. An "S" prefix indicates that that file "supports" another code file, i.e., it's read in through one of the enumerated files. 



## CMI 
The CMI data come from [the NBER](https://www.nber.org/research/data/centers-medicare-medicaid-services-cms-casemix-file-hospital-ipps). 

## AHRF 
The AHRF data are available [here](https://data.hrsa.gov/data/download?data=SHORT#SHORT).

## HCRIS 
CMS provides the HCRIS data at [this link](https://www.cms.gov/Research-Statistics-Data-and-Systems/Downloadable-Public-Use-Files/Cost-Reports/Cost-Reports-by-Fiscal-Year).