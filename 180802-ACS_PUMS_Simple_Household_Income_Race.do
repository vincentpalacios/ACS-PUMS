/*******************************************************************************
* File name: 180803-Simple_Household_Incomeby_Race.do
* Author: Vincent Palacios
* Last Updated: 08/03/18
* Description: Simple demonstration of how to create and tabulate houshold income
* by race/ethnic categories from 2012-2016 ACS 5-year PUMS
*
* Inputs: 2012-2016 ACS 5-year PUMS DC Person csv file
* 2012-2016 ACS 5-year PUMS DC Household csv file
*
*******************************************************************************/

* 0. SET ENVIRONMENT
* 1. LOAD DATA
* 2. INSPECT RAW DATA 
* 3. CREATE VARIABLES FOR ANALYSIS
* 4. PRODUCE SUMMARY TABLES AND GRAPHICS



/*******************************************************************************
** 0. SET ENVIRONMENT
*******************************************************************************/
* Set working directory
cd "~/data/projects/ACS-PUMS/SIMPLE_HOUSEHOLD_INCOME/"

* Clear memory of dataset
clear



/*******************************************************************************
** 1. LOAD DATA
*******************************************************************************/
* Import the 2016 ACS 5-year PUMS person file for DC
import delimited "~/data/acs/2016/2016pdc_5year.csv", clear

* Select just the variables needed
keep serialno relp pincp adjinc rac1p hisp pwgtp

* Merge in household weight
tempfile pdc
save `pdc', replace
import delimited "~/data/acs/2016/2016hdc_5year.csv", clear
keep serialno wgtp
* NOTE: By using the option keep(3) only observations where SERIALNO shows up in both
* datases are kept. This purposefully excludes households that appear in the 
* household file but not in the person file, which happen to be vacant households.
merge 1:m serialno using `pdc', nogenerate keep(3)

* Check the dimensions, variables, and size of the dataset                      
describe
* 32648 obs by 2 variables



/*******************************************************************************
** 2. INSPECT DATA
*******************************************************************************/

* Quickly inspect the first few rows of data
list in 1/6

* Keep just observations in households
keep if relp < 16
describe, short

* Tabulate a variable 
* NOTE: missing option must be specified if missing category is to be reported
tabulate rac1p, missing

* Tabulate a variable, with weights (tab is short for tabulate)
tab rac1p [iw=pwgtp], missing

* Tabulate two variables, with weights
tab hisp rac1p [iw=pwgtp], missing

* Tabulate two variables, with weights, stored as matrix named my_table
tab hisp rac1p [iw=pwgtp], matcell(my_table) missing

* Tabulate just variables that are bytes (likely categorical variables)
ds, has(type byte)
tab1 `r(varlist)'

* Summarize all numeric variables
ds, has(type numeric)
summarize `r(varlist)'



/*******************************************************************************
** 3. CREATE NEW VARIABLES
*******************************************************************************/

** Generate new varialbes to look at household income by custom race groups

* Adjust total person income
generate pincp_adj = pincp * adjinc / 1000000

* Compare summary of old and new variable
* NOTE: There are missing values. ACS PUMS use missing values to frequently
* denote the variable universe. Care must be taken to check for missing values
* to avoid producing incorrect estimates.
summarize pincp pincp_adj
inspect pincp pincp_adj

* Create custom race and ethnic category
* Create a new variable names racecat
generate racecat = 5

* Replace that variable based on condition
replace racecat = 1 if rac1p == 1
replace racecat = 2 if rac1p == 2
replace racecat = 4 if rac1p == 6
replace racecat = 3 if hisp >= 2

* Add value labels to racecat so that tables print with labels
label define racecat 1 "White_NH" 2 "Black_NH" 3 "Hispanic" 4 "Asian_NH" 5 "Other_NH"
label values racecat racecat

* Unweighted tabulation of racecat variable
tab rac1p, missing

* Cross tab raceth with race and hisp
tab2 racecat rac1p hisp, firstonly missing

* Sum up total person income by household
* NOTE: the approach is to group, then summarize, then merge the result with the original data
* NOTE: since Stata can only store one dataset in memory at a time, we create 
* temporary datasets, save our intermediate results, and merge them back together
tempfile pums2016pop household_income
save `pums2016pop'

* sum of all adjusted person income grouped by household
collapse (sum) hincp_adj = pincp_adj, by(serialno)
save `household_income'

* merge above result back to main dataframe using serialno as merge key
use `pums2016pop'
merge m:1 serialno using `household_income', nogenerate

* All of the steps above in one call
use `pums2016pop', clear
egen hincp_adj = sum(pincp_adj), by(serialno)



/*******************************************************************************
** 4. PRODUCE SUMMARY TABLES AND GRAPHICS
*******************************************************************************/

* NOTE: ACS PUMS estimates will not match ACS summary estimates because they 
* are based on a smaller sample and have been further process to protect the 
* anonymity of respondents. 

* Tabulation of average person income by race
table racecat [iw=pwgtp], c(mean pincp_adj)

* Tabulation of average household income by race
table racecat [iw=wgtp] if relp == 0, c(mean hincp_adj)

* Store results of weighted average income by race as dataset in memory
* NOTE: When tabulating at household level, restrict to just householder and use 
* household weights.

* NOTE: This replaces the original dataset in memory, as Stata can only have one
* dataset loaded at a time
table racecat [iw=wgtp] if relp == 0, c(mean hincp_adj) replace

* Create and export column chart of mean incomes by race
graph bar table1, over(racecat)  asyvars  ///
      title("Mean Household Income by Race/Ethnicity in DC") ///
      ytitle("Mean Household Income") ///
      caption("Source: 2012-2016 ACS 5-year PUMS data.") ///
      legend(position(3) cols(1)) bargap(15) ysize(4.2) xsize(6) 

* Save the result
graph export "plots/1_hhinc_by_race_stata.png", replace



/*******************************************************************************
* * QUESTIONS FOR READER
*******************************************************************************/

* 1. What does it mean to tabulate the results for people using their race category?
* 2. What does it mean to tabulate the results for households using the householder's
*    race category?
* 3. Table S1902 has per capita income by race and ethnic origin 
*    (https://factfinder.census.gov/bkmk/table/1.0/en/ACS/16_5YR/S1902/0100000US.04000).
*    How are those estimates different from above? Hint: Who is in the universe of
*    the PINCP variable?   
* 4. If you adapted this code to produce per capita incomes by racecat, why would they
*    they still differ from published estimates? Hint: What is the difference 
*    between ACS summary and PUMS data? Hint: Are the race categories used here the 
*    same as used by the Census?



* The software is provided "as is", without warranty of any kind, express or 
* implied, including but not limited to the warranties of merchantability, 
* fitness for a particular purpose and noninfringement. in no event shall the 
* authors or copyright holders be liable for any claim, damages or other 
* liability, whether in an action of contract, tort or otherwise, arising from, 
* out of or in connection with the software or the use or other dealings in the 
* software. 



/*******************************************************************************
** END OF FILE
*******************************************************************************/
