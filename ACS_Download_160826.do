/*******************************************************************************
** File name: C:/Users/palacios/OneDrive for Business/S/Training/gitHub/Posted/ACS_Download_160815.do
** Author(s): Vincent Palacios
** Posted Date: 8/15/16
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
** http://www2.census.gov/programs-surveys/acs/data/pums/2014/1-Year/. 
**
** Downloaded files need to be unzipped, imported, and saved before they can be 
** accessed routinely in Stata. The following code performs this process in one 
** uninterrupted sequence for convenience and reproducibility, but only works for 
** years 2007 and onward.
**
** This could also be done manually. From the directory you saved the files to, use 
** Stata to unzip the files. Then use the menu or the commands insheet or import 
** to load the .csv data in Stata. Once loaded, save the data in Stata's .dta format 
** for easier use in the future. */

/* Notes: All Census variables are stored in upper case. The user variable "cy" is
** added to denote the calendary year in which they survey was conducted. This script
** takes about 30 minutes to run for the national file but is much quicker for individual 
** states. This was written on Stata 13.1, but should work on earlier versions. */



/*******************************************************************************
**  0. SET THE STATA ENVIRONMENT 
*******************************************************************************/
** Sets the "more" prompt off. This is useful when working with long tables that 
** display over multiple screens/pages.
set more off

** Clears the data stored in memory.
clear

/* This is a local macro that stores the initial of your state. Replace "us" with your 
** state's postal abreviation. For example, the line should say "local state ca" if you
** want data for California. Locals are Stata's way of filling in the blank later. Every 
** where below this line, the text `state' (quotations included) will be replaced with dc 
** when this do file is run. Census' server is case sensitive, so the initials must be in
** lower case. */
local state us

/* Create another local macro, this time for the years that you wish to download. If you wish 
** to download more than one year, separate years with a space (e.g. 2013 2014). */
local years /* 2007 2008 2009 2010 2011 2012 2013 */ 2014 

/* Create the directory where downloaded data will be stored. On my computer I use the 
** directory "C:/P/ACS". If you leave this local macro unchanged, this script will make 
** sure this directory exists on your computer before proceeding. Alternatively, you can 
** chance this directory to whichever path you want to store the data in, but ensure the 
** directory exists before running this file. */

local datadir "C:/P/ACS"

if "`datadir'" == "C:/P/ACS" {
    cap mkdir "C:/P"                                                            //    Execute a command to make a directory "P".
    cd "C:/P"
    cap confirm new file "C:/P/ACS"                                             //    Check if "ACS" directory exists.
    if !_rc {                                                                   //    If it doesn't exist then
        mkdir "C:/P/ACS"                                                        //    execute a command to make a directory "ACS".
    }
}

** Create another local that forces redownloading of the household data even if it already exists.
local overwrite_h 0

** Create another local that forces redownloading of the population data even if it already exists.
local overwrite_p 0



/*******************************************************************************
**     1. DOWNLOAD DATA
*******************************************************************************/

** Change the current directory to the data directory.
cd `datadir'
  
////////////////////////////////////////////////////////////////////////////////
////  Download, Convert, and Save Household File Data
////////////////////////////////////////////////////////////////////////////////
foreach calyear in `years' {
    local year: di %02.0f `calyear' - 2000
    
    quietly cd "`datadir'"
    cap confirm new file "`datadir'/`calyear'"
    if !_rc {
        mkdir "`datadir'/`calyear'"
    }
    quietly cd "`datadir'/`calyear'"
    
    capture confirm new file "`datadir'/`calyear'/`calyear'h`state'.dta"        // Always include extension when confirming a file.

    if !_rc | "`overwrite_h'" == "1" {
        display as result "Downloading data for `calyear'h`state'.dta."
        capture copy "http://www2.census.gov/programs-surveys/acs/data/pums/`calyear'/1-Year/csv_h`state'.zip" "`year'csv_h`state'.zip"
        unzipfile "`year'csv_h`state'.zip", replace

        if "`state'"=="us" {
            local state usa
        }
        capture import delimited "ss`year'h`state'.csv", delimiter(comma) varnames(1) case(upper) clear               
        if _rc==199 {
            insheet using "ss`year'h`state'.csv", case comma clear
        }        
        else if _rc {
            error _rc
            exit
        }
        rm "ss`year'h`state'.csv"
        
        quietly destring _all, replace
        compress
           generate int cy = `calyear'
        **sort cy SERIALNO                                                      // #REMOVED: 8/26/16 to preserve original sort order
        
        label data "`calyear' ACS 1-yr housing file created on `c(current_date)'"
        save "`calyear'h`state'.dta", replace
        
        if "`state'"=="usa"    {
            local state usb
            capture import delimited "ss`year'h`state'.csv", delimiter(comma) varnames(1) case(upper) clear               
            if _rc==199 {
                insheet using "ss`year'h`state'.csv", case comma clear
                rename *, upper
            }
            else if _rc {
                error _rc
                exit
            }
            rm "ss`year'h`state'.csv"
            
            quietly destring _all, replace
            compress
            generate int cy = `calyear'
            
            local state usa
            append using "`calyear'h`state'.dta"
            **sort cy SERIALNO
            rm "`calyear'h`state'.dta"

            local state us
            label data "`calyear' ACS 1-yr housing file created on `c(current_date)'"
            save "`calyear'h`state'", replace
        }
    }    
        
    else if _rc {
        display as result "`calyear'h`state'.dta already exists and was not downloaded."
    }    
}


////////////////////////////////////////////////////////////////////////////////
////  Download, Convert, and Save Person File Data
////////////////////////////////////////////////////////////////////////////////
foreach calyear in `years' {
    local year: di %02.0f `calyear' - 2000
    
    quietly cd "`datadir'"
    cap confirm new file "`datadir'/`calyear'"
    if !_rc {
        mkdir "`calyear'"
    }
    quietly cd "`datadir'/`calyear'"

    capture confirm new file "`datadir'/`calyear'/`calyear'p`state'.dta"
    
    if !_rc | "`overwrite_p'" == "1" {
        display as result "Downloading data for `calyear'p`state'.dta."
        
        capture copy "http://www2.census.gov/programs-surveys/acs/data/pums/`calyear'/1-Year/csv_p`state'.zip" "`year'csv_p`state'.zip"
        unzipfile "`year'csv_p`state'.zip", replace

        if "`state'"=="us" {
            local state usa
        }
        capture import delimited "ss`year'p`state'.csv", delimiter(comma) varnames(1) case(upper) clear               
        if _rc==199 {
            insheet using "ss`year'p`state'.csv", case comma clear
        }
        else if _rc {
            error _rc
            exit
        }
        rm "ss`year'p`state'.csv"
        
        quietly destring _all, replace
        compress
           generate int cy = `calyear'
        **sort cy SERIALNO SPORDER                                              
        
        label data "`calyear' ACS 1-yr person file created on `c(current_date)'"
        save "`calyear'p`state'.dta", replace
        
        if "`state'"=="usa"    {
            local state usb
            capture import delimited "ss`year'p`state'.csv", delimiter(comma) varnames(1) case(upper) clear               
            if _rc==199 {
                insheet using "ss`year'p`state'.csv", case comma clear
                rename *, upper
            }
            else if _rc {
                error _rc
                exit
            }
            rm "ss`year'p`state'.csv"
            
            quietly destring _all, replace
            compress
            generate int cy = `calyear'
            
            local state usa
            append using "`calyear'p`state'.dta"
            **sort cy SERIALNO SPORDER
            rm "`calyear'p`state'.dta"
            
            local state us
            label data "`calyear' ACS 1-yr person file created on `c(current_date)'"
            save "`calyear'p`state'", replace
        }
    }
  
    else if _rc {
        display as result "`calyear'p`state'.dta already exists and was not downloaded."
    }
}



/*******************************************************************************
**  END OF FILE
*******************************************************************************/