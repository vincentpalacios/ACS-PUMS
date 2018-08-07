# ACS-PUMS
Here one can find sample code to access American Community Survey (ACS) Public Use Microdata Samlpe (PUMS) and run simple analyses at the national and state level. The scripts are meant to be run in Stata or R, but the logic is transferable to other programs such as SAS, SPSS, and so on.
I will be populating this folder over time with new examples and requested code, so please check back in the future.

The process of analyzing ACS PUMS data generally includes the following steps:
* Check if data is available on [American Fact Finder](https://factfinder.census.gov/faces/nav/jsf/pages/searchresults.xhtml?refresh=t)

IF NOT:
* Read data dictionary to identify variables
* Identify unit of analysis: person file or household file variables needed?
* Refer to subjects file if needed for concepts 
* Retrieve/convert the data
* Read readme file to see what variables have changed in PUMS vintage
* Log results
* Load data from population or household file (or both)
* Inspect data
  * Be careful for missing values or categorical codings 
* Define new variables 
* Tabulate or summarize data
* Use weights
* Check reasonableness of estimates 
* Check sample sizes of estimates 
* Check standard errors of estimates 
* Compare estimates with other known data for external validation
* Only communicate differences in esimtates if they are statistically different from each other
* Cite data source appropriately
  * e.g. 2012-2016 ACS 5-year PUMS data

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/us/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/3.0/us/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/us/">Creative Commons Attribution-NonCommercial-ShareAlike 3.0 United States License</a>.
