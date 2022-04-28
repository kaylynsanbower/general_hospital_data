########################################################################################
## Author:        Kaylyn Sanbower
## Date Created:  10/1/2019
## Date Edited:   
## Notes:         Code to combine all 
########################################################################################
# clear
rm(list=ls())

if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, ggplot2, dplyr, lubridate, DescTools, psych, plotly, data.table,
               ggthemes, expss, xtable, Hmisc, tables,foreign, lpdensity, rddensity, rdrobust,
               rdlocrand,TeachingDemos, DataCombine, rddtools, readxl)


##########################
##### Importing Data #####
##########################

# Define paths 
path.code="~/Dropbox/Research-Projects/general_hospital_data/CMI/data/input/"


for (i in 2006:2010){
  df <- read_excel(paste(path.code, "CMI",i,".xls",sep=""))
  df <- df %>% subset(select=c(ID, UCMI))
  df <- df %>% mutate(year=i)
  assign(paste("df", i, sep = ""), df )
  
}


for (i in 2011:2012){
  df <- read_excel(paste(path.code, "CMI",i,".xlsx",sep=""))
  df <- df %>% subset(select=c(ID, UCMI))
  df <- df %>% mutate(year=i)
  assign(paste("df", i, sep = ""), df )
}


for (i in 2013:2018){
  df <- read.delim(paste(path.code, "CMI",i,".txt",sep=""), header = FALSE, sep = " ")
  df <- df %>% rename(ID = V1,
                      UCMI = V3)
  df <- df %>% subset(select=c(ID, UCMI))
  df <- df %>% mutate(year=i)
  assign(paste("df", i, sep = ""), df )
}

rm(df)



#### Bind all dataframes ####

final <- rbind(df2006, df2007, df2008, df2009, df2010, df2011,
             df2012, df2013, df2014, df2015, df2016, 
             df2017, df2018)

final <- final %>% rename(mcrnum = ID,
                          cmi = UCMI)


##### EXPORT TO CSV #####
write.csv(final, file = "~/Dropbox/Research-Projects/general_hospital_data/CMI/data/output/CMI-FINAL.csv")

