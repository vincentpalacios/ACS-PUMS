################################################################################
# File name: 180803-Simple_Household_Incomeby_Race.R
# Author: Vincent Palacios
# Last Updated: 08/03/18
# Description: Simple demonstration of how to create and tabulate houshold income
# by race/ethnic categories from 2012-2016 ACS 5-year PUMS
#
# Inputs: 2012-2016 ACS 5-year PUMS DC Person csv file
# 2012-2016 ACS 5-year PUMS DC Household csv file
#
################################################################################

# 0. SET ENVIRONMENT
# 1. LOAD DATA
# 2. INSPECT RAW DATA 
# 3. CREATE VARIABLES FOR ANALYSIS
# 4. PRODUCE SUMMARY TABLES AND GRAPHICS



################################################################################
# 0. SET ENVIRONMENT
################################################################################
# Set working directory
setwd("~/../data/projects/ACS-PUMS/SIMPLE_HOUSEHOLD_INCOME/")

# Clear memory of objects; the syntax is idiosyncratic to base R
rm(list=ls())
  
# Load tidyverse package; if not installed, first run: install.packages("tidyverse")
library(tidyverse)

# Set screen print option to print up to 110 lines to screen. Larger tables will 
# truncate and warn the user that output is ommitted.
options(tibble.print_max = 110)



################################################################################
# 1. LOAD DATA
###############################################################################

# Import the 2016 ACS 5-year PUMS person file for DC
pums2016pop <- read_csv("C:/Users/palacios/Data/ACS/2016/2016pdc_5year.csv")

# Select just the variables needed and reassign the result to the object pums2016pop
pums2016pop <- select(pums2016pop, SERIALNO, RELP, PINCP, ADJINC, RAC1P, HISP, PWGTP)

# Merge in household weight
pums2016hsg <- read_csv("C:/Users/palacios/Data/ACS/2016/2016hdc_5year.csv")
pums2016hsg <- select(pums2016hsg, SERIALNO, WGTP)
# NOTE: By using inner_join() only observations where SERIALNO shows up in both
# datases are kept. This purposefully excludes households that appear in the 
# household file but not in the person file, which happen to be vacant households.
pums2016pop <- inner_join(pums2016pop, pums2016hsg, by = "SERIALNO")

# Check the dimensions, variables, and size of the dataset                         
str(pums2016pop)
print(object.size(pums2016pop), units = "Mb")
# 32648 obs by 2 variables


################################################################################
# 2. INSPECT RAW DATA 
################################################################################

# Quickly inspect the first few rows of data with base R
head(pums2016pop)

# Convert colums to 
# NOTE: R is smart enough to know that the lines continue past the line break
pums2016pop <- 
  (type_convert(pums2016pop, 
    cols(
      SERIALNO = col_double(),
      SPORDER  = col_integer(),
      RELP     = col_integer(),
      PUMA     = col_integer(),
      PINCP    = col_double(),
      HISP     = col_integer(),
      PWGTP    = col_integer(),
      WGTP    = col_integer()
  )))

# Filter to just observations in households
pums2016pop <- filter(pums2016pop, RELP < 16)
head(pums2016pop)

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
# explicity assigned to an object with the assignment operator "<-".

# Tabulate a variable with the dataset declared in the function. 
# NOTE: missing category is reported with count() if present
count(pums2016pop, RAC1P)

# Tabulate a variable by declaring the dataset and piping it to the count function
pums2016pop %>% count(RAC1P)

# Tabulate a variable, with weights
pums2016pop %>% count(RAC1P, wt = PWGTP)

# Tabulate two variables, with weights
# NOTE: Data is returned in long format
pums2016pop %>% count(RAC1P, HISP, wt = PWGTP)

# Tabulate two variables, with weights, in wide format, stored as dataframe named my_table
my_table <- pums2016pop %>% count(RAC1P, HISP, wt = PWGTP) %>% 
  spread(key = RAC1P, value = n)


# Tabulate just variables that are factors
# Summarize all numeric variables
map(pums2016pop, function(x) {
  if (is.factor(x)) return(count(x))
  if (is.numeric(x)) return(summary(x))
})



################################################################################
# 3. CREATE VARIABLES FOR ANALYSIS
###############################################################################

## Generate new varialbes to look at household income by custom race groups

# Adjust total person income
pums2016pop <- mutate(pums2016pop, PINCP_adj = PINCP * ADJINC / 1000000)

# Compare summary of old and new variable
# NOTE: There are missing values. ACS PUMS use missing values to frequently
# denote the variable universe. Care must be taken to check for missing values
# to avoid producing incorrect estimates.
with(pums2016pop, summary(PINCP))
with(pums2016pop, summary(PINCP_adj))

# Create custom race and ethnic category
# Create a new variable names racecat
pums2016pop <- pums2016pop %>% mutate(racecat = 5)

# Replace that variable based on condition
pums2016pop <- pums2016pop %>% mutate(racecat = replace(racecat, which(RAC1P == 1), 1)) 
pums2016pop <- pums2016pop %>% mutate(racecat = replace(racecat, which(RAC1P == 2), 2)) 
pums2016pop <- pums2016pop %>% mutate(racecat = replace(racecat, which(RAC1P == 6), 4)) 
pums2016pop <- pums2016pop %>% mutate(racecat = replace(racecat, which(HISP >= 2), 3))

#Alternatively, do it all with one call
# pums2016pop <- pums2016pop %>% 
#   mutate(racecat = 5) %>% 
#   mutate(racecat = replace(racecat, which(RAC1P == 1), 1)) %>%
#   mutate(racecat = replace(racecat, which(RAC1P == 2), 2)) %>% 
#   mutate(racecat = replace(racecat, which(RAC1P == 6), 4)) %>%
#   mutate(racecat = replace(racecat, which(HISP >= 2), 3))

# Convert racecat to a factor variable so that tables print with labels
racecat_levels <- c("White_NH", "Black_NH", "Hispanic", "Asian_NH", "Other_NH")
pums2016pop$racecat <- factor(pums2016pop$racecat, labels = racecat_levels)

# Unweighted tabulation of racecat variable
count(pums2016pop, racecat)

# Cross tab racecat with RACE and HISP
pums2016pop %>% count(racecat, RAC1P, wt = PWGTP) %>% 
  spread(key = racecat, value = n, fill = 0)

pums2016pop %>% count(racecat, HISP, wt = PWGTP) %>% 
  spread(key = racecat, value = n, fill = 0)


# Sum up total person income by household
# NOTE: the approach is to group, then summarize, then merge the result with the original data
# NOTE: with the pipe operator, %>%, a period, ., stands for the results dataset being piped
# sum of all adjusted person income
pums2016pop %>% 
  summarise(HINCP_adj = sum(PINCP_adj, na.rm = TRUE))

# sum of all adjusted person income grouped by household
household_income <- pums2016pop %>% 
  group_by(SERIALNO) %>% 
  summarise(HINCP_adj = sum(PINCP_adj, na.rm = TRUE))

# merge above result back to main dataframe using SERIALNO as merge key
pums2016pop_and_moneybyhouse <- inner_join(pums2016pop, household_income, by = "SERIALNO")

# All of the steps above in one call
pums2016pop <- pums2016pop %>% 
  group_by(SERIALNO) %>% 
  summarise(HINCP_adj = sum(PINCP_adj, na.rm = TRUE)) %>% 
  inner_join(pums2016pop, ., by = "SERIALNO")

# Inspect results with summary (useful for continuous numeric variables)
with(pums2016pop, summary(PINCP_adj))
with(pums2016pop, summary(HINCP_adj))

# NOTE: Count is just a special case of tally() that calls group_by() and 
# ungroup_by(). It can also be reproduced with summarize() with the n() function
# Compare:
pums2016pop %>% count(RAC1P)

# With:
pums2016pop %>% group_by(RAC1P) %>% tally

# With:
pums2016pop %>% group_by(RAC1P) %>% summarize(n = n())



################################################################################
# 4. PRODUCE SUMMARY TABLES AND GRAPHICS
################################################################################

# NOTE: ACS PUMS estimates will not match ACS summary estimates because they 
# are based on a smaller sample and have been further process to protect the 
# anonymity of respondents.  

# Tabulation of average person income by race
# Tabulate a variable using the group and summary functions
pums2016pop %>% group_by(racecat) %>% 
  summarise(weighted.mean(PINCP_adj, PWGTP, na.rm = TRUE))

# Tabulation of average person income by race, naming result
# Tabulate a variable using the group and summary functions while naming the result
pums2016pop %>% group_by(racecat) %>% 
  summarise(person_inc = weighted.mean(PINCP_adj, PWGTP, na.rm = TRUE))

# Store results of weighted average income by race as a new object
# NOTE: When tabulating at household level, restrict to just householder and use 
# household weights.
# NOTE: Wrapping a line in parantheses causes it to print to the screen when ran
(
  hhinc_by_race <-
    pums2016pop %>% filter(RELP == 0) %>% group_by(racecat) %>%
    summarise(mean_hhi = weighted.mean(HINCP_adj, WGTP, na.rm = TRUE))
)

# Create and export column chart of mean incomes by race
ggplot(data = hhinc_by_race, aes(x = racecat, y = mean_hhi)) +
  geom_col(aes(fill = racecat)) +
  labs(
    title = "Mean Household Income by Race/Ethnicity in DC",
    caption = "\n\nSource: 2012-2016 ACS 5-year PUMS data.",
    x = "Race/Ethnic Category",
    y = "Mean Household Income"
  )

# Save the result
ggsave(
  "plots/1_hhinc_by_race_r.png",
  width = 6,
  height = 6 * 0.7,
  dpi = 300
)



################################################################################
# * QUESTIONS FOR READER
################################################################################

# 1. What does it mean to tabulate the results for people using their race category?
# 2. What does it mean to tabulate the results for households using the householder's
#    race category?
# 3. Table S1902 has per capita income by race and ethnic origin 
#    (https://factfinder.census.gov/bkmk/table/1.0/en/ACS/16_5YR/S1902/0100000US.04000).
#    How are those estimates different from above? Hint: Who is in the universe of
#    the PINCP variable?   
# 4. If you adapted this code to produce per capita incomes by racecat, why would they
#    they still differ from published estimates? Hint: What is the difference 
#    between ACS summary and PUMS data? Hint: Are the race categories used here the 
#    same as used by the Census?


################################################################################
# * REFERENCE SITES
################################################################################

# https://github.com/rstudio/cheatsheets/raw/master/data-transformation.pdf
# https://www.statmethods.net/stats/frequencies.html
# https://sebastiansauer.github.io/sum-isna/
# https://rpubs.com/mharris/reclass_order
# http://r4ds.had.co.nz/transform.html#grouped-summaries-with-summarise
# https://ggplot2.tidyverse.org/reference/geom_bar.html



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
