################################################################################
# File name: 180730_ACS_PUMS_Example_Analysis.R
# Author: Vincent Palacios
# Last Updated: 07/30/18
# Description: Simple demonstration of how to create and tabulate person and 
# houshold variables from 2012-2016 ACS 5-year PUMS
#
# Inputs: 2012-2016 ACS 5-year PUMS DC .csv file
#
################################################################################


# The process of analyzing ACS PUMS data generally includes the following steps:

# Check if data is available on American Fact Finder
# - IF NOT-
# read data dictionary to identify variables
# identify unit of analysis: person file or household file variables needed?
# refer to subjects file if needed for concepts 
# retrieve/convert the data
# read readme file to see what variables have changed in PUMS vintage
# log results
# load data from population or household file (or both)
# inspect data
# be careful for missing values or categorical codings 
# define new variables 
# tabulate or summarize data
# use weights
# check reasonableness of estimates 
# check sample sizes of estimates 
# check standard errors of estimates 
# compare estimates with other known data for external validation
# only communicate differences in esimtates if they are statistically different from each other
# cite data source appropriately
# e.g. 2012-2016 ACS 5-year PUMS data


################################################################################
# 0. SET ENVIRONMENT
################################################################################
# Set working directory
setwd("C:/Users/palacios/Documents")

# Clear memory of objects; the syntax is idiosyncratic to base R
rm(list=ls())

# Load tidyverse package; if not installed, first run: install.packages("tidyverse")
library(tidyverse)

# Set screen print option to print up to 110 lines to screen. Larger tables will 
# truncate and warn the user that output is ommitted.
options(tibble.print_max = 110)



################################################################################
# 1. LOAD PERSON DATA
###############################################################################

# Import the 2012-2016 ACS 5-year PUMS person file for DC
pums2016pop <- read.csv("C:/Users/palacios/Data/ACS/2016/2016pil_5year.csv", nrows = 100)

# Inspect names and structure of data
names(pums2016pop)
str(pums2016pop, list.len = 10)

# Set variables of interest to inlcude
pvarnames <- c("ST", "SERIALNO", "SPORDER", "RELP", "PUMA", "PINCP", "ADJINC", "SFR", "SFN",
               "SEX", "AGEP", "OC", "RC", "MAR", "RAC1P", "HISP", "SCHL", "PWGTP")

# Grab column index numbers from vector of all column names
pvarindex <- which(names(pums2016pop) %in% pvarnames)

# Grab class for just selected variables
# Note: lapply takes a dataframe and a function, applies that function to each column in the dataframe, and returns the output as a list
pvarclass <- lapply(pums2016pop[, pvarindex], class)

# Create vector of "NULL" values
pcolclasses <- rep("NULL", length(pums2016pop))

# Replace "NULL" values with classes of selected variables
pcolclasses[pvarindex] <- pvarclass

# Read in all rows for just selected variables, setting their class
pums2016pop <- read.csv("C:/Users/palacios/Data/ACS/2016/2016pil_5year.csv", colClasses = pcolclasses)

# Check the size of the dataset                      
print(object.size(pums2016pop), units = "Mb")
pums2016pop <- as_tibble(pums2016pop)



################################################################################
# 2. LOAD HOUSEHOLD DATA
###############################################################################

# Import the 2012-2016 ACS 5-year PUMS person file for DC
pums2016hsg <- read.csv("C:/Users/palacios/Data/ACS/2016/2016hil_5year.csv", nrows = 100)

# Inspect names and structure of data
names(pums2016hsg)
str(pums2016hsg, list.len = 10)

# Set variables of interest to inlcude
hvarnames <- c("SERIALNO", "TYPE", "TEN", "VACS", "NP", "FPARC", "HUGCL", "HUPAC", "HUPAOC", 
               "HUPARC", "MULTG", "NOC", "OC", "NRC", "NPF", "NR", "PSF", "R18",
               "FES", "FINCP", "HINCP", "WGTP")

hvarindex <- which(names(pums2016hsg) %in% hvarnames)
hvarclass <- lapply(pums2016hsg[, hvarindex], class)
hcolclasses <- rep("NULL", length(pums2016hsg))
hcolclasses[hvarindex] <- hvarclass
pums2016hsg <- read.csv("C:/Users/palacios/Data/ACS/2016/2016hil_5year.csv", colClasses = hcolclasses)

# Check the size of the dataset                      
print(object.size(pums2016hsg), units = "Mb")
pums2016hsg <- as_tibble(pums2016hsg)



################################################################################
# 3. INSPECT DATA FRAMES AND MERGE DATA
################################################################################

# Quickly inspect the first few rows of data with base R
str(pums2016pop)
str(pums2016hsg)

# Quickly inspect the first few rows of data with base R
summary(pums2016pop)
summary(pums2016hsg)
# Note: ACS PUMS use NA values to denote when an observation is outside of the 
# variable universe. Take care that you account for NAs when analyzing PUMS data.

# Quickly inspect the first few rows of data with base R
head(pums2016pop)
head(pums2016hsg)

# Join the data together on serialno
pums2016 <- inner_join(pums2016pop,pums2016hsg, by = c("SERIALNO"))
# Note: inner_join() is used to omit all vacant households, for which there are 
# no observations in the person file. If one wanted vacant households, the could
# use full_join instead.

# Inspect results
str(pums2016)
summary(pums2016)
head(pums2016)
Hmisc::describe(pums2016)

# Inspect all variables in the dataframe 
lapply(pums2016, function(x) {
  if (is.numeric(x)) return(summary(x))
  if (is.factor(x)) return(table(x, useNA = "always"))
})



################################################################################
# 4. CREATE VARIABLES FOR COMPARISON AGAINST VERIFCATION FILE
################################################################################
# read in verification estimates for Illinois
acs_5year_ve_url <- "https://www2.census.gov/programs-surveys/acs/tech_docs/pums/estimates/pums_estimates_12_16.csv"
(acs_5year_ve <- 
  as.tibble(read.csv(acs_5year_ve_url)) %>% 
  filter(st == 17))

# Total population
(tot_pop <- count(pums2016, wt = PWGTP))

# Housing unit population (RELP=0-15)     
(hsg_pop <- pums2016 %>% filter(RELP < 16) %>% count(wt = PWGTP))

# GQ population (RELP=16-17)              
(gq_pop <- pums2016 %>% filter(RELP >= 16) %>% count(wt = PWGTP))
(gqt_pop <- pums2016 %>% filter(RELP >= 16) %>% group_by(RELP) %>% count(wt = PWGTP))

# By sex
(sex_pop <- pums2016 %>% group_by(SEX) %>% count(wt = PWGTP))

# By age
(age_pop <- pums2016 %>% 
  mutate(age_cat = cut(AGEP, right = FALSE,
    breaks = c(0,5,10,15,20,25,35,45,55,60,65,75,85,100))) %>% 
  group_by(age_cat) %>% count(wt = PWGTP))
                              
# Total housing units (TYPE=1) 
(tot_hsg <- pums2016hsg %>% filter(TYPE == 1) %>% count(wt = WGTP))

# Total occupied units                    
(occ_hsg <- pums2016hsg %>% filter(TEN %in% c(1:4)) %>% count(wt = WGTP))

# Owner occupied units (TEN in 1,2)       
(ooh_hsg <- pums2016hsg %>% filter(TEN %in% c(1:2)) %>% count(wt = WGTP))

# Renter occupied units (TEN in 3,4)      
(roh_hsg <- pums2016hsg %>% filter(TEN %in% c(3:4)) %>% count(wt = WGTP))

# By tenure 
(ten_hsg <- pums2016hsg %>% group_by(TEN) %>% count(wt = WGTP))

# By vacancy group
(vac_hsg <- pums2016hsg %>% mutate(vac_cat = 1) %>% 
    mutate(vac_cat = replace(vac_cat, which(VACS == 3), 2)) %>%
    mutate(vac_cat = replace(vac_cat, which(VACS %in% c(2,4,5,6,7)), 3)) %>%
  group_by(vac_cat) %>% count(wt = WGTP))

# Add estimates together into a data frame
acs_pums_est_ve <- rbind(
  tot_pop,
  hsg_pop,
  gq_pop,
  gqt_pop[,2],
  sex_pop[,2],
  age_pop[,2],
  tot_hsg,
  occ_hsg,
  ooh_hsg,
  roh_hsg,
  ten_hsg[,2],
  vac_hsg[,2])

# Compare Census with calculated estimates
cbind(acs_5year_ve[,3:4], acs_pums_est_ve)



################################################################################
# 5. INSPECT VARIABLES WITH BASE R AND OTHER PACKAGES
################################################################################

# Use with() summary to inspect variables
with(pums2016, summary(RELP))

# Attach the pums2016 dataset so that it is implicitly called with variables
attach(pums2016)

# Describe from Hmisc() package
describe(RELP)

fivenum(SFR)

# Use cross tabs w/ table() to better understand categorical variables
table(RELP, SFR)

# Use cross tabs w/ table() to better understand categorical variables
table(RELP, SFR, useNA = "ifany")

# Keep records from households only, dropping group quarters
pums2016 <- filter(pums2016, RELP <= 15)
table(RELP, SFR, useNA = "ifany")

# Check row or column percentages
table_relp_sfr <- table(RELP, SFR, useNA = "ifany")
prop.table(table_relp_sfr)
prop.table(table_relp_sfr, 1)
round(prop.table(table_relp_sfr, 2)*100,digits = 1) # rounded percentages

# Use xtabs() w/ formula notation to get weighted cross tabs
xtabs(PWGTP ~ RELP + SFR)
xtabs(PWGTP ~ RELP + SFR, addNA = TRUE)

# With CrossTable() from gmodels package
gmodels::CrossTable(RELP,SFR)




################################################################################
# 6. INSPECT VARIABLES WITH TIDYVERSE
################################################################################
# Inspect using dplyr with the pipe operator
# NOTE: one of the most useful features of dplyr is that it was built to be easy
# to follow. Instead of nesting many functions within one assignment statement, i.e.
# Y <- fun1(fun2(fun3(...funX(df)...))), one can declare a dataset and then perform
# some transform of it and pass it along, left to right, to the next transform with
# the pipe operator, %>%, in between, e.g. 
# Y <- df %>% funX() %>% ... %>% fun3() %>% fun2() %>% fun1() 
# In doing so, one does not need to declare the dataset within the function each 
# time as the pipe operates to declare it implicitly as the data moves left to right.
# Functions can still take options, nested if need be. 


# NOTE: the tables below are printed to the screen but not stored in memory unless
# explicity assigned to an object.

# Table a variable with table with the dataset declared in the function. 
count(pums2016, RELP)

# Table a variable by declaring the dataset and piping it to the count function
pums2016 %>% count(RELP)

# Table a variable, with weights
pums2016 %>% count(RELP, wt = PWGTP)

# Table two variables, with weights
pums2016 %>% count(RELP, SFR, wt = PWGTP)

# Table two variables, with weights
pums2016 %>% count(RELP, SFR, wt = PWGTP) %>% 
  spread(key = SFR, value = n)

# Table two variables, with weights
pums2016 %>% count(RELP, SFR, wt = PWGTP) %>% 
  spread(key = SFR, value = n, fill = 0)

# Summarize a variable using useful functions
pums2016 %>% 
  summarise(
    count = n(),
    min = min(RELP),
    max = max(RELP),
    mean = mean(RELP, na.rm = TRUE),
    std.dev = sd(RELP,na.rm = TRUE),
    median = median(RELP, na.rm = TRUE),
    unique = n_distinct(RELP, na.rm = TRUE),
    missing = sum(is.na(RELP)),
    pos = sum(RELP > 0),                    
    zeros = sum(RELP == 0),
    neg = sum(RELP < 0)
  )

# Summarize several variable using useful functions
vars_to_inspect <- c("RELP", "SFR", "PINCP")

pums2016 %>% 
  summarise_at(
    vars(vars_to_inspect),
    funs(
      count = n(),
      nonmissing = sum(!is.na(.)),
      missing = sum(is.na(.)),
      min = min(., na.rm = TRUE),
      max = max(., na.rm = TRUE),
      mean = mean(., na.rm = TRUE),
      std.dev = sd(.,na.rm = TRUE),
      median = median(., na.rm = TRUE),
      unique = n_distinct(., na.rm = TRUE),
      pos = sum(. > 0, na.rm = TRUE),                    
      zero = sum(. == 0, na.rm = TRUE),
      neg = sum(. < 0, na.rm = TRUE)
    )
  ) %>% 
  gather(variable, value) %>% 
  separate(variable, c("var", "stat"), sep = "\\_") %>% 
  spread(stat, value) %>% 
  select(var, count, nonmissing, missing, pos, zero, neg, min, max, mean, std.dev, median, unique) %>% 
  as.data.frame()

# Summarize all integer variables
pums2016 %>% 
  summarise_if(
    is.integer,
    funs(
      count = n(),
      nonmissing = sum(!is.na(.)),
      missing = sum(is.na(.)),
      min = min(., na.rm = TRUE),
      max = max(., na.rm = TRUE),
      mean = mean(., na.rm = TRUE),
      std.dev = sd(.,na.rm = TRUE),
      median = median(., na.rm = TRUE),
      unique = n_distinct(., na.rm = TRUE),
      pos = sum(. > 0, na.rm = TRUE),                    
      zero = sum(. == 0, na.rm = TRUE),
      neg = sum(. < 0, na.rm = TRUE)
    )
  ) %>% 
  gather(variable, value) %>% 
  separate(variable, c("var", "stat"), sep = "\\_") %>% 
  spread(stat, value) %>% 
  select(var, count, nonmissing, missing, pos, zero, neg, min, max, mean, std.dev, median, unique) %>% 
  arrange(-missing)



################################################################################
# * TO ADD
################################################################################
# Recreating Census variables
# Using income variables
# Producing Estimates with replicate weight margins of error



################################################################################
# * REFERENCE SITES
################################################################################

# https://github.com/rstudio/cheatsheets/raw/master/data-transformation.pdf
# https://www.statmethods.net/stats/frequencies.html
# http://r4ds.had.co.nz/transform.html#grouped-summaries-with-summarise
# https://www.princeton.edu/~otorres/sessions/s2r.pdf



# The software is provided "as is", without warranty of any kind, express or 
# implied, including but not limited to the warranties of merchantability, 
# fitness for a particular purpose and noninfringement. in no event shall the 
# authors or copyright holders be liable for any claim, damages or other 
# liability, whether in an action of contract, tort or otherwise, arising from, 
# out of or in connection with the software or the use or other dealings in the 
# software. 



################################################################################
# END OF FILE
################################################################################
