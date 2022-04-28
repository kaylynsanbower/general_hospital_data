########################################################################################
## Author:        Kaylyn Sanbower
## Date Created:  8/21/2019
## Date Edited:   
## Notes:         R file to pull in AHRF data
########################################################################################
# clear
rm(list=ls())

if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, ggplot2, dplyr, lubridate, DescTools, psych, plotly, data.table,
               ggthemes, here)

# Import data
df <- read.csv(here("AHRF/data/input/ahrf2020.csv"))

##########################
##### Splitting Data #####
##########################

###-----------###
### 2010 Data ###
###-----------###
varnames = c('f04530','f13191','f06795','f13321','f14751','f13226')

for (i in 10){
  new_df <- subset(df, select = c(f00011, f00012))
  for (j in varnames){
    keep <- subset(df, select = paste(j,i,sep=""))
    new_df <- bind_cols(new_df, keep)
    assign(paste("df_",i,sep=""),new_df)
  }
}

for (i in ls(pattern="^df_10")) {
  g <- get(i)
  names(g)[1:8] <- c("st_fips", "cty_fips", "pop","mcare_elig", "unemp",
                     "pct_pov", "uninsured", "median_inc")
  assign(i,g)
}


###----------------###
### 2011-2014 Data ###
###----------------###
varnames = c('f11984','f13191','f06795','f13321','f13226','f15550')

for (i in 11:14){
  new_df <- subset(df, select = c(f00011, f00012))
  for (j in varnames){
    keep <- subset(df, select = paste(j,i,sep=""))
    new_df <- bind_cols(new_df, keep)
    assign(paste("df_",i,sep=""),new_df)
  }
}

for (i in ls(pattern="^df_11")) {
  g <- get(i)
  names(g)[1:8] <- c("st_fips", "cty_fips", "pop","mcare_elig", "unemp",
                     "pct_pov", "median_inc", "mcare_enroll")
  assign(i,g)
}

for (i in ls(pattern="^df_12")) {
  g <- get(i)
  names(g)[1:8] <- c("st_fips", "cty_fips", "pop","mcare_elig", "unemp",
                     "pct_pov", "median_inc", "mcare_enroll")
  assign(i,g)
}


for (i in ls(pattern="^df_13")) {
  g <- get(i)
  names(g)[1:8] <- c("st_fips", "cty_fips", "pop","mcare_elig", "unemp",
                     "pct_pov", "median_inc", "mcare_enroll")
  assign(i,g)
}

for (i in ls(pattern="^df_14")) {
  g <- get(i)
  names(g)[1:8] <- c("st_fips", "cty_fips", "pop","mcare_elig", "unemp",
                     "pct_pov", "median_inc", "mcare_enroll")
  assign(i,g)
}


###----------------###
### 2015-2016 Data ###
###----------------###

varnames = c('f11984','f13191','f06795','f13321', 'f15474', 'f13226','f15550')

for (i in 15:18){
  new_df <- subset(df, select = c(f00011, f00012))
  for (j in varnames){
    keep <- subset(df, select = paste(j,i,sep=""))
    new_df <- bind_cols(new_df, keep)
    assign(paste("df_",i,sep=""),new_df)
  }
}


for (i in ls(pattern="^df_15")) {
  g <- get(i)
  names(g)[1:9] <- c("st_fips", "cty_fips", "pop","mcare_elig", "unemp",
                     "pct_pov", "uninsured", "median_inc", "mcare_enroll")
  assign(i,g)
}
for (i in ls(pattern="^df_16")) {
  g <- get(i)
  names(g)[1:9] <- c("st_fips", "cty_fips", "pop","mcare_elig", "unemp",
                     "pct_pov", "uninsured", "median_inc", "mcare_enroll")
  assign(i,g)
}

for (i in ls(pattern="^df_17")) {
  g <- get(i)
  names(g)[1:9] <- c("st_fips", "cty_fips", "pop","mcare_elig", "unemp",
                     "pct_pov", "uninsured", "median_inc", "mcare_enroll")
  assign(i,g)
}

for (i in ls(pattern="^df_18")) {
  g <- get(i)
  names(g)[1:9] <- c("st_fips", "cty_fips", "pop","mcare_elig", "unemp",
                     "pct_pov", "uninsured", "median_inc", "mcare_enroll")
  assign(i,g)
}


###-------------------###
### Add year variable ###
###-------------------###
df_10 <- df_10 %>% mutate(year=2010)
df_11 <- df_11 %>% mutate(year=2011)
df_12 <- df_12 %>% mutate(year=2012)
df_13 <- df_13 %>% mutate(year=2013)
df_14 <- df_14 %>% mutate(year=2014)
df_15 <- df_15 %>% mutate(year=2015)
df_16 <- df_16 %>% mutate(year=2016)
df_17 <- df_17 %>% mutate(year=2017)
df_18 <- df_18 %>% mutate(year=2018)




###------------------###
### Combine Datasets ###
###------------------###
final <- bind_rows(df_11, df_12, df_13, df_14, df_15, df_16, df_17, df_18)

write.csv(final, here("AHRF/data/output/ahrf-panel-2011-2018.csv"))




# combine ahrf stuff ------------------------------------------------------
# this is to supplement missing uninsured data

old <- read.csv(here("AHRF/data/output/AHRF-condensed-panel.csv")) %>% subset(select=c(st_fips, cty_fips, uninsured,  year)) %>%
  filter(st_fips ==12) %>% rename(unins = "uninsured")

final <- final %>% filter(st_fips ==12) 

final <- left_join(final, old, by=c("st_fips", "cty_fips", "year")) %>% 
          mutate(all_unins = pmax(uninsured, unins, na.rm=T)) %>% 
          subset(select=-c(unins, uninsured)) %>% 
          rename(uninsured = "all_unins")


###---------------###
### Export to CSV ###
###---------------###

write.csv(final, here("AHRF/data/output/ahrf-panel-fl-2011-2018.csv"))




