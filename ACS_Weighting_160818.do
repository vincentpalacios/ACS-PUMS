/*******************************************************************************
** File name: C:/Users/palacios/OneDrive for Business/S/Training/gitHub/Posted/ACS_Weighting_160815.do
** Author(s): Vincent Palacios
** Posted Date: 8/18/16
** Description: 
** This Stata DO file will automatically download 2014 1-year national ACS microdata to your C:/P/ACS directory
** Version: 0.1
*******************************************************************************/

/* The American Community Survey (ACS) Public Use Microdata Sample (PUMS) contains
** detailed, individual-level survey response data for over 1,000,000 households 
** and over 3,000,000 people in a given year. There are over 40 topics covered spanning 
** 364 variables in the household and person data files, excluding the weighting variables.
** For more information on the survey and PUMS documentation, visit: 
** https://www.census.gov/programs-surveys/acs/technical-documentation/pums/documentation.html.
**
** The ACS PUMS data can be downloaded direclty from the Census, with the simplest way 
** being to visit the Census FTP page, an online repository for large files. This link is the 
** FTP page for the ACS PUMS 2014 1-year files: 
** http://www2.census.gov/programs-surveys/acs/data/pums/2014/1-Year/. */
**
** Read more about the ACS PUMS and how to use these files in the Technical Documentation
** available at: 
** https://www.census.gov/programs-surveys/acs/technical-documentation/pums/documentation.html.
** Of particular relevance is the 2014 ACS 1-year PUMS estimates verification file, 
** available in SAS, LST of CSV format. These files contain several household- and 
** person-level estimates that allow users to verify they are using the weights 
** correctly and are producing correct replicate weiht standard errors. */

/* Notes: All Census variables are stored in upper case. The user variable "cy" is
** added to denote the calendary year in which they survey was conducted. 
** This was written on Stata 13.1, but should work on earlier versions. */



/*******************************************************************************
**  0. SET THE STATA ENVIRONMENT 
*******************************************************************************/
** Sets the "more" prompt off. This is useful when working with long tables that 
** display over multiple screens/pages.
set more off

** Clears the data stored in memory.
clear



/*******************************************************************************
**  1. LOAD PERSON FILE FOR US OR STATE
*******************************************************************************/
** Set local to your state's postal abbreviation. In this example, we look at Alabama.
local statename al

/* Set local to the list of variables you wish to load into memory from the dataset.
** Use lower case variables if your data has variables saved in lower case. The PWTGP*
** term is used to bring in the 80 person replicate weights, PWGTP1 through PWGTP80. */
local varlist ST SERIALNO SPORDER RELP SEX AGEP SCH SCHL RAC1P PWGTP PWGTP*

/* Load the dataset into memory. This assumes your data is story as described in
** the do file: https://github.com/vincentpalacios/ACS-PUMS/blob/master/ACS_Download_160815.do.
** Otherwise, use the correct filepath and file name for your data. */
use `varlist' using C:/P/ACS/2014/2014p`statename'.dta



/*******************************************************************************
**  2. CREATE AGE CATEGORY
*******************************************************************************/
** Create a variable categorizing age using the cutoffs in the User Verification file.
generate byte AgeCategory = 1
replace       AgeCategory = 2 if AGEP > 4
replace       AgeCategory = 3 if AGEP > 9
replace       AgeCategory = 4 if AGEP > 14
replace       AgeCategory = 5 if AGEP > 19
replace       AgeCategory = 6 if AGEP > 24
replace       AgeCategory = 7 if AGEP > 34
replace       AgeCategory = 8 if AGEP > 44
replace       AgeCategory = 9 if AGEP > 54
replace       AgeCategory = 10 if AGEP > 59
replace       AgeCategory = 11 if AGEP > 64
replace       AgeCategory = 12 if AGEP > 74
replace       AgeCategory = 13 if AGEP > 84

** Does the same as above, using the egen command instead. Note the values are different.
egen AgeCategory_2 = cut(AGEP), at(0,5,10,15,20,25,35,45,55,60,65,75,85,100)



/*******************************************************************************
**  3. TABULATE SEX AND AGE CATEGORY, UNWEIGHTED
*******************************************************************************/
** Tabulate several variables to look at their unweighted counts.
tabulate SEX

tab AgeCategory

tab AgeCategory_2

tab AgeCategory_2 SEX



/*******************************************************************************
**  3. TABULATE CATEGORIES, WEIGHTED
*******************************************************************************/
/* Reproduce the same tabulations above, but this time specifying the type of 
** weights and the weighting variable. For person-level estimates use PWGTP. 
** For household-level estimates, use WGTP. In this case, we only use PWGTP.
** The command tabulate takes several different types of weights. Using -fweights-
** would also work here, but both of this might not work correctly for different
** commands. Experiment and check accordingly. Conversely, the weighting variable 
** PWGTP would always stay the same for the same type of tabulation.
**
** As described in the ACS 1-Year Readme file, if you have merged the person 
** and household file "[p]lease note that housing characteristics cannot be 
** tallied from this merged file without extra steps to ensure that each housing 
** weight is counted only once per household." [1] 
**
** Note: Compare these values against those in the User Verification file. They 
** should match up. */
tab SEX [iweight = PWGTP]

tab AgeCategory_2 [iweight = PWGTP]

** This cross tabulation is not available in the User Verification file.
tab AgeCategory_2 SEX [iweight = PWGTP]

** Weights looking at subpopulations using if
tab AgeCategory_2 [iweight = PWGTP] if SEX == 1



/*******************************************************************************
**  3. TABULATE CATEGORIES, WEIGHTED, 
**  WITH REPLICATE-BASED STANDARD ERRORS [2] [3] 
*******************************************************************************/
/* Stata can correctly generate replicate weight-based standard errors. To do so
** one needs to use the survey commands. Type help svy or help svy estimation to
** get acquainted with theses commands. Before svy: command can be used to produce
** an estimate with the correct standard errors, the svyset command must be used 
** specifying the variance estimation method to be used, as shown below. */

** Generate a uniform variable that will be used for counting up persons.
generate byte Count = 1

/* Use the -svyset- command to give Stata information on the survey design and 
** variance estimation methodology. This only needs to be done once.*/
svyset [iw=PWGTP], vce(sdr) sdrweight(PWGTP1-PWGTP80) mse

** Use the -svy: total- command to produce weighted estimates with SEs.
svy: total Count

** Use the -over()- option to create estimaets for groups.
svy: total Count, over(SEX)
svy: total Count, over(AgeCategory_2)
svy: total Count, over(SEX AgeCategory_2)


** Weights looking at subpopulations using subpop and a dummy variable.
gen byte Male = SEX == 1

/* Using the -subpop()- option is recommending for subpopulations of the 
** data instead of using the more common -if- command. */
svy, subpop(Male): total Count, over(AgeCategory_2)

** This is an alternative to using a dummy variable for subpopulations.
svy, subpop(if SEX == 1): total Count, over(AgeCategory_2)



/*******************************************************************************
**  NOTES
*******************************************************************************/
/* [1] See pg 5., http://www2.census.gov/programs-surveys/acs/tech_docs/pums/ACS2014_PUMS_README.pdf.
**
** [2] See http://www.ats.ucla.edu/stat/stata/faq/sample_survey_setups.htm for 
** an excellent discussion of how to set up common surveys in several popular
** statisical progams. 
**
** [3] See https://usa.ipums.org/usa/repwt.shtml for addional discussion of replicate 
** weights with the Census PUMS datasets. Note that IPUMS correctly notes that 
** for the CPS and ACS the option mse must be specified with the svyset command. 
** This page also shows how to use alternate variance specifications than that of 
** succesive difference replication, sdr. For Stata users, sdr is recommended though
** the alternate specifications should return the same results.


/*******************************************************************************
**  END OF FILE
*******************************************************************************/