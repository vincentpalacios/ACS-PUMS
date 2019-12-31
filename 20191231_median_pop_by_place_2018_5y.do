* By: Vincent Palacios
* Date: 12/31/2019
* Description: Calculate US median populatipon by named place, including non-place residents
* Source: https://data.census.gov/cedsci/table?q=population%20total&g=0100000US.04000.001&table=B01003&tid=ACSDT5Y2018.B01003&t=Population%20Total&lastDisplayedRow=0&d=ACS%205-Year%20Estimates%20Detailed%20Tables&vintage=2018&hidePreview=true
* Source: https://data.census.gov/cedsci/table?q=population%20total&g=0100000US.160000&table=B01003&tid=ACSDT5Y2018.B01003&t=Population%20Total&lastDisplayedRow=0&d=ACS%205-Year%20Estimates%20Detailed%20Tables&vintage=2018&hidePreview=true


* Open state total population
cd ~/data/temp
import delimited "ACSDT5Y2018.B01003_data_with_overlays_2019-12-31T095948.csv", varnames(2) clear rowrange(2:54)
gen state_fips = real(substr(id, 10, 2))
rename (estimatetotal) (pop_5y_2018)
keep state_fips pop_5y_2018 
save "2018_5y_st_pop_est", replace
* Open town/city population 
import delimited "ACSDT5Y2018.B01003_data_with_overlays_2019-12-31T094940.csv", varnames(1) clear
drop in 1
destring _all, replace
gen state_fips = real(substr(geo_id, 10, 2))
save "2018_5y_st_place_pop_est", replace
* Merge in total population, derive non-town/city population
merge m:1 state_fips using "2018_5y_st_pop_est", keep(3) nogen
keep state_fips pop_5y_2018 b01003_001e geo_id name 
egen place_pop = sum(b01003_001e), by(state_fips)
gen nonplace_pop = pop_5y_2018 - place_pop 
collapse (mean) nonplace_pop, by(state_fips)
rename nonplace_pop b01003_001e
save "2018_5y_st_rural_pop_est"
* Calculate median town/city population for resident US population
use "2018_5y_st_place_pop_est"
append using "2018_5y_st_rural_pop_est"
gen wt = b01003_001e 
replace b01003_001e = 0 if geo_id == ""
sum b01003_001e [fw=b01003_001e], detail
* 2018 5y Median, place only: 60,410
sum b01003_001e [fw=wt], detail
* 2018 5y Median, place and non-place: 25,174 
 
