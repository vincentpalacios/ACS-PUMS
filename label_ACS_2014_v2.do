/*******************************************************************************
* File name: C:\Users\palacios\OneDrive for Business\S\DEV\Utility\label_ACS_2014_v2.do
* Author(s): Cecile Murray, Vincent Palacios
* Start Date: 5/18/16
* Posted Date: 5/18/16
* Description: Labels 2014 ACS PUMS 1-yr data
* Leaves original case intact. 
*
* Inputs:
* acs_dict_2014_vp.py
*
* Outputs:
*
* Note: This was written on a PC running Windows 7
*******************************************************************************/
version 13.1

quietly ds
local varnames_orig `r(varlist)'
dis "`varnames_orig'"

capture rename _all, upper

capture label variable RT "Record Type"


capture label variable SERIALNO "Housing unit/GQ person serial number"


capture label variable DIVISION "Division code"
capture label define divisionLB ///
0 "Puerto Rico" /// 
1 "New England (Northeast region)" /// 
2 "Middle Atlantic (Northeast region)" /// 
3 "East North Central (Midwest region)" /// 
4 "West North Central (Midwest region)" /// 
5 "South Atlantic (South region)" /// 
6 "East South Central (South region)" /// 
7 "West South Central (South Region)" /// 
8 "Mountain (West region)" /// 
9 "Pacific (West region)"
capture label values DIVISION divisionLB

notes: Public use microdata areas (PUMAs) designate areas of 100,000 or more population. Use with ST for unique code.

capture label variable PUMA "Public use microdata area code (PUMA) based on 2010 Census definition"


capture label variable REGION "Region code"
capture label define regionLB ///
1 "Northeast" /// 
2 "Midwest" /// 
3 "South" /// 
4 "West" /// 
9 "Puerto Rico"
capture label values REGION regionLB


capture label variable ST "State Code"
capture label define stLB ///
01 "Alabama/AL" /// 
02 "Alaska/AK" /// 
04 "Arizona/AR" /// 
05 "Arkansas/AR" /// 
06 "California/CA" /// 
08 "Colorado/CO" /// 
09 "Connecticut/CT" /// 
10 "Delaware/DE" /// 
11 "District of Columbia/DC" /// 
12 "Florida/FL" /// 
13 "Georgia/GA" /// 
15 "Hawaii/HI" /// 
16 "Idaho/ID" /// 
17 "Illinois/IL" /// 
18 "Indiana/IN" /// 
19 "Iowa/IA" /// 
20 "Kansas/KS" /// 
21 "Kentucky/KY" /// 
22 "Louisiana/LA" /// 
23 "Maine/ME" /// 
24 "Maryland/MD" /// 
25 "Massachusetts/MA" /// 
26 "Michigan/MI" /// 
27 "Minnesota/MN" /// 
28 "Mississippi/MS" /// 
29 "Missouri/MO" /// 
30 "Montana/MT" /// 
31 "Nebraska/NE" /// 
32 "Nevada/NV" /// 
33 "New Hampshire/NH" /// 
34 "New Jersey/NJ" /// 
35 "New Mexico/NM" /// 
36 "New York/NY" /// 
37 "North Carolina/NC" /// 
38 "North Dakota/ND" /// 
39 "Ohio/OH" /// 
40 "Oklahoma/OK" /// 
41 "Oregon/OR" /// 
42 "Pennsylvania/PA" /// 
44 "Rhode Island/RI" /// 
45 "South Carolina/SC" /// 
46 "South Dakota/SD" /// 
47 "Tennessee/TN" /// 
48 "Texas/TX" /// 
49 "Utah/UT" /// 
50 "Vermont/VT" /// 
51 "Virginia/VA" /// 
53 "Washington/WA" /// 
54 "West Virginia/WV" /// 
55 "Wisconsin/WI" /// 
56 "Wyoming/WY" /// 
72 "Puerto Rico/PR"
capture label values ST stLB

notes: The value of ADJHSG inflation-adjusts reported housing costs to 2014 dollars and applies to variables CONP, ELEP, FULP, GASP, GRNTP, INSP, MHP, MRGP, SMOCP, RNTP, SMP, and WATP in the housing record. ADJHSG does not apply to AGS and TAXP because they are categorical variables that should not be inflation-adjusted. ADJHSG does not apply to VALP.

capture label variable ADJHSG "Adjustment factor for housing dollar amounts (6 implied decimal places)"

notes: The value of ADJINC inflation-adjusts reported income to 2014 dollars. ADJINC applies to variables FINCP and HINCP in the housing record, and variables INTP, OIP, PAP, PERNP, PINCP, RETP, SEMP, SSIP, SSP, and WAGP in the person record.

capture label variable ADJINC "Adjustment factor for income and earnings dollar amounts(6 implied decimal places)"


capture label variable WGTP "Housing Weight"
capture label define wgtpLB ///

capture label values WGTP wgtpLB


capture label variable NP "Number of person records following this housing record"
capture label define npLB ///

capture label values NP npLB


capture label variable TYPE "Type of unit"
capture label define typeLB ///
1 "Housing unit" /// 
2 "Institutional group quarters" /// 
3 "Noninstitutional group quarters"
capture label values TYPE typeLB


capture label variable ACCESS "Access to the Internet"
capture label define accessLB ///
1 "Yes, with subscription to an Internet service" /// 
2 "Yes, without a subscription to an Internet service" /// 
3 "No Internet access at this house, apartment, or mobile home"
capture label values ACCESS accessLB


capture label variable ACR "Lot size"
capture label define acrLB ///
1 "House on less than one acre" /// 
2 "House on one to less than ten acres" /// 
3 "House on ten or more acres"
capture label values ACR acrLB

notes: no adjustment factor is applied to AGS.

capture label variable AGS "Sales of Agriculture Products (Yearly sales)"
capture label define agsLB ///
1 "None" /// 
2 "$1 - $ 999" /// 
3 "$ 1000 - $ 2499" /// 
4 "$ 2500 - $ 4999" /// 
5 "$ 5000 - $ 9999" /// 
6 "$10000+"
capture label values AGS agsLB


capture label variable BATH "Bathtub or shower"
capture label define bathLB ///
1 "Yes" /// 
2 "No"
capture label values BATH bathLB


capture label variable BDSP "Number of bedrooms"
capture label define bdspLB ///

capture label values BDSP bdspLB


capture label variable BLD "Units in structure"
capture label define bldLB ///
01 "Mobile home or trailer" /// 
02 "One-family house detached" /// 
03 "One-family house attached" /// 
04 "2 Apartments" /// 
05 "3-4 Apartments" /// 
06 "5-9 Apartments" /// 
07 "10-19 Apartments" /// 
08 "20-49 Apartments" /// 
09 "50 or more apartments" /// 
10 "Boat, RV, van, etc."
capture label values BLD bldLB


capture label variable BROADBND "Mobile broadband plan"
capture label define broadbndLB ///
1 "Yes" /// 
2 "No"
capture label values BROADBND broadbndLB


capture label variable BUS "Business or medical office on property"
capture label define busLB ///
1 "Yes" /// 
2 "No"
capture label values BUS busLB


capture label variable COMPOTHX "Other computer equipment"
capture label define compothxLB ///
1 "Yes" /// 
2 "No"
capture label values COMPOTHX compothxLB

notes: Use ADJHSG to adjust CONP to constant dollars.

capture label variable CONP "Condo fee (monthly amount)"
capture label define conpLB ///
0000 "Not condo"
capture label values CONP conpLB


capture label variable DIALUP "Dial-up service"
capture label define dialupLB ///
1 "Yes" /// 
2 "No"
capture label values DIALUP dialupLB


capture label variable DSL "DSL service"
capture label define dslLB ///
1 "Yes" /// 
2 "No"
capture label values DSL dslLB

notes: Use ADJHSG to adjust ELEP values 3 and over to constant dollars.

capture label variable ELEP "Electricity (monthly cost)"
capture label define elepLB ///
001 "Included in rent or in condo fee" /// 
002 "No charge or electricity not used"
capture label values ELEP elepLB


capture label variable FIBEROP "Fiber-optic Internet service"
capture label define fiberopLB ///
1 "Yes" /// 
2 "No"
capture label values FIBEROP fiberopLB


capture label variable FS "Yearly food stamp/Supplemental Nutrition Assistance Program recipiency"
capture label define fsLB ///
1 "Yes" /// 
2 "No"
capture label values FS fsLB

notes: Use ADJHSG to adjust FULP values 3 and over to constant dollars.

capture label variable FULP "Fuel cost(yearly cost for fuels other than gas and electricity)"
capture label define fulpLB ///
0001 "Included in rent or in condo fee" /// 
0002 "No charge or these fuels not used"
capture label values FULP fulpLB

notes: Use ADJHSG to adjust GASP values 4 and over to constant dollars.

capture label variable GASP "Gas (monthly cost)"
capture label define gaspLB ///
001 "Included in rent or in condo fee" /// 
002 "Included in electricity payment" /// 
003 "No charge or gas not used"
capture label values GASP gaspLB


capture label variable HANDHELD "Handheld computer"
capture label define handheldLB ///
1 "Yes" /// 
2 "No"
capture label values HANDHELD handheldLB


capture label variable HFL "House heating fuel"
capture label define hflLB ///
1 "Utility gas" /// 
2 "Bottled, tank, or LP gas" /// 
3 "Electricity" /// 
4 "Fuel oil, kerosene, etc." /// 
5 "Coal or coke" /// 
6 "Wood" /// 
7 "Solar energy" /// 
8 "Other fuel" /// 
9 "No fuel used"
capture label values HFL hflLB

notes: Use ADJHSG to adjust INSP to constant dollars.

capture label variable INSP "Fire/hazard/flood insurance (yearly amount)"
capture label define inspLB ///
00000 "None"
capture label values INSP inspLB


capture label variable LAPTOP "Laptop, desktop, or notebook computer"
capture label define laptopLB ///
1 "Yes" /// 
2 "No"
capture label values LAPTOP laptopLB

notes: Use ADJHSG to adjust MHP to constant dollars.

capture label variable MHP "Mobile home costs (yearly amount)"
capture label define mhpLB ///
00000 "None"
capture label values MHP mhpLB


capture label variable MODEM "Cable Internet service"
capture label define modemLB ///
1 "Yes" /// 
2 "No"
capture label values MODEM modemLB


capture label variable MRGI "First mortgage payment includes fire/hazard/flood insurance"
capture label define mrgiLB ///
1 "Yes, insurance included in payment" /// 
2 "No, insurance paid separately or no insurance"
capture label values MRGI mrgiLB

notes: Use ADJHSG to adjust MRGP to constant dollars.

capture label variable MRGP "First mortgage payment (monthly amount)"
capture label define mrgpLB ///

capture label values MRGP mrgpLB


capture label variable MRGT "First mortgage payment includes real estate taxes"
capture label define mrgtLB ///
1 "Yes, taxes included in payment" /// 
2 "No, taxes paid separately or taxes not required"
capture label values MRGT mrgtLB


capture label variable MRGX "First mortgage status"
capture label define mrgxLB ///
1 "Mortgage, deed of trust, or similar debt" /// 
2 "Contract to purchase" /// 
3 "None"
capture label values MRGX mrgxLB


capture label variable OTHSVCEX "Other Internet service"
capture label define othsvcexLB ///
1 "Yes" /// 
2 "No"
capture label values OTHSVCEX othsvcexLB


capture label variable REFR "Refrigerator"
capture label define refrLB ///
1 "Yes" /// 
2 "No"
capture label values REFR refrLB


capture label variable RMSP "Number of Rooms"
capture label define rmspLB ///

capture label values RMSP rmspLB


capture label variable RNTM "Meals included in rent"
capture label define rntmLB ///
1 "Yes" /// 
2 "No"
capture label values RNTM rntmLB

notes: Use ADJHSG to adjust RNTP to constant dollars.

capture label variable RNTP "Monthly rent"
capture label define rntpLB ///

capture label values RNTP rntpLB


capture label variable RWAT "Hot and cold running water"
capture label define rwatLB ///
1 "Yes" /// 
2 "No" /// 
9 "Case is from Puerto Rico, RWAT not applicable"
capture label values RWAT rwatLB


capture label variable RWATPR "Running water"
capture label define rwatprLB ///
1 "Yes" /// 
2 "No" /// 
9 "Case is from the United States, RWATPR not applicable"
capture label values RWATPR rwatprLB


capture label variable SATELLITE "Satellite Internet service"
capture label define satelliteLB ///
1 "Yes" /// 
2 "No"
capture label values SATELLITE satelliteLB


capture label variable SINK "Sink with a faucet"
capture label define sinkLB ///
1 "Yes" /// 
2 "No"
capture label values SINK sinkLB

notes: Use ADJHSG to adjust SMP to constant dollars.

capture label variable SMP "Total payment on all second and junior mortgages and home equity loans"
capture label define smpLB ///

capture label values SMP smpLB


capture label variable STOV "Stove or range"
capture label define stovLB ///
1 "Yes" /// 
2 "No"
capture label values STOV stovLB


capture label variable TEL "Telephone"
capture label define telLB ///
1 "Yes" /// 
2 "No"
capture label values TEL telLB


capture label variable TEN "Tenure"
capture label define tenLB ///
1 "Owned with mortgage or loan (include home equity loans)" /// 
2 "Owned free and clear" /// 
3 "Rented" /// 
4 "Occupied without payment of rent"
capture label values TEN tenLB


capture label variable TOIL "Flush toilet"
capture label define toilLB ///
1 "Yes" /// 
2 "No"
capture label values TOIL toilLB


capture label variable VACS "Vacancy status"
capture label define vacsLB ///
1 "For rent" /// 
2 "Rented, not occupied" /// 
3 "For sale only" /// 
4 "Sold, not occupied" /// 
5 "For seasonal/recreational/occasional use" /// 
6 "For migrant workers" /// 
7 "Other vacant"
capture label values VACS vacsLB


capture label variable VALP "Property value"
capture label define valpLB ///

capture label values VALP valpLB


capture label variable VEH "Vehicles (1 ton or less) available"
capture label define vehLB ///
0 "No vehicles" /// 
1 "1 vehicle" /// 
2 "2 vehicles" /// 
3 "3 vehicles" /// 
4 "4 vehicles" /// 
5 "5 vehicles" /// 
6 "6 or more vehicles"
capture label values VEH vehLB

notes: Use ADJHSG to adjust WATP values 3 and over to constant dollars.

capture label variable WATP "Water (yearly cost)"
capture label define watpLB ///
0001 "Included in rent or in condo fee" /// 
0002 "No charge"
capture label values WATP watpLB


capture label variable YBL "When structure first built"
capture label define yblLB ///
01 "1939 or earlier" /// 
02 "1940 to 1949" /// 
03 "1950 to 1959" /// 
04 "1960 to 1969" /// 
05 "1970 to 1979" /// 
06 "1980 to 1989" /// 
07 "1990 to 1999" /// 
08 "2000 to 2004" /// 
09 "2005" /// 
10 "2006" /// 
11 "2007" /// 
12 "2008" /// 
13 "2009" /// 
14 "2010" /// 
15 "2011" /// 
16 "2012" /// 
17 "2013" /// 
18 "2014"
capture label values YBL yblLB


capture label variable FES "Family type and employment status"
capture label define fesLB ///
1 "Married-couple family: Husband and wife in LF" /// 
2 "Married-couple family: Husband in labor force, wife.not in LF" /// 
3 "Married-couple family: Husband not in LF,wife in LF" /// 
4 "Married-couple family: Neither husband nor wife in LF" /// 
5 "Other family: Male householder, no wife present, in LF" /// 
6 "Other family: Male householder, no wife present, not in LF" /// 
7 "Other family: Female householder, no husband present, in LF" /// 
8 "Other family: Female householder, no husband present, not in LF"
capture label values FES fesLB

notes: Use ADJINC to adjust FINCP to constant dollars.

capture label variable FINCP "Family income (past 12 months)"
capture label define fincpLB ///
000000000 "No family income" /// 
-00059999 "Loss of -$59,999 or more" /// 
000000001 "$1 or Break even"
capture label values FINCP fincpLB


capture label variable FPARC "Family presence and age of related children"
capture label define fparcLB ///
1 "With related children under 5 years only" /// 
2 "With related children 5 to 17 years only" /// 
3 "With related children under 5 years and 5 to 17 years" /// 
4 "No related children"
capture label values FPARC fparcLB

notes: Use ADJHSG to adjust GRNTP to constant dollars.

capture label variable GRNTP "Gross rent (monthly amount)"
capture label define grntpLB ///

capture label values GRNTP grntpLB


capture label variable GRPIP "Gross rent as a percentage of household income past 12 months"
capture label define grpipLB ///
101 "101% or more"
capture label values GRPIP grpipLB


capture label variable HHL "Household language"
capture label define hhlLB ///
1 "English only" /// 
2 "Spanish" /// 
3 "Other Indo-European languages" /// 
4 "Asian and Pacific Island languages" /// 
5 "Other language"
capture label values HHL hhlLB


capture label variable HHT "Household/family type"
capture label define hhtLB ///
1 "Married couple household" /// 
2 "Other family household:Male householder, no wife present" /// 
3 "Other family household:Female householder, no husband present" /// 
4 "Nonfamily household:Male householder:Living alone" /// 
5 "Nonfamily household:Male householder:Not living alone" /// 
6 "Nonfamily household:Female householder:Living alone" /// 
7 "Nonfamily household:Female householder:Not living alone"
capture label values HHT hhtLB

notes: Use ADJINC to adjust HINCP to constant dollars.

capture label variable HINCP "Household income (past 12 months)"
capture label define hincpLB ///
000000000 "No household income" /// 
-00059999 "Loss of -$59,999 or more" /// 
000000001 "$1 or Break even"
capture label values HINCP hincpLB


capture label variable HOTWAT "Water heater (Puerto Rico only)"
capture label define hotwatLB ///
1 "Yes" /// 
2 "No" /// 
9 "Case is from the United States, HOTWAT not applicable"
capture label values HOTWAT hotwatLB


capture label variable HUGCL "Household with grandparent living with grandchildren"
capture label define hugclLB ///
0 "Household without grandparent living with grandchildren" /// 
1 "Household with grandparent living with grandchildren"
capture label values HUGCL hugclLB


capture label variable HUPAC "HH presence and age of children"
capture label define hupacLB ///
1 "With children under 6 years only" /// 
2 "With children 6 to 17 years only" /// 
3 "With children under 6 years and 6 to 17 years" /// 
4 "No children"
capture label values HUPAC hupacLB


capture label variable HUPAOC "HH presence and age of own children"
capture label define hupaocLB ///
1 "Presence of own children under 6 years only" /// 
2 "Presence of own children 6 to 17 years only" /// 
3 "Presence of own children under 6 years and 6 to 17 years" /// 
4 "No own children present"
capture label values HUPAOC hupaocLB


capture label variable HUPARC "HH presence and age of related children"
capture label define huparcLB ///
1 "Presence of related children under 6 years only" /// 
2 "Presence of related children 6 to 17 years only" /// 
3 "Presence of related children under 6 years and 6 to 17 years" /// 
4 "No related children present"
capture label values HUPARC huparcLB


capture label variable KIT "Complete kitchen facilities"
capture label define kitLB ///
1 "Yes, has stove or range, refrigerator, and sink with a faucet" /// 
2 "No"
capture label values KIT kitLB


capture label variable LNGI "Limited English speaking household"
capture label define lngiLB ///
1 "At least one person in the household 14 and over speaks English only or speaks English 'very well'" /// 
2 "No one in the household 14 and over speaks English only or speaks English 'very well'"
capture label values LNGI lngiLB


capture label variable MULTG "Multigenerational Household"
capture label define multgLB ///
1 "No, not a multigenerational household" /// 
2 "Yes, is a multigenerational household"
capture label values MULTG multgLB


capture label variable MV "When moved into this house or apartment"
capture label define mvLB ///
1 "12 months or less" /// 
2 "13 to 23 months" /// 
3 "2 to 4 years" /// 
4 "5 to 9 years" /// 
5 "10 to 19 years" /// 
6 "20 to 29 years" /// 
7 "30 years or more"
capture label values MV mvLB


capture label variable NOC "Number of own children in household (unweighted)"
capture label define nocLB ///
00 "No own children"
capture label values NOC nocLB


capture label variable NPF "Number of persons in family (unweighted)"
capture label define npfLB ///

capture label values NPF npfLB


capture label variable NPP "Grandparent headed household with no parent present"
capture label define nppLB ///
0 "Not a grandparent headed household with no parent present" /// 
1 "Grandparent headed household with no parent present"
capture label values NPP nppLB


capture label variable NR "Presence of nonrelative in household"
capture label define nrLB ///
0 "None" /// 
1 "1 or more nonrelatives"
capture label values NR nrLB


capture label variable NRC "Number of related children in household (unweighted)"
capture label define nrcLB ///
00 "No related children"
capture label values NRC nrcLB


capture label variable OCPIP "Selected monthly owner costs as a percentage of household"
capture label define ocpipLB ///

capture label values OCPIP ocpipLB


capture label variable PARTNER "Unmarried partner household"
capture label define partnerLB ///
0 "No unmarried partner in household" /// 
1 "Male householder, male partner" /// 
2 "Male householder, female partner" /// 
3 "Female householder, female partner" /// 
4 "Female householder, male partner"
capture label values PARTNER partnerLB


capture label variable PLM "Complete plumbing facilities"
capture label define plmLB ///
1 "Yes, has hot and cold running water, a flush toilet, and a bathtub or shower" /// 
2 "No" /// 
9 "Case is from Puerto Rico, PLM recode not applicable"
capture label values PLM plmLB


capture label variable PLMPRP "Complete plumbing facilities for Puerto Rico"
capture label define plmprpLB ///
1 "Yes, has running water, a flush toilet, and a bathtub orshower " /// 
2 "No" /// 
9 "Case is from the United States, PLMPRP not applicable"
capture label values PLMPRP plmprpLB


capture label variable PSF "Presence of subfamilies in Household"
capture label define psfLB ///
0 "No subfamilies" /// 
1 "1 or more subfamilies"
capture label values PSF psfLB


capture label variable R18 "Presence of persons under 18 years in household (unweighted)"
capture label define r18LB ///
0 "No person under 18 in household" /// 
1 "1 or more persons under 18 in household"
capture label values R18 r18LB


capture label variable R60 "Presence of persons 60 years and over in household (unweighted)"
capture label define r60LB ///
0 "No person 60 and over" /// 
1 "1 person 60 and over" /// 
2 "2 or more persons 60 and over"
capture label values R60 r60LB


capture label variable R65 "Presence of persons 65 years and over in household (unweighted)"
capture label define r65LB ///
0 "No person 65 and over" /// 
1 "1 person 65 and over" /// 
2 "2 or more persons 65 and over"
capture label values R65 r65LB


capture label variable RESMODE "Response mode"
capture label define resmodeLB ///
1 "Mail" /// 
2 "CATI/CAPI" /// 
3 "Internet"
capture label values RESMODE resmodeLB

notes: Use ADJHSG to adjust SMOCP to constant dollars.

capture label variable SMOCP "Selected monthly owner costs"
capture label define smocpLB ///

capture label values SMOCP smocpLB


capture label variable SMX "Second or junior mortgage or home equity loan status"
capture label define smxLB ///
1 "Yes, a second mortgage" /// 
2 "Yes, a home equity loan" /// 
3 "No" /// 
4 "Both a second mortgage and a home equity loan"
capture label values SMX smxLB


capture label variable SRNT "Specified rent unit"
capture label define srntLB ///
0 "Not specified rent unit" /// 
1 "Specified rent unit"
capture label values SRNT srntLB


capture label variable SSMC "Same-sex married couple households"
capture label define ssmcLB ///
0 "Households without a same-sex married couple" /// 
1 "Same-sex married-couple household where not all relevant data shown as reported" /// 
2 "All other same-sex married-couple households"
capture label values SSMC ssmcLB


capture label variable SVAL "Specified value owner unit"
capture label define svalLB ///
0 "Not specified value owner unit" /// 
1 "Specified value owner unit"
capture label values SVAL svalLB

notes: No adjustment factor is applied to TAXP.

capture label variable TAXP "Property taxes (yearly amount)"
capture label define taxpLB ///
01 "None" /// 
02 "$ 1 - $ 49" /// 
03 "$ 50 - $ 99" /// 
04 "$ 100 - $ 149" /// 
05 "$ 150 - $ 199" /// 
06 "$ 200 - $ 249" /// 
07 "$ 250 - $ 299" /// 
08 "$ 300 - $ 349" /// 
09 "$ 350 - $ 399" /// 
10 "$ 400 - $ 449" /// 
11 "$ 450 - $ 499" /// 
12 "$ 500 - $ 549" /// 
13 "$ 550 - $ 599" /// 
14 "$ 600 - $ 649" /// 
15 "$ 650 - $ 699" /// 
16 "$ 700 - $ 749" /// 
17 "$ 750 - $ 799" /// 
18 "$ 800 - $ 849" /// 
19 "$ 850 - $ 899" /// 
20 "$ 900 - $ 949" /// 
21 "$ 950 - $ 999" /// 
22 "$1000 - $1099" /// 
23 "$1100 - $1199" /// 
24 "$1200 - $1299" /// 
25 "$1300 - $1399" /// 
26 "$1400 - $1499" /// 
27 "$1500 - $1599" /// 
28 "$1600 - $1699" /// 
29 "$1700 - $1799" /// 
30 "$1800 - $1899" /// 
31 "$1900 - $1999" /// 
32 "$2000 - $2099" /// 
33 "$2100 - $2199" /// 
34 "$2200 - $2299" /// 
35 "$2300 - $2399" /// 
36 "$2400 - $2499" /// 
37 "$2500 - $2599" /// 
38 "$2600 - $2699" /// 
39 "$2700 - $2799" /// 
40 "$2800 - $2899" /// 
41 "$2900 - $2999" /// 
42 "$3000 - $3099" /// 
43 "$3100 - $3199" /// 
44 "$3200 - $3299" /// 
45 "$3300 - $3399" /// 
46 "$3400 - $3499" /// 
47 "$3500 - $3599" /// 
48 "$3600 - $3699" /// 
49 "$3700 - $3799" /// 
50 "$3800 - $3899" /// 
51 "$3900 - $3999" /// 
52 "$4000 - $4099" /// 
53 "$4100 - $4199" /// 
54 "$4200 - $4299" /// 
55 "$4300 - $4399" /// 
56 "$4400 - $4499" /// 
57 "$4500 - $4599" /// 
58 "$4600 - $4699" /// 
59 "$4700 - $4799" /// 
60 "$4800 - $4899" /// 
61 "$4900 - $4999" /// 
62 "$5000 - $5499" /// 
63 "$5500 - $5999" /// 
64 "$6000 - $6999" /// 
65 "$7000 - $7999" /// 
66 "$8000 - $8999" /// 
67 "$9000 - $9999" /// 
68 "$10000+(Top-coded)"
capture label values TAXP taxpLB


capture label variable WIF "Workers in family during the past 12 months"
capture label define wifLB ///
0 "No workers" /// 
1 "1 worker" /// 
2 "2 workers" /// 
3 "3 or more workers in family"
capture label values WIF wifLB


capture label variable WKEXREL "Work experience of householder and spouse"
capture label define wkexrelLB ///
01 "Householder and spouse worked FT" /// 
02 "Householder worked FT; spouse worked < FT" /// 
03 "Householder worked FT; spouse did not work" /// 
04 "Householder worked < FT; spouse worked FT" /// 
05 "Householder worked < FT; spouse worked < FT" /// 
06 "Householder worked < FT; spouse did not work" /// 
07 "Householder did not work; spouse worked FT" /// 
08 "Householder did not work; spouse worked < FT" /// 
09 "Householder did not work; spouse did not work" /// 
10 "Male householder worked FT; no spouse present" /// 
11 "Male householder worked < FT; no spouse present" /// 
12 "Male householder did not work; no spouse present" /// 
13 "Female householder worked FT; no spouse present" /// 
14 "Female householder worked < FT; no spouse present" /// 
15 "Female householder did not work; no spouse present"
capture label values WKEXREL wkexrelLB


capture label variable WORKSTAT "Work status of householder or spouse in family households"
capture label define workstatLB ///
01 "Husband and wife both in labor force, both employed or in Armed Forces" /// 
02 "Husband and wife both in labor force, husband employed or in Armed Forces, wife unemployed" /// 
03 "Husband in labor force and wife not in labor force, husband employed or in Armed Forces" /// 
04 "Husband and wife both in labor force, husband unemployed, wife employed or in Armed Forces" /// 
05 "Husband and wife both in labor force, husband unemployed, wife unemployed" /// 
06 "Husband in labor force, husband unemployed, wife not in labor force" /// 
07 "Husband not in labor force, wife in labor force, wife employed or in Armed Forces" /// 
08 "Husband not in labor force, wife in labor force, wife unemployed" /// 
09 "Neither husband nor wife in labor force" /// 
10 "Male householder with no wife present, householder in labor force, employed or in Armed Forces" /// 
11 "Male householder with no wife present, householder inlabor force and unemployed" /// 
12 "Male householder with no wife present, householder not in labor force" /// 
13 "Female householder with no husband present, householder in labor force, employed or in Armed Forces" /// 
14 "Female householder with no husband present, householder inlabor force and unemployed" /// 
15 "Female householder with no husband present, householder not in labor force"
capture label values WORKSTAT workstatLB


capture label variable FACCESSP "Access to the Internet allocation flag"
capture label define faccesspLB ///
0 "No" /// 
1 "Yes"
capture label values FACCESSP faccesspLB


capture label variable FACRP "Lot size allocation flag"
capture label define facrpLB ///
0 "No" /// 
1 "Yes"
capture label values FACRP facrpLB


capture label variable FAGSP "Sales of Agricultural Products allocation flag"
capture label define fagspLB ///
0 "No" /// 
1 "Yes"
capture label values FAGSP fagspLB


capture label variable FBATHP "Bathtub or shower allocation flag"
capture label define fbathpLB ///
0 "No" /// 
1 "Yes"
capture label values FBATHP fbathpLB


capture label variable FBDSP "Number of bedrooms allocation flag"
capture label define fbdspLB ///
0 "No" /// 
1 "Yes"
capture label values FBDSP fbdspLB


capture label variable FBLDP "Units in structure allocation flag"
capture label define fbldpLB ///
0 "No" /// 
1 "Yes"
capture label values FBLDP fbldpLB


capture label variable FBROADBNDP "Mobile broadband plan allocation flag"
capture label define fbroadbndpLB ///
0 "No" /// 
1 "Yes"
capture label values FBROADBNDP fbroadbndpLB


capture label variable FBUSP "Business or medical office on property allocation flag"
capture label define fbuspLB ///
0 "No" /// 
1 "Yes"
capture label values FBUSP fbuspLB


capture label variable FCOMPOTHXP "Other computer equipment allocation flag"
capture label define fcompothxpLB ///
0 "No" /// 
1 "Yes"
capture label values FCOMPOTHXP fcompothxpLB


capture label variable FCONP "Condominium fee allocation flag"
capture label define fconpLB ///
0 "No" /// 
1 "Yes"
capture label values FCONP fconpLB


capture label variable FDIALUPP "Dial-up service allocation flag"
capture label define fdialuppLB ///
0 "No" /// 
1 "Yes"
capture label values FDIALUPP fdialuppLB


capture label variable FDSLP "DSL service allocation flag"
capture label define fdslpLB ///
0 "No" /// 
1 "Yes"
capture label values FDSLP fdslpLB


capture label variable FELEP "Electricity (monthly cost) allocation flag"
capture label define felepLB ///
0 "No" /// 
1 "Yes"
capture label values FELEP felepLB


capture label variable FFIBEROPP "Fiber-optic Internet service allocation flag"
capture label define ffiberoppLB ///
0 "No" /// 
1 "Yes"
capture label values FFIBEROPP ffiberoppLB


capture label variable FFINCP "Family income (past 12 months) allocation flag"
capture label define ffincpLB ///
0 "No" /// 
1 "Yes"
capture label values FFINCP ffincpLB


capture label variable FFSP "Yearly food stamp/Supplemental Nutrition Assistance Program"
capture label define ffspLB ///
0 "No" /// 
1 "Yes"
capture label values FFSP ffspLB


capture label variable FFULP "Fuel cost (yearly cost for fuels other than gas and electricity)"
capture label define ffulpLB ///
0 "No" /// 
1 "Yes"
capture label values FFULP ffulpLB


capture label variable FGASP "Gas (monthly cost) allocation flag"
capture label define fgaspLB ///
0 "No" /// 
1 "Yes"
capture label values FGASP fgaspLB


capture label variable FGRNTP "Gross rent (monthly amount) allocation flag"
capture label define fgrntpLB ///
0 "No" /// 
1 "Yes"
capture label values FGRNTP fgrntpLB


capture label variable FHANDHELDP "Handheld computer allocation flag"
capture label define fhandheldpLB ///
0 "No" /// 
1 "Yes"
capture label values FHANDHELDP fhandheldpLB


capture label variable FHFLP "House heating fuel allocation flag"
capture label define fhflpLB ///
0 "No" /// 
1 "Yes"
capture label values FHFLP fhflpLB


capture label variable FHINCP "Household income (past 12 months) allocation flag"
capture label define fhincpLB ///
0 "No" /// 
1 "Yes"
capture label values FHINCP fhincpLB


capture label variable FHOTWATP "Water heater allocation flag (Puerto Rico only)"
capture label define fhotwatpLB ///
0 "No" /// 
1 "Yes"
capture label values FHOTWATP fhotwatpLB


capture label variable FINSP "Fire, hazard, flood insurance (yearly amount) allocation flag"
capture label define finspLB ///
0 "No" /// 
1 "Yes"
capture label values FINSP finspLB


capture label variable FKITP "Complete kitchen facilities allocation flag"
capture label define fkitpLB ///
0 "No" /// 
1 "Yes"
capture label values FKITP fkitpLB


capture label variable FLAPTOPP "Laptop, desktop, or notebook computer allocation flag"
capture label define flaptoppLB ///
0 "No" /// 
1 "Yes"
capture label values FLAPTOPP flaptoppLB


capture label variable FMHP "Mobile home costs (yearly amount) allocation flag"
capture label define fmhpLB ///
0 "No" /// 
1 "Yes"
capture label values FMHP fmhpLB


capture label variable FMODEMP "Cable Internet service allocation flag"
capture label define fmodempLB ///
0 "No" /// 
1 "Yes"
capture label values FMODEMP fmodempLB


capture label variable FMRGIP "First mortgage payment includes fire, hazard, flood insurance"
capture label define fmrgipLB ///
0 "No" /// 
1 "Yes"
capture label values FMRGIP fmrgipLB


capture label variable FMRGP "First mortgage payment (monthly amount) allocation flag"
capture label define fmrgpLB ///
0 "No" /// 
1 "Yes"
capture label values FMRGP fmrgpLB


capture label variable FMRGTP "First mortgage payment includes real estate taxes allocation flag"
capture label define fmrgtpLB ///
0 "No" /// 
1 "Yes"
capture label values FMRGTP fmrgtpLB


capture label variable FMRGXP "First mortgage status allocation flag"
capture label define fmrgxpLB ///
0 "No" /// 
1 "Yes"
capture label values FMRGXP fmrgxpLB


capture label variable FMVP "When moved into this house or apartment allocation flag"
capture label define fmvpLB ///
0 "No" /// 
1 "Yes"
capture label values FMVP fmvpLB


capture label variable FOTHSVCEXP "Other Internet service allocation flag"
capture label define fothsvcexpLB ///
0 "No" /// 
1 "Yes"
capture label values FOTHSVCEXP fothsvcexpLB


capture label variable FPLMP "Complete plumbing facilities allocation flag"
capture label define fplmpLB ///
0 "No" /// 
1 "Yes"
capture label values FPLMP fplmpLB


capture label variable FPLMPRP "Complete plumbing facilities allocation flag for Puerto Rico"
capture label define fplmprpLB ///
0 "No" /// 
1 "Yes"
capture label values FPLMPRP fplmprpLB


capture label variable FREFRP "Refrigerator allocation flag"
capture label define frefrpLB ///
0 "No" /// 
1 "Yes"
capture label values FREFRP frefrpLB


capture label variable FRMSP "Number of rooms allocation flag"
capture label define frmspLB ///
0 "No" /// 
1 "Yes"
capture label values FRMSP frmspLB


capture label variable FRNTMP "Meals included in rent allocation flag"
capture label define frntmpLB ///
0 "No" /// 
1 "Yes"
capture label values FRNTMP frntmpLB


capture label variable FRNTP "Monthly rent allocation flag"
capture label define frntpLB ///
0 "No" /// 
1 "Yes"
capture label values FRNTP frntpLB


capture label variable FRWATP "Hot and cold running water allocation flag"
capture label define frwatpLB ///
0 "No" /// 
1 "Yes"
capture label values FRWATP frwatpLB


capture label variable FRWATPRP "Running water allocation flag"
capture label define frwatprpLB ///
0 "No" /// 
1 "Yes"
capture label values FRWATPRP frwatprpLB


capture label variable FSATELLITEP "Satellite Internet service allocation flag"
capture label define fsatellitepLB ///
0 "No" /// 
1 "Yes"
capture label values FSATELLITEP fsatellitepLB


capture label variable FSINKP "Sink with a faucet allocation flag"
capture label define fsinkpLB ///
0 "No" /// 
1 "Yes"
capture label values FSINKP fsinkpLB


capture label variable FSMOCP "Selected monthly owner cost allocation flag"
capture label define fsmocpLB ///
0 "No" /// 
1 "Yes"
capture label values FSMOCP fsmocpLB


capture label variable FSMP "Total payment on second and junior mortgages and home equity loans"
capture label define fsmpLB ///
0 "No" /// 
1 "Yes"
capture label values FSMP fsmpLB


capture label variable FSMXHP "Home equity loan status allocation flag"
capture label define fsmxhpLB ///
0 "No" /// 
1 "Yes"
capture label values FSMXHP fsmxhpLB


capture label variable FSMXSP "Second mortgage status allocation flag"
capture label define fsmxspLB ///
0 "No" /// 
1 "Yes"
capture label values FSMXSP fsmxspLB


capture label variable FSTOVP "Stove or range allocation flag"
capture label define fstovpLB ///
0 "No" /// 
1 "Yes"
capture label values FSTOVP fstovpLB


capture label variable FTAXP "Property taxes (yearly amount) allocation flag"
capture label define ftaxpLB ///
0 "No" /// 
1 "Yes"
capture label values FTAXP ftaxpLB


capture label variable FTELP "Telephone allocation flag"
capture label define ftelpLB ///
0 "No" /// 
1 "Yes"
capture label values FTELP ftelpLB


capture label variable FTENP "Tenure allocation flag"
capture label define ftenpLB ///
0 "No" /// 
1 "Yes"
capture label values FTENP ftenpLB


capture label variable FTOILP "Flush toilet allocation flag"
capture label define ftoilpLB ///
0 "No" /// 
1 "Yes"
capture label values FTOILP ftoilpLB


capture label variable FVACSP "Vacancy status allocation flag"
capture label define fvacspLB ///
0 "No" /// 
1 "Yes"
capture label values FVACSP fvacspLB


capture label variable FVALP "Property value allocation flag"
capture label define fvalpLB ///
0 "No" /// 
1 "Yes"
capture label values FVALP fvalpLB


capture label variable FVEHP "Vehicles available allocation flag"
capture label define fvehpLB ///
0 "No" /// 
1 "Yes"
capture label values FVEHP fvehpLB


capture label variable FWATP "Water (yearly cost) allocation flag"
capture label define fwatpLB ///
0 "No" /// 
1 "Yes"
capture label values FWATP fwatpLB


capture label variable FYBLP "When structure first built allocation flag"
capture label define fyblpLB ///
0 "No" /// 
1 "Yes"
capture label values FYBLP fyblpLB


capture label variable WGTP1 "Housing Weight replicate 1"


capture label variable WGTP2 "Housing Weight replicate 2"


capture label variable WGTP3 "Housing Weight replicate 3"


capture label variable WGTP4 "Housing Weight replicate 4"


capture label variable WGTP5 "Housing Weight replicate 5"


capture label variable WGTP6 "Housing Weight replicate 6"


capture label variable WGTP7 "Housing Weight replicate 7"


capture label variable WGTP8 "Housing Weight replicate 8"


capture label variable WGTP9 "Housing Weight replicate 9"


capture label variable WGTP10 "Housing Weight replicate 10"


capture label variable WGTP11 "Housing Weight replicate 11"


capture label variable WGTP12 "Housing Weight replicate 12"


capture label variable WGTP13 "Housing Weight replicate 13"


capture label variable WGTP14 "Housing Weight replicate 14"


capture label variable WGTP15 "Housing Weight replicate 15"


capture label variable WGTP16 "Housing Weight replicate 16"


capture label variable WGTP17 "Housing Weight replicate 17"


capture label variable WGTP18 "Housing Weight replicate 18"


capture label variable WGTP19 "Housing Weight replicate 19"


capture label variable WGTP20 "Housing Weight replicate 20"


capture label variable WGTP21 "Housing Weight replicate 21"


capture label variable WGTP22 "Housing Weight replicate 22"


capture label variable WGTP23 "Housing Weight replicate 23"


capture label variable WGTP24 "Housing Weight replicate 24"


capture label variable WGTP25 "Housing Weight replicate 25"


capture label variable WGTP26 "Housing Weight replicate 26"


capture label variable WGTP27 "Housing Weight replicate 27"


capture label variable WGTP28 "Housing Weight replicate 28"


capture label variable WGTP29 "Housing Weight replicate 29"


capture label variable WGTP30 "Housing Weight replicate 30"


capture label variable WGTP31 "Housing Weight replicate 31"


capture label variable WGTP32 "Housing Weight replicate 32"


capture label variable WGTP33 "Housing Weight replicate 33"


capture label variable WGTP34 "Housing Weight replicate 34"


capture label variable WGTP35 "Housing Weight replicate 35"


capture label variable WGTP36 "Housing Weight replicate 36"


capture label variable WGTP37 "Housing Weight replicate 37"


capture label variable WGTP38 "Housing Weight replicate 38"


capture label variable WGTP39 "Housing Weight replicate 39"


capture label variable WGTP40 "Housing Weight replicate 40"


capture label variable WGTP41 "Housing Weight replicate 41"


capture label variable WGTP42 "Housing Weight replicate 42"


capture label variable WGTP43 "Housing Weight replicate 43"


capture label variable WGTP44 "Housing Weight replicate 44"


capture label variable WGTP45 "Housing Weight replicate 45"


capture label variable WGTP46 "Housing Weight replicate 46"


capture label variable WGTP47 "Housing Weight replicate 47"


capture label variable WGTP48 "Housing Weight replicate 48"


capture label variable WGTP49 "Housing Weight replicate 49"


capture label variable WGTP50 "Housing Weight replicate 50"


capture label variable WGTP51 "Housing Weight replicate 51"


capture label variable WGTP52 "Housing Weight replicate 52"


capture label variable WGTP53 "Housing Weight replicate 53"


capture label variable WGTP54 "Housing Weight replicate 54"


capture label variable WGTP55 "Housing Weight replicate 55"


capture label variable WGTP56 "Housing Weight replicate 56"


capture label variable WGTP57 "Housing Weight replicate 57"


capture label variable WGTP58 "Housing Weight replicate 58"


capture label variable WGTP59 "Housing Weight replicate 59"


capture label variable WGTP60 "Housing Weight replicate 60"


capture label variable WGTP61 "Housing Weight replicate 61"


capture label variable WGTP62 "Housing Weight replicate 62"


capture label variable WGTP63 "Housing Weight replicate 63"


capture label variable WGTP64 "Housing Weight replicate 64"


capture label variable WGTP65 "Housing Weight replicate 65"


capture label variable WGTP66 "Housing Weight replicate 66"


capture label variable WGTP67 "Housing Weight replicate 67"


capture label variable WGTP68 "Housing Weight replicate 68"


capture label variable WGTP69 "Housing Weight replicate 69"


capture label variable WGTP70 "Housing Weight replicate 70"


capture label variable WGTP71 "Housing Weight replicate 71"


capture label variable WGTP72 "Housing Weight replicate 72"


capture label variable WGTP73 "Housing Weight replicate 73"


capture label variable WGTP74 "Housing Weight replicate 74"


capture label variable WGTP75 "Housing Weight replicate 75"


capture label variable WGTP76 "Housing Weight replicate 76"


capture label variable WGTP77 "Housing Weight replicate 77"


capture label variable WGTP78 "Housing Weight replicate 78"


capture label variable WGTP79 "Housing Weight replicate 79"


capture label variable WGTP80 "Housing Weight replicate 80"


capture label variable RT "Record Type"


capture label variable SERIALNO "Housing unit/GQ person serial number"


capture label variable SPORDER "Person number"

notes: Public use microdata areas (PUMAs) designate areas of 100,000 or more population. Use with ST for unique code.

capture label variable PUMA "Public use microdata area code (PUMA) based on 2010 Census definition"


capture label variable ST "State Code"
capture label define stLB ///
01 "Alabama/AL" /// 
02 "Alaska/AK" /// 
04 "Arizona/AZ" /// 
05 "Arkansas/AR" /// 
06 "California/CA" /// 
08 "Colorado/CO" /// 
09 "Connecticut/CT" /// 
10 "Delaware/DE" /// 
11 "District of Columbia/DC" /// 
12 "Florida/FL" /// 
13 "Georgia/GA" /// 
15 "Hawaii/HI" /// 
16 "Idaho/ID" /// 
17 "Illinois/IL" /// 
18 "Indiana/IN" /// 
19 "Iowa/IA" /// 
20 "Kansas/KS" /// 
21 "Kentucky/KY" /// 
22 "Louisiana/LA" /// 
23 "Maine/ME" /// 
24 "Maryland/MD" /// 
25 "Massachusetts/MA" /// 
26 "Michigan/MI" /// 
27 "Minnesota/MN" /// 
28 "Mississippi/MS" /// 
29 "Missouri/MO" /// 
30 "Montana/MT" /// 
31 "Nebraska/NE" /// 
32 "Nevada/NV" /// 
33 "New Hampshire/NH" /// 
34 "New Jersey/NJ" /// 
35 "New Mexico/NM" /// 
36 "New York/NY" /// 
37 "North Carolina/NC" /// 
38 "North Dakota/ND" /// 
39 "Ohio/OH" /// 
40 "Oklahoma/OK" /// 
41 "Oregon/OR" /// 
42 "Pennsylvania/PA" /// 
44 "Rhode Island/RI" /// 
45 "South Carolina/SC" /// 
46 "South Dakota/SD" /// 
47 "Tennessee/TN" /// 
48 "Texas/TX" /// 
49 "Utah/UT" /// 
50 "Vermont/VT" /// 
51 "Virginia/VA" /// 
53 "Washington/WA" /// 
54 "West Virginia/WV" /// 
55 "Wisconsin/WI" /// 
56 "Wyoming/WY" /// 
72 "Puerto Rico/PR"
capture label values ST stLB

notes: The value of ADJINC inflation-adjusts reported income to 2014 dollars. ADJINC applies to variables FINCP and HINCP in the housing record, and variables INTP, OIP, PAP, PERNP, PINCP, RETP, SEMP, SSIP, SSP, and WAGP in the person record.

capture label variable ADJINC "Adjustment factor for income and earnings dollar amounts (6 implied decimal places)"


capture label variable PWGTP "Person's weight"


capture label variable AGEP "Age"
capture label define agepLB ///
00 "Under 1 year"
capture label values AGEP agepLB


capture label variable CIT "Citizenship status"
capture label define citLB ///
1 "Born in the U.S." /// 
2 "Born in Puerto Rico, Guam, the U.S. Virgin Islands, or the Northern Marianas" /// 
3 "Born abroad of American parent(s)" /// 
4 "U.S. citizen by naturalization" /// 
5 "Not a citizen of the U.S."
capture label values CIT citLB


capture label variable CITWP "Year of naturalization write-in"
capture label define citwpLB ///
1928 "1928 or earlier (Bottom-coded)" /// 
1929 "1929 – 1933" /// 
1934 "1934 – 1939" /// 
1940 "1940 - 1942" /// 
1943 "1943 - 1944" /// 
1945 "1945" /// 
1946 "1946 – 1947" /// 
1948 "1948" /// 
1949 "1949" /// 
1950 "1950" /// 
1951 "1951" /// 
1952 "1952" /// 
1953 "1953" /// 
1954 "1954" /// 
1955 "1955" /// 
1956 "1956" /// 
1957 "1957" /// 
1958 "1958" /// 
1959 "1959" /// 
1960 "1960" /// 
1961 "1961" /// 
1962 "1962" /// 
1963 "1963" /// 
1964 "1964" /// 
1965 "1965" /// 
1966 "1966" /// 
1967 "1967" /// 
1968 "1968" /// 
1969 "1969" /// 
1970 "1970" /// 
1971 "1971" /// 
1972 "1972" /// 
1973 "1973" /// 
1974 "1974" /// 
1975 "1975" /// 
1976 "1976" /// 
1977 "1977" /// 
1978 "1978" /// 
1979 "1979" /// 
1980 "1980" /// 
1981 "1981" /// 
1982 "1982" /// 
1983 "1983" /// 
1984 "1984" /// 
1985 "1985" /// 
1986 "1986" /// 
1987 "1987" /// 
1988 "1988" /// 
1989 "1989" /// 
1990 "1990" /// 
1991 "1991" /// 
1992 "1992" /// 
1993 "1993" /// 
1994 "1994" /// 
1995 "1995" /// 
1996 "1996" /// 
1997 "1997" /// 
1998 "1998" /// 
1999 "1999" /// 
2000 "2000" /// 
2001 "2001" /// 
2002 "2002" /// 
2003 "2003" /// 
2004 "2004" /// 
2005 "2005" /// 
2006 "2006" /// 
2007 "2007" /// 
2008 "2008" /// 
2009 "2009" /// 
2010 "2010" /// 
2011 "2011" /// 
2012 "2012" /// 
2013 "2013" /// 
2014 "2014"
capture label values CITWP citwpLB


capture label variable COW "Class of worker"
capture label define cowLB ///
1 "Employee of a private for-profit company or business, or of an individual, for wages, salary, or commissions" /// 
2 "Employee of a private not-for-profit, tax-exempt, or charitable organization" /// 
3 "Local government employee (city, county, etc.)" /// 
4 "State government employee" /// 
5 "Federal government employee" /// 
6 "Self-employed in own not incorporated business, professional practice, or farm" /// 
7 "Self-employed in own incorporated business, professional practice or farm" /// 
8 "Working without pay in family business or farm" /// 
9 "Unemployed and last worked 5 years ago or earlier or never worked"
capture label values COW cowLB


capture label variable DDRS "Self-care difficulty"
capture label define ddrsLB ///
1 "Yes" /// 
2 "No"
capture label values DDRS ddrsLB


capture label variable DEAR "Hearing difficulty"
capture label define dearLB ///
1 "Yes" /// 
2 "No"
capture label values DEAR dearLB


capture label variable DEYE "Vision difficulty"
capture label define deyeLB ///
1 "Yes" /// 
2 "No"
capture label values DEYE deyeLB


capture label variable DOUT "Independent living difficulty"
capture label define doutLB ///
1 "Yes" /// 
2 "No"
capture label values DOUT doutLB


capture label variable DPHY "Ambulatory difficulty"
capture label define dphyLB ///
1 "Yes" /// 
2 "No"
capture label values DPHY dphyLB


capture label variable DRAT "Veteran service connected disability rating (percentage)"
capture label define dratLB ///
1 "0 percent" /// 
2 "10 or 20 percent" /// 
3 "30 or 40 percent" /// 
4 "50 or 60 percent" /// 
5 "70, 80, 90, or 100 percent" /// 
6 "Not reported"
capture label values DRAT dratLB


capture label variable DRATX "Veteran service connected disability rating (checkbox)"
capture label define dratxLB ///
1 "Yes" /// 
2 "No"
capture label values DRATX dratxLB


capture label variable DREM "Cognitive difficulty"
capture label define dremLB ///
1 "Yes" /// 
2 "No"
capture label values DREM dremLB


capture label variable ENG "Ability to speak English"
capture label define engLB ///
1 "Very well" /// 
2 "Well" /// 
3 "Not well" /// 
4 "Not at all"
capture label values ENG engLB


capture label variable FER "Gave birth to child within the past 12 months"
capture label define ferLB ///
1 "Yes" /// 
2 "No"
capture label values FER ferLB


capture label variable GCL "Grandparents living with grandchildren"
capture label define gclLB ///
1 "Yes" /// 
2 "No"
capture label values GCL gclLB


capture label variable GCM "Length of time responsible for grandchildren"
capture label define gcmLB ///
1 "Less than 6 months" /// 
2 "6 to 11 months" /// 
3 "1 or 2 years" /// 
4 "3 or 4 years" /// 
5 "5 or more years"
capture label values GCM gcmLB


capture label variable GCR "Grandparents responsible for grandchildren"
capture label define gcrLB ///
1 "Yes" /// 
2 "No"
capture label values GCR gcrLB


capture label variable HINS1 "Insurance through a current or former employer or union"
capture label define hins1LB ///
1 "Yes" /// 
2 "No"
capture label values HINS1 hins1LB


capture label variable HINS2 "Insurance purchased directly from an insurance company"
capture label define hins2LB ///
1 "Yes" /// 
2 "No"
capture label values HINS2 hins2LB


capture label variable HINS3 "Medicare, for people 65 and older, or people with certain disabilities"
capture label define hins3LB ///
1 "Yes" /// 
2 "No"
capture label values HINS3 hins3LB


capture label variable HINS4 "Medicaid, Medical Assistance, or any kind of government-assistance plan"
capture label define hins4LB ///
1 "Yes" /// 
2 "No"
capture label values HINS4 hins4LB


capture label variable HINS5 "TRICARE or other military health care"
capture label define hins5LB ///
1 "Yes" /// 
2 "No"
capture label values HINS5 hins5LB


capture label variable HINS6 "VA (including those who have ever used or enrolled for VA health care)"
capture label define hins6LB ///
1 "Yes" /// 
2 "No"
capture label values HINS6 hins6LB


capture label variable HINS7 "Indian Health Service"
capture label define hins7LB ///
1 "Yes" /// 
2 "No"
capture label values HINS7 hins7LB

notes: Use ADJINC to adjust INTP to constant dollars.

capture label variable INTP "Interest, dividends, and net rental income past 12 months (signed)"
capture label define intpLB ///
000000 "None" /// 
000001 "$1 or break even"
capture label values INTP intpLB


capture label variable JWMNP "Travel time to work"
capture label define jwmnpLB ///

capture label values JWMNP jwmnpLB


capture label variable JWRIP "Vehicle occupancy"
capture label define jwripLB ///
01 "Drove alone" /// 
02 "In 2-person carpool" /// 
03 "In 3-person carpool" /// 
04 "In 4-person carpool" /// 
05 "In 5-person carpool" /// 
06 "In 6-person carpool" /// 
07 "In 7-person carpool" /// 
08 "In 8-person carpool" /// 
09 "In 9-person carpool" /// 
10 "In 10-person or more carpool (Top-coded)"
capture label values JWRIP jwripLB


capture label variable JWTR "Means of transportation to work"
capture label define jwtrLB ///
01 "Car, truck, or van" /// 
02 "Bus or trolley bus" /// 
03 "Streetcar or trolley car (carro publico in Puerto Rico)" /// 
04 "Subway or elevated" /// 
05 "Railroad" /// 
06 "Ferryboat" /// 
07 "Taxicab" /// 
08 "Motorcycle" /// 
09 "Bicycle" /// 
10 "Walked" /// 
11 "Worked at home" /// 
12 "Other method"
capture label values JWTR jwtrLB


capture label variable LANX "Language other than English spoken at home"
capture label define lanxLB ///
1 "Yes, speaks another language" /// 
2 "No, speaks only English"
capture label values LANX lanxLB


capture label variable MAR "Marital status"
capture label define marLB ///
1 "Married" /// 
2 "Widowed" /// 
3 "Divorced" /// 
4 "Separated" /// 
5 "Never married or under 15 years old"
capture label values MAR marLB


capture label variable MARHD "Divorced in the past 12 months"
capture label define marhdLB ///
1 "Yes" /// 
2 "No"
capture label values MARHD marhdLB


capture label variable MARHM "Married in the past 12 months"
capture label define marhmLB ///
1 "Yes" /// 
2 "No"
capture label values MARHM marhmLB


capture label variable MARHT "Number of times married"
capture label define marhtLB ///
1 "One time" /// 
2 "Two times" /// 
3 "Three or more times"
capture label values MARHT marhtLB


capture label variable MARHW "Widowed in the past 12 months"
capture label define marhwLB ///
1 "Yes" /// 
2 "No"
capture label values MARHW marhwLB


capture label variable MARHYP "Year last married"
capture label define marhypLB ///
1932 "1932 or earlier (Bottom-coded)" /// 
1933 "1933" /// 
1934 "1934" /// 
1935 "1935" /// 
1936 "1936" /// 
1937 "1937" /// 
1938 "1938" /// 
1939 "1939" /// 
1940 "1940" /// 
1941 "1941" /// 
1942 "1942" /// 
1943 "1943" /// 
1944 "1944" /// 
1945 "1945" /// 
1946 "1946" /// 
1947 "1947" /// 
1948 "1948" /// 
1949 "1949" /// 
1950 "1950" /// 
1951 "1951" /// 
1952 "1952" /// 
1953 "1953" /// 
1954 "1954" /// 
1955 "1955" /// 
1956 "1956" /// 
1957 "1957" /// 
1958 "1958" /// 
1959 "1959" /// 
1960 "1960" /// 
1961 "1961" /// 
1962 "1962" /// 
1963 "1963" /// 
1964 "1964" /// 
1965 "1965" /// 
1966 "1966" /// 
1967 "1967" /// 
1968 "1968" /// 
1969 "1969" /// 
1970 "1970" /// 
1971 "1971" /// 
1972 "1972" /// 
1973 "1973" /// 
1974 "1974" /// 
1975 "1975" /// 
1976 "1976" /// 
1977 "1977" /// 
1978 "1978" /// 
1979 "1979" /// 
1980 "1980" /// 
1981 "1981" /// 
1982 "1982" /// 
1983 "1983" /// 
1984 "1984" /// 
1985 "1985" /// 
1986 "1986" /// 
1987 "1987" /// 
1988 "1988" /// 
1989 "1989" /// 
1990 "1990" /// 
1991 "1991" /// 
1992 "1992" /// 
1993 "1993" /// 
1994 "1994" /// 
1995 "1995" /// 
1996 "1996" /// 
1997 "1997" /// 
1998 "1998" /// 
1999 "1999" /// 
2000 "2000" /// 
2001 "2001" /// 
2002 "2002" /// 
2003 "2003" /// 
2004 "2004" /// 
2005 "2005" /// 
2006 "2006" /// 
2007 "2007" /// 
2008 "2008" /// 
2009 "2009" /// 
2010 "2010" /// 
2011 "2011" /// 
2012 "2012" /// 
2013 "2013" /// 
2014 "2014"
capture label values MARHYP marhypLB


capture label variable MIG "Mobility status (lived here 1 year ago)"
capture label define migLB ///
1 "Yes, same house (nonmovers)" /// 
2 "No, outside US and Puerto Rico" /// 
3 "No, different house in US or Puerto Rico"
capture label values MIG migLB


capture label variable MIL "Military service"
capture label define milLB ///
1 "Now on active duty" /// 
2 "On active duty in the past, but not now" /// 
3 "Only on active duty for training in Reserves/National Guard" /// 
4 "Never served in the military"
capture label values MIL milLB


capture label variable MLPA "Served September 2001 or later"
capture label define mlpaLB ///
0 "Did not serve this period" /// 
1 "Served this period"
capture label values MLPA mlpaLB


capture label variable MLPB "Served August 1990 - August 2001 (including Persian Gulf War)"
capture label define mlpbLB ///
0 "Did not serve this period" /// 
1 "Served this period"
capture label values MLPB mlpbLB


capture label variable MLPCD "Served May 1975 - July 1990"
capture label define mlpcdLB ///
0 "Did not serve this period" /// 
1 "Served this period"
capture label values MLPCD mlpcdLB


capture label variable MLPE "Served Vietnam era (August 1964 - April 1975)"
capture label define mlpeLB ///
0 "Did not serve this period" /// 
1 "Served this period"
capture label values MLPE mlpeLB


capture label variable MLPFG "Served February 1955 - July 1964"
capture label define mlpfgLB ///
0 "Did not serve this period" /// 
1 "Served this period"
capture label values MLPFG mlpfgLB


capture label variable MLPH "Served Korean War (July 1950 - January 1955)"
capture label define mlphLB ///
0 "Did not serve this period" /// 
1 "Served this period"
capture label values MLPH mlphLB


capture label variable MLPI "Served January 1947 - June 1950"
capture label define mlpiLB ///
0 "Did not serve this period" /// 
1 "Served this period"
capture label values MLPI mlpiLB


capture label variable MLPJ "Served World War II (December 1941 - December 1946)"
capture label define mlpjLB ///
0 "Did not serve this period" /// 
1 "Served this period"
capture label values MLPJ mlpjLB


capture label variable MLPK "Served November 1941 or earlier"
capture label define mlpkLB ///
0 "Did not serve this period" /// 
1 "Served this period"
capture label values MLPK mlpkLB


capture label variable NWAB "Temporary absence from work"
capture label define nwabLB ///
1 "Yes" /// 
2 "No" /// 
3 "Did not report"
capture label values NWAB nwabLB


capture label variable NWAV "Available for work"
capture label define nwavLB ///
1 "Yes" /// 
2 "No, temporarily ill" /// 
3 "No, other reasons" /// 
4 "No, unspecified" /// 
5 "Did not report"
capture label values NWAV nwavLB


capture label variable NWLA "On layoff from work"
capture label define nwlaLB ///
1 "Yes" /// 
2 "No" /// 
3 "Did not report"
capture label values NWLA nwlaLB


capture label variable NWLK "Looking for work"
capture label define nwlkLB ///
1 "Yes" /// 
2 "No" /// 
3 "Did not report"
capture label values NWLK nwlkLB


capture label variable NWRE "Informed of recall"
capture label define nwreLB ///
1 "Yes" /// 
2 "No" /// 
3 "Did not report"
capture label values NWRE nwreLB

notes: Use ADJINC to adjust OIP to constant dollars.

capture label variable OIP "All other income past 12 months"
capture label define oipLB ///
000000 "None"
capture label values OIP oipLB

notes: Use ADJINC to adjust PAP to constant dollars.

capture label variable PAP "Public assistance income past 12 months"
capture label define papLB ///
00000 "None"
capture label values PAP papLB


capture label variable RELP "Relationship"
capture label define relpLB ///
00 "Reference person" /// 
01 "Husband/wife" /// 
02 "Biological son or daughter" /// 
03 "Adopted son or daughter" /// 
04 "Stepson or stepdaughter" /// 
05 "Brother or sister" /// 
06 "Father or mother" /// 
07 "Grandchild" /// 
08 "Parent-in-law" /// 
09 "Son-in-law or daughter-in-law" /// 
10 "Other relative" /// 
11 "Roomer or boarder" /// 
12 "Housemate or roommate" /// 
13 "Unmarried partner" /// 
14 "Foster child" /// 
15 "Other nonrelative" /// 
16 "Institutionalized group quarters population" /// 
17 "Noninstitutionalized group quarters population"
capture label values RELP relpLB

notes: Use ADJINC to adjust RETP to constant dollars.

capture label variable RETP "Retirement income past 12 months"
capture label define retpLB ///
000000 "None"
capture label values RETP retpLB


capture label variable SCH "School enrollment"
capture label define schLB ///
1 "No, has not attended in the last 3 months" /// 
2 "Yes, public school or public college" /// 
3 "Yes, private school or college or home school"
capture label values SCH schLB


capture label variable SCHG "Grade level attending"
capture label define schgLB ///
01 "Nursery school/preschool" /// 
02 "Kindergarten" /// 
03 "Grade 1" /// 
04 "Grade 2" /// 
05 "Grade 3" /// 
06 "Grade 4" /// 
07 "Grade 5" /// 
08 "Grade 6" /// 
09 "Grade 7" /// 
10 "Grade 8" /// 
11 "Grade 9" /// 
12 "Grade 10" /// 
13 "Grade 11" /// 
14 "Grade 12" /// 
15 "College undergraduate years (freshman to senior)" /// 
16 "Graduate or professional school beyond a bachelor's degree"
capture label values SCHG schgLB


capture label variable SCHL "Educational attainment"
capture label define schlLB ///
01 "No schooling completed" /// 
02 "Nursery school, preschool" /// 
03 "Kindergarten" /// 
04 "Grade 1" /// 
05 "Grade 2" /// 
06 "Grade 3" /// 
07 "Grade 4" /// 
08 "Grade 5" /// 
09 "Grade 6" /// 
10 "Grade 7" /// 
11 "Grade 8" /// 
12 "Grade 9" /// 
13 "Grade 10" /// 
14 "Grade 11" /// 
15 "12th grade - no diploma" /// 
16 "Regular high school diploma" /// 
17 "GED or alternative credential" /// 
18 "Some college, but less than 1 year" /// 
19 "1 or more years of college credit, no degree" /// 
20 "Associate's degree" /// 
21 "Bachelor's degree" /// 
22 "Master's degree" /// 
23 "Professional degree beyond a bachelor's degree" /// 
24 "Doctorate degree"
capture label values SCHL schlLB

notes: Use ADJINC to adjust SEMP to constant dollars.

capture label variable SEMP "Self-employment income past 12 months (signed)"
capture label define sempLB ///
000000 "None" /// 
000001 "$1 or break even"
capture label values SEMP sempLB


capture label variable SEX "Sex"
capture label define sexLB ///
1 "Male" /// 
2 "Female"
capture label values SEX sexLB

notes: Use ADJINC to adjust SSIP to constant dollars.

capture label variable SSIP "Supplementary Security Income past 12 months"
capture label define ssipLB ///
00000 "None"
capture label values SSIP ssipLB

notes: Use ADJINC to adjust SSP to constant dollars.

capture label variable Social "bbbbb .N/A (less than 15 years old)"
capture label define socialLB ///
00000 "None"
capture label values Social socialLB

notes: Use ADJINC to adjust WAGP to constant dollars.

capture label variable WAGP "Wages or salary income past 12 months"
capture label define wagpLB ///
000000 "None"
capture label values WAGP wagpLB


capture label variable WKHP "Usual hours worked per week past 12 months"
capture label define wkhpLB ///
99 "99 or more usual hours"
capture label values WKHP wkhpLB


capture label variable WKL "When last worked"
capture label define wklLB ///
1 "Within the past 12 months" /// 
2 "1-5 years ago" /// 
3 "Over 5 years ago or never worked"
capture label values WKL wklLB


capture label variable WKW "Weeks worked during past 12 months"
capture label define wkwLB ///
1 "50 to 52 weeks worked during past 12 months" /// 
2 "48 to 49 weeks worked during past 12 months" /// 
3 "40 to 47 weeks worked during past 12 months" /// 
4 "27 to 39 weeks worked during past 12 months" /// 
5 "14 to 26 weeks worked during past 12 months" /// 
6 "less than 14 weeks worked during past 12 months"
capture label values WKW wkwLB


capture label variable WRK "Worked last week"
capture label define wrkLB ///
1 "Worked" /// 
2 "Did not work"
capture label values WRK wrkLB


capture label variable YOEP "Year of entry"
capture label define yoepLB ///
1921 "1921 or earlier (Bottom-coded)" /// 
1922 "1922 - 1923" /// 
1924 "1924 - 1925" /// 
1926 "1926 - 1927" /// 
1928 "1928 - 1929" /// 
1930 "1930 – 1931" /// 
1932 "1932 - 1934" /// 
1935 "1935 - 1936" /// 
1937 "1937 - 1938" /// 
1939 "1939" /// 
1940 "1940" /// 
1941 "1941" /// 
1942 "1942" /// 
1943 "1943 - 1944" /// 
1945 "1945" /// 
1946 "1946" /// 
1947 "1947" /// 
1948 "1948" /// 
1949 "1949" /// 
1950 "1950" /// 
1951 "1951" /// 
1952 "1952" /// 
1953 "1953" /// 
1954 "1954" /// 
1955 "1955" /// 
1956 "1956" /// 
1957 "1957" /// 
1958 "1958" /// 
1959 "1959" /// 
1960 "1960" /// 
1961 "1961" /// 
1962 "1962" /// 
1963 "1963" /// 
1964 "1964" /// 
1965 "1965" /// 
1966 "1966" /// 
1967 "1967" /// 
1968 "1968" /// 
1969 "1969" /// 
1970 "1970" /// 
1971 "1971" /// 
1972 "1972" /// 
1973 "1973" /// 
1974 "1974" /// 
1975 "1975" /// 
1976 "1976" /// 
1977 "1977" /// 
1978 "1978" /// 
1979 "1979" /// 
1980 "1980" /// 
1981 "1981" /// 
1982 "1982" /// 
1983 "1983" /// 
1984 "1984" /// 
1985 "1985" /// 
1986 "1986" /// 
1987 "1987" /// 
1988 "1988" /// 
1989 "1989" /// 
1990 "1990" /// 
1991 "1991" /// 
1992 "1992" /// 
1993 "1993" /// 
1994 "1994" /// 
1995 "1995" /// 
1996 "1996" /// 
1997 "1997" /// 
1998 "1998" /// 
1999 "1999" /// 
2000 "2000" /// 
2001 "2001" /// 
2002 "2002" /// 
2003 "2003" /// 
2004 "2004" /// 
2005 "2005" /// 
2006 "2006" /// 
2007 "2007" /// 
2008 "2008" /// 
2009 "2009" /// 
2010 "2010" /// 
2011 "2011" /// 
2012 "2012" /// 
2013 "2013" /// 
2014 "2014"
capture label values YOEP yoepLB


capture label variable ANC "Ancestry recode"
capture label define ancLB ///
1 "Single" /// 
2 "Multiple" /// 
3 "Unclassified" /// 
4 "Not reported"
capture label values ANC ancLB


capture label variable ANC1P "Recoded Detailed Ancestry - first entry"
capture label define anc1pLB ///
001 "Alsatian" /// 
003 "Austrian" /// 
005 "Basque" /// 
008 "Belgian" /// 
009 "Flemish" /// 
011 "British" /// 
012 "British Isles" /// 
020 "Danish" /// 
021 "Dutch" /// 
022 "English" /// 
024 "Finnish" /// 
026 "French" /// 
032 "German" /// 
040 "Prussian" /// 
046 "Greek" /// 
049 "Icelander" /// 
050 "Irish" /// 
051 "Italian" /// 
068 "Sicilian" /// 
077 "Luxemburger" /// 
078 "Maltese" /// 
082 "Norwegian" /// 
084 "Portuguese" /// 
087 "Scotch Irish" /// 
088 "Scottish" /// 
089 "Swedish" /// 
091 "Swiss" /// 
094 "Irish Scotch" /// 
097 "Welsh" /// 
098 "Scandinavian" /// 
099 "Celtic" /// 
100 "Albanian" /// 
102 "Belorussian" /// 
103 "Bulgarian" /// 
109 "Croatian" /// 
111 "Czech" /// 
112 "Bohemian" /// 
114 "Czechoslovakian" /// 
115 "Estonian" /// 
122 "German Russian" /// 
124 "Rom" /// 
125 "Hungarian" /// 
128 "Latvian" /// 
129 "Lithuanian" /// 
130 "Macedonian" /// 
131 "Montenegrin" /// 
142 "Polish" /// 
144 "Romanian" /// 
146 "Moldavian" /// 
148 "Russian" /// 
152 "Serbian" /// 
153 "Slovak" /// 
154 "Slovene" /// 
168 "Turkestani" /// 
169 "Uzbeg" /// 
170 "Georgia CIS" /// 
171 "Ukrainian" /// 
176 "Yugoslavian" /// 
177 "Bosnian and Herzegovinian" /// 
178 "Slavic" /// 
179 "Slavonian" /// 
181 "Central European" /// 
183 "Northern European" /// 
185 "Southern European" /// 
187 "Western European" /// 
190 "Eastern European" /// 
194 "Germanic" /// 
195 "European" /// 
200 "Spaniard" /// 
210 "Mexican" /// 
211 "Mexican American" /// 
212 "Mexicano" /// 
213 "Chicano" /// 
215 "Mexican American Indian" /// 
218 "Mexican State" /// 
219 "Mexican Indian" /// 
221 "Costa Rican" /// 
222 "Guatemalan" /// 
223 "Honduran" /// 
224 "Nicaraguan" /// 
225 "Panamanian" /// 
226 "Salvadoran" /// 
227 "Central American" /// 
231 "Argentinean" /// 
232 "Bolivian" /// 
233 "Chilean" /// 
234 "Colombian" /// 
235 "Ecuadorian" /// 
236 "Paraguayan" /// 
237 "Peruvian" /// 
238 "Uruguayan" /// 
239 "Venezuelan" /// 
249 "South American" /// 
250 "Latin American" /// 
251 "Latin" /// 
252 "Latino" /// 
261 "Puerto Rican" /// 
271 "Cuban" /// 
275 "Dominican" /// 
290 "Hispanic" /// 
291 "Spanish" /// 
295 "Spanish American" /// 
300 "Bahamian" /// 
301 "Barbadian" /// 
302 "Belizean" /// 
308 "Jamaican" /// 
310 "Dutch West Indian" /// 
314 "Trinidadian Tobagonian" /// 
322 "British West Indian" /// 
325 "Antigua and Barbuda" /// 
329 "Grenadian" /// 
330 "Vincent-Grenadine Islander" /// 
331 "St Lucia Islander" /// 
335 "West Indian" /// 
336 "Haitian" /// 
359 "Other West Indian" /// 
360 "Brazilian" /// 
370 "Guyanese" /// 
400 "Algerian" /// 
402 "Egyptian" /// 
406 "Moroccan" /// 
411 "North African" /// 
416 "Iranian" /// 
417 "Iraqi" /// 
419 "Israeli" /// 
421 "Jordanian" /// 
425 "Lebanese" /// 
427 "Saudi Arabian" /// 
429 "Syrian" /// 
431 "Armenian" /// 
434 "Turkish" /// 
435 "Yemeni" /// 
442 "Kurdish" /// 
465 "Palestinian" /// 
483 "Assyrian" /// 
484 "Chaldean" /// 
490 "Mideast" /// 
495 "Arab" /// 
496 "Arabic" /// 
499 "Other Arab" /// 
508 "Cameroonian" /// 
510 "Cape Verdean" /// 
515 "Congolese" /// 
522 "Ethiopian" /// 
523 "Eritrean" /// 
529 "Ghanaian" /// 
534 "Kenyan" /// 
541 "Liberian" /// 
553 "Nigerian" /// 
564 "Senegalese" /// 
566 "Sierra Leonean" /// 
568 "Somali" /// 
570 "South African" /// 
576 "Sudanese" /// 
587 "Other Subsaharan African" /// 
588 "Ugandan" /// 
598 "Western African" /// 
599 "African" /// 
600 "Afghan" /// 
603 "Bangladeshi" /// 
607 "Bhutanese" /// 
609 "Nepali" /// 
615 "Asian Indian" /// 
618 "Bengali" /// 
620 "East Indian" /// 
650 "Punjabi" /// 
680 "Pakistani" /// 
690 "Sri Lankan" /// 
700 "Burmese" /// 
703 "Cambodian" /// 
706 "Chinese" /// 
707 "Cantonese" /// 
712 "Mongolian" /// 
714 "Tibetan" /// 
720 "Filipino" /// 
730 "Indonesian" /// 
740 "Japanese" /// 
748 "Okinawan" /// 
750 "Korean" /// 
765 "Laotian" /// 
768 "Hmong" /// 
770 "Malaysian" /// 
776 "Thai" /// 
782 "Taiwanese" /// 
785 "Vietnamese" /// 
793 "Eurasian" /// 
795 "Asian" /// 
799 "Other Asian" /// 
800 "Australian" /// 
803 "New Zealander" /// 
808 "Polynesian" /// 
811 "Hawaiian" /// 
814 "Samoan" /// 
815 "Tongan" /// 
820 "Micronesian" /// 
821 "Guamanian" /// 
822 "Chamorro" /// 
825 "Marshallese" /// 
841 "Fijian" /// 
850 "Pacific Islander" /// 
899 "Other Pacific" /// 
900 "Afro American" /// 
901 "Afro" /// 
902 "African American" /// 
903 "Black" /// 
904 "Negro" /// 
907 "Creole" /// 
913 "Central American Indian" /// 
914 "South American Indian" /// 
917 "Native American" /// 
918 "Indian" /// 
919 "Cherokee" /// 
920 "American Indian" /// 
921 "Aleut" /// 
922 "Eskimo" /// 
924 "White" /// 
925 "Anglo" /// 
927 "Appalachian" /// 
929 "Pennsylvania German" /// 
931 "Canadian" /// 
935 "French Canadian" /// 
937 "Cajun" /// 
939 "American" /// 
940 "United States" /// 
983 "Texas" /// 
994 "North American" /// 
995 "Mixture" /// 
996 "Uncodable entries" /// 
997 "Other groups" /// 
998 "Other responses" /// 
999 "Not reported"
capture label values ANC1P anc1pLB


capture label variable ANC2P "Recoded Detailed Ancestry - second entry"
capture label define anc2pLB ///
001 "Alsatian" /// 
003 "Austrian" /// 
005 "Basque" /// 
008 "Belgian" /// 
009 "Flemish" /// 
011 "British" /// 
012 "British Isles" /// 
020 "Danish" /// 
021 "Dutch" /// 
022 "English" /// 
024 "Finnish" /// 
026 "French" /// 
032 "German" /// 
040 "Prussian" /// 
046 "Greek" /// 
049 "Icelander" /// 
050 "Irish" /// 
051 "Italian" /// 
068 "Sicilian" /// 
077 "Luxemburger" /// 
078 "Maltese" /// 
082 "Norwegian" /// 
084 "Portuguese" /// 
087 "Scotch Irish" /// 
088 "Scottish" /// 
089 "Swedish" /// 
091 "Swiss" /// 
094 "Irish Scotch" /// 
097 "Welsh" /// 
098 "Scandinavian" /// 
099 "Celtic" /// 
100 "Albanian" /// 
102 "Belorussian" /// 
103 "Bulgarian" /// 
109 "Croatian" /// 
111 "Czech" /// 
112 "Bohemian" /// 
114 "Czechoslovakian" /// 
115 "Estonian" /// 
122 "German Russian" /// 
124 "Rom" /// 
125 "Hungarian" /// 
128 "Latvian" /// 
129 "Lithuanian" /// 
130 "Macedonian" /// 
131 "Montenegrin" /// 
142 "Polish" /// 
144 "Romanian" /// 
146 "Moldavian" /// 
148 "Russian" /// 
152 "Serbian" /// 
153 "Slovak" /// 
154 "Slovene" /// 
168 "Turkestani" /// 
169 "Uzbeg" /// 
170 "Georgia CIS" /// 
171 "Ukrainian" /// 
176 "Yugoslavian" /// 
177 "Bosnian and Herzegovinian" /// 
178 "Slavic" /// 
179 "Slavonian" /// 
181 "Central European" /// 
183 "Northern European" /// 
185 "Southern European" /// 
187 "Western European" /// 
190 "Eastern European" /// 
194 "Germanic" /// 
195 "European" /// 
200 "Spaniard" /// 
210 "Mexican" /// 
211 "Mexican American" /// 
212 "Mexicano" /// 
213 "Chicano" /// 
215 "Mexican American Indian" /// 
218 "Mexican State" /// 
219 "Mexican Indian" /// 
221 "Costa Rican" /// 
222 "Guatemalan" /// 
223 "Honduran" /// 
224 "Nicaraguan" /// 
225 "Panamanian" /// 
226 "Salvadoran" /// 
227 "Central American" /// 
231 "Argentinean" /// 
232 "Bolivian" /// 
233 "Chilean" /// 
234 "Colombian" /// 
235 "Ecuadorian" /// 
236 "Paraguayan" /// 
237 "Peruvian" /// 
238 "Uruguayan" /// 
239 "Venezuelan" /// 
249 "South American" /// 
250 "Latin American" /// 
251 "Latin" /// 
252 "Latino" /// 
261 "Puerto Rican" /// 
271 "Cuban" /// 
275 "Dominican" /// 
290 "Hispanic" /// 
291 "Spanish" /// 
295 "Spanish American" /// 
300 "Bahamian" /// 
301 "Barbadian" /// 
302 "Belizean" /// 
308 "Jamaican" /// 
310 "Dutch West Indian" /// 
314 "Trinidadian Tobagonian" /// 
322 "British West Indian" /// 
325 "Antigua and Barbuda" /// 
329 "Grenadian" /// 
330 "Vincent-Grenadine Islander" /// 
331 "St Lucia Islander" /// 
335 "West Indian" /// 
336 "Haitian" /// 
359 "Other West Indian" /// 
360 "Brazilian" /// 
370 "Guyanese" /// 
400 "Algerian" /// 
402 "Egyptian" /// 
406 "Moroccan" /// 
411 "North African" /// 
416 "Iranian" /// 
417 "Iraqi" /// 
419 "Israeli" /// 
421 "Jordanian" /// 
425 "Lebanese" /// 
427 "Saudi Arabian" /// 
429 "Syrian" /// 
431 "Armenian" /// 
434 "Turkish" /// 
435 "Yemeni" /// 
442 "Kurdish" /// 
465 "Palestinian" /// 
483 "Assyrian" /// 
484 "Chaldean" /// 
490 "Mideast" /// 
495 "Arab" /// 
496 "Arabic" /// 
499 "Other Arab" /// 
508 "Cameroonian" /// 
510 "Cape Verdean" /// 
515 "Congolese" /// 
522 "Ethiopian" /// 
523 "Eritrean" /// 
529 "Ghanaian" /// 
534 "Kenyan" /// 
541 "Liberian" /// 
553 "Nigerian" /// 
564 "Senegalese" /// 
566 "Sierra Leonean" /// 
568 "Somali" /// 
570 "South African" /// 
576 "Sudanese" /// 
587 "Other Subsaharan African" /// 
588 "Ugandan" /// 
598 "Western African" /// 
599 "African" /// 
600 "Afghan" /// 
603 "Bangladeshi" /// 
607 "Bhutanese" /// 
609 "Nepali" /// 
615 "Asian Indian" /// 
618 "Bengali" /// 
620 "East Indian" /// 
650 "Punjabi" /// 
680 "Pakistani" /// 
690 "Sri Lankan" /// 
700 "Burmese" /// 
703 "Cambodian" /// 
706 "Chinese" /// 
707 "Cantonese" /// 
712 "Mongolian" /// 
714 "Tibetan" /// 
720 "Filipino" /// 
730 "Indonesian" /// 
740 "Japanese" /// 
748 "Okinawan" /// 
750 "Korean" /// 
765 "Laotian" /// 
768 "Hmong" /// 
770 "Malaysian" /// 
776 "Thai" /// 
782 "Taiwanese" /// 
785 "Vietnamese" /// 
793 "Eurasian" /// 
795 "Asian" /// 
799 "Other Asian" /// 
800 "Australian" /// 
803 "New Zealander" /// 
808 "Polynesian" /// 
811 "Hawaiian" /// 
814 "Samoan" /// 
815 "Tongan" /// 
820 "Micronesian" /// 
821 "Guamanian" /// 
822 "Chamorro" /// 
825 "Marshallese" /// 
841 "Fijian" /// 
850 "Pacific Islander" /// 
899 "Other Pacific" /// 
900 "Afro American" /// 
901 "Afro" /// 
902 "African American" /// 
903 "Black" /// 
904 "Negro" /// 
907 "Creole" /// 
913 "Central American Indian" /// 
914 "South American Indian" /// 
917 "Native American" /// 
918 "Indian" /// 
919 "Cherokee" /// 
920 "American Indian" /// 
921 "Aleut" /// 
922 "Eskimo" /// 
924 "White" /// 
925 "Anglo" /// 
927 "Appalachian" /// 
929 "Pennsylvania German" /// 
931 "Canadian" /// 
935 "French Canadian" /// 
937 "Cajun" /// 
939 "American" /// 
940 "United States" /// 
983 "Texas" /// 
994 "North American" /// 
995 "Mixture" /// 
996 "Uncodable entries" /// 
997 "Other groups" /// 
998 "Other responses" /// 
999 "Not reported"
capture label values ANC2P anc2pLB


capture label variable DECADE "Decade of entry"
capture label define decadeLB ///
1 "Before 1950" /// 
2 "1950 - 1959" /// 
3 "1960 - 1969" /// 
4 "1970 - 1979" /// 
5 "1980 - 1989" /// 
6 "1990 - 1999" /// 
7 "2000 or later"
capture label values DECADE decadeLB


capture label variable DIS "Disability recode"
capture label define disLB ///
1 "With a disability" /// 
2 "Without a disability"
capture label values DIS disLB


capture label variable DRIVESP "Number of vehicles calculated from JWRI"
capture label define drivespLB ///
1 "1.000 vehicles (Drove alone)" /// 
2 "0.500 vehicles (In a 2-person carpool)" /// 
3 "0.333 vehicles (In a 3-person carpool)" /// 
4 "0.250 vehicles (In a 4-person carpool)" /// 
5 "0.200 vehicles (In a 5- or 6-person carpool)" /// 
6 "0.143 vehicles (In a 7-or-more person carpool)"
capture label values DRIVESP drivespLB


capture label variable ESP "Employment status of parents"
capture label define espLB ///
1 "Both parents in labor force" /// 
2 "Father only in labor force" /// 
3 "Mother only in labor force" /// 
4 "Neither parent in labor force" /// 
5 "Father in the labor force" /// 
6 "Father not in labor force" /// 
7 "Mother in the labor force" /// 
8 "Mother not in labor force"
capture label values ESP espLB


capture label variable ESR "Employment status recode"
capture label define esrLB ///
1 "Civilian employed, at work" /// 
2 "Civilian employed, with a job but not at work" /// 
3 "Unemployed" /// 
4 "Armed forces, at work" /// 
5 "Armed forces, with a job but not at work" /// 
6 "Not in labor force"
capture label values ESR esrLB


capture label variable FOD1P "Recoded field of degree - first entry"
capture label define fod1pLB ///
1100 "GENERAL AGRICULTURE" /// 
1101 "AGRICULTURE PRODUCTION AND MANAGEMENT" /// 
1102 "AGRICULTURAL ECONOMICS" /// 
1103 "ANIMAL SCIENCES" /// 
1104 "FOOD SCIENCE" /// 
1105 "PLANT SCIENCE AND AGRONOMY" /// 
1106 "SOIL SCIENCE" /// 
1199 "MISCELLANEOUS AGRICULTURE" /// 
1301 "ENVIRONMENTAL SCIENCE" /// 
1302 "FORESTRY" /// 
1303 "NATURAL RESOURCES MANAGEMENT" /// 
1401 "ARCHITECTURE" /// 
1501 "AREA ETHNIC AND CIVILIZATION STUDIES" /// 
1901 "COMMUNICATIONS" /// 
1902 "JOURNALISM" /// 
1903 "MASS MEDIA" /// 
1904 "ADVERTISING AND PUBLIC RELATIONS" /// 
2001 "COMMUNICATION TECHNOLOGIES" /// 
2100 "COMPUTER AND INFORMATION SYSTEMS" /// 
2101 "COMPUTER PROGRAMMING AND DATA PROCESSING" /// 
2102 "COMPUTER SCIENCE" /// 
2105 "INFORMATION SCIENCES" /// 
2106 "COMPUTER ADMINISTRATION MANAGEMENT AND SECURITY" /// 
2107 "COMPUTER NETWORKING AND TELECOMMUNICATIONS" /// 
2201 "COSMETOLOGY SERVICES AND CULINARY ARTS" /// 
2300 "GENERAL EDUCATION" /// 
2301 "EDUCATIONAL ADMINISTRATION AND SUPERVISION" /// 
2303 "SCHOOL STUDENT COUNSELING" /// 
2304 "ELEMENTARY EDUCATION" /// 
2305 "MATHEMATICS TEACHER EDUCATION" /// 
2306 "PHYSICAL AND HEALTH EDUCATION TEACHING" /// 
2307 "EARLY CHILDHOOD EDUCATION" /// 
2308 "SCIENCE AND COMPUTER TEACHER EDUCATION" /// 
2309 "SECONDARY TEACHER EDUCATION" /// 
2310 "SPECIAL NEEDS EDUCATION" /// 
2311 "SOCIAL SCIENCE OR HISTORY TEACHER EDUCATION" /// 
2312 "TEACHER EDUCATION: MULTIPLE LEVELS" /// 
2313 "LANGUAGE AND DRAMA EDUCATION" /// 
2314 "ART AND MUSIC EDUCATION" /// 
2399 "MISCELLANEOUS EDUCATION" /// 
2400 "GENERAL ENGINEERING" /// 
2401 "AEROSPACE ENGINEERING" /// 
2402 "BIOLOGICAL ENGINEERING" /// 
2403 "ARCHITECTURAL ENGINEERING" /// 
2404 "BIOMEDICAL ENGINEERING" /// 
2405 "CHEMICAL ENGINEERING" /// 
2406 "CIVIL ENGINEERING" /// 
2407 "COMPUTER ENGINEERING" /// 
2408 "ELECTRICAL ENGINEERING" /// 
2409 "ENGINEERING MECHANICS PHYSICS AND SCIENCE" /// 
2410 "ENVIRONMENTAL ENGINEERING" /// 
2411 "GEOLOGICAL AND GEOPHYSICAL ENGINEERING" /// 
2412 "INDUSTRIAL AND MANUFACTURING ENGINEERING" /// 
2413 "MATERIALS ENGINEERING AND MATERIALS SCIENCE" /// 
2414 "MECHANICAL ENGINEERING" /// 
2415 "METALLURGICAL ENGINEERING" /// 
2416 "MINING AND MINERAL ENGINEERING" /// 
2417 "NAVAL ARCHITECTURE AND MARINE ENGINEERING" /// 
2418 "NUCLEAR ENGINEERING" /// 
2419 "PETROLEUM ENGINEERING" /// 
2499 "MISCELLANEOUS ENGINEERING" /// 
2500 "ENGINEERING TECHNOLOGIES" /// 
2501 "ENGINEERING AND INDUSTRIAL MANAGEMENT" /// 
2502 "ELECTRICAL ENGINEERING TECHNOLOGY" /// 
2503 "INDUSTRIAL PRODUCTION TECHNOLOGIES" /// 
2504 "MECHANICAL ENGINEERING RELATED TECHNOLOGIES" /// 
2599 "MISCELLANEOUS ENGINEERING TECHNOLOGIES" /// 
2601 "LINGUISTICS AND COMPARATIVE LANGUAGE AND LITERATURE" /// 
2602 "FRENCH GERMAN LATIN AND OTHER COMMON FOREIGN LANGUAGE STUDIES" /// 
2603 "OTHER FOREIGN LANGUAGES" /// 
2901 "FAMILY AND CONSUMER SCIENCES" /// 
3201 "COURT REPORTING" /// 
3202 "PRE-LAW AND LEGAL STUDIES" /// 
3301 "ENGLISH LANGUAGE AND LITERATURE" /// 
3302 "COMPOSITION AND RHETORIC" /// 
3401 "LIBERAL ARTS" /// 
3402 "HUMANITIES" /// 
3501 "LIBRARY SCIENCE" /// 
3600 "BIOLOGY" /// 
3601 "BIOCHEMICAL SCIENCES" /// 
3602 "BOTANY" /// 
3603 "MOLECULAR BIOLOGY" /// 
3604 "ECOLOGY" /// 
3605 "GENETICS" /// 
3606 "MICROBIOLOGY" /// 
3607 "PHARMACOLOGY" /// 
3608 "PHYSIOLOGY" /// 
3609 "ZOOLOGY" /// 
3611 "NEUROSCIENCE" /// 
3699 "MISCELLANEOUS BIOLOGY" /// 
3700 "MATHEMATICS" /// 
3701 "APPLIED MATHEMATICS" /// 
3702 "STATISTICS AND DECISION SCIENCE" /// 
3801 "MILITARY TECHNOLOGIES" /// 
4000 "MULTI/INTERDISCIPLINARY STUDIES" /// 
4001 "INTERCULTURAL AND INTERNATIONAL STUDIES" /// 
4002 "NUTRITION SCIENCES" /// 
4005 "MATHEMATICS AND COMPUTER SCIENCE" /// 
4006 "COGNITIVE SCIENCE AND BIOPSYCHOLOGY" /// 
4007 "INTERDISCIPLINARY SOCIAL SCIENCES" /// 
4101 "PHYSICAL FITNESS PARKS RECREATION AND LEISURE" /// 
4801 "PHILOSOPHY AND RELIGIOUS STUDIES" /// 
4901 "THEOLOGY AND RELIGIOUS VOCATIONS" /// 
5000 "PHYSICAL SCIENCES" /// 
5001 "ASTRONOMY AND ASTROPHYSICS" /// 
5002 "ATMOSPHERIC SCIENCES AND METEOROLOGY" /// 
5003 "CHEMISTRY" /// 
5004 "GEOLOGY AND EARTH SCIENCE" /// 
5005 "GEOSCIENCES" /// 
5006 "OCEANOGRAPHY" /// 
5007 "PHYSICS" /// 
5008 "MATERIALS SCIENCE" /// 
5098 "MULTI-DISCIPLINARY OR GENERAL SCIENCE" /// 
5102 "NUCLEAR, INDUSTRIAL RADIOLOGY, AND BIOLOGICAL TECHNOLOGIES" /// 
5200 "PSYCHOLOGY" /// 
5201 "EDUCATIONAL PSYCHOLOGY" /// 
5202 "CLINICAL PSYCHOLOGY" /// 
5203 "COUNSELING PSYCHOLOGY" /// 
5205 "INDUSTRIAL AND ORGANIZATIONAL PSYCHOLOGY" /// 
5206 "SOCIAL PSYCHOLOGY" /// 
5299 "MISCELLANEOUS PSYCHOLOGY" /// 
5301 "CRIMINAL JUSTICE AND FIRE PROTECTION" /// 
5401 "PUBLIC ADMINISTRATION" /// 
5402 "PUBLIC POLICY" /// 
5403 "HUMAN SERVICES AND COMMUNITY ORGANIZATION" /// 
5404 "SOCIAL WORK" /// 
5500 "GENERAL SOCIAL SCIENCES" /// 
5501 "ECONOMICS" /// 
5502 "ANTHROPOLOGY AND ARCHEOLOGY" /// 
5503 "CRIMINOLOGY" /// 
5504 "GEOGRAPHY" /// 
5505 "INTERNATIONAL RELATIONS" /// 
5506 "POLITICAL SCIENCE AND GOVERNMENT" /// 
5507 "SOCIOLOGY" /// 
5599 "MISCELLANEOUS SOCIAL SCIENCES" /// 
5601 "CONSTRUCTION SERVICES" /// 
5701 "ELECTRICAL, MECHANICAL, AND PRECISION TECHNOLOGIES AND PRODUCTION" /// 
5901 "TRANSPORTATION SCIENCES AND TECHNOLOGIES" /// 
6000 "FINE ARTS" /// 
6001 "DRAMA AND THEATER ARTS" /// 
6002 "MUSIC" /// 
6003 "VISUAL AND PERFORMING ARTS" /// 
6004 "COMMERCIAL ART AND GRAPHIC DESIGN" /// 
6005 "FILM VIDEO AND PHOTOGRAPHIC ARTS" /// 
6006 "ART HISTORY AND CRITICISM" /// 
6007 "STUDIO ARTS" /// 
6099 "MISCELLANEOUS FINE ARTS" /// 
6100 "GENERAL MEDICAL AND HEALTH SERVICES" /// 
6102 "COMMUNICATION DISORDERS SCIENCES AND SERVICES" /// 
6103 "HEALTH AND MEDICAL ADMINISTRATIVE SERVICES" /// 
6104 "MEDICAL ASSISTING SERVICES" /// 
6105 "MEDICAL TECHNOLOGIES TECHNICIANS" /// 
6106 "HEALTH AND MEDICAL PREPARATORY PROGRAMS" /// 
6107 "NURSING" /// 
6108 "PHARMACY PHARMACEUTICAL SCIENCES AND ADMINISTRATION" /// 
6109 "TREATMENT THERAPY PROFESSIONS" /// 
6110 "COMMUNITY AND PUBLIC HEALTH" /// 
6199 "MISCELLANEOUS HEALTH MEDICAL PROFESSIONS" /// 
6200 "GENERAL BUSINESS" /// 
6201 "ACCOUNTING" /// 
6202 "ACTUARIAL SCIENCE" /// 
6203 "BUSINESS MANAGEMENT AND ADMINISTRATION" /// 
6204 "OPERATIONS LOGISTICS AND E-COMMERCE" /// 
6205 "BUSINESS ECONOMICS" /// 
6206 "MARKETING AND MARKETING RESEARCH" /// 
6207 "FINANCE" /// 
6209 "HUMAN RESOURCES AND PERSONNEL MANAGEMENT" /// 
6210 "INTERNATIONAL BUSINESS" /// 
6211 "HOSPITALITY MANAGEMENT" /// 
6212 "MANAGEMENT INFORMATION SYSTEMS AND STATISTICS" /// 
6299 "MISCELLANEOUS BUSINESS & MEDICAL ADMINISTRATION" /// 
6402 "HISTORY" /// 
6403 "UNITED STATES HISTORY"
capture label values FOD1P fod1pLB


capture label variable FOD2P "Recoded field of degree - second entry"
capture label define fod2pLB ///
1100 "GENERAL AGRICULTURE" /// 
1101 "AGRICULTURE PRODUCTION AND MANAGEMENT" /// 
1102 "AGRICULTURAL ECONOMICS" /// 
1103 "ANIMAL SCIENCES" /// 
1104 "FOOD SCIENCE" /// 
1105 "PLANT SCIENCE AND AGRONOMY" /// 
1106 "SOIL SCIENCE" /// 
1199 "MISCELLANEOUS AGRICULTURE" /// 
1301 "ENVIRONMENTAL SCIENCE" /// 
1302 "FORESTRY" /// 
1303 "NATURAL RESOURCES MANAGEMENT" /// 
1401 "ARCHITECTURE" /// 
1501 "AREA ETHNIC AND CIVILIZATION STUDIES" /// 
1901 "COMMUNICATIONS" /// 
1902 "JOURNALISM" /// 
1903 "MASS MEDIA" /// 
1904 "ADVERTISING AND PUBLIC RELATIONS" /// 
2001 "COMMUNICATION TECHNOLOGIES" /// 
2100 "COMPUTER AND INFORMATION SYSTEMS" /// 
2101 "COMPUTER PROGRAMMING AND DATA PROCESSING" /// 
2102 "COMPUTER SCIENCE" /// 
2105 "INFORMATION SCIENCES" /// 
2106 "COMPUTER ADMINISTRATION MANAGEMENT AND SECURITY" /// 
2107 "COMPUTER NETWORKING AND TELECOMMUNICATIONS" /// 
2201 "COSMETOLOGY SERVICES AND CULINARY ARTS" /// 
2300 "GENERAL EDUCATION" /// 
2301 "EDUCATIONAL ADMINISTRATION AND SUPERVISION" /// 
2303 "SCHOOL STUDENT COUNSELING" /// 
2304 "ELEMENTARY EDUCATION" /// 
2305 "MATHEMATICS TEACHER EDUCATION" /// 
2306 "PHYSICAL AND HEALTH EDUCATION TEACHING" /// 
2307 "EARLY CHILDHOOD EDUCATION" /// 
2308 "SCIENCE AND COMPUTER TEACHER EDUCATION" /// 
2309 "SECONDARY TEACHER EDUCATION" /// 
2310 "SPECIAL NEEDS EDUCATION" /// 
2311 "SOCIAL SCIENCE OR HISTORY TEACHER EDUCATION" /// 
2312 "TEACHER EDUCATION: MULTIPLE LEVELS" /// 
2313 "LANGUAGE AND DRAMA EDUCATION" /// 
2314 "ART AND MUSIC EDUCATION" /// 
2399 "MISCELLANEOUS EDUCATION" /// 
2400 "GENERAL ENGINEERING" /// 
2401 "AEROSPACE ENGINEERING" /// 
2402 "BIOLOGICAL ENGINEERING" /// 
2403 "ARCHITECTURAL ENGINEERING" /// 
2404 "BIOMEDICAL ENGINEERING" /// 
2405 "CHEMICAL ENGINEERING" /// 
2406 "CIVIL ENGINEERING" /// 
2407 "COMPUTER ENGINEERING" /// 
2408 "ELECTRICAL ENGINEERING" /// 
2409 "ENGINEERING MECHANICS PHYSICS AND SCIENCE" /// 
2410 "ENVIRONMENTAL ENGINEERING" /// 
2411 "GEOLOGICAL AND GEOPHYSICAL ENGINEERING" /// 
2412 "INDUSTRIAL AND MANUFACTURING ENGINEERING" /// 
2413 "MATERIALS ENGINEERING AND MATERIALS SCIENCE" /// 
2414 "MECHANICAL ENGINEERING" /// 
2415 "METALLURGICAL ENGINEERING" /// 
2416 "MINING AND MINERAL ENGINEERING" /// 
2417 "NAVAL ARCHITECTURE AND MARINE ENGINEERING" /// 
2418 "NUCLEAR ENGINEERING" /// 
2419 "PETROLEUM ENGINEERING" /// 
2499 "MISCELLANEOUS ENGINEERING" /// 
2500 "ENGINEERING TECHNOLOGIES" /// 
2501 "ENGINEERING AND INDUSTRIAL MANAGEMENT" /// 
2502 "ELECTRICAL ENGINEERING TECHNOLOGY" /// 
2503 "INDUSTRIAL PRODUCTION TECHNOLOGIES" /// 
2504 "MECHANICAL ENGINEERING RELATED TECHNOLOGIES" /// 
2599 "MISCELLANEOUS ENGINEERING TECHNOLOGIES" /// 
2601 "LINGUISTICS AND COMPARATIVE LANGUAGE AND LITERATURE" /// 
2602 "FRENCH GERMAN LATIN AND OTHER COMMON FOREIGN LANGUAGE STUDIES" /// 
2603 "OTHER FOREIGN LANGUAGES" /// 
2901 "FAMILY AND CONSUMER SCIENCES" /// 
3201 "COURT REPORTING" /// 
3202 "PRE-LAW AND LEGAL STUDIES" /// 
3301 "ENGLISH LANGUAGE AND LITERATURE" /// 
3302 "COMPOSITION AND RHETORIC" /// 
3401 "LIBERAL ARTS" /// 
3402 "HUMANITIES" /// 
3501 "LIBRARY SCIENCE" /// 
3600 "BIOLOGY" /// 
3601 "BIOCHEMICAL SCIENCES" /// 
3602 "BOTANY" /// 
3603 "MOLECULAR BIOLOGY" /// 
3604 "ECOLOGY" /// 
3605 "GENETICS" /// 
3606 "MICROBIOLOGY" /// 
3607 "PHARMACOLOGY" /// 
3608 "PHYSIOLOGY" /// 
3609 "ZOOLOGY" /// 
3611 "NEUROSCIENCE" /// 
3699 "MISCELLANEOUS BIOLOGY" /// 
3700 "MATHEMATICS" /// 
3701 "APPLIED MATHEMATICS" /// 
3702 "STATISTICS AND DECISION SCIENCE" /// 
3801 "MILITARY TECHNOLOGIES" /// 
4000 "MULTI/INTERDISCIPLINARY STUDIES" /// 
4001 "INTERCULTURAL AND INTERNATIONAL STUDIES" /// 
4002 "NUTRITION SCIENCES" /// 
4005 "MATHEMATICS AND COMPUTER SCIENCE" /// 
4006 "COGNITIVE SCIENCE AND BIOPSYCHOLOGY" /// 
4007 "INTERDISCIPLINARY SOCIAL SCIENCES" /// 
4101 "PHYSICAL FITNESS PARKS RECREATION AND LEISURE" /// 
4801 "PHILOSOPHY AND RELIGIOUS STUDIES" /// 
4901 "THEOLOGY AND RELIGIOUS VOCATIONS" /// 
5000 "PHYSICAL SCIENCES" /// 
5001 "ASTRONOMY AND ASTROPHYSICS" /// 
5002 "ATMOSPHERIC SCIENCES AND METEOROLOGY" /// 
5003 "CHEMISTRY" /// 
5004 "GEOLOGY AND EARTH SCIENCE" /// 
5005 "GEOSCIENCES" /// 
5006 "OCEANOGRAPHY" /// 
5007 "PHYSICS" /// 
5008 "MATERIALS SCIENCE" /// 
5098 "MULTI-DISCIPLINARY OR GENERAL SCIENCE" /// 
5102 "NUCLEAR, INDUSTRIAL RADIOLOGY, AND BIOLOGICAL TECHNOLOGIES" /// 
5200 "PSYCHOLOGY" /// 
5201 "EDUCATIONAL PSYCHOLOGY" /// 
5202 "CLINICAL PSYCHOLOGY" /// 
5203 "COUNSELING PSYCHOLOGY" /// 
5205 "INDUSTRIAL AND ORGANIZATIONAL PSYCHOLOGY" /// 
5206 "SOCIAL PSYCHOLOGY" /// 
5299 "MISCELLANEOUS PSYCHOLOGY" /// 
5301 "CRIMINAL JUSTICE AND FIRE PROTECTION" /// 
5401 "PUBLIC ADMINISTRATION" /// 
5402 "PUBLIC POLICY" /// 
5403 "HUMAN SERVICES AND COMMUNITY ORGANIZATION" /// 
5404 "SOCIAL WORK" /// 
5500 "GENERAL SOCIAL SCIENCES" /// 
5501 "ECONOMICS" /// 
5502 "ANTHROPOLOGY AND ARCHEOLOGY" /// 
5503 "CRIMINOLOGY" /// 
5504 "GEOGRAPHY" /// 
5505 "INTERNATIONAL RELATIONS" /// 
5506 "POLITICAL SCIENCE AND GOVERNMENT" /// 
5507 "SOCIOLOGY" /// 
5599 "MISCELLANEOUS SOCIAL SCIENCES" /// 
5601 "CONSTRUCTION SERVICES" /// 
5701 "ELECTRICAL, MECHANICAL, AND PRECISION TECHNOLOGIES AND PRODUCTION" /// 
5901 "TRANSPORTATION SCIENCES AND TECHNOLOGIES" /// 
6000 "FINE ARTS" /// 
6001 "DRAMA AND THEATER ARTS" /// 
6002 "MUSIC" /// 
6003 "VISUAL AND PERFORMING ARTS" /// 
6004 "COMMERCIAL ART AND GRAPHIC DESIGN" /// 
6005 "FILM VIDEO AND PHOTOGRAPHIC ARTS" /// 
6006 "ART HISTORY AND CRITICISM" /// 
6007 "STUDIO ARTS" /// 
6099 "MISCELLANEOUS FINE ARTS" /// 
6100 "GENERAL MEDICAL AND HEALTH SERVICES" /// 
6102 "COMMUNICATION DISORDERS SCIENCES AND SERVICES" /// 
6103 "HEALTH AND MEDICAL ADMINISTRATIVE SERVICES" /// 
6104 "MEDICAL ASSISTING SERVICES" /// 
6105 "MEDICAL TECHNOLOGIES TECHNICIANS" /// 
6106 "HEALTH AND MEDICAL PREPARATORY PROGRAMS" /// 
6107 "NURSING" /// 
6108 "PHARMACY PHARMACEUTICAL SCIENCES AND ADMINISTRATION" /// 
6109 "TREATMENT THERAPY PROFESSIONS" /// 
6110 "COMMUNITY AND PUBLIC HEALTH" /// 
6199 "MISCELLANEOUS HEALTH MEDICAL PROFESSIONS" /// 
6200 "GENERAL BUSINESS" /// 
6201 "ACCOUNTING" /// 
6202 "ACTUARIAL SCIENCE" /// 
6203 "BUSINESS MANAGEMENT AND ADMINISTRATION" /// 
6204 "OPERATIONS LOGISTICS AND E-COMMERCE" /// 
6205 "BUSINESS ECONOMICS" /// 
6206 "MARKETING AND MARKETING RESEARCH" /// 
6207 "FINANCE" /// 
6209 "HUMAN RESOURCES AND PERSONNEL MANAGEMENT" /// 
6210 "INTERNATIONAL BUSINESS" /// 
6211 "HOSPITALITY MANAGEMENT" /// 
6212 "MANAGEMENT INFORMATION SYSTEMS AND STATISTICS" /// 
6299 "MISCELLANEOUS BUSINESS & MEDICAL ADMINISTRATION" /// 
6402 "HISTORY" /// 
6403 "UNITED STATES HISTORY"
capture label values FOD2P fod2pLB


capture label variable HICOV "Health insurance coverage recode"
capture label define hicovLB ///
1 "With health insurance coverage" /// 
2 "No health insurance coverage"
capture label values HICOV hicovLB


capture label variable HISP "Recoded detailed Hispanic origin"
capture label define hispLB ///
01 "Not Spanish/Hispanic/Latino" /// 
02 "Mexican" /// 
03 "Puerto Rican" /// 
04 "Cuban" /// 
05 "Dominican" /// 
06 "Costa Rican" /// 
07 "Guatemalan" /// 
08 "Honduran" /// 
09 "Nicaraguan" /// 
10 "Panamanian" /// 
11 "Salvadoran" /// 
12 "Other Central American" /// 
13 "Argentinean" /// 
14 "Bolivian" /// 
15 "Chilean" /// 
16 "Colombian" /// 
17 "Ecuadorian" /// 
18 "Paraguayan" /// 
19 "Peruvian" /// 
20 "Uruguayan" /// 
21 "Venezuelan" /// 
22 "Other South American" /// 
23 "Spaniard" /// 
24 "All Other Spanish/Hispanic/Latino"
capture label values HISP hispLB

notes: For additional information on NAICS and SOC groupings within major categories visit our website at: http://www.census.gov/people/io/methodology/indexes.html.

capture label variable INDP "Industry recode for 2013 and later based on 2012 IND codes"
capture label define indpLB ///
0170 "AGR-CROP PRODUCTION" /// 
0180 "AGR-ANIMAL PRODUCTION AND AQUACULTURE" /// 
0190 "AGR-FORESTRY EXCEPT LOGGING" /// 
0270 "AGR-LOGGING" /// 
0280 "AGR-FISHING, HUNTING AND TRAPPING" /// 
0290 "AGR-SUPPORT ACTIVITIES FOR AGRICULTURE AND FORESTRY" /// 
0370 "EXT-OIL AND GAS EXTRACTION" /// 
0380 "EXT-COAL MINING" /// 
0390 "EXT-METAL ORE MINING" /// 
0470 "EXT-NONMETALLIC MINERAL MINING AND QUARRYING" /// 
0490 "EXT-SUPPORT ACTIVITIES FOR MINING" /// 
0570 "UTL-ELECTRIC POWER GENERATION, TRANSMISSION AND DISTRIBUTION" /// 
0580 "UTL-NATURAL GAS DISTRIBUTION" /// 
0590 "UTL-ELECTRIC AND GAS, AND OTHER COMBINATIONS" /// 
0670 "UTL-WATER, STEAM, AIR CONDITIONING, AND IRRIGATION SYSTEMS" /// 
0680 "UTL-SEWAGE TREATMENT FACILITIES" /// 
0690 "UTL-NOT SPECIFIED UTILITIES" /// 
0770 "CON-CONSTRUCTION, INCL CLEANING DURING AND IMM AFTER" /// 
1070 "MFG-ANIMAL FOOD, GRAIN AND OILSEED MILLING" /// 
1080 "MFG-SUGAR AND CONFECTIONERY PRODUCTS" /// 
1090 "MFG-FRUIT AND VEGETABLE PRESERVING AND SPECIALTY FOODS" /// 
1170 "MFG-DAIRY PRODUCTS" /// 
1180 "MFG-ANIMAL SLAUGHTERING AND PROCESSING" /// 
1190 "MFG-RETAIL BAKERIES" /// 
1270 "MFG-BAKERIES AND TORTILLA, EXCEPT RETAIL BAKERIES" /// 
1280 "MFG-SEAFOOD AND OTHER MISCELLANEOUS FOODS, N.E.C." /// 
1290 "MFG-NOT SPECIFIED FOOD INDUSTRIES" /// 
1370 "MFG-BEVERAGE" /// 
1390 "MFG-TOBACCO" /// 
1470 "MFG-FIBER, YARN, AND THREAD MILLS" /// 
1480 "MFG-FABRIC MILLS, EXCEPT KNITTING MILLS" /// 
1490 "MFG-TEXTILE AND FABRIC FINISHING AND FABRIC COATING MILLS" /// 
1570 "MFG-CARPET AND RUG MILLS" /// 
1590 "MFG-TEXTILE PRODUCT MILLS, EXCEPT CARPET AND RUG" /// 
1670 "MFG-KNITTING FABRIC MILLS, AND APPAREL KNITTING MILLS" /// 
1680 "MFG-CUT AND SEW APPAREL" /// 
1690 "MFG-APPAREL ACCESSORIES AND OTHER APPAREL" /// 
1770 "MFG-FOOTWEAR" /// 
1790 "MFG-LEATHER TANNING AND FINISHING AND OTHER ALLIED PRODUCTS MANUFACTURING" /// 
1870 "MFG-PULP, PAPER, AND PAPERBOARD MILLS" /// 
1880 "MFG-PAPERBOARD CONTAINER" /// 
1890 "MFG-MISCELLANEOUS PAPER AND PULP PRODUCTS" /// 
1990 "MFG-PRINTING AND RELATED SUPPORT ACTIVITIES" /// 
2070 "MFG-PETROLEUM REFINING" /// 
2090 "MFG-MISCELLANEOUS PETROLEUM AND COAL PRODUCTS" /// 
2170 "MFG-RESIN, SYNTHETIC RUBBER, AND FIBERS AND FILAMENTS" /// 
2180 "MFG-AGRICULTURAL CHEMICALS" /// 
2190 "MFG-PHARMACEUTICALS AND MEDICINES" /// 
2270 "MFG-PAINT, COATING, AND ADHESIVES" /// 
2280 "MFG-SOAP, CLEANING COMPOUND, AND COSMETICS" /// 
2290 "MFG-INDUSTRIAL AND MISCELLANEOUS CHEMICALS" /// 
2370 "MFG-PLASTICS PRODUCTS" /// 
2380 "MFG-TIRES" /// 
2390 "MFG-RUBBER PRODUCTS, EXCEPT TIRES" /// 
2470 "MFG-POTTERY, CERAMICS, AND PLUMBING FIXTURE MANUFACTURING" /// 
2480 "MFG- CLAY BUILDING MATERIAL AND REFRACTORIES" /// 
2490 "MFG-GLASS AND GLASS PRODUCTS" /// 
2570 "MFG-CEMENT, CONCRETE, LIME, AND GYPSUM PRODUCTS" /// 
2590 "MFG-MISCELLANEOUS NONMETALLIC MINERAL PRODUCTS" /// 
2670 "MFG-IRON AND STEEL MILLS AND STEEL PRODUCTS" /// 
2680 "MFG-ALUMINUM PRODUCTION AND PROCESSING" /// 
2690 "MFG-NONFERROUS METAL, EXCEPT ALUMINUM, PRODUCTION AND PROCESSING" /// 
2770 "MFG-FOUNDRIES" /// 
2780 "MFG-METAL FORGINGS AND STAMPINGS" /// 
2790 "MFG-CUTLERY AND HAND TOOLS" /// 
2870 "MFG-STRUCTURAL METALS, AND BOILER, TANK, AND SHIPPING CONTAINERS" /// 
2880 "MFG-MACHINE SHOPS; TURNED PRODUCTS; SCREWS, NUTS AND BOLTS" /// 
2890 "MFG-COATING, ENGRAVING, HEAT TREATING AND ALLIED ACTIVITIES" /// 
2970 "MFG-ORDNANCE" /// 
2980 "MFG-MISCELLANEOUS FABRICATED METAL PRODUCTS" /// 
2990 "MFG-NOT SPECIFIED METAL INDUSTRIES" /// 
3070 "MFG-AGRICULTURAL IMPLEMENTS" /// 
3080 "MFG-CONSTRUCTION, AND MINING AND OIL AND GAS FIELD MACHINERY" /// 
3095 "MFG-COMMERCIAL AND SERVICE INDUSTRY MACHINERY" /// 
3170 "MFG-METALWORKING MACHINERY" /// 
3180 "MFG-ENGINE, TURBINE, AND POWER TRANSMISSION EQUIPMENT" /// 
3190 "MFG-MACHINERY, N.E.C. OR NOT SPECIFIED" /// 
3365 "MFG-COMPUTER AND PERIPHERAL EQUIPMENT" /// 
3370 "MFG-COMMUNICATIONS, AND AUDIO AND VIDEO EQUIPMENT" /// 
3380 "MFG-NAVIGATIONAL, MEASURING, ELECTROMEDICAL, AND CONTROL INSTRUMENTS" /// 
3390 "MFG-ELECTRONIC COMPONENTS AND PRODUCTS, N.E.C." /// 
3470 "MFG-HOUSEHOLD APPLIANCES" /// 
3490 "MFG-ELECTRIC LIGHTING AND ELECTRICAL EQUIPMENT MANUFACTURING,AND OTHER ELECTRICAL COMPONENT MANUFACTURING,N.E.C." /// 
3570 "MFG-MOTOR VEHICLES AND MOTOR VEHICLE EQUIPMENT" /// 
3580 "MFG-AIRCRAFT AND PARTS" /// 
3590 "MFG-AEROSPACE PRODUCTS AND PARTS" /// 
3670 "MFG-RAILROAD ROLLING STOCK" /// 
3680 "MFG-SHIP AND BOAT BUILDING" /// 
3690 "MFG-OTHER TRANSPORTATION EQUIPMENT" /// 
3770 "MFG-SAWMILLS AND WOOD PRESERVATION" /// 
3780 "MFG-VENEER, PLYWOOD, AND ENGINEERED WOOD PRODUCTS" /// 
3790 "MFG-PREFABRICATED WOOD BUILDINGS AND MOBILE HOMES" /// 
3875 "MFG-MISCELLANEOUS WOOD PRODUCTS" /// 
3895 "MFG-FURNITURE AND RELATED PRODUCTS" /// 
3960 "MFG-MEDICAL EQUIPMENT AND SUPPLIES" /// 
3970 "MFG-SPORTING AND ATHLETIC GOODS, AND DOLL, TOY, AND GAME MANUFACTURING" /// 
3980 "MFG-MISCELLANEOUS MANUFACTURING, N.E.C." /// 
3990 "MFG-NOT SPECIFIED MANUFACTURING INDUSTRIES" /// 
4070 "WHL-MOTOR VEHICLE AND MOTOR VEHICLE PARTS AND SUPPLIES MERCHANT WHOLESALERS" /// 
4080 "WHL-FURNITURE AND HOME FURNISHING MERCHANT WHOLESALERS" /// 
4090 "WHL-LUMBER AND OTHER CONSTRUCTION MATERIALS MERCHANT WHOLESALERS" /// 
4170 "WHL-PROFESSIONAL AND COMMERCIAL EQUIPMENT AND SUPPLIES MERCHANT WHOLESALERS" /// 
4180 "WHL-METALS AND MINERALS, EXCEPT PETROLEUM, MERCHANT WHOLESALERS" /// 
4195 "WHL-HOUSEHOLD APPLIANCES AND ELECTRICAL AND ELECTRONIC GOODS MERCHANT WHOLESALERS" /// 
4265 "WHL-HARDWARE, AND PLUMBING AND HEATING EQUIPMENT, AND SUPPLIES MERCHANT WHOLESALERS" /// 
4270 "WHL-MACHINERY, EQUIPMENT, AND SUPPLIES MERCHANT WHOLESALERS" /// 
4280 "WHL-RECYCLABLE MATERIAL MERCHANT WHOLESALERS" /// 
4290 "WHL-MISCELLANEOUS DURABLE GOODS MERCHANT WHOLESALERS" /// 
4370 "WHL-PAPER AND PAPER PRODUCTS MERCHANT WHOLESALERS" /// 
4380 "WHL-DRUGS, SUNDRIES, AND CHEMICAL AND ALLIED PRODUCTS MERCHANT WHOLESALERS" /// 
4390 "WHL-APPAREL, PIECE GOODS, AND NOTIONS MERCHANT WHOLESALERS" /// 
4470 "WHL-GROCERY AND RELATED PRODUCT MERCHANT WHOLESALERS" /// 
4480 "WHL-FARM PRODUCT RAW MATERIAL MERCHANT WHOLESALERS" /// 
4490 "WHL-PETROLEUM AND PETROLEUM PRODUCTS MERCHANT WHOLESALERS" /// 
4560 "WHL-ALCOHOLIC BEVERAGES MERCHANT WHOLESALERS" /// 
4570 "WHL-FARM SUPPLIES MERCHANT WHOLESALERS" /// 
4580 "WHL-MISCELLANEOUS NONDURABLE GOODS MERCHANT WHOLESALERS" /// 
4585 "WHL-WHOLESALE ELECTRONIC MARKETS AND AGENTS AND BROKERS" /// 
4590 "WHL-NOT SPECIFIED WHOLESALE TRADE" /// 
4670 "RET-AUTOMOBILE DEALERS" /// 
4680 "RET-OTHER MOTOR VEHICLE DEALERS" /// 
4690 "RET-AUTOMOTIVE PARTS, ACCESSORIES, AND TIRE STORES" /// 
4770 "RET-FURNITURE AND HOME FURNISHINGS STORES" /// 
4780 "RET-HOUSEHOLD APPLIANCE STORES" /// 
4795 "RET-ELECTRONICS STORES" /// 
4870 "RET-BUILDING MATERIAL AND SUPPLIES DEALERS" /// 
4880 "RET-HARDWARE STORES" /// 
4890 "RET-LAWN AND GARDEN EQUIPMENT AND SUPPLIES STORES" /// 
4970 "RET-GROCERY STORES" /// 
4980 "RET-SPECIALTY FOOD STORES" /// 
4990 "RET-BEER, WINE, AND LIQUOR STORES" /// 
5070 "RET-PHARMACIES AND DRUG STORES" /// 
5080 "RET-HEALTH AND PERSONAL CARE, EXCEPT DRUG, STORES" /// 
5090 "RET-GASOLINE STATIONS" /// 
5170 "RET-CLOTHING STORES" /// 
5180 "RET-SHOE STORES" /// 
5190 "RET-JEWELRY, LUGGAGE, AND LEATHER GOODS STORES" /// 
5275 "RET-SPORTING GOODS, AND HOBBY AND TOY STORES" /// 
5280 "RET-SEWING, NEEDLEWORK, AND PIECE GOODS STORES" /// 
5295 "RET-MUSICAL INSTRUMENT AND SUPPLIES STORES" /// 
5370 "RET-BOOK STORES AND NEWS DEALERS" /// 
5380 "RET-DEPARTMENT AND DISCOUNT STORES" /// 
5390 "RET-MISCELLANEOUS GENERAL MERCHANDISE STORES" /// 
5470 "RET-FLORISTS" /// 
5480 "RET-OFFICE SUPPLIES AND STATIONERY STORES" /// 
5490 "RET-USED MERCHANDISE STORES" /// 
5570 "RET-GIFT, NOVELTY, AND SOUVENIR SHOPS" /// 
5580 "RET-MISCELLANEOUS RETAIL STORES" /// 
5590 "RET-ELECTRONIC SHOPPING" /// 
5591 "RET-ELECTRONIC AUCTIONS" /// 
5592 "RET-MAIL-ORDER HOUSES" /// 
5670 "RET-VENDING MACHINE OPERATORS" /// 
5680 "RET-FUEL DEALERS" /// 
5690 "RET-OTHER DIRECT SELLING ESTABLISHMENTS" /// 
5790 "RET-NOT SPECIFIED RETAIL TRADE" /// 
6070 "TRN-AIR TRANSPORTATION" /// 
6080 "TRN-RAIL TRANSPORTATION" /// 
6090 "TRN-WATER TRANSPORTATION" /// 
6170 "TRN-TRUCK TRANSPORTATION" /// 
6180 "TRN-BUS SERVICE AND URBAN TRANSIT" /// 
6190 "TRN-TAXI AND LIMOUSINE SERVICE" /// 
6270 "TRN-PIPELINE TRANSPORTATION" /// 
6280 "TRN-SCENIC AND SIGHTSEEING TRANSPORTATION" /// 
6290 "TRN-SERVICES INCIDENTAL TO TRANSPORTATION" /// 
6370 "TRN-POSTAL SERVICE" /// 
6380 "TRN-COURIERS AND MESSENGERS" /// 
6390 "TRN-WAREHOUSING AND STORAGE" /// 
6470 "INF-NEWSPAPER PUBLISHERS" /// 
6480 "INF-PERIODICAL, BOOK, AND DIRECTORY PUBLISHERS" /// 
6490 "INF-SOFTWARE PUBLISHERS" /// 
6570 "INF-MOTION PICTURE AND VIDEO INDUSTRIES" /// 
6590 "INF-SOUND RECORDING INDUSTRIES" /// 
6670 "INF-BROADCASTING, EXCEPT INTERNET" /// 
6672 "INF-INTERNET PUBLISHING AND BROADCASTING AND WEB SEARCH PORTALS" /// 
6680 "INF-WIRED TELECOMMUNICATIONS CARRIERS" /// 
6690 "INF-TELECOMMUNICATIONS, EXCEPT WIRED TELECOMMUNICATIONS CARRIERS" /// 
6695 "INF-DATA PROCESSING, HOSTING, AND RELATED SERVICES" /// 
6770 "INF-LIBRARIES AND ARCHIVES" /// 
6780 "INF-OTHER INFORMATION SERVICES, EXCEPT LIBRARIES AND ARCHIVES, AND INTERNET PUBLISHING AND BROADCASTING AND WEB SEARCH PORTALS" /// 
6870 "FIN-BANKING AND RELATED ACTIVITIES" /// 
6880 "FIN-SAVINGS INSTITUTIONS, INCLUDING CREDIT UNIONS" /// 
6890 "FIN-NONDEPOSITORY CREDIT AND RELATED ACTIVITIES" /// 
6970 "FIN-SECURITIES, COMMODITIES, FUNDS, TRUSTS, AND OTHER FINANCIAL INVESTMENTS" /// 
6990 "FIN-INSURANCE CARRIERS AND RELATED ACTIVITIES" /// 
7070 "FIN-REAL ESTATE" /// 
7080 "FIN-AUTOMOTIVE EQUIPMENT RENTAL AND LEASING" /// 
7170 "FIN-VIDEO TAPE AND DISK RENTAL" /// 
7180 "FIN-OTHER CONSUMER GOODS RENTAL" /// 
7190 "FIN-COMMERCIAL, INDUSTRIAL, AND OTHER INTANGIBLE ASSETS RENTAL AND LEASING" /// 
7270 "PRF-LEGAL SERVICES" /// 
7280 "PRF-ACCOUNTING, TAX PREPARATION, BOOKKEEPING, AND PAYROLL SERVICES" /// 
7290 "PRF-ARCHITECTURAL, ENGINEERING, AND RELATED SERVICES" /// 
7370 "PRF-SPECIALIZED DESIGN SERVICES" /// 
7380 "PRF-COMPUTER SYSTEMS DESIGN AND RELATED SERVICES" /// 
7390 "PRF-MANAGEMENT, SCIENTIFIC, AND TECHNICAL CONSULTING SERVICES" /// 
7460 "PRF-SCIENTIFIC RESEARCH AND DEVELOPMENT SERVICES" /// 
7470 "PRF-ADVERTISING, PUBLIC RELATIONS, AND RELATED SERVICES" /// 
7480 "PRF-VETERINARY SERVICES" /// 
7490 "PRF-OTHER PROFESSIONAL, SCIENTIFIC, AND TECHNICAL SERVICES" /// 
7570 "PRF-MANAGEMENT OF COMPANIES AND ENTERPRISES" /// 
7580 "PRF-EMPLOYMENT SERVICES" /// 
7590 "PRF-BUSINESS SUPPORT SERVICES" /// 
7670 "PRF-TRAVEL ARRANGEMENTS AND RESERVATION SERVICES" /// 
7680 "PRF-INVESTIGATION AND SECURITY SERVICES" /// 
7690 "PRF-SERVICES TO BUILDINGS AND DWELLINGS, EX CONSTR CLN" /// 
7770 "PRF-LANDSCAPING SERVICES" /// 
7780 "PRF-OTHER ADMINISTRATIVE AND OTHER SUPPORT SERVICES" /// 
7790 "PRF-WASTE MANAGEMENT AND REMEDIATION SERVICES" /// 
7860 "EDU-ELEMENTARY AND SECONDARY SCHOOLS" /// 
7870 "EDU-COLLEGES, UNIVERSITIES, AND PROFESSIONAL SCHOOLS, INCLUDING JUNIOR COLLEGES" /// 
7880 "EDU-BUSINESS, TECHNICAL, AND TRADE SCHOOLS AND TRAINING" /// 
7890 "EDU-OTHER SCHOOLS AND INSTRUCTION, AND EDUCATIONAL SUPPORT SERVICES" /// 
7970 "MED-OFFICES OF PHYSICIANS" /// 
7980 "MED-OFFICES OF DENTISTS" /// 
7990 "MED-OFFICES OF CHIROPRACTORS" /// 
8070 "MED-OFFICES OF OPTOMETRISTS" /// 
8080 "MED-OFFICES OF OTHER HEALTH PRACTITIONERS" /// 
8090 "MED-OUTPATIENT CARE CENTERS" /// 
8170 "MED-HOME HEALTH CARE SERVICES" /// 
8180 "MED-OTHER HEALTH CARE SERVICES" /// 
8190 "MED-HOSPITALS" /// 
8270 "MED-NURSING CARE FACILITIES (SKILLED NURSING FACILITIES)" /// 
8290 "MED-RESIDENTIAL CARE FACILITIES, EXCEPT SKILLED NURSING FACILITIES" /// 
8370 "SCA-INDIVIDUAL AND FAMILY SERVICES" /// 
8380 "SCA-COMMUNITY FOOD AND HOUSING, AND EMERGENCY SERVICES" /// 
8390 "SCA-VOCATIONAL REHABILITATION SERVICES" /// 
8470 "SCA-CHILD DAY CARE SERVICES" /// 
8560 "ENT-PERFORMING ARTS, SPECTATOR SPORTS, AND RELATED INDUSTRIES" /// 
8570 "ENT-MUSEUMS, ART GALLERIES, HISTORICAL SITES, AND SIMILAR INSTITUTIONS" /// 
8580 "ENT-BOWLING CENTERS" /// 
8590 "ENT-OTHER AMUSEMENT, GAMBLING, AND RECREATION INDUSTRIES" /// 
8660 "ENT-TRAVELER ACCOMMODATION" /// 
8670 "ENT-RECREATIONAL VEHICLE PARKS AND CAMPS, AND ROOMING AND BOARDING HOUSES" /// 
8680 "ENT-RESTAURANTS AND OTHER FOOD SERVICES" /// 
8690 "ENT-DRINKING PLACES, ALCOHOLIC BEVERAGES" /// 
8770 "SRV-AUTOMOTIVE REPAIR AND MAINTENANCE" /// 
8780 "SRV-CAR WASHES" /// 
8790 "SRV-ELECTRONIC AND PRECISION EQUIPMENT REPAIR AND MAINTENANCE" /// 
8870 "SRV-COMMERCIAL AND INDUSTRIAL MACHINERY AND EQUIPMENT REPAIR AND MAINTENANCE" /// 
8880 "SRV-PERSONAL AND HOUSEHOLD GOODS REPAIR AND MAINTENANCE" /// 
8970 "SRV-BARBER SHOPS" /// 
8980 "SRV-BEAUTY SALONS" /// 
8990 "SRV-NAIL SALONS AND OTHER PERSONAL CARE SERVICES" /// 
9070 "SRV-DRYCLEANING AND LAUNDRY SERVICES" /// 
9080 "SRV-FUNERAL HOMES, CEMETERIES AND CREMATORIES" /// 
9090 "SRV-OTHER PERSONAL SERVICES" /// 
9160 "SRV-RELIGIOUS ORGANIZATIONS" /// 
9170 "SRV-CIVIC, SOCIAL, ADVOCACY ORGANIZATIONS, AND GRANTMAKING AND GIVING SERVICES" /// 
9180 "SRV-LABOR UNIONS" /// 
9190 "SRV-BUSINESS, PROFESSIONAL, POLITICAL, AND SIMILAR ORGANIZATIONS" /// 
9290 "SRV-PRIVATE HOUSEHOLDS" /// 
9370 "ADM-EXECUTIVE OFFICES AND LEGISLATIVE BODIES" /// 
9380 "ADM-PUBLIC FINANCE ACTIVITIES" /// 
9390 "ADM-OTHER GENERAL GOVERNMENT AND SUPPORT" /// 
9470 "ADM-JUSTICE, PUBLIC ORDER, AND SAFETY ACTIVITIES" /// 
9480 "ADM-ADMINISTRATION OF HUMAN RESOURCE PROGRAMS" /// 
9490 "ADM-ADMINISTRATION OF ENVIRONMENTAL QUALITY AND HOUSING PROGRAMS" /// 
9570 "ADM-ADMINISTRATION OF ECONOMIC PROGRAMS AND SPACE RESEARCH" /// 
9590 "ADM-NATIONAL SECURITY AND INTERNATIONAL AFFAIRS" /// 
9670 "MIL-U.S. ARMY" /// 
9680 "MIL-U.S. AIR FORCE" /// 
9690 "MIL-U.S. NAVY" /// 
9770 "MIL-U.S. MARINES" /// 
9780 "MIL-U.S. COAST GUARD" /// 
9790 "MIL-U.S. ARMED FORCES, BRANCH NOT SPECIFIED" /// 
9870 "MIL-MILITARY RESERVES OR NATIONAL GUARD" /// 
9920 "UNEMPLOYED AND LAST WORKED 5 YEARS AGO OR EARLIER OR NEVER WORKED**"
capture label values INDP indpLB


capture label variable JWAP "Time of arrival at work - hour and minute"
capture label define jwapLB ///
001 "12:00 a.m. to 12:04 a.m." /// 
002 "12:05 a.m. to 12:09 a.m." /// 
003 "12:10 a.m. to 12:14 a.m." /// 
004 "12:15 a.m. to 12:19 a.m." /// 
005 "12:20 a.m. to 12:24 a.m." /// 
006 "12:25 a.m. to 12:29 a.m." /// 
007 "12:30 a.m. to 12:39 a.m." /// 
008 "12:40 a.m. to 12:44 a.m." /// 
009 "12:45 a.m. to 12:49 a.m." /// 
010 "12:50 a.m. to 12:59 a.m." /// 
011 "1:00 a.m. to 1:04 a.m." /// 
012 "1:05 a.m. to 1:09 a.m." /// 
013 "1:10 a.m. to 1:14 a.m." /// 
014 "1:15 a.m. to 1:19 a.m." /// 
015 "1:20 a.m. to 1:24 a.m." /// 
016 "1:25 a.m. to 1:29 a.m." /// 
017 "1:30 a.m. to 1:34 a.m." /// 
018 "1:35 a.m. to 1:39 a.m." /// 
019 "1:40 a.m. to 1:44 a.m." /// 
020 "1:45 a.m. to 1:49 a.m." /// 
021 "1:50 a.m. to 1:59 a.m." /// 
022 "2:00 a.m. to 2:04 a.m." /// 
023 "2:05 a.m. to 2:09 a.m." /// 
024 "2:10 a.m. to 2:14 a.m." /// 
025 "2:15 a.m. to 2:19 a.m." /// 
026 "2:20 a.m. to 2:24 a.m." /// 
027 "2:25 a.m. to 2:29 a.m." /// 
028 "2:30 a.m. to 2:34 a.m." /// 
029 "2:35 a.m. to 2:39 a.m." /// 
030 "2:40 a.m. to 2:44 a.m." /// 
031 "2:45 a.m. to 2:49 a.m." /// 
032 "2:50 a.m. to 2:54 a.m." /// 
033 "2:55 a.m. to 2:59 a.m." /// 
034 "3:00 a.m. to 3:04 a.m." /// 
035 "3:05 a.m. to 3:09 a.m." /// 
036 "3:10 a.m. to 3:14 a.m." /// 
037 "3:15 a.m. to 3:19 a.m." /// 
038 "3:20 a.m. to 3:24 a.m." /// 
039 "3:25 a.m. to 3:29 a.m." /// 
040 "3:30 a.m. to 3:34 a.m." /// 
041 "3:35 a.m. to 3:39 a.m." /// 
042 "3:40 a.m. to 3:44 a.m." /// 
043 "3:45 a.m. to 3:49 a.m." /// 
044 "3:50 a.m. to 3:54 a.m." /// 
045 "3:55 a.m. to 3:59 a.m." /// 
046 "4:00 a.m. to 4:04 a.m." /// 
047 "4:05 a.m. to 4:09 a.m." /// 
048 "4:10 a.m. to 4:14 a.m." /// 
049 "4:15 a.m. to 4:19 a.m." /// 
050 "4:20 a.m. to 4:24 a.m." /// 
051 "4:25 a.m. to 4:29 a.m." /// 
052 "4:30 a.m. to 4:34 a.m." /// 
053 "4:35 a.m. to 4:39 a.m." /// 
054 "4:40 a.m. to 4:44 a.m." /// 
055 "4:45 a.m. to 4:49 a.m." /// 
056 "4:50 a.m. to 4:54 a.m." /// 
057 "4:55 a.m. to 4:59 a.m." /// 
058 "5:00 a.m. to 5:04 a.m." /// 
059 "5:05 a.m. to 5:09 a.m." /// 
060 "5:10 a.m. to 5:14 a.m." /// 
061 "5:15 a.m. to 5:19 a.m." /// 
062 "5:20 a.m. to 5:24 a.m." /// 
063 "5:25 a.m. to 5:29 a.m." /// 
064 "5:30 a.m. to 5:34 a.m." /// 
065 "5:35 a.m. to 5:39 a.m." /// 
066 "5:40 a.m. to 5:44 a.m." /// 
067 "5:45 a.m. to 5:49 a.m." /// 
068 "5:50 a.m. to 5:54 a.m." /// 
069 "5:55 a.m. to 5:59 a.m." /// 
070 "6:00 a.m. to 6:04 a.m." /// 
071 "6:05 a.m. to 6:09 a.m." /// 
072 "6:10 a.m. to 6:14 a.m." /// 
073 "6:15 a.m. to 6:19 a.m." /// 
074 "6:20 a.m. to 6:24 a.m." /// 
075 "6:25 a.m. to 6:29 a.m." /// 
076 "6:30 a.m. to 6:34 a.m." /// 
077 "6:35 a.m. to 6:39 a.m." /// 
078 "6:40 a.m. to 6:44 a.m." /// 
079 "6:45 a.m. to 6:49 a.m." /// 
080 "6:50 a.m. to 6:54 a.m." /// 
081 "6:55 a.m. to 6:59 a.m." /// 
082 "7:00 a.m. to 7:04 a.m." /// 
083 "7:05 a.m. to 7:09 a.m." /// 
084 "7:10 a.m. to 7:14 a.m." /// 
085 "7:15 a.m. to 7:19 a.m." /// 
086 "7:20 a.m. to 7:24 a.m." /// 
087 "7:25 a.m. to 7:29 a.m." /// 
088 "7:30 a.m. to 7:34 a.m." /// 
089 "7:35 a.m. to 7:39 a.m." /// 
090 "7:40 a.m. to 7:44 a.m." /// 
091 "7:45 a.m. to 7:49 a.m." /// 
092 "7:50 a.m. to 7:54 a.m." /// 
093 "7:55 a.m. to 7:59 a.m." /// 
094 "8:00 a.m. to 8:04 a.m." /// 
095 "8:05 a.m. to 8:09 a.m." /// 
096 "8:10 a.m. to 8:14 a.m." /// 
097 "8:15 a.m. to 8:19 a.m." /// 
098 "8:20 a.m. to 8:24 a.m." /// 
099 "8:25 a.m. to 8:29 a.m." /// 
100 "8:30 a.m. to 8:34 a.m." /// 
101 "8:35 a.m. to 8:39 a.m." /// 
102 "8:40 a.m. to 8:44 a.m." /// 
103 "8:45 a.m. to 8:49 a.m." /// 
104 "8:50 a.m. to 8:54 a.m." /// 
105 "8:55 a.m. to 8:59 a.m." /// 
106 "9:00 a.m. to 9:04 a.m." /// 
107 "9:05 a.m. to 9:09 a.m." /// 
108 "9:10 a.m. to 9:14 a.m." /// 
109 "9:15 a.m. to 9:19 a.m." /// 
110 "9:20 a.m. to 9:24 a.m." /// 
111 "9:25 a.m. to 9:29 a.m." /// 
112 "9:30 a.m. to 9:34 a.m." /// 
113 "9:35 a.m. to 9:39 a.m." /// 
114 "9:40 a.m. to 9:44 a.m." /// 
115 "9:45 a.m. to 9:49 a.m." /// 
116 "9:50 a.m. to 9:54 a.m." /// 
117 "9:55 a.m. to 9:59 a.m." /// 
118 "10:00 a.m. to 10:04 a.m." /// 
119 "10:05 a.m. to 10:09 a.m." /// 
120 "10:10 a.m. to 10:14 a.m." /// 
121 "10:15 a.m. to 10:19 a.m." /// 
122 "10:20 a.m. to 10:24 a.m." /// 
123 "10:25 a.m. to 10:29 a.m." /// 
124 "10:30 a.m. to 10:34 a.m." /// 
125 "10:35 a.m. to 10:39 a.m." /// 
126 "10:40 a.m. to 10:44 a.m." /// 
127 "10:45 a.m. to 10:49 a.m." /// 
128 "10:50 a.m. to 10:54 a.m." /// 
129 "10:55 a.m. to 10:59 a.m." /// 
130 "11:00 a.m. to 11:04 a.m." /// 
131 "11:05 a.m. to 11:09 a.m." /// 
132 "11:10 a.m. to 11:14 a.m." /// 
133 "11:15 a.m. to 11:19 a.m." /// 
134 "11:20 a.m. to 11:24 a.m." /// 
135 "11:25 a.m. to 11:29 a.m." /// 
136 "11:30 a.m. to 11:34 a.m." /// 
137 "11:35 a.m. to 11:39 a.m." /// 
138 "11:40 a.m. to 11:44 a.m." /// 
139 "11:45 a.m. to 11:49 a.m." /// 
140 "11:50 a.m. to 11:54 a.m." /// 
141 "11:55 a.m. to 11:59 a.m." /// 
142 "12:00 p.m. to 12:04 p.m." /// 
143 "12:05 p.m. to 12:09 p.m." /// 
144 "12:10 p.m. to 12:14 p.m." /// 
145 "12:15 p.m. to 12:19 p.m." /// 
146 "12:20 p.m. to 12:24 p.m." /// 
147 "12:25 p.m. to 12:29 p.m." /// 
148 "12:30 p.m. to 12:34 p.m." /// 
149 "12:35 p.m. to 12:39 p.m." /// 
150 "12:40 p.m. to 12:44 p.m." /// 
151 "12:45 p.m. to 12:49 p.m." /// 
152 "12:50 p.m. to 12:54 p.m." /// 
153 "12:55 p.m. to 12:59 p.m." /// 
154 "1:00 p.m. to 1:04 p.m." /// 
155 "1:05 p.m. to 1:09 p.m." /// 
156 "1:10 p.m. to 1:14 p.m." /// 
157 "1:15 p.m. to 1:19 p.m." /// 
158 "1:20 p.m. to 1:24 p.m." /// 
159 "1:25 p.m. to 1:29 p.m." /// 
160 "1:30 p.m. to 1:34 p.m." /// 
161 "1:35 p.m. to 1:39 p.m." /// 
162 "1:40 p.m. to 1:44 p.m." /// 
163 "1:45 p.m. to 1:49 p.m." /// 
164 "1:50 p.m. to 1:54 p.m." /// 
165 "1:55 p.m. to 1:59 p.m." /// 
166 "2:00 p.m. to 2:04 p.m." /// 
167 "2:05 p.m. to 2:09 p.m." /// 
168 "2:10 p.m. to 2:14 p.m." /// 
169 "2:15 p.m. to 2:19 p.m." /// 
170 "2:20 p.m. to 2:24 p.m." /// 
171 "2:25 p.m. to 2:29 p.m." /// 
172 "2:30 p.m. to 2:34 p.m." /// 
173 "2:35 p.m. to 2:39 p.m." /// 
174 "2:40 p.m. to 2:44 p.m." /// 
175 "2:45 p.m. to 2:49 p.m." /// 
176 "2:50 p.m. to 2:54 p.m." /// 
177 "2:55 p.m. to 2:59 p.m." /// 
178 "3:00 p.m. to 3:04 p.m." /// 
179 "3:05 p.m. to 3:09 p.m." /// 
180 "3:10 p.m. to 3:14 p.m." /// 
181 "3:15 p.m. to 3:19 p.m." /// 
182 "3:20 p.m. to 3:24 p.m." /// 
183 "3:25 p.m. to 3:29 p.m." /// 
184 "3:30 p.m. to 3:34 p.m." /// 
185 "3:35 p.m. to 3:39 p.m." /// 
186 "3:40 p.m. to 3:44 p.m." /// 
187 "3:45 p.m. to 3:49 p.m." /// 
188 "3:50 p.m. to 3:54 p.m." /// 
189 "3:55 p.m. to 3:59 p.m." /// 
190 "4:00 p.m. to 4:04 p.m." /// 
191 "4:05 p.m. to 4:09 p.m." /// 
192 "4:10 p.m. to 4:14 p.m." /// 
193 "4:15 p.m. to 4:19 p.m." /// 
194 "4:20 p.m. to 4:24 p.m." /// 
195 "4:25 p.m. to 4:29 p.m." /// 
196 "4:30 p.m. to 4:34 p.m." /// 
197 "4:35 p.m. to 4:39 p.m." /// 
198 "4:40 p.m. to 4:44 p.m." /// 
199 "4:45 p.m. to 4:49 p.m." /// 
200 "4:50 p.m. to 4:54 p.m." /// 
201 "4:55 p.m. to 4:59 p.m." /// 
202 "5:00 p.m. to 5:04 p.m." /// 
203 "5:05 p.m. to 5:09 p.m." /// 
204 "5:10 p.m. to 5:14 p.m." /// 
205 "5:15 p.m. to 5:19 p.m." /// 
206 "5:20 p.m. to 5:24 p.m." /// 
207 "5:25 p.m. to 5:29 p.m." /// 
208 "5:30 p.m. to 5:34 p.m." /// 
209 "5:35 p.m. to 5:39 p.m." /// 
210 "5:40 p.m. to 5:44 p.m." /// 
211 "5:45 p.m. to 5:49 p.m." /// 
212 "5:50 p.m. to 5:54 p.m." /// 
213 "5:55 p.m. to 5:59 p.m." /// 
214 "6:00 p.m. to 6:04 p.m." /// 
215 "6:05 p.m. to 6:09 p.m." /// 
216 "6:10 p.m. to 6:14 p.m." /// 
217 "6:15 p.m. to 6:19 p.m." /// 
218 "6:20 p.m. to 6:24 p.m." /// 
219 "6:25 p.m. to 6:29 p.m." /// 
220 "6:30 p.m. to 6:34 p.m." /// 
221 "6:35 p.m. to 6:39 p.m." /// 
222 "6:40 p.m. to 6:44 p.m." /// 
223 "6:45 p.m. to 6:49 p.m." /// 
224 "6:50 p.m. to 6:54 p.m." /// 
225 "6:55 p.m. to 6:59 p.m." /// 
226 "7:00 p.m. to 7:04 p.m." /// 
227 "7:05 p.m. to 7:09 p.m." /// 
228 "7:10 p.m. to 7:14 p.m." /// 
229 "7:15 p.m. to 7:19 p.m." /// 
230 "7:20 p.m. to 7:24 p.m." /// 
231 "7:25 p.m. to 7:29 p.m." /// 
232 "7:30 p.m. to 7:34 p.m." /// 
233 "7:35 p.m. to 7:39 p.m." /// 
234 "7:40 p.m. to 7:44 p.m." /// 
235 "7:45 p.m. to 7:49 p.m." /// 
236 "7:50 p.m. to 7:54 p.m." /// 
237 "7:55 p.m. to 7:59 p.m." /// 
238 "8:00 p.m. to 8:04 p.m." /// 
239 "8:05 p.m. to 8:09 p.m." /// 
240 "8:10 p.m. to 8:14 p.m." /// 
241 "8:15 p.m. to 8:19 p.m." /// 
242 "8:20 p.m. to 8:24 p.m." /// 
243 "8:25 p.m. to 8:29 p.m." /// 
244 "8:30 p.m. to 8:34 p.m." /// 
245 "8:35 p.m. to 8:39 p.m." /// 
246 "8:40 p.m. to 8:44 p.m." /// 
247 "8:45 p.m. to 8:49 p.m." /// 
248 "8:50 p.m. to 8:54 p.m." /// 
249 "8:55 p.m. to 8:59 p.m." /// 
250 "9:00 p.m. to 9:04 p.m." /// 
251 "9:05 p.m. to 9:09 p.m." /// 
252 "9:10 p.m. to 9:14 p.m." /// 
253 "9:15 p.m. to 9:19 p.m." /// 
254 "9:20 p.m. to 9:24 p.m." /// 
255 "9:25 p.m. to 9:29 p.m." /// 
256 "9:30 p.m. to 9:34 p.m." /// 
257 "9:35 p.m. to 9:39 p.m." /// 
258 "9:40 p.m. to 9:44 p.m." /// 
259 "9:45 p.m. to 9:49 p.m." /// 
260 "9:50 p.m. to 9:54 p.m." /// 
261 "9:55 p.m. to 9:59 p.m." /// 
262 "10:00 p.m. to 10:04 p.m." /// 
263 "10:05 p.m. to 10:09 p.m." /// 
264 "10:10 p.m. to 10:14 p.m." /// 
265 "10:15 p.m. to 10:19 p.m." /// 
266 "10:20 p.m. to 10:24 p.m." /// 
267 "10:25 p.m. to 10:29 p.m." /// 
268 "10:30 p.m. to 10:34 p.m." /// 
269 "10:35 p.m. to 10:39 p.m." /// 
270 "10:40 p.m. to 10:44 p.m." /// 
271 "10:45 p.m. to 10:49 p.m." /// 
272 "10:50 p.m. to 10:55 p.m." /// 
273 "10:55 p.m. to 10:59 p.m." /// 
274 "11:00 p.m. to 11:04 p.m." /// 
275 "11:05 p.m. to 11:09 p.m." /// 
276 "11:10 p.m. to 11:14 p.m." /// 
277 "11:15 p.m. to 11:19 p.m." /// 
278 "11:20 p.m. to 11:24 p.m." /// 
279 "11:25 p.m. to 11:29 p.m." /// 
280 "11:30 p.m. to 11:34 p.m." /// 
281 "11:35 p.m. to 11:39 p.m." /// 
282 "11:40 p.m. to 11:44 p.m." /// 
283 "11:45 p.m. to 11:49 p.m." /// 
284 "11:50 p.m. to 11:54 p.m." /// 
285 "11:55 p.m. to 11:59 p.m."
capture label values JWAP jwapLB


capture label variable JWDP "Time of departure for work - hour and minute"
capture label define jwdpLB ///
001 "12:00 a.m. to 12:29 a.m." /// 
002 "12:30 a.m. to 12:59 a.m." /// 
003 "1:00 a.m. to 1:29 a.m." /// 
004 "1:30 a.m. to 1:59 a.m." /// 
005 "2:00 a.m. to 2:29 a.m." /// 
006 "2:30 a.m. to 2:59 a.m." /// 
007 "3:00 a.m. to 3:09 a.m." /// 
008 "3:10 a.m. to 3:19 a.m." /// 
009 "3:20 a.m. to 3:29 a.m." /// 
010 "3:30 a.m. to 3:39 a.m." /// 
011 "3:40 a.m. to 3:49 a.m." /// 
012 "3:50 a.m. to 3:59 a.m." /// 
013 "4:00 a.m. to 4:09 a.m." /// 
014 "4:10 a.m. to 4:19 a.m." /// 
015 "4:20 a.m. to 4:29 a.m." /// 
016 "4:30 a.m. to 4:39 a.m." /// 
017 "4:40 a.m. to 4:49 a.m." /// 
018 "4:50 a.m. to 4:59 a.m." /// 
019 "5:00 a.m. to 5:04 a.m." /// 
020 "5:05 a.m. to 5:09 a.m." /// 
021 "5:10 a.m. to 5:14 a.m." /// 
022 "5:15 a.m. to 5:19 a.m." /// 
023 "5:20 a.m. to 5:24 a.m." /// 
024 "5:25 a.m. to 5:29 a.m." /// 
025 "5:30 a.m. to 5:34 a.m." /// 
026 "5:35 a.m. to 5:39 a.m." /// 
027 "5:40 a.m. to 5:44 a.m." /// 
028 "5:45 a.m. to 5:49 a.m." /// 
029 "5:50 a.m. to 5:54 a.m." /// 
030 "5:55 a.m. to 5:59 a.m." /// 
031 "6:00 a.m. to 6:04 a.m." /// 
032 "6:05 a.m. to 6:09 a.m." /// 
033 "6:10 a.m. to 6:14 a.m." /// 
034 "6:15 a.m. to 6:19 a.m." /// 
035 "6:20 a.m. to 6:24 a.m." /// 
036 "6:25 a.m. to 6:29 a.m." /// 
037 "6:30 a.m. to 6:34 a.m." /// 
038 "6:35 a.m. to 6:39 a.m." /// 
039 "6:40 a.m. to 6:44 a.m." /// 
040 "6:45 a.m. to 6:49 a.m." /// 
041 "6:50 a.m. to 6:54 a.m." /// 
042 "6:55 a.m. to 6:59 a.m." /// 
043 "7:00 a.m. to 7:04 a.m." /// 
044 "7:05 a.m. to 7:09 a.m." /// 
045 "7:10 a.m. to 7:14 a.m." /// 
046 "7:15 a.m. to 7:19 a.m." /// 
047 "7:20 a.m. to 7:24 a.m." /// 
048 "7:25 a.m. to 7:29 a.m." /// 
049 "7:30 a.m. to 7:34 a.m." /// 
050 "7:35 a.m. to 7:39 a.m." /// 
051 "7:40 a.m. to 7:44 a.m." /// 
052 "7:45 a.m. to 7:49 a.m." /// 
053 "7:50 a.m. to 7:54 a.m." /// 
054 "7:55 a.m. to 7:59 a.m." /// 
055 "8:00 a.m. to 8:04 a.m." /// 
056 "8:05 a.m. to 8:09 a.m." /// 
057 "8:10 a.m. to 8:14 a.m." /// 
058 "8:15 a.m. to 8:19 a.m." /// 
059 "8:20 a.m. to 8:24 a.m." /// 
060 "8:25 a.m. to 8:29 a.m." /// 
061 "8:30 a.m. to 8:34 a.m." /// 
062 "8:35 a.m. to 8:39 a.m." /// 
063 "8:40 a.m. to 8:44 a.m." /// 
064 "8:45 a.m. to 8:49 a.m." /// 
065 "8:50 a.m. to 8:54 a.m." /// 
066 "8:55 a.m. to 8:59 a.m." /// 
067 "9:00 a.m. to 9:04 a.m." /// 
068 "9:05 a.m. to 9:09 a.m." /// 
069 "9:10 a.m. to 9:14 a.m." /// 
070 "9:15 a.m. to 9:19 a.m." /// 
071 "9:20 a.m. to 9:24 a.m." /// 
072 "9:25 a.m. to 9:29 a.m." /// 
073 "9:30 a.m. to 9:34 a.m." /// 
074 "9:35 a.m. to 9:39 a.m." /// 
075 "9:40 a.m. to 9:44 a.m." /// 
076 "9:45 a.m. to 9:49 a.m." /// 
077 "9:50 a.m. to 9:54 a.m." /// 
078 "9:55 a.m. to 9:59 a.m." /// 
079 "10:00 a.m. to 10:09 a.m." /// 
080 "10:10 a.m. to 10:19 a.m." /// 
081 "10:20 a.m. to 10:29 a.m." /// 
082 "10:30 a.m. to 10:39 a.m." /// 
083 "10:40 a.m. to 10:49 a.m." /// 
084 "10:50 a.m. to 10:59 a.m." /// 
085 "11:00 a.m. to 11:09 a.m." /// 
086 "11:10 a.m. to 11:19 a.m." /// 
087 "11:20 a.m. to 11:29 a.m." /// 
088 "11:30 a.m. to 11:39 a.m." /// 
089 "11:40 a.m. to 11:49 a.m." /// 
090 "11:50 a.m. to 11:59 a.m." /// 
091 "12:00 p.m. to 12:09 p.m." /// 
092 "12:10 p.m. to 12:19 p.m." /// 
093 "12:20 p.m. to 12:29 p.m." /// 
094 "12:30 p.m. to 12:39 p.m." /// 
095 "12:40 p.m. to 12:49 p.m." /// 
096 "12:50 p.m. to 12:59 p.m." /// 
097 "1:00 p.m. to 1:09 p.m." /// 
098 "1:10 p.m. to 1:19 p.m." /// 
099 "1:20 p.m. to 1:29 p.m." /// 
100 "1:30 p.m. to 1:39 p.m." /// 
101 "1:40 p.m. to 1:49 p.m." /// 
102 "1:50 p.m. to 1:59 p.m." /// 
103 "2:00 p.m. to 2:09 p.m." /// 
104 "2:10 p.m. to 2:19 p.m." /// 
105 "2:20 p.m. to 2:29 p.m." /// 
106 "2:30 p.m. to 2:39 p.m." /// 
107 "2:40 p.m. to 2:49 p.m." /// 
108 "2:50 p.m. to 2:59 p.m." /// 
109 "3:00 p.m. to 3:09 p.m." /// 
110 "3:10 p.m. to 3:19 p.m." /// 
111 "3:20 p.m. to 3:29 p.m." /// 
112 "3:30 p.m. to 3:39 p.m." /// 
113 "3:40 p.m. to 3:49 p.m." /// 
114 "3:50 p.m. to 3:59 p.m." /// 
115 "4:00 p.m. to 4:09 p.m." /// 
116 "4:10 p.m. to 4:19 p.m." /// 
117 "4:20 p.m. to 4:29 p.m." /// 
118 "4:30 p.m. to 4:39 p.m." /// 
119 "4:40 p.m. to 4:49 p.m." /// 
120 "4:50 p.m. to 4:59 p.m." /// 
121 "5:00 p.m. to 5:09 p.m." /// 
122 "5:10 p.m. to 5:19 p.m." /// 
123 "5:20 p.m. to 5:29 p.m." /// 
124 "5:30 p.m. to 5:39 p.m." /// 
125 "5:40 p.m. to 5:49 p.m." /// 
126 "5:50 p.m. to 5:59 p.m." /// 
127 "6:00 p.m. to 6:09 p.m." /// 
128 "6:10 p.m. to 6:19 p.m." /// 
129 "6:20 p.m. to 6:29 p.m." /// 
130 "6:30 p.m. to 6:39 p.m." /// 
131 "6:40 p.m. to 6:49 p.m." /// 
132 "6:50 p.m. to 6:59 p.m." /// 
133 "7:00 p.m. to 7:29 p.m." /// 
134 "7:30 p.m. to 7:59 p.m." /// 
135 "8:00 p.m. to 8:29 p.m." /// 
136 "8:30 p.m. to 8:59 p.m." /// 
137 "9:00 p.m. to 9:09 p.m." /// 
138 "9:10 p.m. to 9:19 p.m." /// 
139 "9:20 p.m. to 9:29 p.m." /// 
140 "9:30 p.m. to 9:39 p.m." /// 
141 "9:40 p.m. to 9:49 p.m." /// 
142 "9:50 p.m. to 9:59 p.m." /// 
143 "10:00 p.m. to 10:09 p.m." /// 
144 "10:10 p.m. to 10:19 p.m." /// 
145 "10:20 p.m. to 10:29 p.m." /// 
146 "10:30 p.m. to 10:39 p.m." /// 
147 "10:40 p.m. to 10:49 p.m." /// 
148 "10:50 p.m. to 10:59 p.m." /// 
149 "11:00 p.m. to 11:29 p.m." /// 
150 "11:30 p.m. to 11:59 p.m."
capture label values JWDP jwdpLB


capture label variable LANP "Language spoken at home"
capture label define lanpLB ///
601 "Jamaican Creole" /// 
602 "Krio" /// 
607 "German" /// 
608 "Pennsylvania Dutch" /// 
609 "Yiddish" /// 
610 "Dutch" /// 
611 "Afrikaans" /// 
614 "Swedish" /// 
615 "Danish" /// 
616 "Norwegian" /// 
619 "Italian" /// 
620 "French" /// 
622 "Patois" /// 
623 "French Creole" /// 
624 "Cajun" /// 
625 "Spanish" /// 
629 "Portuguese" /// 
631 "Romanian" /// 
635 "Irish Gaelic" /// 
637 "Greek" /// 
638 "Albanian" /// 
639 "Russian" /// 
641 "Ukrainian" /// 
642 "Czech" /// 
645 "Polish" /// 
646 "Slovak" /// 
647 "Bulgarian" /// 
648 "Macedonian" /// 
649 "Serbo-Croatian" /// 
650 "Croatian" /// 
651 "Serbian" /// 
653 "Lithuanian" /// 
654 "Latvian" /// 
655 "Armenian" /// 
656 "Persian" /// 
657 "Pashto" /// 
658 "Kurdish" /// 
662 "India N.E.C." /// 
663 "Hindi" /// 
664 "Bengali" /// 
665 "Panjabi" /// 
666 "Marathi" /// 
667 "Gujarati" /// 
671 "Urdu" /// 
674 "Nepali" /// 
675 "Sindhi" /// 
676 "Pakistan N.E.C." /// 
677 "Sinhalese" /// 
679 "Finnish" /// 
682 "Hungarian" /// 
689 "Uighur" /// 
691 "Turkish" /// 
694 "Mongolian" /// 
701 "Telugu" /// 
702 "Kannada" /// 
703 "Malayalam" /// 
704 "Tamil" /// 
708 "Chinese" /// 
711 "Cantonese" /// 
712 "Mandarin" /// 
714 "Formosan" /// 
717 "Burmese" /// 
720 "Thai" /// 
721 "Mien" /// 
722 "Hmong" /// 
723 "Japanese" /// 
724 "Korean" /// 
725 "Laotian" /// 
726 "Mon-Khmer, Cambodian" /// 
728 "Vietnamese" /// 
732 "Indonesian" /// 
739 "Malay" /// 
742 "Tagalog" /// 
743 "Bisayan" /// 
744 "Sebuano" /// 
746 "Ilocano" /// 
750 "Micronesian" /// 
752 "Chamorro" /// 
761 "Trukese" /// 
767 "Samoan" /// 
768 "Tongan" /// 
776 "Hawaiian" /// 
777 "Arabic" /// 
778 "Hebrew" /// 
779 "Syriac" /// 
780 "Amharic" /// 
783 "Cushite" /// 
791 "Swahili" /// 
792 "Bantu" /// 
793 "Mande" /// 
794 "Fulani" /// 
796 "Kru, Ibo, Yoruba" /// 
799 "African" /// 
806 "Other Algonquian languages" /// 
819 "Ojibwa" /// 
862 "Apache" /// 
864 "Navajo" /// 
907 "Dakota" /// 
924 "Keres" /// 
933 "Cherokee" /// 
964 "Zuni" /// 
985 "Other Indo-European languages" /// 
986 "Other Asian languages" /// 
988 "Other Pacific Island languages" /// 
989 "Other specified African languages" /// 
990 "Aleut-Eskimo languages" /// 
992 "South/Central American Indian languages" /// 
993 "Other Specified North American Indian languages" /// 
994 "Other languages" /// 
996 "Language not specified"
capture label values LANP lanpLB


capture label variable MIGPUMA "Migration PUMA based on 2010 Census definition"
capture label define migpumaLB ///
00001 "Did not live in the United States or in Puerto Rico one year ago" /// 
00002 "Lived in Puerto Rico one year ago and current residence is in the U.S."
capture label values MIGPUMA migpumaLB


capture label variable MIGSP "Migration recode - State or foreign country code"
capture label define migspLB ///
001 "Alabama/AL" /// 
002 "Alaska/AK" /// 
004 "Arizona/AZ" /// 
005 "Arkansas/AR" /// 
006 "California/CA" /// 
008 "Colorado/CO" /// 
009 "Connecticut/CT" /// 
010 "Delaware/DE" /// 
011 "District of Columbia/DC" /// 
012 "Florida/FL" /// 
013 "Georgia/GA" /// 
015 "Hawaii/HI" /// 
016 "Idaho/ID" /// 
017 "Illinois/IL" /// 
018 "Indiana/IN" /// 
019 "Iowa/IA" /// 
020 "Kansas/KS" /// 
021 "Kentucky/KY" /// 
022 "Louisiana/LA" /// 
023 "Maine/ME" /// 
024 "Maryland/MD" /// 
025 "Massachusetts/MA" /// 
026 "Michigan/MI" /// 
027 "Minnesota/MN" /// 
028 "Mississippi/MS" /// 
029 "Missouri/MO" /// 
030 "Montana/MT" /// 
031 "Nebraska/NE" /// 
032 "Nevada/NV" /// 
033 "New Hampshire/NH" /// 
034 "New Jersey/NJ" /// 
035 "New Mexico/NM" /// 
036 "New York/NY" /// 
037 "North Carolina/NC" /// 
038 "North Dakota/ND" /// 
039 "Ohio/OH" /// 
040 "Oklahoma/OK" /// 
041 "Oregon/OR" /// 
042 "Pennsylvania/PA" /// 
044 "Rhode Island/RI" /// 
045 "South Carolina/SC" /// 
046 "South Dakota/SD" /// 
047 "Tennessee/TN" /// 
048 "Texas/TX" /// 
049 "Utah/UT" /// 
050 "Vermont/VT" /// 
051 "Virginia/VA" /// 
053 "Washington/WA" /// 
054 "West Virginia/WV" /// 
055 "Wisconsin/WI" /// 
056 "Wyoming/WY" /// 
072 "Puerto Rico" /// 
109 "France" /// 
110 "Germany" /// 
111 "Northern Europe, Not Specified" /// 
113 "Eastern Europe, Not Specified" /// 
114 "Western Europe or Other Europe, Not Specified" /// 
120 "Italy" /// 
134 "Spain" /// 
138 "United Kingdom, Excluding England" /// 
139 "England" /// 
163 "Russia" /// 
200 "Afghanistan" /// 
207 "China, Hong Kong, Macau & Paracel Islands" /// 
210 "India" /// 
213 "Iraq" /// 
215 "Japan" /// 
217 "Korea" /// 
229 "Nepal" /// 
231 "Pakistan" /// 
233 "Philippines" /// 
235 "Saudi Arabia" /// 
240 "Taiwan" /// 
242 "Thailand" /// 
243 "Turkey" /// 
247 "Vietnam" /// 
251 "Eastern Asia, Not Specified" /// 
252 "Western Asia, Not Specified" /// 
253 "South Central Asia or Asia, Not Specified" /// 
301 "Canada" /// 
303 "Mexico" /// 
312 "El Salvador" /// 
313 "Guatemala" /// 
314 "Honduras" /// 
317 "Central America, Not Specified" /// 
327 "Cuba" /// 
329 "Dominican Republic" /// 
332 "Haiti" /// 
333 "Jamaica" /// 
344 "Caribbean and North America, Not Specified" /// 
362 "Brazil" /// 
364 "Colombia" /// 
374 "South America, Not Specified" /// 
414 "Egypt" /// 
440 "Nigeria" /// 
463 "Eastern Africa, Not Specified" /// 
467 "Western Africa, Not Specified" /// 
468 "Northern Africa or Other Africa, Not Specified" /// 
501 "Australia" /// 
555 "Other US Island Areas, Oceania, Not Specified, or At Sea"
capture label values MIGSP migspLB


capture label variable MSP "Married, spouse present/spouse absent"
capture label define mspLB ///
1 "Now married, spouse present" /// 
2 "Now married, spouse absent" /// 
3 "Widowed" /// 
4 "Divorced" /// 
5 "Separated" /// 
6 "Never married"
capture label values MSP mspLB

notes: For additional information on NAICS and SOC groupings within major categories visit our website at: http://www.census.gov/people/io/methodology/indexes.html.

capture label variable NAICSP "NAICS Industry recode for 2013 and later based on 2012 NAICS codes"
capture label define naicspLB ///
111 "AGR-CROP PRODUCTION" /// 
112 "AGR-ANIMAL PRODUCTION AND AQUACULTURE" /// 
1133 "AGR-LOGGING" /// 
113M "AGR-FORESTRY EXCEPT LOGGING" /// 
114 "AGR-FISHING, HUNTING, AND TRAPPING" /// 
115 "AGR-SUPPORT ACTIVITIES FOR AGRICULTURE AND FORESTRY" /// 
211 "EXT-OIL AND GAS EXTRACTION" /// 
2121 "EXT-COAL MINING" /// 
2122 "EXT-METAL ORE MINING" /// 
2123 "EXT-NONMETALLIC MINERAL MINING AND QUARRYING" /// 
213 "EXT-SUPPORT ACTIVITIES FOR MINING" /// 
2211P "UTL-ELECTRIC POWER GENERATION, TRANSMISSION AND DISTRIBUTION" /// 
2212P "UTL-NATURAL GAS DISTRIBUTION" /// 
22132 "UTL-SEWAGE TREATMENT FACILITIES" /// 
2213M "UTL-WATER, STEAM, AIR CONDITIONING, AND IRRIGATION SYSTEMS" /// 
221MP "UTL-ELECTRIC AND GAS, AND OTHER COMBINATIONS" /// 
22S "UTL-NOT SPECIFIED UTILITIES" /// 
23 "CON-CONSTRUCTION, INCL CLEANING DURING AND IMM AFTER" /// 
3113 "MFG-SUGAR AND CONFECTIONERY PRODUCTS" /// 
3114 "MFG-FRUIT AND VEGETABLE PRESERVING AND SPECIALTY FOODS" /// 
3115 "MFG-DAIRY PRODUCTS" /// 
3116 "MFG-ANIMAL SLAUGHTERING AND PROCESSING" /// 
3118Z "MFG-BAKERIES AND TORTILLA, EXCEPT RETAIL BAKERIES" /// 
311M1 "MFG-ANIMAL FOOD, GRAIN AND OILSEED MILLING" /// 
311M2 "MFG-SEAFOOD AND OTHER MISCELLANEOUS FOODS, N.E.C." /// 
311S "MFG-NOT SPECIFIED FOOD INDUSTRIES" /// 
3121 "MFG-BEVERAGE" /// 
3122 "MFG-TOBACCO" /// 
3131 "MFG-FIBER, YARN, AND THREAD MILLS" /// 
3132Z "MFG-FABRIC MILLS, EXCEPT KNITTING" /// 
3133 "MFG-TEXTILE AND FABRIC FINISHING AND FABRIC COATING MILLS" /// 
31411 "MFG-CARPET AND RUG MILLS" /// 
314Z "MFG-TEXTILE PRODUCT MILLS, EXCEPT CARPET AND RUG" /// 
3152 "MFG-CUT AND SEW APPAREL" /// 
3159 "MFG-APPAREL ACCESSORIES AND OTHER APPAREL" /// 
3162 "MFG-FOOTWEAR" /// 
316M "MFG-LEATHER TANNING AND FINISHING AND OTHER ALLIED PRODUCTS MANUFACTURING" /// 
31M "MFG-KNITTING FABRIC MILLS, AND APPAREL KNITTING MILLS" /// 
3211 "MFG-SAWMILLS AND WOOD PRESERVATION" /// 
3212 "MFG-VENEER, PLYWOOD, AND ENGINEERED WOOD PRODUCTS" /// 
32199M "MFG-PREFABRICATED WOOD BUILDINGS AND MOBILE HOMES" /// 
3219ZM "MFG-MISCELLANEOUS WOOD PRODUCTS" /// 
3221 "MFG-PULP, PAPER, AND PAPERBOARD MILLS" /// 
32221 "MFG-PAPERBOARD CONTAINER" /// 
3222M "MFG-MISCELLANEOUS PAPER AND PULP PRODUCTS" /// 
3231 "MFG-PRINTING AND RELATED SUPPORT ACTIVITIES" /// 
3241M "MFG-MISCELLANEOUS PETROLEUM AND COAL PRODUCTS" /// 
32411 "MFG-PETROLEUM REFINING" /// 
3252 "MFG-RESIN, SYNTHETIC RUBBER, AND FIBERS AND FILAMENTS" /// 
3253 "MFG-AGRICULTURAL CHEMICALS" /// 
3254 "MFG-PHARMACEUTICALS AND MEDICINES" /// 
3255 "MFG-PAINT, COATING, AND ADHESIVES" /// 
3256 "MFG-SOAP, CLEANING COMPOUND, AND COSMETICS" /// 
325M "MFG-INDUSTRIAL AND MISCELLANEOUS CHEMICALS" /// 
3261 "MFG-PLASTICS PRODUCTS" /// 
32621 "MFG-TIRES" /// 
3262M "MFG-RUBBER PRODUCTS, EXCEPT TIRES" /// 
32711 "MFG-POTTERY, CERAMICS, AND PLUMBING FIXTURE MANUFACTURING" /// 
327120 "MFG-CLAY BUILDING MATERIAL AND REFRACTORIES" /// 
3272 "MFG-GLASS AND GLASS PRODUCTS" /// 
3279 "MFG-MISCELLANEOUS NONMETALLIC MINERAL PRODUCTS" /// 
327M "MFG-CEMENT, CONCRETE, LIME, AND GYPSUM PRODUCTS" /// 
3313 "MFG-ALUMINUM PRODUCTION AND PROCESSING" /// 
3314 "MFG-NONFERROUS METAL, EXCEPT ALUMINUM, PRODUCTION AND PROCESSING" /// 
3315 "MFG-FOUNDRIES" /// 
331M "MFG-IRON AND STEEL MILLS AND STEEL PRODUCTS" /// 
3321 "MFG-METAL FORGINGS AND STAMPINGS" /// 
3322 "MFG-CUTLERY AND HAND TOOLS" /// 
3327 "MFG-MACHINE SHOPS; TURNED PRODUCTS; SCREWS, NUTS AND BOLTS" /// 
3328 "MFG-COATING, ENGRAVING, HEAT TREATING AND ALLIED ACTIVITIES" /// 
33299M "MFG-ORDNANCE" /// 
332M "MFG-STRUCTURAL METALS, AND BOILER, TANK, AND SHIPPING CONTAINERS" /// 
332MZ "MFG-MISCELLANEOUS FABRICATED METAL PRODUCTS" /// 
33311 "MFG-AGRICULTURAL IMPLEMENTS" /// 
3331M "MFG-CONSTRUCTION, AND MINING AND OIL AND GAS FIELD MACHINERY" /// 
3333 "MFG-COMMERCIAL AND SERVICE INDUSTRY MACHINERY" /// 
3335 "MFG-METALWORKING MACHINERY" /// 
3336 "MFG-ENGINE, TURBINE, AND POWER TRANSMISSION EQUIPMENT" /// 
333MS "MFG-MACHINERY MANUFACTURING, N.E.C. OR NOT SPECIFIED" /// 
3341 "MFG-COMPUTER AND PERIPHERAL EQUIPMENT" /// 
3345 "MFG-NAVIGATIONAL, MEASURING, ELECTROMEDICAL, AND CONTROL INSTRUMENTS" /// 
334M1 "MFG-COMMUNICATIONS, AND AUDIO AND VIDEO EQUIPMENT" /// 
334M2 "MFG-ELECTRONIC COMPONENTS AND PRODUCTS, N.E.C." /// 
3352 "MFG-HOUSEHOLD APPLIANCES" /// 
335M "MFG-ELECTRIC LIGHTING, AND ELECTRICAL EQUIPMENT MANUFACTURING, AND OTHER ELECTRICAL COMPONENT MANUFACTURING, N.E.C." /// 
33641M1 "MFG-AIRCRAFT AND PARTS" /// 
33641M2 "MFG-AEROSPACE PRODUCTS AND PARTS" /// 
3365 "MFG-RAILROAD ROLLING STOCK" /// 
3366 "MFG-SHIP AND BOAT BUILDING" /// 
3369 "MFG-OTHER TRANSPORTATION EQUIPMENT" /// 
336M "MFG-MOTOR VEHICLES AND MOTOR VEHICLE EQUIPMENT" /// 
337 "MFG-FURNITURE AND RELATED PRODUCTS" /// 
3391 "MFG-MEDICAL EQUIPMENT AND SUPPLIES" /// 
3399M "MFG-SPORTING AND ATHLETIC GOODS, AND DOLL, TOY, AND GAME MANUFACTURING" /// 
33MS "MFG-NOT SPECIFIED METAL INDUSTRIES" /// 
3MS "MFG-NOT SPECIFIED INDUSTRIES" /// 
4231 "WHL-MOTOR VEHICLES AND MOTOR VEHICLE PARTS AND SUPPLIES MERCHANT WHOLESALERS" /// 
4232 "WHL-FURNITURE AND HOME FURNISHING MERCHANT WHOLESALERS" /// 
4233 "WHL-LUMBER AND OTHER CONSTRUCTION MATERIALS MERCHANT WHOLESALERS" /// 
4234 "WHL-PROFESSIONAL AND COMMERCIAL EQUIPMENT AND SUPPLIES MERCHANT WHOLESALERS" /// 
4235 "WHL-METALS AND MINERALS, EXCEPT PETROLEUM, MERCHANT WHOLESALERS" /// 
4236 "WHL-HOUSEHOLD APPLIANCES AND ELECTRICAL AND ELECTRONIC GOODS MERCHANT WHOLESALERS" /// 
4237 "WHL-HARDWARE, AND PLUMBING AND HEATING EQUIPMENT, AND SUPPLIES MERCHANT WHOLESALERS" /// 
4238 "WHL-MACHINERY, EQUIPMENT, AND SUPPLIES MERCHANT WHOLESALERS" /// 
42393 "WHL-RECYCLABLE MATERIAL MERCHANT WHOLESALERS" /// 
4239Z "WHL-MISCELLANEOUS DURABLE GOODS MERCHANT WHOLESALERS" /// 
4241 "WHL-PAPER AND PAPER PRODUCTS MERCHANT WHOLESALERS" /// 
4243 "WHL-APPAREL, PIECE GOODS, AND NOTIONS MERCHANT WHOLESALERS" /// 
4244 "WHL-GROCERY AND RELATED PRODUCT MERCHANT WHOLESALERS" /// 
4245 "WHL-FARM PRODUCT RAW MATERIAL MERCHANT WHOLESALERS" /// 
4247 "WHL-PETROLEUM AND PETROLEUM PRODUCTS MERCHANT WHOLESALERS" /// 
4248 "WHL-ALCOHOLIC BEVERAGES MERCHANT WHOLESALERS" /// 
42491 "WHL-FARM SUPPLIES MERCHANT WHOLESALERS" /// 
4249Z "WHL-MISCELLANEOUS NONDURABLE GOODS MERCHANT WHOLESALERS" /// 
424M "WHL-DRUGS, SUNDRIES, AND CHEMICAL AND ALLIED PRODUCTS MERCHANT WHOLESALERS" /// 
4251 "WHL-WHOLESALE ELECTRONIC MARKETS AND AGENTS AND BROKERS" /// 
42S "WHL-NOT SPECIFIED WHOLESALE TRADE" /// 
4411 "RET-AUTOMOBILE DEALERS" /// 
4412 "RET-OTHER MOTOR VEHICLE DEALERS" /// 
4413 "RET-AUTOMOTIVE PARTS, ACCESSORIES, AND TIRE STORES" /// 
442 "RET-FURNITURE AND HOME FURNISHINGS STORES" /// 
443141 "RET-HOUSEHOLD APPLIANCE STORES" /// 
443142 "RET-ELECTRONICS STORES" /// 
44413 "RET-HARDWARE STORES" /// 
4441Z "RET-BUILDING MATERIAL AND SUPPLIES DEALERS" /// 
4442 "RET-LAWN AND GARDEN EQUIPMENT AND SUPPLIES STORES" /// 
4451 "RET-GROCERY STORES" /// 
4452 "RET-SPECIALTY FOOD STORES" /// 
4453 "RET-BEER, WINE, AND LIQUOR STORES" /// 
44611 "RET-PHARMACIES AND DRUG STORES" /// 
446Z "RET-HEALTH AND PERSONAL CARE, EXCEPT DRUG, STORES" /// 
447 "RET-GASOLINE STATIONS" /// 
44821 "RET-SHOE STORES" /// 
4483 "RET-JEWELRY, LUGGAGE, AND LEATHER GOODS STORES" /// 
4481 "RET-CLOTHING STORES" /// 
45113 "RET-SEWING, NEEDLEWORK, AND PIECE GOODS STORES" /// 
45114 "RET-MUSICAL INSTRUMENT AND SUPPLIES STORES" /// 
4511M "RET-SPORTING GOODS, AND HOBBY AND TOY STORES" /// 
45121 "RET-BOOK STORES AND NEWS DEALERS" /// 
45211 "RET-DEPARTMENT AND DISCOUNT STORES" /// 
4529 "RET-MISCELLANEOUS GENERAL MERCHANDISE STORES" /// 
4531 "RET-FLORISTS" /// 
45321 "RET-OFFICE SUPPLIES AND STATIONERY STORES" /// 
45322 "RET-GIFT, NOVELTY, AND SOUVENIR SHOPS" /// 
4533 "RET-USED MERCHANDISE STORES" /// 
4539 "RET-MISCELLANEOUS RETAIL STORES" /// 
454111 "RET-ELECTRONIC SHOPPING" /// 
454112 "RET-ELECTRONIC AUCTIONS" /// 
454113 "RET-MAIL-ORDER HOUSES" /// 
4542 "RET-VENDING MACHINE OPERATORS" /// 
454310 "RET-FUEL DEALERS" /// 
45439 "RET-OTHER DIRECT SELLING ESTABLISHMENTS" /// 
4MS "RET-NOT SPECIFIED RETAIL TRADE" /// 
481 "TRN-AIR TRANSPORTATION" /// 
482 "TRN-RAIL TRANSPORTATION" /// 
483 "TRN-WATER TRANSPORTATION" /// 
484 "TRN-TRUCK TRANSPORTATION" /// 
4853 "TRN-TAXI AND LIMOUSINE SERVICE" /// 
485M "TRN-BUS SERVICE AND URBAN TRANSIT" /// 
486 "TRN-PIPELINE TRANSPORTATION" /// 
487 "TRN-SCENIC AND SIGHTSEEING TRANSPORTATION" /// 
488 "TRN-SERVICES INCIDENTAL TO TRANSPORTATION" /// 
491 "TRN-POSTAL SERVICE" /// 
492 "TRN-COURIERS AND MESSENGERS" /// 
493 "TRN-WAREHOUSING AND STORAGE" /// 
51111 "INF-NEWSPAPER PUBLISHERS" /// 
5111Z "INF-PERIODICAL, BOOK, AND DIRECTORY PUBLISHERS" /// 
5112 "INF-SOFTWARE PUBLISHERS" /// 
5121 "INF-MOTION PICTURE AND VIDEO INDUSTRIES" /// 
5122 "INF-SOUND RECORDING INDUSTRIES" /// 
515 "INF-BROADCASTING, EXCEPT INTERNET" /// 
5171 "INF-WIRED TELECOMMUNICATIONS CARRIERS" /// 
517Z "INF-TELECOMMUNICATIONS, EXCEPT WIRED TELECOMMUNICATIONS CARRIERS" /// 
5182 "INF-DATA PROCESSING, HOSTING, AND RELATED SERVICES" /// 
51912 "INF-LIBRARIES AND ARCHIVES" /// 
51913 "INF-INTERNET PUBLISHING AND BROADCASTING AND WEB SEARCH PORTALS" /// 
5221M "FIN-SAVINGS INSTITUTIONS, INCLUDING CREDIT UNIONS" /// 
522M "FIN-NONDEPOSITORY CREDIT AND RELATED ACTIVITIES" /// 
524 "FIN-INSURANCE CARRIERS AND RELATED ACTIVITIES" /// 
52M1 "FIN-BANKING AND RELATED ACTIVITIES" /// 
52M2 "FIN-SECURITIES, COMMODITIES, FUNDS, TRUSTS, AND OTHER FINANCIAL INVESTMENTS" /// 
531 "FIN-REAL ESTATE" /// 
5321 "FIN-AUTOMOTIVE EQUIPMENT RENTAL AND LEASING" /// 
53223 "FIN-VIDEO TAPE AND DISK RENTAL" /// 
532M "FIN-OTHER CONSUMER GOODS RENTAL" /// 
53M "FIN-COMMERCIAL, INDUSTRIAL, AND OTHER INTANGIBLE ASSETS RENTAL AND LEASING" /// 
5411 "PRF-LEGAL SERVICES" /// 
5412 "PRF-ACCOUNTING, TAX PREPARATION, BOOKKEEPING, AND PAYROLL SERVICES" /// 
5413 "PRF-ARCHITECTURAL, ENGINEERING, AND RELATED SERVICES" /// 
5414 "PRF-SPECIALIZED DESIGN SERVICES" /// 
5415 "PRF-COMPUTER SYSTEMS DESIGN AND RELATED SERVICES" /// 
5416 "PRF-MANAGEMENT, SCIENTIFIC, AND TECHNICAL CONSULTING SERVICES" /// 
5417 "PRF-SCIENTIFIC RESEARCH AND DEVELOPMENT SERVICES" /// 
5418 "PRF-ADVERTISING, PUBLIC RELATIONS, AND RELATED SERVICES" /// 
54194 "PRF-VETERINARY SERVICES" /// 
5419Z "PRF-OTHER PROFESSIONAL, SCIENTIFIC, AND TECHNICAL SERVICES" /// 
55 "PRF-MANAGEMENT OF COMPANIES AND ENTERPRISES" /// 
5613 "PRF-EMPLOYMENT SERVICES" /// 
5614 "PRF-BUSINESS SUPPORT SERVICES" /// 
5615 "PRF-TRAVEL ARRANGEMENTS AND RESERVATION SERVICES" /// 
5616 "PRF-INVESTIGATION AND SECURITY SERVICES" /// 
56173 "PRF-LANDSCAPING SERVICES" /// 
5617Z "PRF-SERVICES TO BUILDINGS AND DWELLINGS, EX CONSTR CLN" /// 
561M "PRF-OTHER ADMINISTRATIVE AND OTHER SUPPORT SERVICES" /// 
562 "PRF-WASTE MANAGEMENT AND REMEDIATION SERVICES" /// 
6111 "EDU-ELEMENTARY AND SECONDARY SCHOOLS" /// 
611M1 "EDU-COLLEGES, UNIVERSITIES, AND PROFESSIONAL SCHOOLS, INCLUDING JUNIOR COLLEGES" /// 
611M2 "EDU-BUSINESS, TECHNICAL, AND TRADE SCHOOLS AND TRAINING" /// 
611M3 "EDU-OTHER SCHOOLS AND INSTRUCTION, AND EDUCATIONAL SUPPORT SERVICES" /// 
6211 "MED-OFFICES OF PHYSICIANS" /// 
6212 "MED-OFFICES OF DENTISTS" /// 
62131 "MED-OFFICES OF CHIROPRACTORS" /// 
62132 "MED-OFFICES OF OPTOMETRISTS" /// 
6213ZM "MED-OFFICES OF OTHER HEALTH PRACTITIONERS" /// 
6214 "MED-OUTPATIENT CARE CENTERS" /// 
6216 "MED-HOME HEALTH CARE SERVICES" /// 
621M "MED-OTHER HEALTH CARE SERVICES" /// 
622 "MED-HOSPITALS" /// 
6231 "MED-NURSING CARE FACILITIES (SKILLED NURSING FACILITIES)" /// 
623M "MED-RESIDENTIAL CARE FACILITIES, EXCEPT SKILLED NURSING FACILITIES" /// 
6241 "SCA-INDIVIDUAL AND FAMILY SERVICES" /// 
6242 "SCA-COMMUNITY FOOD AND HOUSING, AND EMERGENCY SERVICES" /// 
6243 "SCA-VOCATIONAL REHABILITATION SERVICES" /// 
6244 "SCA-CHILD DAY CARE SERVICES" /// 
711 "ENT-PERFORMING ARTS, SPECTATOR SPORTS, AND RELATED INDUSTRIES" /// 
712 "ENT-MUSEUMS, ART GALLERIES, HISTORICAL SITES, AND SIMILAR INSTITUTIONS" /// 
71395 "ENT-BOWLING CENTERS" /// 
713Z "ENT-OTHER AMUSEMENT, GAMBLING, AND RECREATION INDUSTRIES" /// 
7211 "ENT-TRAVELER ACCOMMODATION" /// 
721M "ENT-RECREATIONAL VEHICLE PARKS AND CAMPS, AND ROOMING AND BOARDING HOUSES" /// 
7224 "ENT-DRINKING PLACES, ALCOHOLIC BEVERAGES" /// 
722Z "ENT-RESTAURANTS AND OTHER FOOD SERVICES" /// 
811192 "SRV-CAR WASHES" /// 
8111Z "SRV-AUTOMOTIVE REPAIR AND MAINTENANCE" /// 
8112 "SRV-ELECTRONIC AND PRECISION EQUIPMENT REPAIR AND MAINTENANCE" /// 
8113 "SRV-COMMERCIAL AND INDUSTRIAL MACHINERY AND EQUIPMENT REPAIR AND MAINTENANCE" /// 
8114 "SRV-PERSONAL AND HOUSEHOLD GOODS REPAIR AND MAINTENANCE" /// 
812111 "SRV-BARBER SHOPS" /// 
812112 "SRV-BEAUTY SALONS" /// 
8121M "SRV-NAIL SALONS AND OTHER PERSONAL CARE SERVICES" /// 
8122 "SRV-FUNERAL HOMES, CEMETERIES AND CREMATORIES" /// 
8123 "SRV-DRYCLEANING AND LAUNDRY SERVICES" /// 
8129 "SRV-OTHER PERSONAL SERVICES" /// 
8131 "SRV-RELIGIOUS ORGANIZATIONS" /// 
81393 "SRV-LABOR UNIONS" /// 
8139Z "SRV-BUSINESS, PROFESSIONAL, POLITICAL, AND SIMILAR ORGANIZATIONS" /// 
813M "SRV-CIVIC, SOCIAL, ADVOCACY ORGANIZATIONS, AND GRANTMAKING AND GIVING SERVICES" /// 
814 "SRV-PRIVATE HOUSEHOLDS" /// 
92113 "ADM-PUBLIC FINANCE ACTIVITIES" /// 
92119 "ADM-OTHER GENERAL GOVERNMENT AND SUPPORT" /// 
9211MP "ADM-EXECUTIVE OFFICES AND LEGISLATIVE BODIES" /// 
923 "ADM-ADMINISTRATION OF HUMAN RESOURCE PROGRAMS" /// 
928110P1 "MIL-U.S. ARMY" /// 
928110P2 "MIL-U.S. AIR FORCE" /// 
928110P3 "MIL-U.S. NAVY" /// 
928110P4 "MIL-U.S. MARINES" /// 
928110P5 "MIL-U.S. COAST GUARD" /// 
928110P6 "MIL-U.S. ARMED FORCES, BRANCH NOT SPECIFIED" /// 
928110P7 "MIL-MILITARY RESERVES OR NATIONAL GUARD" /// 
928P "ADM-NATIONAL SECURITY AND INTERNATIONAL AFFAIRS" /// 
92M1 "ADM-ADMINISTRATION OF ENVIRONMENTAL QUALITY AND HOUSING PROGRAMS" /// 
92M2 "ADM-ADMINISTRATION OF ECONOMIC PROGRAMS AND SPACE RESEARCH" /// 
92MP "ADM-JUSTICE, PUBLIC ORDER, AND SAFETY ACTIVITIES" /// 
9920 "UNEMPLOYED AND LAST WORKED 5 YEARS AGO OR EARLIER OR NEVER WORKED**"
capture label values NAICSP naicspLB


capture label variable NATIVITY "Nativity"
capture label define nativityLB ///
1 "Native" /// 
2 "Foreign born"
capture label values NATIVITY nativityLB


capture label variable NOP "Nativity of parent"
capture label define nopLB ///
1 "Living with two parents: Both parents NATIVE" /// 
2 "Living with two parents: Father only FOREIGN BORN" /// 
3 "Living with two parents: Mother only FOREIGN BORN" /// 
4 "Living with two parents: BOTH parents FOREIGN BORN" /// 
5 "Living with father only: Father NATIVE" /// 
6 "Living with father only: Father FOREIGN BORN" /// 
7 "Living with mother only: Mother NATIVE" /// 
8 "Living with mother only: Mother FOREIGN BORN"
capture label values NOP nopLB


capture label variable OC "Own child"
capture label define ocLB ///
0 "No (includes GQ)" /// 
1 "Yes"
capture label values OC ocLB

notes: For additional information on NAICS and SOC groupings within major categories visit our website at: http://www.census.gov/people/io/methodology/indexes.html.

capture label variable OCCP4 "Occupation recode for 2012 and later based on 2010 OCC codes"
capture label define occp4LB ///
0010 "MGR-CHIEF EXECUTIVES AND LEGISLATORS" /// 
0020 "MGR-GENERAL AND OPERATIONS MANAGERS" /// 
0040 "MGR-ADVERTISING AND PROMOTIONS MANAGERS" /// 
0050 "MGR-MARKETING AND SALES MANAGERS" /// 
0060 "MGR-PUBLIC RELATIONS AND FUNDRAISING MANAGERS" /// 
0100 "MGR-ADMINISTRATIVE SERVICES MANAGERS" /// 
0110 "MGR-COMPUTER AND INFORMATION SYSTEMS MANAGERS" /// 
0120 "MGR-FINANCIAL MANAGERS" /// 
0135 "MGR-COMPENSATION AND BENEFITS MANAGERS" /// 
0136 "MGR-HUMAN RESOURCES MANAGERS" /// 
0137 "MGR-TRAINING AND DEVELOPMENT MANAGERS" /// 
0140 "MGR-INDUSTRIAL PRODUCTION MANAGERS" /// 
0150 "MGR-PURCHASING MANAGERS" /// 
0160 "MGR-TRANSPORTATION, STORAGE, AND DISTRIBUTION MANAGERS" /// 
0205 "MGR-FARMERS, RANCHERS, AND OTHER AGRICULTURAL MANAGERS" /// 
0220 "MGR-CONSTRUCTION MANAGERS" /// 
0230 "MGR-EDUCATION ADMINISTRATORS" /// 
0300 "MGR-ARCHITECTURAL AND ENGINEERING MANAGERS" /// 
0310 "MGR-FOOD SERVICE MANAGERS" /// 
0330 "MGR-GAMING MANAGERS" /// 
0340 "MGR-LODGING MANAGERS" /// 
0350 "MGR-MEDICAL AND HEALTH SERVICES MANAGERS" /// 
0360 "MGR-NATURAL SCIENCES MANAGERS" /// 
0410 "MGR-PROPERTY, REAL ESTATE, AND COMMUNITY ASSOCIATION MANAGERS" /// 
0420 "MGR-SOCIAL AND COMMUNITY SERVICE MANAGERS" /// 
0425 "MGR-EMERGENCY MANAGEMENT DIRECTORS" /// 
0430 "MGR-MISCELLANEOUS MANAGERS, INCLUDING FUNERAL SERVICE MANAGERS AND POSTMASTERS AND MAIL SUPERINTENDENTS" /// 
0500 "BUS-AGENTS AND BUSINESS MANAGERS OF ARTISTS, PERFORMERS, AND ATHLETES" /// 
0510 "BUS-BUYERS AND PURCHASING AGENTS, FARM PRODUCTS" /// 
0520 "BUS-WHOLESALE AND RETAIL BUYERS, EXCEPT FARM PRODUCTS" /// 
0530 "BUS-PURCHASING AGENTS, EXCEPT WHOLESALE, RETAIL, AND FARM PRODUCTS" /// 
0540 "BUS-CLAIMS ADJUSTERS, APPRAISERS, EXAMINERS, AND INVESTIGATORS" /// 
0565 "BUS-COMPLIANCE OFFICERS" /// 
0600 "BUS-COST ESTIMATORS" /// 
0630 "BUS-HUMAN RESOURCES WORKERS" /// 
0640 "BUS-COMPENSATION, BENEFITS, AND JOB ANALYSIS SPECIALISTS" /// 
0650 "BUS-TRAINING AND DEVELOPMENT SPECIALISTS" /// 
0700 "BUS-LOGISTICIANS" /// 
0710 "BUS-MANAGEMENT ANALYSTS" /// 
0725 "BUS-MEETING, CONVENTION, AND EVENT PLANNERS" /// 
0726 "BUS-FUNDRAISERS" /// 
0735 "BUS-MARKET RESEARCH ANALYSTS AND MARKETING SPECIALISTS" /// 
0740 "BUS-BUSINESS OPERATIONS SPECIALISTS, ALL OTHER" /// 
0800 "FIN-ACCOUNTANTS AND AUDITORS" /// 
0810 "FIN-APPRAISERS AND ASSESSORS OF REAL ESTATE" /// 
0820 "FIN-BUDGET ANALYSTS" /// 
0830 "FIN-CREDIT ANALYSTS" /// 
0840 "FIN-FINANCIAL ANALYSTS" /// 
0850 "FIN-PERSONAL FINANCIAL ADVISORS" /// 
0860 "FIN-INSURANCE UNDERWRITERS" /// 
0900 "FIN-FINANCIAL EXAMINERS" /// 
0910 "FIN-CREDIT COUNSELORS AND LOAN OFFICERS" /// 
0930 "FIN-TAX EXAMINERS AND COLLECTORS, AND REVENUE AGENTS" /// 
0940 "FIN-TAX PREPARERS" /// 
0950 "FIN-FINANCIAL SPECIALISTS, ALL OTHER" /// 
1005 "CMM-COMPUTER AND INFORMATION RESEARCH SCIENTISTS" /// 
1006 "CMM-COMPUTER SYSTEMS ANALYSTS" /// 
1007 "CMM-INFORMATION SECURITY ANALYSTS" /// 
1010 "CMM-COMPUTER PROGRAMMERS" /// 
1020 "CMM-SOFTWARE DEVELOPERS, APPLICATIONS AND SYSTEMS SOFTWARE" /// 
1030 "CMM-WEB DEVELOPERS" /// 
1050 "CMM-COMPUTER SUPPORT SPECIALISTS" /// 
1060 "CMM-DATABASE ADMINISTRATORS" /// 
1105 "CMM-NETWORK AND COMPUTER SYSTEMS ADMINISTRATORS" /// 
1106 "CMM-COMPUTER NETWORK ARCHITECTS" /// 
1107 "CMM-COMPUTER OCCUPATIONS, ALL OTHER" /// 
1200 "CMM-ACTUARIES" /// 
1220 "CMM-OPERATIONS RESEARCH ANALYSTS" /// 
1240 "CMM-MISCELLANEOUS MATHEMATICAL SCIENCE OCCUPATIONS, INCLUDING MATHEMATICIANS AND STATISTICIANS" /// 
1300 "ENG-ARCHITECTS, EXCEPT NAVAL" /// 
1310 "ENG-SURVEYORS, CARTOGRAPHERS, AND PHOTOGRAMMETRISTS" /// 
1320 "ENG-AEROSPACE ENGINEERS" /// 
1340 "ENG-BIOMEDICAL AND AGRICULTURAL ENGINEERS" /// 
1350 "ENG-CHEMICAL ENGINEERS" /// 
1360 "ENG-CIVIL ENGINEERS" /// 
1400 "ENG-COMPUTER HARDWARE ENGINEERS" /// 
1410 "ENG-ELECTRICAL AND ELECTRONICS ENGINEERS" /// 
1420 "ENG-ENVIRONMENTAL ENGINEERS" /// 
1430 "ENG-INDUSTRIAL ENGINEERS, INCLUDING HEALTH AND SAFETY" /// 
1440 "ENG-MARINE ENGINEERS AND NAVAL ARCHITECTS" /// 
1450 "ENG-MATERIALS ENGINEERS" /// 
1460 "ENG-MECHANICAL ENGINEERS" /// 
1520 "ENG-PETROLEUM, MINING AND GEOLOGICAL ENGINEERS, INCLUDING MINING SAFETY ENGINEERS" /// 
1530 "ENG-MISCELLANEOUS ENGINEERS, INCLUDING NUCLEAR ENGINEERS" /// 
1540 "ENG-DRAFTERS" /// 
1550 "ENG-ENGINEERING TECHNICIANS, EXCEPT DRAFTERS" /// 
1560 "ENG-SURVEYING AND MAPPING TECHNICIANS" /// 
1600 "SCI-AGRICULTURAL AND FOOD SCIENTISTS" /// 
1610 "SCI-BIOLOGICAL SCIENTISTS" /// 
1640 "SCI-CONSERVATION SCIENTISTS AND FORESTERS" /// 
1650 "SCI-MEDICAL SCIENTISTS, AND LIFE SCIENTISTS, ALL OTHER" /// 
1700 "SCI-ASTRONOMERS AND PHYSICISTS" /// 
1710 "SCI-ATMOSPHERIC AND SPACE SCIENTISTS" /// 
1720 "SCI-CHEMISTS AND MATERIALS SCIENTISTS" /// 
1740 "SCI-ENVIRONMENTAL SCIENTISTS AND GEOSCIENTISTS" /// 
1760 "SCI-PHYSICAL SCIENTISTS, ALL OTHER" /// 
1800 "SCI-ECONOMISTS" /// 
1820 "SCI-PSYCHOLOGISTS" /// 
1840 "SCI-URBAN AND REGIONAL PLANNERS" /// 
1860 "SCI-MISCELLANEOUS SOCIAL SCIENTISTS, INCLUDING SURVEY RESEARCHERS AND SOCIOLOGISTS" /// 
1900 "SCI-AGRICULTURAL AND FOOD SCIENCE TECHNICIANS" /// 
1910 "SCI-BIOLOGICAL TECHNICIANS" /// 
1920 "SCI-CHEMICAL TECHNICIANS" /// 
1930 "SCI-GEOLOGICAL AND PETROLEUM TECHNICIANS, AND NUCLEAR TECHNICIANS" /// 
1965 "SCI-MISCELLANEOUS LIFE, PHYSICAL, AND SOCIAL SCIENCE TECHNICIANS, INCLUDING SOCIAL SCIENCE RESEARCH ASSISTANTS" /// 
2000 "CMS-COUNSELORS" /// 
2010 "CMS-SOCIAL WORKERS" /// 
2015 "CMS-PROBATION OFFICERS AND CORRECTIONAL TREATMENT SPECIALISTS" /// 
2016 "CMS-SOCIAL AND HUMAN SERVICE ASSISTANTS" /// 
2040 "CMS-CLERGY" /// 
2050 "CMS-DIRECTORS, RELIGIOUS ACTIVITIES AND EDUCATION" /// 
2060 "CMS-RELIGIOUS WORKERS, ALL OTHER" /// 
2100 "LGL-LAWYERS, AND JUDGES, MAGISTRATES, AND OTHER JUDICIAL WORKERS" /// 
2105 "LGL-JUDICIAL LAW CLERKS" /// 
2145 "LGL-PARALEGALS AND LEGAL ASSISTANTS" /// 
2160 "LGL-MISCELLANEOUS LEGAL SUPPORT WORKERS" /// 
2200 "EDU-POSTSECONDARY TEACHERS" /// 
2300 "EDU-PRESCHOOL AND KINDERGARTEN TEACHERS" /// 
2310 "EDU-ELEMENTARY AND MIDDLE SCHOOL TEACHERS" /// 
2320 "EDU-SECONDARY SCHOOL TEACHERS" /// 
2330 "EDU-SPECIAL EDUCATION TEACHERS" /// 
2340 "EDU-OTHER TEACHERS AND INSTRUCTORS" /// 
2400 "EDU-ARCHIVISTS, CURATORS, AND MUSEUM TECHNICIANS" /// 
2430 "EDU-LIBRARIANS" /// 
2440 "EDU-LIBRARY TECHNICIANS" /// 
2540 "EDU-TEACHER ASSISTANTS" /// 
2550 "EDU-OTHER EDUCATION, TRAINING, AND LIBRARY WORKERS" /// 
2600 "ENT-ARTISTS AND RELATED WORKERS" /// 
2630 "ENT-DESIGNERS" /// 
2700 "ENT-ACTORS" /// 
2710 "ENT-PRODUCERS AND DIRECTORS" /// 
2720 "ENT-ATHLETES, COACHES, UMPIRES, AND RELATED WORKERS" /// 
2740 "ENT-DANCERS AND CHOREOGRAPHERS" /// 
2750 "ENT-MUSICIANS, SINGERS, AND RELATED WORKERS" /// 
2760 "ENT-ENTERTAINERS AND PERFORMERS, SPORTS AND RELATED WORKERS, ALL OTHER" /// 
2800 "ENT-ANNOUNCERS" /// 
2810 "ENT-NEWS ANALYSTS, REPORTERS AND CORRESPONDENTS" /// 
2825 "ENT-PUBLIC RELATIONS SPECIALISTS" /// 
2830 "ENT-EDITORS" /// 
2840 "ENT-TECHNICAL WRITERS" /// 
2850 "ENT-WRITERS AND AUTHORS" /// 
2860 "ENT-MISCELLANEOUS MEDIA AND COMMUNICATION WORKERS" /// 
2900 "ENT-BROADCAST AND SOUND ENGINEERING TECHNICIANS AND RADIO OPERATORS, AND MEDIA AND COMMUNICATION EQUIPMENT WORKERS, ALL OTHER" /// 
2910 "ENT-PHOTOGRAPHERS" /// 
2920 "ENT-TELEVISION, VIDEO, AND MOTION PICTURE CAMERA OPERATORS AND EDITORS" /// 
3000 "MED-CHIROPRACTORS" /// 
3010 "MED-DENTISTS" /// 
3030 "MED-DIETITIANS AND NUTRITIONISTS" /// 
3040 "MED-OPTOMETRISTS" /// 
3050 "MED-PHARMACISTS" /// 
3060 "MED-PHYSICIANS AND SURGEONS" /// 
3110 "MED-PHYSICIAN ASSISTANTS" /// 
3120 "MED-PODIATRISTS" /// 
3140 "MED-AUDIOLOGISTS" /// 
3150 "MED-OCCUPATIONAL THERAPISTS" /// 
3160 "MED-PHYSICAL THERAPISTS" /// 
3200 "MED-RADIATION THERAPISTS" /// 
3210 "MED-RECREATIONAL THERAPISTS" /// 
3220 "MED-RESPIRATORY THERAPISTS" /// 
3230 "MED-SPEECH-LANGUAGE PATHOLOGISTS" /// 
3245 "MED-OTHER THERAPISTS, INCLUDING EXERCISE PHYSIOLOGISTS" /// 
3250 "MED-VETERINARIANS" /// 
3255 "MED-REGISTERED NURSES" /// 
3256 "MED-NURSE ANESTHETISTS" /// 
3258 "MED-NURSE PRACTITIONERS, AND NURSE MIDWIVES" /// 
3260 "MED-HEALTH DIAGNOSING AND TREATING PRACTITIONERS, ALL OTHER" /// 
3300 "MED-CLINICAL LABORATORY TECHNOLOGISTS AND TECHNICIANS" /// 
3310 "MED-DENTAL HYGIENISTS" /// 
3320 "MED-DIAGNOSTIC RELATED TECHNOLOGISTS AND TECHNICIANS" /// 
3400 "MED-EMERGENCY MEDICAL TECHNICIANS AND PARAMEDICS" /// 
3420 "MED-HEALTH PRACTITIONER SUPPORT TECHNOLOGISTS AND TECHNICIANS" /// 
3500 "MED-LICENSED PRACTICAL AND LICENSED VOCATIONAL NURSES" /// 
3510 "MED-MEDICAL RECORDS AND HEALTH INFORMATION TECHNICIANS" /// 
3520 "MED-OPTICIANS, DISPENSING" /// 
3535 "MED-MISCELLANEOUS HEALTH TECHNOLOGISTS AND TECHNICIANS" /// 
3540 "MED-OTHER HEALTHCARE PRACTITIONERS AND TECHNICAL OCCUPATIONS" /// 
3600 "HLS-NURSING, PSYCHIATRIC, AND HOME HEALTH AIDES" /// 
3610 "HLS-OCCUPATIONAL THERAPY ASSISTANTS AND AIDES" /// 
3620 "HLS-PHYSICAL THERAPIST ASSISTANTS AND AIDES" /// 
3630 "HLS-MASSAGE THERAPISTS" /// 
3640 "HLS-DENTAL ASSISTANTS" /// 
3645 "HLS-MEDICAL ASSISTANTS" /// 
3646 "HLS-MEDICAL TRANSCRIPTIONISTS" /// 
3647 "HLS-PHARMACY AIDES" /// 
3648 "HLS-VETERINARY ASSISTANTS AND LABORATORY ANIMAL CARETAKERS" /// 
3649 "HLS-PHLEBOTOMISTS" /// 
3655 "HLS-HEALTHCARE SUPPORT WORKERS, ALL OTHER, INCLUDING MEDICAL EQUIPMENT PREPARERS" /// 
3700 "PRT-FIRST-LINE SUPERVISORS OF CORRECTIONAL OFFICERS" /// 
3710 "PRT-FIRST-LINE SUPERVISORS OF POLICE AND DETECTIVES" /// 
3720 "PRT-FIRST-LINE SUPERVISORS OF FIRE FIGHTING AND PREVENTION WORKERS" /// 
3730 "PRT-FIRST-LINE SUPERVISORS OF PROTECTIVE SERVICE WORKERS, ALL OTHER" /// 
3740 "PRT-FIREFIGHTERS" /// 
3750 "PRT-FIRE INSPECTORS" /// 
3800 "PRT-BAILIFFS, CORRECTIONAL OFFICERS, AND JAILERS" /// 
3820 "PRT-DETECTIVES AND CRIMINAL INVESTIGATORS" /// 
3840 "PRT-MISCELLANEOUS LAW ENFORCEMENT WORKERS" /// 
3850 "PRT-POLICE OFFICERS" /// 
3900 "PRT-ANIMAL CONTROL WORKERS" /// 
3910 "PRT-PRIVATE DETECTIVES AND INVESTIGATORS" /// 
3930 "PRT-SECURITY GUARDS AND GAMING SURVEILLANCE OFFICERS" /// 
3940 "PRT-CROSSING GUARDS" /// 
3945 "PRT-TRANSPORTATION SECURITY SCREENERS" /// 
3955 "PRT-LIFEGUARDS AND OTHER RECREATIONAL, AND ALL OTHER PROTECTIVE SERVICE WORKERS" /// 
4000 "EAT-CHEFS AND HEAD COOKS" /// 
4010 "EAT-FIRST-LINE SUPERVISORS OF FOOD PREPARATION AND SERVING WORKERS" /// 
4020 "EAT-COOKS" /// 
4030 "EAT-FOOD PREPARATION WORKERS" /// 
4040 "EAT-BARTENDERS" /// 
4050 "EAT-COMBINED FOOD PREPARATION AND SERVING WORKERS,INCLUDING FAST FOOD" /// 
4060 "EAT-COUNTER ATTENDANTS, CAFETERIA, FOOD CONCESSION, AND COFFEE SHOP" /// 
4110 "EAT-WAITERS AND WAITRESSES" /// 
4120 "EAT-FOOD SERVERS, NONRESTAURANT" /// 
4130 "EAT-MISCELLANEOUS FOOD PREPARATION AND SERVING RELATED WORKERS, INCLUDING DINING ROOM AND CAFETERIA ATTENDANTS AND BARTENDER HELPERS" /// 
4140 "EAT-DISHWASHERS" /// 
4150 "EAT-HOSTS AND HOSTESSES, RESTAURANT, LOUNGE, AND COFFEE SHOP" /// 
4200 "CLN-FIRST-LINE SUPERVISORS OF HOUSEKEEPING AND JANITORIAL WORKERS" /// 
4210 "CLN-FIRST-LINE SUPERVISORS OF LANDSCAPING, LAWN SERVICE, AND GROUNDSKEEPING WORKERS" /// 
4220 "CLN-JANITORS AND BUILDING CLEANERS" /// 
4230 "CLN-MAIDS AND HOUSEKEEPING CLEANERS" /// 
4240 "CLN-PEST CONTROL WORKERS" /// 
4250 "CLN-GROUNDS MAINTENANCE WORKERS" /// 
4300 "PRS-FIRST-LINE SUPERVISORS OF GAMING WORKERS" /// 
4320 "PRS-FIRST-LINE SUPERVISORS OF PERSONAL SERVICE WORKERS" /// 
4340 "PRS-ANIMAL TRAINERS" /// 
4350 "PRS-NONFARM ANIMAL CARETAKERS" /// 
4400 "PRS-GAMING SERVICES WORKERS" /// 
4410 "PRS-MOTION PICTURE PROJECTIONISTS" /// 
4420 "PRS-USHERS, LOBBY ATTENDANTS, AND TICKET TAKERS" /// 
4430 "PRS-MISCELLANEOUS ENTERTAINMENT ATTENDANTS AND RELATED WORKERS" /// 
4460 "PRS-EMBALMERS AND FUNERAL ATTENDANTS" /// 
4465 "PRS-MORTICIANS, UNDERTAKERS, AND FUNERAL DIRECTORS" /// 
4500 "PRS-BARBERS" /// 
4510 "PRS-HAIRDRESSERS, HAIRSTYLISTS, AND COSMETOLOGISTS" /// 
4520 "PRS-MISCELLANEOUS PERSONAL APPEARANCE WORKERS" /// 
4530 "PRS-BAGGAGE PORTERS, BELLHOPS, AND CONCIERGES" /// 
4540 "PRS-TOUR AND TRAVEL GUIDES" /// 
4600 "PRS-CHILDCARE WORKERS" /// 
4610 "PRS-PERSONAL CARE AIDES" /// 
4620 "PRS-RECREATION AND FITNESS WORKERS" /// 
4640 "PRS-RESIDENTIAL ADVISORS" /// 
4650 "PRS-PERSONAL CARE AND SERVICE WORKERS, ALL OTHER" /// 
4700 "SAL-FIRST-LINE SUPERVISORS OF RETAIL SALES WORKERS" /// 
4710 "SAL-FIRST-LINE SUPERVISORS OF NON-RETAIL SALES WORKERS" /// 
4720 "SAL-CASHIERS" /// 
4740 "SAL-COUNTER AND RENTAL CLERKS" /// 
4750 "SAL-PARTS SALESPERSONS" /// 
4760 "SAL-RETAIL SALESPERSONS" /// 
4800 "SAL-ADVERTISING SALES AGENTS" /// 
4810 "SAL-INSURANCE SALES AGENTS" /// 
4820 "SAL-SECURITIES, COMMODITIES, AND FINANCIAL SERVICES SALES AGENTS" /// 
4830 "SAL-TRAVEL AGENTS" /// 
4840 "SAL-SALES REPRESENTATIVES, SERVICES, ALL OTHER" /// 
4850 "SAL-SALES REPRESENTATIVES, WHOLESALE AND MANUFACTURING" /// 
4900 "SAL-MODELS, DEMONSTRATORS, AND PRODUCT PROMOTERS" /// 
4920 "SAL-REAL ESTATE BROKERS AND SALES AGENTS" /// 
4930 "SAL-SALES ENGINEERS" /// 
4940 "SAL-TELEMARKETERS" /// 
4950 "SAL-DOOR-TO-DOOR SALES WORKERS, NEWS AND STREET VENDORS, AND RELATED WORKERS" /// 
4965 "SAL-SALES AND RELATED WORKERS, ALL OTHER" /// 
5000 "OFF-FIRST-LINE SUPERVISORS OF OFFICE AND ADMINISTRATIVE SUPPORT WORKERS" /// 
5010 "OFF-SWITCHBOARD OPERATORS, INCLUDING ANSWERING SERVICE" /// 
5020 "OFF-TELEPHONE OPERATORS" /// 
5030 "OFF-COMMUNICATIONS EQUIPMENT OPERATORS, ALL OTHER" /// 
5100 "OFF-BILL AND ACCOUNT COLLECTORS" /// 
5110 "OFF-BILLING AND POSTING CLERKS" /// 
5120 "OFF-BOOKKEEPING, ACCOUNTING, AND AUDITING CLERKS" /// 
5130 "OFF-GAMING CAGE WORKERS" /// 
5140 "OFF-PAYROLL AND TIMEKEEPING CLERKS" /// 
5150 "OFF-PROCUREMENT CLERKS" /// 
5160 "OFF-TELLERS" /// 
5165 "OFF-FINANCIAL CLERKS, ALL OTHER" /// 
5200 "OFF-BROKERAGE CLERKS" /// 
5220 "OFF-COURT, MUNICIPAL, AND LICENSE CLERKS" /// 
5230 "OFF-CREDIT AUTHORIZERS, CHECKERS, AND CLERKS" /// 
5240 "OFF-CUSTOMER SERVICE REPRESENTATIVES" /// 
5250 "OFF-ELIGIBILITY INTERVIEWERS, GOVERNMENT PROGRAMS" /// 
5260 "OFF-FILE CLERKS" /// 
5300 "OFF-HOTEL, MOTEL, AND RESORT DESK CLERKS" /// 
5310 "OFF-INTERVIEWERS, EXCEPT ELIGIBILITY AND LOAN" /// 
5320 "OFF-LIBRARY ASSISTANTS, CLERICAL" /// 
5330 "OFF-LOAN INTERVIEWERS AND CLERKS" /// 
5340 "OFF-NEW ACCOUNTS CLERKS" /// 
5350 "OFF-CORRESPONDENCE CLERKS AND ORDER CLERKS" /// 
5360 "OFF-HUMAN RESOURCES ASSISTANTS, EXCEPT PAYROLL AND TIMEKEEPING" /// 
5400 "OFF-RECEPTIONISTS AND INFORMATION CLERKS" /// 
5420 "OFF-INFORMATION AND RECORD CLERKS, ALL OTHER" /// 
5500 "OFF-CARGO AND FREIGHT AGENTS" /// 
5510 "OFF-COURIERS AND MESSENGERS" /// 
5520 "OFF-DISPATCHERS" /// 
5530 "OFF-METER READERS, UTILITIES" /// 
5540 "OFF-POSTAL SERVICE CLERKS" /// 
5550 "OFF-POSTAL SERVICE MAIL CARRIERS" /// 
5600 "OFF-PRODUCTION, PLANNING, AND EXPEDITING CLERKS" /// 
5610 "OFF-SHIPPING, RECEIVING, AND TRAFFIC CLERKS" /// 
5620 "OFF-STOCK CLERKS AND ORDER FILLERS" /// 
5630 "OFF-WEIGHERS, MEASURERS, CHECKERS, AND SAMPLERS, RECORDKEEPING" /// 
5700 "OFF-SECRETARIES AND ADMINISTRATIVE ASSISTANTS" /// 
5800 "OFF-COMPUTER OPERATORS" /// 
5810 "OFF-DATA ENTRY KEYERS" /// 
5820 "OFF-WORD PROCESSORS AND TYPISTS" /// 
5840 "OFF-INSURANCE CLAIMS AND POLICY PROCESSING CLERKS" /// 
5850 "OFF-MAIL CLERKS AND MAIL MACHINE OPERATORS, EXCEPT POSTAL SERVICE" /// 
5860 "OFF-OFFICE CLERKS, GENERAL" /// 
5900 "OFF-OFFICE MACHINE OPERATORS, EXCEPT COMPUTER" /// 
5910 "OFF-PROOFREADERS AND COPY MARKERS" /// 
5920 "OFF-STATISTICAL ASSISTANTS" /// 
5940 "OFF-MISCELLANEOUS OFFICE AND ADMINISTRATIVE SUPPORT WORKERS, INCLUDING DESKTOP PUBLISHERS" /// 
6005 "FFF-FIRST-LINE SUPERVISORS OF FARMING, FISHING, AND FORESTRY WORKERS" /// 
6010 "FFF-AGRICULTURAL INSPECTORS" /// 
6040 "FFF-GRADERS AND SORTERS, AGRICULTURAL PRODUCTS" /// 
6050 "FFF-MISCELLANEOUS AGRICULTURAL WORKERS, INCLUDING ANIMAL BREEDERS" /// 
6100 "FFF-FISHING AND HUNTING WORKERS" /// 
6120 "FFF-FOREST AND CONSERVATION WORKERS" /// 
6130 "FFF-LOGGING WORKERS" /// 
6200 "CON-FIRST-LINE SUPERVISORS OF CONSTRUCTION TRADES AND EXTRACTION WORKERS" /// 
6210 "CON-BOILERMAKERS" /// 
6220 "CON-BRICKMASONS, BLOCKMASONS, STONEMASONS, AND REINFORCING IRON AND REBAR WORKERS" /// 
6230 "CON-CARPENTERS" /// 
6240 "CON-CARPET, FLOOR, AND TILE INSTALLERS AND FINISHERS" /// 
6260 "CON-CONSTRUCTION LABORERS" /// 
6300 "CON-PAVING, SURFACING, AND TAMPING EQUIPMENT OPERATORS" /// 
6320 "CON-CONSTRUCTION EQUIPMENT OPERATORS, EXCEPT PAVING, SURFACING, AND TAMPING EQUIPMENT OPERATORS" /// 
6355 "CON-ELECTRICIANS" /// 
6360 "CON-GLAZIERS" /// 
6400 "CON-INSULATION WORKERS" /// 
6420 "CON-PAINTERS AND PAPERHANGERS" /// 
6440 "CON-PIPELAYERS, PLUMBERS, PIPEFITTERS, AND STEAMFITTERS" /// 
6460 "CON-PLASTERERS AND STUCCO MASONS" /// 
6515 "CON-ROOFERS" /// 
6520 "CON-SHEET METAL WORKERS" /// 
6530 "CON-STRUCTURAL IRON AND STEEL WORKERS" /// 
6600 "CON-HELPERS, CONSTRUCTION TRADES" /// 
6660 "CON-CONSTRUCTION AND BUILDING INSPECTORS" /// 
6700 "CON-ELEVATOR INSTALLERS AND REPAIRERS" /// 
6710 "CON-FENCE ERECTORS" /// 
6720 "CON-HAZARDOUS MATERIALS REMOVAL WORKERS" /// 
6730 "CON-HIGHWAY MAINTENANCE WORKERS" /// 
6740 "CON-RAIL-TRACK LAYING AND MAINTENANCE EQUIPMENT OPERATORS" /// 
6765 "CON-MISCELLANEOUS CONSTRUCTION WORKERS, INCLUDING SOLAR PHOTOVOLTAIC INSTALLERS, SEPTIC TANK SERVICERS AND SEWER PIPE CLEANERS" /// 
6800 "EXT-DERRICK, ROTARY DRILL, AND SERVICE UNIT OPERATORS, AND ROUSTABOUTS, OIL, GAS, AND MINING" /// 
6820 "EXT-EARTH DRILLERS, EXCEPT OIL AND GAS" /// 
6830 "EXT-EXPLOSIVES WORKERS, ORDNANCE HANDLING EXPERTS, AND BLASTERS" /// 
6840 "EXT-MINING MACHINE OPERATORS" /// 
6940 "EXT-MISCELLANEOUS EXTRACTION WORKERS, INCLUDING ROOF BOLTERS AND HELPERS" /// 
7000 "RPR-FIRST-LINE SUPERVISORS OF MECHANICS, INSTALLERS, AND REPAIRERS" /// 
7010 "RPR-COMPUTER, AUTOMATED TELLER, AND OFFICE MACHINE REPAIRERS" /// 
7020 "RPR-RADIO AND TELECOMMUNICATIONS EQUIPMENT INSTALLERS AND REPAIRERS" /// 
7030 "RPR-AVIONICS TECHNICIANS" /// 
7040 "RPR-ELECTRIC MOTOR, POWER TOOL, AND RELATED REPAIRERS" /// 
7100 "RPR-ELECTRICAL AND ELECTRONICS REPAIRERS, TRANSPORTATION EQUIPMENT, AND INDUSTRIAL AND UTILITY" /// 
7110 "RPR-ELECTRONIC EQUIPMENT INSTALLERS AND REPAIRERS, MOTOR VEHICLES" /// 
7120 "RPR-ELECTRONIC HOME ENTERTAINMENT EQUIPMENT INSTALLERS AND REPAIRERS" /// 
7130 "RPR-SECURITY AND FIRE ALARM SYSTEMS INSTALLERS" /// 
7140 "RPR-AIRCRAFT MECHANICS AND SERVICE TECHNICIANS" /// 
7150 "RPR-AUTOMOTIVE BODY AND RELATED REPAIRERS" /// 
7160 "RPR-AUTOMOTIVE GLASS INSTALLERS AND REPAIRERS" /// 
7200 "RPR-AUTOMOTIVE SERVICE TECHNICIANS AND MECHANICS" /// 
7210 "RPR-BUS AND TRUCK MECHANICS AND DIESEL ENGINE SPECIALISTS" /// 
7220 "RPR-HEAVY VEHICLE AND MOBILE EQUIPMENT SERVICE TECHNICIANS AND MECHANICS" /// 
7240 "RPR-SMALL ENGINE MECHANICS" /// 
7260 "RPR-MISCELLANEOUS VEHICLE AND MOBILE EQUIPMENT MECHANICS, INSTALLERS, AND REPAIRERS" /// 
7300 "RPR-CONTROL AND VALVE INSTALLERS AND REPAIRERS" /// 
7315 "RPR-HEATING, AIR CONDITIONING, AND REFRIGERATION MECHANICS AND INSTALLERS" /// 
7320 "RPR-HOME APPLIANCE REPAIRERS" /// 
7330 "RPR-INDUSTRIAL AND REFRACTORY MACHINERY MECHANICS" /// 
7340 "RPR-MAINTENANCE AND REPAIR WORKERS, GENERAL" /// 
7350 "RPR-MAINTENANCE WORKERS, MACHINERY" /// 
7360 "RPR-MILLWRIGHTS" /// 
7410 "RPR-ELECTRICAL POWER-LINE INSTALLERS AND REPAIRERS" /// 
7420 "RPR-TELECOMMUNICATIONS LINE INSTALLERS AND REPAIRERS" /// 
7430 "RPR-PRECISION INSTRUMENT AND EQUIPMENT REPAIRERS" /// 
7510 "RPR-COIN, VENDING, AND AMUSEMENT MACHINE SERVICERS AND REPAIRERS" /// 
7540 "RPR-LOCKSMITHS AND SAFE REPAIRERS" /// 
7560 "RPR-RIGGERS" /// 
7610 "RPR-HELPERS--INSTALLATION, MAINTENANCE, AND REPAIR WORKERS" /// 
7630 "RPR-MISCELLANEOUS INSTALLATION, MAINTENANCE, AND REPAIR WORKERS, INCLUDING WIND TURBINE SERVICE TECHNICIANS" /// 
7700 "PRD-FIRST-LINE SUPERVISORS OF PRODUCTION AND OPERATING WORKERS" /// 
7710 "PRD-AIRCRAFT STRUCTURE, SURFACES, RIGGING, AND SYSTEMS ASSEMBLERS" /// 
7720 "PRD-ELECTRICAL, ELECTRONICS, AND ELECTROMECHANICAL ASSEMBLERS" /// 
7730 "PRD-ENGINE AND OTHER MACHINE ASSEMBLERS" /// 
7740 "PRD-STRUCTURAL METAL FABRICATORS AND FITTERS" /// 
7750 "PRD-MISCELLANEOUS ASSEMBLERS AND FABRICATORS" /// 
7800 "PRD-BAKERS" /// 
7810 "PRD-BUTCHERS AND OTHER MEAT, POULTRY, AND FISH PROCESSING WORKERS" /// 
7830 "PRD-FOOD AND TOBACCO ROASTING, BAKING, AND DRYING MACHINE OPERATORS AND TENDERS" /// 
7840 "PRD-FOOD BATCHMAKERS" /// 
7850 "PRD-FOOD COOKING MACHINE OPERATORS AND TENDERS\" /// 
7855 "PRD-FOOD PROCESSING WORKERS, ALL OTHER" /// 
7900 "PRD-COMPUTER CONTROL PROGRAMMERS AND OPERATORS" /// 
7920 "PRD-EXTRUDING AND DRAWING MACHINE SETTERS, OPERATORS, AND TENDERS, METAL AND PLASTIC" /// 
7930 "PRD-FORGING MACHINE SETTERS, OPERATORS, AND TENDERS, METAL AND PLASTIC" /// 
7940 "PRD-ROLLING MACHINE SETTERS, OPERATORS, AND TENDERS, METAL AND PLASTIC" /// 
7950 "PRD-MACHINE TOOL CUTTING SETTERS, OPERATORS, AND TENDERS, METAL AND PLASTIC" /// 
8030 "PRD-MACHINISTS" /// 
8040 "PRD-METAL FURNACE OPERATORS, TENDERS, POURERS, AND CASTERS" /// 
8100 "PRD-MODEL MAKERS, PATTERNMAKERS, AND MOLDING MACHINE SETTERS, METAL AND PLASTIC" /// 
8130 "PRD-TOOL AND DIE MAKERS" /// 
8140 "PRD-WELDING, SOLDERING, AND BRAZING WORKERS" /// 
8220 "PRD-MISCELLANEOUS METAL WORKERS AND PLASTIC WORKERS, INCLUDING MULTIPLE MACHINE TOOL SETTERS" /// 
8250 "PRD-PREPRESS TECHNICIANS AND WORKERS" /// 
8255 "PRD-PRINTING PRESS OPERATORS" /// 
8256 "PRD-PRINT BINDING AND FINISHING WORKERS" /// 
8300 "PRD-LAUNDRY AND DRY-CLEANING WORKERS" /// 
8310 "PRD-PRESSERS, TEXTILE, GARMENT, AND RELATED MATERIALS" /// 
8320 "PRD-SEWING MACHINE OPERATORS" /// 
8330 "PRD-SHOE AND LEATHER WORKERS" /// 
8350 "PRD-TAILORS, DRESSMAKERS, AND SEWERS" /// 
8400 "PRD-TEXTILE BLEACHING AND DYEING, AND CUTTING MACHINE SETTERS, OPERATORS, AND TENDERS" /// 
8410 "PRD-TEXTILE KNITTING AND WEAVING MACHINE SETTERS, OPERATORS, AND TENDERS" /// 
8420 "PRD-TEXTILE WINDING, TWISTING, AND DRAWING OUT MACHINE SETTERS, OPERATORS, AND TENDERS" /// 
8450 "PRD-UPHOLSTERERS" /// 
8460 "PRD-MISCELLANEOUS TEXTILE, APPAREL, AND FURNISHINGS WORKERS, EXCEPT UPHOLSTERERS" /// 
8500 "PRD-CABINETMAKERS AND BENCH CARPENTERS" /// 
8510 "PRD-FURNITURE FINISHERS" /// 
8530 "PRD-SAWING MACHINE SETTERS, OPERATORS, AND TENDERS, WOOD" /// 
8540 "PRD-WOODWORKING MACHINE SETTERS, OPERATORS, AND TENDERS, EXCEPT SAWING" /// 
8550 "PRD-MISCELLANEOUS WOODWORKERS, INCLUDING MODEL MAKERS AND PATTERNMAKERS" /// 
8600 "PRD-POWER PLANT OPERATORS, DISTRIBUTORS, AND DISPATCHERS" /// 
8610 "PRD-STATIONARY ENGINEERS AND BOILER OPERATORS" /// 
8620 "PRD-WATER AND WASTEWATER TREATMENT PLANT AND SYSTEM OPERATORS" /// 
8630 "PRD-MISCELLANEOUS PLANT AND SYSTEM OPERATORS" /// 
8640 "PRD-CHEMICAL PROCESSING MACHINE SETTERS, OPERATORS, AND TENDERS" /// 
8650 "PRD-CRUSHING, GRINDING, POLISHING, MIXING, AND BLENDING WORKERS" /// 
8710 "PRD-CUTTING WORKERS" /// 
8720 "PRD-EXTRUDING, FORMING, PRESSING, AND COMPACTING MACHINE SETTERS, OPERATORS, AND TENDERS" /// 
8730 "PRD-FURNACE, KILN, OVEN, DRIER, AND KETTLE OPERATORS AND TENDERS" /// 
8740 "PRD-INSPECTORS, TESTERS, SORTERS, SAMPLERS, AND WEIGHERS" /// 
8750 "PRD-JEWELERS AND PRECIOUS STONE AND METAL WORKERS" /// 
8760 "PRD-MEDICAL, DENTAL, AND OPHTHALMIC LABORATORY TECHNICIANS" /// 
8800 "PRD-PACKAGING AND FILLING MACHINE OPERATORS AND TENDERS" /// 
8810 "PRD-PAINTING WORKERS" /// 
8830 "PRD-PHOTOGRAPHIC PROCESS WORKERS AND PROCESSING MACHINE OPERATORS" /// 
8850 "PRD-ADHESIVE BONDING MACHINE OPERATORS AND TENDERS" /// 
8910 "PRD-ETCHERS AND ENGRAVERS" /// 
8930 "PRD-PAPER GOODS MACHINE SETTERS, OPERATORS, AND TENDERS" /// 
8940 "PRD-TIRE BUILDERS" /// 
8950 "PRD-HELPERS-PRODUCTION WORKERS" /// 
8965 "PRD-MISCELLANEOUS PRODUCTION WORKERS, INCLUDING SEMICONDUCTOR PROCESSORS" /// 
9000 "TRN-SUPERVISORS OF TRANSPORTATION AND MATERIAL MOVING WORKERS" /// 
9030 "TRN-AIRCRAFT PILOTS AND FLIGHT ENGINEERS" /// 
9040 "TRN-AIR TRAFFIC CONTROLLERS AND AIRFIELD OPERATIONS SPECIALISTS" /// 
9050 "TRN-FLIGHT ATTENDANTS" /// 
9110 "TRN-AMBULANCE DRIVERS AND ATTENDANTS, EXCEPT EMERGENCY MEDICAL TECHNICIANS" /// 
9120 "TRN-BUS DRIVERS" /// 
9130 "TRN-DRIVER/SALES WORKERS AND TRUCK DRIVERS" /// 
9140 "TRN-TAXI DRIVERS AND CHAUFFEURS" /// 
9150 "TRN-MOTOR VEHICLE OPERATORS, ALL OTHER" /// 
9200 "TRN-LOCOMOTIVE ENGINEERS AND OPERATORS" /// 
9240 "TRN-RAILROAD CONDUCTORS AND YARDMASTERS" /// 
9260 "TRN-SUBWAY, STREETCAR, AND OTHER RAIL TRANSPORTATION WORKERS" /// 
9300 "TRN-SAILORS AND MARINE OILERS, AND SHIP ENGINEERS" /// 
9310 "TRN-SHIP AND BOAT CAPTAINS AND OPERATORS" /// 
9350 "TRN-PARKING LOT ATTENDANTS" /// 
9360 "TRN-AUTOMOTIVE AND WATERCRAFT SERVICE ATTENDANTS" /// 
9410 "TRN-TRANSPORTATION INSPECTORS" /// 
9415 "TRN-TRANSPORTATION ATTENDANTS, EXCEPT FLIGHT ATTENDANTS" /// 
9420 "TRN-MISCELLANEOUS TRANSPORTATION WORKERS, INCLUDING BRIDGE AND LOCK TENDERS AND TRAFFIC TECHNICIANS" /// 
9510 "TRN-CRANE AND TOWER OPERATORS" /// 
9520 "TRN-DREDGE, EXCAVATING, AND LOADING MACHINE OPERATORS" /// 
9560 "TRN-CONVEYOR OPERATORS AND TENDERS, AND HOIST AND WINCH OPERATORS" /// 
9600 "TRN-INDUSTRIAL TRUCK AND TRACTOR OPERATORS" /// 
9610 "TRN-CLEANERS OF VEHICLES AND EQUIPMENT" /// 
9620 "TRN-LABORERS AND FREIGHT, STOCK, AND MATERIAL MOVERS, HAND" /// 
9630 "TRN-MACHINE FEEDERS AND OFFBEARERS" /// 
9640 "TRN-PACKERS AND PACKAGERS, HAND" /// 
9650 "TRN-PUMPING STATION OPERATORS" /// 
9720 "TRN-REFUSE AND RECYCLABLE MATERIAL COLLECTORS" /// 
9750 "TRN-MISCELLANEOUS MATERIAL MOVING WORKERS, INCLUDING MINE SHUTTLE CAR OPERATORS, AND TANK CAR, TRUCK, AND SHIP LOADERS" /// 
9800 "MIL-MILITARY OFFICER SPECIAL AND TACTICAL OPERATIONS LEADERS" /// 
9810 "MIL-FIRST-LINE ENLISTED MILITARY SUPERVISORS" /// 
9820 "MIL-MILITARY ENLISTED TACTICAL OPERATIONS AND AIR/WEAPONS SPECIALISTS AND CREW MEMBERS" /// 
9830 "MIL-MILITARY, RANK NOT SPECIFIED **" /// 
9920 "UNEMPLOYED AND LAST WORKED 5 YEARS AGO OR EARLIER OR NEVER WORKED **"
capture label values OCCP4 occp4LB


capture label variable PAOC "Presence and age of own children"
capture label define paocLB ///
1 "Females with own children under 6 years only" /// 
2 "Females with own children 6 to 17 years only" /// 
3 "Females with own children under 6 years and 6 to 17 years" /// 
4 "Females with no own children"
capture label values PAOC paocLB

notes: Use ADJINC to adjust PERNP to constant dollars.

capture label variable PERNP "Total person's earnings"
capture label define pernpLB ///
0000000 "No earnings" /// 
-010000 "Loss of $10000 or more (Rounded & bottom-coded components)" /// 
0000001 "$1 or break even"
capture label values PERNP pernpLB

notes: Use ADJINC to adjust PINCP to constant dollars.

capture label variable PINCP "Total person's income (signed)"
capture label define pincpLB ///
0000000 "None" /// 
-019999 "Loss of $19999 or more (Rounded & bottom-coded components)" /// 
0000001 "$1 or break even"
capture label values PINCP pincpLB


capture label variable POBP "Place of birth (Recode)"
capture label define pobpLB ///
001 "Alabama/AL" /// 
002 "Alaska/AK" /// 
004 "Arizona/AZ" /// 
005 "Arkansas/AR" /// 
006 "California/CA" /// 
008 "Colorado/CO" /// 
009 "Connecticut/CT" /// 
010 "Delaware/DE" /// 
011 "District of Columbia/DC" /// 
012 "Florida/FL" /// 
013 "Georgia/GA" /// 
015 "Hawaii/HI" /// 
016 "Idaho/ID" /// 
017 "Illinois/IL" /// 
018 "Indiana/IN" /// 
019 "Iowa/IA" /// 
020 "Kansas/KS" /// 
021 "Kentucky/KY" /// 
022 "Louisiana/LA" /// 
023 "Maine/ME" /// 
024 "Maryland/MD" /// 
025 "Massachusetts/MA" /// 
026 "Michigan/MI" /// 
027 "Minnesota/MN" /// 
028 "Mississippi/MS" /// 
029 "Missouri/MO" /// 
030 "Montana/MT" /// 
031 "Nebraska/NE" /// 
032 "Nevada/NV" /// 
033 "New Hampshire/NH" /// 
034 "New Jersey/NJ" /// 
035 "New Mexico/NM" /// 
036 "New York/NY" /// 
037 "North Carolina/NC" /// 
038 "North Dakota/ND" /// 
039 "Ohio/OH" /// 
040 "Oklahoma/OK" /// 
041 "Oregon/OR" /// 
042 "Pennsylvania/PA" /// 
044 "Rhode Island/RI" /// 
045 "South Carolina/SC" /// 
046 "South Dakota/SD" /// 
047 "Tennessee/TN" /// 
048 "Texas/TX" /// 
049 "Utah/UT" /// 
050 "Vermont/VT" /// 
051 "Virginia/VA" /// 
053 "Washington/WA" /// 
054 "West Virginia/WV" /// 
055 "Wisconsin/WI" /// 
056 "Wyoming/WY" /// 
060 "American Samoa" /// 
066 "Guam" /// 
069 "Commonwealth of the Northern Mariana Islands" /// 
072 "Puerto Rico" /// 
078 "US Virgin Islands" /// 
100 "Albania" /// 
102 "Austria" /// 
103 "Belgium" /// 
104 "Bulgaria" /// 
105 "Czechoslovakia" /// 
106 "Denmark" /// 
108 "Finland" /// 
109 "France" /// 
110 "Germany" /// 
116 "Greece" /// 
117 "Hungary" /// 
118 "Iceland" /// 
119 "Ireland" /// 
120 "Italy" /// 
126 "Netherlands" /// 
127 "Norway" /// 
128 "Poland" /// 
129 "Portugal" /// 
130 "Azores Islands" /// 
132 "Romania" /// 
134 "Spain" /// 
136 "Sweden" /// 
137 "Switzerland" /// 
138 "United Kingdom, Not Specified" /// 
139 "England" /// 
140 "Scotland" /// 
147 "Yugoslavia" /// 
148 "Czech Republic" /// 
149 "Slovakia" /// 
150 "Bosnia and Herzegovina" /// 
151 "Croatia" /// 
152 "Macedonia" /// 
154 "Serbia" /// 
156 "Latvia" /// 
157 "Lithuania" /// 
158 "Armenia" /// 
159 "Azerbaijan" /// 
160 "Belarus" /// 
161 "Georgia" /// 
162 "Moldova" /// 
163 "Russia" /// 
164 "Ukraine" /// 
165 "USSR" /// 
168 "Montenegro" /// 
169 "Other Europe, Not Specified" /// 
200 "Afghanistan" /// 
202 "Bangladesh" /// 
203 "Bhutan" /// 
205 "Myanmar" /// 
206 "Cambodia" /// 
207 "China" /// 
208 "Cyprus" /// 
209 "Hong Kong" /// 
210 "India" /// 
211 "Indonesia" /// 
212 "Iran" /// 
213 "Iraq" /// 
214 "Israel" /// 
215 "Japan" /// 
216 "Jordan" /// 
217 "Korea" /// 
218 "Kazakhstan" /// 
222 "Kuwait" /// 
223 "Laos" /// 
224 "Lebanon" /// 
226 "Malaysia" /// 
229 "Nepal" /// 
231 "Pakistan" /// 
233 "Philippines" /// 
235 "Saudi Arabia" /// 
236 "Singapore" /// 
238 "Sri Lanka" /// 
239 "Syria" /// 
240 "Taiwan" /// 
242 "Thailand" /// 
243 "Turkey" /// 
245 "United Arab Emirates" /// 
246 "Uzbekistan" /// 
247 "Vietnam" /// 
248 "Yemen" /// 
249 "Asia" /// 
253 "South Central Asia, Not Specified" /// 
254 "Other Asia, Not Specified" /// 
300 "Bermuda" /// 
301 "Canada" /// 
303 "Mexico" /// 
310 "Belize" /// 
311 "Costa Rica" /// 
312 "El Salvador" /// 
313 "Guatemala" /// 
314 "Honduras" /// 
315 "Nicaragua" /// 
316 "Panama" /// 
321 "Antigua & Barbuda" /// 
323 "Bahamas" /// 
324 "Barbados" /// 
327 "Cuba" /// 
328 "Dominica" /// 
329 "Dominican Republic" /// 
330 "Grenada" /// 
332 "Haiti" /// 
333 "Jamaica" /// 
339 "St. Lucia" /// 
340 "St. Vincent & the Grenadines" /// 
341 "Trinidad & Tobago" /// 
343 "West Indies" /// 
344 "Caribbean, Not Specified" /// 
360 "Argentina" /// 
361 "Bolivia" /// 
362 "Brazil" /// 
363 "Chile" /// 
364 "Colombia" /// 
365 "Ecuador" /// 
368 "Guyana" /// 
369 "Paraguay" /// 
370 "Peru" /// 
372 "Uruguay" /// 
373 "Venezuela" /// 
374 "South America" /// 
399 "Americas, Not Specified" /// 
400 "Algeria" /// 
407 "Cameroon" /// 
408 "Cabo Verde" /// 
412 "Congo" /// 
414 "Egypt" /// 
416 "Ethiopia" /// 
417 "Eritrea" /// 
420 "Gambia" /// 
421 "Ghana" /// 
423 "Guinea" /// 
427 "Kenya" /// 
429 "Liberia" /// 
430 "Libya" /// 
436 "Morocco" /// 
440 "Nigeria" /// 
444 "Senegal" /// 
447 "Sierra Leone" /// 
448 "Somalia" /// 
449 "South Africa" /// 
451 "Sudan" /// 
453 "Tanzania" /// 
454 "Togo" /// 
457 "Uganda" /// 
459 "Democratic Republic of Congo (Zaire)" /// 
460 "Zambia" /// 
461 "Zimbabwe" /// 
462 "Africa" /// 
463 "Eastern Africa, Not Specified" /// 
464 "Northern Africa, Not Specified" /// 
467 "Western Africa, Not Specified" /// 
468 "Other Africa, Not Specified" /// 
501 "Australia" /// 
508 "Fiji" /// 
511 "Marshall Islands" /// 
512 "Micronesia" /// 
515 "New Zealand" /// 
523 "Tonga" /// 
527 "Samoa" /// 
554 "Other US Island Areas, Oceania, Not Specified, or at Sea"
capture label values POBP pobpLB


capture label variable POVPIP "Income-to-poverty ratio recode"
capture label define povpipLB ///

capture label values POVPIP povpipLB


capture label variable POWPUMA "Place of work PUMA based on 2010 Census definition"
capture label define powpumaLB ///
00001 "Did not work in the United States or in Puerto Rico"
capture label values POWPUMA powpumaLB


capture label variable POWSP "Place of work - State or foreign country recode"
capture label define powspLB ///
001 "Alabama/AL" /// 
002 "Alaska/AK" /// 
004 "Arizona/AZ" /// 
005 "Arkansas/AR" /// 
006 "California/CA" /// 
008 "Colorado/CO" /// 
009 "Connecticut/CT" /// 
010 "Delaware/DE" /// 
011 "District of Columbia/DC" /// 
012 "Florida/FL" /// 
013 "Georgia/GA" /// 
015 "Hawaii/HI" /// 
016 "Idaho/ID" /// 
017 "Illinois/IL" /// 
018 "Indiana/IN" /// 
019 "Iowa/IA" /// 
020 "Kansas/KS" /// 
021 "Kentucky/KY" /// 
022 "Louisiana/LA" /// 
023 "Maine/ME" /// 
024 "Maryland/MD" /// 
025 "Massachusetts/MA" /// 
026 "Michigan/MI" /// 
027 "Minnesota/MN" /// 
028 "Mississippi/MS" /// 
029 "Missouri/MO" /// 
030 "Montana/MT" /// 
031 "Nebraska/NE" /// 
032 "Nevada/NV" /// 
033 "New Hampshire/NH" /// 
034 "New Jersey/NJ" /// 
035 "New Mexico/NM" /// 
036 "New York/NY" /// 
037 "North Carolina/NC" /// 
038 "North Dakota/ND" /// 
039 "Ohio/OH" /// 
040 "Oklahoma/OK" /// 
041 "Oregon/OR" /// 
042 "Pennsylvania/PA" /// 
044 "Rhode Island/RI" /// 
045 "South Carolina/SC" /// 
046 "South Dakota/SD" /// 
047 "Tennessee/TN" /// 
048 "Texas/TX" /// 
049 "Utah/UT" /// 
050 "Vermont/VT" /// 
051 "Virginia/VA" /// 
053 "Washington/WA" /// 
054 "West Virginia/WV" /// 
055 "Wisconsin/WI" /// 
056 "Wyoming/WY" /// 
072 "Puerto Rico" /// 
166 "Europe" /// 
251 "Eastern Asia" /// 
254 "Other Asia, Not Specified" /// 
301 "Canada" /// 
303 "Mexico" /// 
399 "Americas, Not Specified" /// 
555 "Other US Island Areas Not Specified, Africa, Oceania, at Sea, or Abroad, Not Specified"
capture label values POWSP powspLB


capture label variable PRIVCOV "Private health insurance coverage recode"
capture label define privcovLB ///
1 "With private health insurance coverage" /// 
2 "Without private health insurance coverage"
capture label values PRIVCOV privcovLB


capture label variable PUBCOV "Public health coverage recode"
capture label define pubcovLB ///
1 "With public health coverage" /// 
2 "Without public health coverage"
capture label values PUBCOV pubcovLB


capture label variable QTRBIR "Quarter of birth"
capture label define qtrbirLB ///
1 "January through March" /// 
2 "April through June" /// 
3 "July through September" /// 
4 "October through December"
capture label values QTRBIR qtrbirLB


capture label variable RAC1P "Recoded detailed race code"
capture label define rac1pLB ///
1 "White alone" /// 
2 "Black or African American alone" /// 
3 "American Indian alone" /// 
4 "Alaska Native alone" /// 
5 "American Indian and Alaska Native tribes specified; or American Indian or Alaska Native, not specified and no other races" /// 
6 "Asian alone" /// 
7 "Native Hawaiian and Other Pacific Islander alone" /// 
8 "Some Other Race alone" /// 
9 "Two or More Races"
capture label values RAC1P rac1pLB


capture label variable RAC2P "Recoded detailed race code"
capture label define rac2pLB ///
01 "White alone" /// 
02 "Black or African American alone" /// 
03 "Apache alone" /// 
04 "Blackfeet alone" /// 
05 "Cherokee alone" /// 
06 "Cheyenne alone" /// 
07 "Chickasaw alone" /// 
08 "Chippewa alone" /// 
09 "Choctaw alone" /// 
10 "Comanche alone" /// 
11 "Creek alone" /// 
12 "Crow alone" /// 
13 "Hopi alone" /// 
14 "Iroquois alone" /// 
15 "Lumbee alone" /// 
16 "Mexican American Indian alone" /// 
17 "Navajo alone" /// 
18 "Pima alone" /// 
19 "Potawatomi alone" /// 
20 "Pueblo alone" /// 
21 "Puget Sound Salish alone" /// 
22 "Seminole alone" /// 
23 "Sioux alone" /// 
24 "South American Indian alone" /// 
25 "Tohono O'Odham alone" /// 
26 "Yaqui alone" /// 
27 "Other specified American Indian tribes alone" /// 
28 "All other specified American Indian tribe combinations" /// 
29 "American Indian, tribe not specified" /// 
30 "Alaskan Athabascan alone" /// 
31 "Tlingit-Haida alone" /// 
32 "Inupiat alone" /// 
33 "Yup’ik alone" /// 
34 "Aleut alone" /// 
35 "Other Alaska Native" /// 
36 "Other American Indian and Alaska Native specified" /// 
37 "American Indian and Alaska Native, not specified" /// 
38 "Asian Indian alone" /// 
39 "Bangladeshi alone" /// 
40 "Bhutanese alone" /// 
41 "Burmese alone" /// 
42 "Cambodian alone" /// 
43 "Chinese, except Taiwanese, alone" /// 
44 "Taiwanese alone" /// 
45 "Filipino alone" /// 
46 "Hmong alone" /// 
47 "Indonesian alone" /// 
48 "Japanese alone" /// 
49 "Korean alone" /// 
50 "Laotian alone" /// 
51 "Malaysian alone" /// 
52 "Mongolian alone" /// 
53 "Nepalese alone" /// 
54 "Pakistani alone" /// 
55 "Sri Lankan alone" /// 
56 "Thai alone" /// 
57 "Vietnamese alone" /// 
58 "Other Asian alone" /// 
59 "All combinations of Asian races only" /// 
60 "Native Hawaiian alone" /// 
61 "Samoan alone" /// 
62 "Tongan alone" /// 
63 "Guamanian or Chamorro alone" /// 
64 "Marshallese alone" /// 
65 "Fijian alone" /// 
66 "Other Native Hawaiian and Other Pacific Islander" /// 
67 "Some Other Race alone" /// 
68 "Two or More Races"
capture label values RAC2P rac2pLB


capture label variable RAC3P "Recoded detailed race code"
capture label define rac3pLB ///
001 "White alone" /// 
002 "Black or African American alone" /// 
003 "American Indian and Alaska Native alone" /// 
004 "Asian Indian alone" /// 
005 "Chinese alone" /// 
006 "Filipino alone" /// 
007 "Japanese alone" /// 
008 "Korean alone" /// 
009 "Vietnamese alone" /// 
010 "Other Asian alone" /// 
011 "Native Hawaiian alone" /// 
012 "Guamanian or Chamorro alone" /// 
013 "Samoan alone" /// 
014 "Other Pacific Islander alone" /// 
015 "Some Other Race alone" /// 
016 "White; Black or African American" /// 
017 "White; American Indian and Alaska Native" /// 
018 "White; Asian Indian" /// 
019 "White; Chinese" /// 
020 "White; Filipino" /// 
021 "White; Japanese" /// 
022 "White; Korean" /// 
023 "White; Vietnamese" /// 
024 "White; Other Asian" /// 
025 "White; Native Hawaiian" /// 
026 "White; Guamanian or Chamorro" /// 
027 "White; Samoan" /// 
028 "White; Other Pacific Islander" /// 
029 "White; Some Other Race" /// 
030 "Black or African American; American Indian and Alaska Native" /// 
031 "Black or African American; Asian Indian" /// 
032 "Black or African American; Chinese" /// 
033 "Black or African American; Filipino" /// 
034 "Black or African American; Japanese" /// 
035 "Black or African American; Korean" /// 
036 "Black or African American; Other Asian" /// 
037 "Black or African American; Other Pacific Islander" /// 
038 "Black or African American; Some Other Race" /// 
039 "American Indian and Alaska Native; Asian Indian" /// 
040 "American Indian and Alaska Native; Filipino" /// 
041 "American Indian and Alaska Native; Some Other Race" /// 
042 "Asian Indian; Other Asian" /// 
043 "Asian Indian; Some Other Race" /// 
044 "Chinese; Filipino" /// 
045 "Chinese; Japanese" /// 
046 "Chinese; Korean" /// 
047 "Chinese; Vietnamese" /// 
048 "Chinese; Other Asian" /// 
049 "Chinese; Native Hawaiian" /// 
050 "Filipino; Japanese" /// 
051 "Filipino; Native Hawaiian" /// 
052 "Filipino; Other Pacific Islander" /// 
053 "Filipino; Some Other Race" /// 
054 "Japanese; Korean" /// 
055 "Japanese; Native Hawaiian" /// 
056 "Vietnamese; Other Asian" /// 
057 "Other Asian; Other Pacific Islander" /// 
058 "Other Asian; Some Other Race" /// 
059 "Other Pacific Islander; Some Other Race" /// 
060 "White; Black or African American; American Indian and Alaska Native" /// 
061 "White; Black or African American; Filipino" /// 
062 "White; Black or African American; Some Other Race" /// 
063 "White; American Indian and Alaska Native; Filipino" /// 
064 "White; American Indian and Alaska Native; Some Other Race" /// 
065 "White; Chinese; Filipino" /// 
066 "White; Chinese; Japanese" /// 
067 "White; Chinese; Native Hawaiian" /// 
068 "White; Filipino; Native Hawaiian" /// 
069 "White; Japanese; Native Hawaiian" /// 
070 "White; Other Asian; Some Other Race" /// 
071 "Chinese; Filipino; Native Hawaiian" /// 
072 "White; Chinese; Filipino; Native Hawaiian" /// 
073 "White; Chinese; Japanese; Native Hawaiian" /// 
074 "Black or African American; Asian groups" /// 
075 "Black or African American; Native Hawaiian and Other Pacific Islander groups" /// 
076 "Asian Indian; Asian groups" /// 
077 "Filipino; Asian groups" /// 
078 "White; Black or African American; Asian groups" /// 
079 "White; American Indian and Alaska Native; Asian groups" /// 
080 "White; Native Hawaiian and Other Pacific Islander groups; and/or Some Other Race" /// 
081 "White; Black or African American; American Indian and Alaska Native; Asian groups" /// 
082 "White; Black or African American; American Indian and Alaska Native; and/or Native Hawaiian and Other Pacific Islander groups; and/or Some Other Race" /// 
083 "White; Black or African American; and/or Asian groups; and/or Native Hawaiian and Other Pacific Islander groups;and/or Some Other Race" /// 
084 "White; American Indian and Alaska Native; and/or Asian groups; and/or Native Hawaiian and Other Pacific Islander groups" /// 
085 "White; Chinese; Filipino; and/or Asian groups; and/or Native Hawaiian and Other Pacific Islander groups; and/or Some Other Race" /// 
086 "White; Chinese; and/or Asian groups; and/or Native Hawaiian and Other Pacific Islander groups; and/or Some Other Race" /// 
087 "White; Filipino; and/or Native Hawaiian and Other Pacific Islander groups; and/or Some Other Race" /// 
088 "White; Japanese; and/or Asian groups; and/or Native Hawaiian and Other Pacific Islander groups; and/or Some Other Race" /// 
089 "White; Asian groups; and/or Native Hawaiian and Other Pacific Islander groups; and/or Some Other Race" /// 
090 "Black or African American; American Indian and Alaska Native; and/or Asian groups; and/or Native Hawaiian and Other Pacific Islander groups; and/or Some Other Race" /// 
091 "Black or African American; Asian groups; and/or Native Hawaiian and Other Pacific Islander groups; and/or Some Other Race" /// 
092 "American Indian and Alaska Native; Asian groups; and/or Native Hawaiian and Other Pacific Islander groups; and/or Some Other Race" /// 
093 "Asian Indian; and/or White; and/or Asian groups; and/or Native Hawaiian and Other Pacific Islander groups; and/or Some Other Race" /// 
094 "Chinese; Japanese; Native Hawaiian; and/or other Asian and/or Pacific Islander groups" /// 
095 "Chinese; and/or Asian groups; and/or Native Hawaiian and Other Pacific Islander groups; and/or Some Other Race" /// 
096 "Filipino; and/or Asian groups; and/or Native Hawaiian and Other Pacific Islander groups; and/or Some Other Race" /// 
097 "Japanese; and/or Asian groups; and/or Native Hawaiian and Other Pacific Islander groups; and/or Some Other Race" /// 
098 "Korean; and/or Vietnamese; and/or Other Asian; and/or Native Hawaiian and Other Pacific Islander groups; and/or Some Other Race" /// 
099 "Native Hawaiian; and/or Pacific Islander groups; and/or Some Other Race" /// 
100 "White; and/or Black or African American; and/or American Indian and Alaska Native; and/or Asian groups; and/or Native Hawaiian and Other Pacific Islander groups; and/or Some Other Race"
capture label values RAC3P rac3pLB


capture label variable RACAIAN "American Indian and Alaska Native recode (American Indian and Alaska Native alone or in combination with one or more other races)"
capture label define racaianLB ///
0 "No" /// 
1 "Yes"
capture label values RACAIAN racaianLB


capture label variable RACAS "Asian recode (Asian alone or in combination with one or more other races)"
capture label define racasLB ///
0 "No" /// 
1 "Yes"
capture label values RACAS racasLB


capture label variable RACBLK "Black or African American recode (Black alone or in combination with one or more other races)"
capture label define racblkLB ///
0 "No" /// 
1 "Yes"
capture label values RACBLK racblkLB


capture label variable RACNH "Native Hawaiian recode (Native Hawaiian alone or in combination with one or more other races)"
capture label define racnhLB ///
0 "No" /// 
1 "Yes"
capture label values RACNH racnhLB


capture label variable RACNUM "Number of major race groups represented"


capture label variable RACPI "Other Pacific Islander recode (Other Pacific Islander alone or in combination with one or more other races)"
capture label define racpiLB ///
0 "No" /// 
1 "Yes"
capture label values RACPI racpiLB


capture label variable RACSOR "Some other race recode (Some other race alone or in combination with one or more other races)"
capture label define racsorLB ///
0 "No" /// 
1 "Yes"
capture label values RACSOR racsorLB


capture label variable RACWHT "White recode (White alone or in combination with one or more other races)"
capture label define racwhtLB ///
0 "No" /// 
1 "Yes"
capture label values RACWHT racwhtLB


capture label variable RC "Related child"
capture label define rcLB ///
0 "No (includes GQ)" /// 
1 "Yes"
capture label values RC rcLB


capture label variable SCIENGP "Field of Degree Science and Engineering Flag – NSF Definition"
capture label define sciengpLB ///
1 "Yes" /// 
2 "No"
capture label values SCIENGP sciengpLB


capture label variable SCIENGRLP "Field of Degree Science and Engineering Related Flag – NSF Definition"
capture label define sciengrlpLB ///
1 "Yes" /// 
2 "No"
capture label values SCIENGRLP sciengrlpLB


capture label variable SFN "Subfamily number"
capture label define sfnLB ///
1 "In subfamily 1" /// 
2 "In subfamily 2" /// 
3 "In subfamily 3" /// 
4 "In subfamily 4"
capture label values SFN sfnLB


capture label variable SFR "Subfamily relationship"
capture label define sfrLB ///
1 "Husband/wife no children" /// 
2 "Husband/wife with children" /// 
3 "Parent in a parent/child subfamily" /// 
4 "Child in a married-couple subfamily" /// 
5 "Child in a mother-child subfamily" /// 
6 "Child in a father-child subfamily"
capture label values SFR sfrLB

notes: For additional information on NAICS and SOC groupings within major categories visit our website at: http://www.census.gov/people/io/methodology/indexes.

capture label variable SOCP "SOC Occupation code for 2012 and later based on 2010 SOC codes"
capture label define socpLB ///
1110XX "MGR-CHIEF EXECUTIVES AND LEGISLATORS *" /// 
111021 "MGR-GENERAL AND OPERATIONS MANAGERS" /// 
112011 "MGR-ADVERTISING AND PROMOTIONS MANAGERS" /// 
112020 "MGR-MARKETING AND SALES MANAGERS" /// 
112031 "MGR-PUBLIC RELATIONS AND FUNDRAISING MANAGERS" /// 
113011 "MGR-ADMINISTRATIVE SERVICES MANAGERS" /// 
113021 "MGR-COMPUTER AND INFORMATION SYSTEMS MANAGERS" /// 
113031 "MGR-FINANCIAL MANAGERS" /// 
113111 "MGR-COMPENSATION AND BENEFITS MANAGERS" /// 
113121 "MGR-HUMAN RESOURCES MANAGERS" /// 
113131 "MGR-TRAINING AND DEVELOPMENT MANAGERS" /// 
113051 "MGR-INDUSTRIAL PRODUCTION MANAGERS" /// 
113061 "MGR-PURCHASING MANAGERS" /// 
113071 "MGR-TRANSPORTATION, STORAGE, AND DISTRIBUTION MANAGERS" /// 
119013 "MGR-FARMERS, RANCHERS, AND OTHER AGRICULTURAL MANAGERS" /// 
119021 "MGR-CONSTRUCTION MANAGERS" /// 
119030 "MGR-EDUCATION ADMINISTRATORS" /// 
119041 "MGR-ARCHITECTURAL AND ENGINEERING MANAGERS" /// 
119051 "MGR-FOOD SERVICE MANAGERS" /// 
119071 "MGR-GAMING MANAGERS" /// 
119081 "MGR-LODGING MANAGERS" /// 
119111 "MGR-MEDICAL AND HEALTH SERVICES MANAGERS" /// 
119121 "MGR-NATURAL SCIENCES MANAGERS" /// 
119141 "MGR-PROPERTY, REAL ESTATE, AND COMMUNITY ASSOCIATION MANAGERS" /// 
119151 "MGR-SOCIAL AND COMMUNITY SERVICE MANAGERS" /// 
119161 "MGR-EMERGENCY MANAGEMENT DIRECTORS" /// 
119XXX "MGR-MISCELLANEOUS MANAGERS, INCLUDING FUNERAL SERVICE MANAGERS AND POSTMASTERS AND MAIL SUPERINTENDENTS *" /// 
131011 "BUS-AGENTS AND BUSINESS MANAGERS OF ARTISTS, PERFORMERS, AND ATHLETES" /// 
131021 "BUS-BUYERS AND PURCHASING AGENTS, FARM PRODUCTS" /// 
131022 "BUS-WHOLESALE AND RETAIL BUYERS, EXCEPT FARM PRODUCTS" /// 
131023 "BUS-PURCHASING AGENTS, EXCEPT WHOLESALE, RETAIL, AND FARM PRODUCTS" /// 
131030 "BUS-CLAIMS ADJUSTERS, APPRAISERS, EXAMINERS, AND INVESTIGATORS" /// 
131041 "BUS-COMPLIANCE OFFICERS" /// 
131051 "BUS-COST ESTIMATORS" /// 
131070 "BUS-HUMAN RESOURCES WORKERS" /// 
131081 "BUS-LOGISTICIANS" /// 
131111 "BUS-MANAGEMENT ANALYSTS" /// 
131121 "BUS-MEETING CONVENTION, AND EVENT PLANNERS" /// 
131131 "BUS-FUNDRAISERS" /// 
131141 "BUS-COMPENSATION, BENEFITS, AND JOB ANALYSIS SPECIALISTS" /// 
131151 "BUS-TRAINING AND DEVELOPMENT SPECIALISTS" /// 
131161 "BUS-MARKET RESEARCH ANALYSTS AND MARKETING SPECIALISTS" /// 
131199 "BUS-BUSINESS OPERATIONS SPECIALISTS, ALL OTHER" /// 
132011 "FIN-ACCOUNTANTS AND AUDITORS" /// 
132021 "FIN-APPRAISERS AND ASSESSORS OF REAL ESTATE" /// 
132031 "FIN-BUDGET ANALYSTS" /// 
132041 "FIN-CREDIT ANALYSTS" /// 
132051 "FIN-FINANCIAL ANALYSTS" /// 
132052 "FIN-PERSONAL FINANCIAL ADVISORS" /// 
132053 "FIN-INSURANCE UNDERWRITERS" /// 
132061 "FIN-FINANCIAL EXAMINERS" /// 
132070 "FIN-CREDIT COUNSELORS AND LOAN OFFICERS" /// 
132081 "FIN-TAX EXAMINERS AND COLLECTORS, AND REVENUE AGENTS" /// 
132082 "FIN-TAX PREPARERS" /// 
132099 "FIN-FINANCIAL SPECIALISTS, ALL OTHER" /// 
151111 "CMM-COMPUTER AND INFORMATION RESEARCH SCIENTISTS" /// 
151121 "CMM-COMPUTER SYSTEMS ANALYSTS" /// 
151122 "CMM-INFORMATION SECURITY ANALYSTS" /// 
151131 "CMM-COMPUTER PROGRAMMERS" /// 
15113X "CMM-SOFTWARE DEVELOPERS,APPLICATIONS AND SYSTEMS SOFTWARE*" /// 
151134 "CMM-WEB DEVELOPERS" /// 
151141 "CMM-DATABASE ADMINISTRATORS" /// 
151142 "CMM-NETWORK AND COMPUTER SYSTEMS ADMINISTRATORS" /// 
151143 "CMM-COMPUTER NETWORK ARCHITECTS" /// 
151150 "CMM-COMPUTER SUPPORT SPECIALISTS" /// 
151199 "CMM-COMPUTER OCCUPATIONS, ALL OTHER" /// 
152011 "CMM-ACTUARIES" /// 
152031 "CMM-OPERATIONS RESEARCH ANALYSTS" /// 
1520XX "CMM-MISCELLANEOUS MATHEMATICAL SCIENCE OCCUPATIONS, INCLUDING MATHEMATICIANS AND STATISTICIANS *" /// 
171010 "ENG-ARCHITECTS, EXCEPT NAVAL" /// 
171020 "ENG-SURVEYORS, CARTOGRAPHERS, AND PHOTOGRAMMETRISTS" /// 
172011 "ENG-AEROSPACE ENGINEERS" /// 
1720XX "ENG-BIOMEDICAL AND AGRICULTURAL ENGINEERS *" /// 
172041 "ENG-CHEMICAL ENGINEERS" /// 
172051 "ENG-CIVIL ENGINEERS" /// 
172061 "ENG-COMPUTER HARDWARE ENGINEERS" /// 
172070 "ENG-ELECTRICAL AND ELECTRONICS ENGINEERS" /// 
172081 "ENG-ENVIRONMENTAL ENGINEERS" /// 
172110 "ENG-INDUSTRIAL ENGINEERS, INCLUDING HEALTH AND SAFETY" /// 
172121 "ENG-MARINE ENGINEERS AND NAVAL ARCHITECTS" /// 
172131 "ENG-MATERIALS ENGINEERS" /// 
172141 "ENG-MECHANICAL ENGINEERS" /// 
1721XX "ENG-PETROLEUM, MINING AND GEOLOGICAL ENGINEERS, INCLUDING MINING SAFETY ENGINEERS *" /// 
1721YY "ENG-MISCELLANEOUS ENGINEERS, INCLUDING NUCLEAR ENGINEERS *" /// 
173010 "ENG-DRAFTERS" /// 
173020 "ENG-ENGINEERING TECHNICIANS, EXCEPT DRAFTERS" /// 
173031 "ENG-SURVEYING AND MAPPING TECHNICIANS" /// 
191010 "SCI-AGRICULTURAL AND FOOD SCIENTISTS" /// 
191020 "SCI-BIOLOGICAL SCIENTISTS" /// 
191030 "SCI-CONSERVATION SCIENTISTS AND FORESTERS" /// 
1910XX "SCI-MEDICAL SCIENTISTS, AND LIFE SCIENTISTS, ALL OTHER *" /// 
192010 "SCI-ASTRONOMERS AND PHYSICISTS" /// 
192021 "SCI-ATMOSPHERIC AND SPACE SCIENTISTS" /// 
192030 "SCI-CHEMISTS AND MATERIALS SCIENTISTS" /// 
192040 "SCI-ENVIRONMENTAL SCIENTISTS AND GEOSCIENTISTS" /// 
192099 "SCI-PHYSICAL SCIENTISTS, ALL OTHER" /// 
193011 "SCI-ECONOMISTS" /// 
193030 "SCI-PSYCHOLOGISTS" /// 
193051 "SCI-URBAN AND REGIONAL PLANNERS" /// 
1930XX "SCI-MISCELLANEOUS SOCIAL SCIENTISTS, INCLUDING SURVEY RESEARCHERS AND SOCIOLOGISTS *" /// 
194011 "SCI-AGRICULTURAL AND FOOD SCIENCE TECHNICIANS" /// 
194021 "SCI-BIOLOGICAL TECHNICIANS" /// 
194031 "SCI-CHEMICAL TECHNICIANS" /// 
1940XX "SCI-GEOLOGICAL AND PETROLEUM TECHNICIANS, AND NUCLEAR TECHNICIANS *" /// 
1940YY "SCI-MISCELLANEOUS LIFE, PHYSICAL, AND SOCIAL SCIENCE TECHNICIANS, INCLUDING SOCIAL SCIENCE RESEARCH ASSISTANTS*" /// 
211010 "CMS-COUNSELORS" /// 
211020 "CMS-SOCIAL WORKERS" /// 
211092 "CMS-PROBATION OFFICERS AND CORRECTIONAL TREATMENT SPECIALISTS" /// 
211093 "CMS-SOCIAL AND HUMAN SERVICE ASSISTANTS" /// 
21109X "CMS-MISCELLANEOUS COMMUNITY AND SOCIAL SERVICE SPECIALISTS,INCLUDING HEALTH EDUCATORS AND COMMUNITY HEALTH WORKERS *" /// 
212011 "CMS-CLERGY" /// 
212021 "CMS-DIRECTORS, RELIGIOUS ACTIVITIES AND EDUCATION" /// 
212099 "CMS-RELIGIOUS WORKERS, ALL OTHER" /// 
2310XX "LGL-LAWYERS, AND JUDGES, MAGISTRATES, AND OTHER JUDICIAL WORKERS *" /// 
231012 "LGL-JUDICIAL LAW CLERKS" /// 
232011 "LGL-PARALEGALS AND LEGAL ASSISTANTS" /// 
232090 "LGL-MISCELLANEOUS LEGAL SUPPORT WORKERS" /// 
251000 "EDU-POSTSECONDARY TEACHERS" /// 
252010 "EDU-PRESCHOOL AND KINDERGARTEN TEACHERS" /// 
252020 "EDU-ELEMENTARY AND MIDDLE SCHOOL TEACHERS" /// 
252030 "EDU-SECONDARY SCHOOL TEACHERS" /// 
252050 "EDU-SPECIAL EDUCATION TEACHERS" /// 
253000 "EDU-OTHER TEACHERS AND INSTRUCTORS" /// 
254010 "EDU-ARCHIVISTS, CURATORS, AND MUSEUM TECHNICIANS" /// 
254021 "EDU-LIBRARIANS" /// 
254031 "EDU-LIBRARY TECHNICIANS" /// 
259041 "EDU-TEACHER ASSISTANTS" /// 
2590XX "EDU-OTHER EDUCATION, TRAINING, AND LIBRARY WORKERS *" /// 
271010 "ENT-ARTISTS AND RELATED WORKERS" /// 
271020 "ENT-DESIGNERS" /// 
272011 "ENT-ACTORS" /// 
272012 "ENT-PRODUCERS AND DIRECTORS" /// 
272020 "ENT-ATHLETES, COACHES, UMPIRES, AND RELATED WORKERS" /// 
272030 "ENT-DANCERS AND CHOREOGRAPHERS" /// 
272040 "ENT-MUSICIANS, SINGERS, AND RELATED WORKERS" /// 
272099 "ENT-ENTERTAINERS AND PERFORMERS, SPORTS AND RELATED WORKERS, ALL OTHER" /// 
273010 "ENT-ANNOUNCERS" /// 
273020 "ENT-NEWS ANALYSTS, REPORTERS AND CORRESPONDENTS" /// 
273031 "ENT-PUBLIC RELATIONS SPECIALISTS" /// 
273041 "ENT-EDITORS" /// 
273042 "ENT-TECHNICAL WRITERS" /// 
273043 "ENT-WRITERS AND AUTHORS" /// 
273090 "ENT-MISCELLANEOUS MEDIA AND COMMUNICATION WORKERS" /// 
2740XX "ENT-BROADCAST AND SOUND ENGINEERING TECHNICIANS AND RADIO OPERATORS, AND MEDIA AND COMMUNICATION EQUIPMENT WORKERS, ALL OTHER *" /// 
274021 "ENT-PHOTOGRAPHERS" /// 
274030 "ENT-TELEVISION, VIDEO, AND MOTION PICTURE CAMERA OPERATORS AND EDITORS" /// 
291011 "MED-CHIROPRACTORS" /// 
291020 "MED-DENTISTS" /// 
291031 "MED-DIETITIANS AND NUTRITIONISTS" /// 
291041 "MED-OPTOMETRISTS" /// 
291051 "MED-PHARMACISTS" /// 
291060 "MED-PHYSICIANS AND SURGEONS" /// 
291071 "MED-PHYSICIAN ASSISTANTS" /// 
291081 "MED-PODIATRISTS" /// 
291122 "MED-OCCUPATIONAL THERAPISTS" /// 
291123 "MED-PHYSICAL THERAPISTS" /// 
291124 "MED-RADIATION THERAPISTS" /// 
291125 "MED-RECREATIONAL THERAPISTS" /// 
291126 "MED-RESPIRATORY THERAPISTS" /// 
291127 "MED-SPEECH-LANGUAGE PATHOLOGISTS" /// 
29112X "MED-OTHER THERAPISTS, INCLUDING EXERCISE PHYSIOLOGISTS *" /// 
291131 "MED-VETERINARIANS" /// 
291141 "MED-REGISTERED NURSES" /// 
291151 "MED-NURSE ANESTHETISTS" /// 
291181 "MED-AUDIOLOGISTS" /// 
291199 "MED-HEALTH DIAGNOSING AND TREATING PRACTITIONERS, ALL OTHER" /// 
2911XX "MED-NURSE PRACTITIONERS AND NURSE MIDWIVES *" /// 
292010 "MED-CLINICAL LABORATORY TECHNOLOGISTS AND TECHNICIANS" /// 
292021 "MED-DENTAL HYGIENISTS" /// 
292030 "MED-DIAGNOSTIC RELATED TECHNOLOGISTS AND TECHNICIANS" /// 
292041 "MED-EMERGENCY MEDICAL TECHNICIANS AND PARAMEDICS" /// 
292050 "MED-HEALTH PRACTITIONER SUPPORT TECHNOLOGISTS AND TECHNICIANS" /// 
292061 "MED-LICENSED PRACTICAL AND LICENSED VOCATIONAL NURSES" /// 
292071 "MED-MEDICAL RECORDS AND HEALTH INFORMATION TECHNICIANS" /// 
292081 "MED-OPTICIANS, DISPENSING" /// 
292090 "MED-MISCELLANEOUS HEALTH TECHNOLOGISTS AND TECHNICIANS" /// 
299000 "MED-OTHER HEALTHCARE PRACTITIONERS AND TECHNICAL OCCUPATIONS" /// 
311010 "HLS-NURSING, PSYCHIATRIC, AND HOME HEALTH AIDES" /// 
312010 "HLS-OCCUPATIONAL THERAPY ASSISTANTS AND AIDES" /// 
312020 "HLS-PHYSICAL THERAPIST ASSISTANTS AND AIDES" /// 
319011 "HLS-MASSAGE THERAPISTS" /// 
319091 "HLS-DENTAL ASSISTANTS" /// 
319092 "HLS-MEDICAL ASSISTANTS" /// 
319094 "HLS-MEDICAL TRANSCRIPTIONISTS" /// 
319095 "HLS-PHARMACY AIDES" /// 
319096 "HLS-VETERINARY ASSISTANTS AND LABORATORY ANIMAL CARETAKERS" /// 
319097 "HLS-PHLEBOTOMISTS" /// 
31909X "HEALTHCARE SUPPORT WORKERS, ALL OTHER, INCLUDING MEDICAL EQUIPMENT PREPARERS *" /// 
331011 "PRT-FIRST-LINE SUPERVISORS OF CORRECTIONAL OFFICERS" /// 
331012 "PRT-FIRST-LINE SUPERVISORS OF POLICE AND DETECTIVES" /// 
331021 "PRT-FIRST-LINE SUPERVISORS OF FIRE FIGHTING AND PREVENTION WORKERS" /// 
331099 "PRT-FIRST-LINE SUPERVISORS OF PROTECTIVE SERVICE WORKERS, ALL OTHER" /// 
332011 "PRT-FIREFIGHTERS" /// 
332020 "PRT-FIRE INSPECTORS" /// 
333010 "PRT-BAILIFFS, CORRECTIONAL OFFICERS, AND JAILERS" /// 
333021 "PRT-DETECTIVES AND CRIMINAL INVESTIGATORS" /// 
3330XX "PRT-MISCELLANEOUS LAW ENFORCEMENT WORKERS *" /// 
333050 "PRT-POLICE OFFICERS" /// 
339011 "PRT-ANIMAL CONTROL WORKERS" /// 
339021 "PRT-PRIVATE DETECTIVES AND INVESTIGATORS" /// 
339030 "PRT-SECURITY GUARDS AND GAMING SURVEILLANCE OFFICERS" /// 
339091 "PRT-CROSSING GUARDS" /// 
339093 "PRT-TRANSPORTATION SECURITY SCREENERS" /// 
33909X "PRT-LIFEGUARDS AND OTHER RECREATIONAL, AND ALL OTHER PROTECTIVE SERVICE WORKERS *" /// 
351011 "EAT-CHEFS AND HEAD COOKS" /// 
351012 "EAT-FIRST-LINE SUPERVISORS OF FOOD PREPARATION AND SERVING WORKERS" /// 
352010 "EAT-COOKS" /// 
352021 "EAT-FOOD PREPARATION WORKERS" /// 
353011 "EAT-BARTENDERS" /// 
353021 "EAT-COMBINED FOOD PREPARATION AND SERVING WORKERS, INCLUDING FAST FOOD" /// 
353022 "EAT-COUNTER ATTENDANTS, CAFETERIA, FOOD CONCESSION, AND COFFEE SHOP" /// 
353031 "EAT-WAITERS AND WAITRESSES" /// 
353041 "EAT-FOOD SERVERS, NONRESTAURANT" /// 
3590XX "EAT-MISCELLANEOUS FOOD PREPARATION AND SERVING RELATED WORKERS, INCLUDING DINING ROOM AND CAFETERIA ATTENDANTS AND BARTENDER HELPERS *" /// 
359021 "EAT-DISHWASHERS" /// 
359031 "EAT-HOSTS AND HOSTESSES, RESTAURANT, LOUNGE, AND COFFEE SHOP" /// 
371011 "CLN-FIRST-LINE SUPERVISORS OF HOUSEKEEPING AND JANITORIAL WORKERS" /// 
371012 "CLN-FIRST-LINE SUPERVISORS OF LANDSCAPING, LAWN SERVICE, AND GROUNDSKEEPING WORKERS" /// 
37201X "CLN-JANITORS AND BUILDING CLEANERS *" /// 
372012 "CLN-MAIDS AND HOUSEKEEPING CLEANERS" /// 
372021 "CLN-PEST CONTROL WORKERS" /// 
373010 "CLN-GROUNDS MAINTENANCE WORKERS" /// 
391010 "PRS-FIRST-LINE SUPERVISORS OF GAMING WORKERS" /// 
391021 "PRS-FIRST-LINE SUPERVISORS OF PERSONAL SERVICE WORKERS" /// 
392011 "PRS-ANIMAL TRAINERS" /// 
392021 "PRS-NONFARM ANIMAL CARETAKERS" /// 
393010 "PRS-GAMING SERVICES WORKERS" /// 
393021 "PRS-MOTION PICTURE PROJECTIONISTS" /// 
393031 "PRS-USHERS, LOBBY ATTENDANTS, AND TICKET TAKERS" /// 
393090 "PRS-MISCELLANEOUS ENTERTAINMENT ATTENDANTS AND RELATED WORKERS" /// 
394031 "PRS-MORTICIANS, UNDERTAKERS, AND FUNERAL DIRECTORS" /// 
3940XX "PRS-EMBALMERS AND FUNERAL ATTENDANTS *" /// 
395011 "PRS-BARBERS" /// 
395012 "PRS-HAIRDRESSERS, HAIRSTYLISTS, AND COSMETOLOGISTS" /// 
395090 "PRS-MISCELLANEOUS PERSONAL APPEARANCE WORKERS" /// 
396010 "PRS-BAGGAGE PORTERS, BELLHOPS, AND CONCIERGES" /// 
397010 "PRS-TOUR AND TRAVEL GUIDES" /// 
399011 "PRS-CHILDCARE WORKERS" /// 
399021 "PRS-PERSONAL CARE AIDES" /// 
399030 "PRS-RECREATION AND FITNESS WORKERS" /// 
399041 "PRS-RESIDENTIAL ADVISORS" /// 
399099 "PRS-PERSONAL CARE AND SERVICE WORKERS, ALL OTHER" /// 
411011 "SAL-FIRST-LINE SUPERVISORS OF RETAIL SALES WORKERS" /// 
411012 "SAL-FIRST-LINE SUPERVISORS OF NON-RETAIL SALES WORKERS" /// 
412010 "SAL-CASHIERS" /// 
412021 "SAL-COUNTER AND RENTAL CLERKS" /// 
412022 "SAL-PARTS SALESPERSONS" /// 
412031 "SAL-RETAIL SALESPERSONS" /// 
413011 "SAL-ADVERTISING SALES AGENTS" /// 
413021 "SAL-INSURANCE SALES AGENTS" /// 
413031 "SAL-SECURITIES, COMMODITIES, AND FINANCIAL SERVICES SALES AGENTS" /// 
413041 "SAL-TRAVEL AGENTS" /// 
413099 "SAL-SALES REPRESENTATIVES, SERVICES, ALL OTHER" /// 
414010 "SAL-SALES REPRESENTATIVES, WHOLESALE AND MANUFACTURING" /// 
419010 "SAL-MODELS, DEMONSTRATORS, AND PRODUCT PROMOTERS" /// 
419020 "SAL-REAL ESTATE BROKERS AND SALES AGENTS" /// 
419031 "SAL-SALES ENGINEERS" /// 
419041 "SAL-TELEMARKETERS" /// 
419091 "SAL-DOOR-TO-DOOR SALES WORKERS, NEWS AND STREET VENDORS, AND RELATED WORKERS" /// 
419099 "SAL-SALES AND RELATED WORKERS, ALL OTHER" /// 
431011 "OFF-FIRST-LINE SUPERVISORS OF OFFICE AND ADMINISTRATIVE SUPPORT WORKERS" /// 
432011 "OFF-SWITCHBOARD OPERATORS, INCLUDING ANSWERING SERVICE" /// 
432021 "OFF-TELEPHONE OPERATORS" /// 
432099 "OFF-COMMUNICATIONS EQUIPMENT OPERATORS, ALL OTHER" /// 
433011 "OFF-BILL AND ACCOUNT COLLECTORS" /// 
433021 "OFF-BILLING AND POSTING CLERKS" /// 
433031 "OFF-BOOKKEEPING, ACCOUNTING, AND AUDITING CLERKS" /// 
433041 "OFF-GAMING CAGE WORKERS" /// 
433051 "OFF-PAYROLL AND TIMEKEEPING CLERKS" /// 
433061 "OFF-PROCUREMENT CLERKS" /// 
433071 "OFF-TELLERS" /// 
433099 "OFF-FINANCIAL CLERKS, ALL OTHER" /// 
434011 "OFF-BROKERAGE CLERKS" /// 
434031 "OFF-COURT, MUNICIPAL, AND LICENSE CLERKS" /// 
434041 "OFF-CREDIT AUTHORIZERS, CHECKERS, AND CLERKS" /// 
434051 "OFF-CUSTOMER SERVICE REPRESENTATIVES" /// 
434061 "OFF-ELIGIBILITY INTERVIEWERS, GOVERNMENT PROGRAMS" /// 
434071 "OFF-FILE CLERKS" /// 
434081 "OFF-HOTEL, MOTEL, AND RESORT DESK CLERKS" /// 
434111 "OFF-INTERVIEWERS, EXCEPT ELIGIBILITY AND LOAN" /// 
434121 "OFF-LIBRARY ASSISTANTS, CLERICAL" /// 
434131 "OFF-LOAN INTERVIEWERS AND CLERKS" /// 
434141 "OFF-NEW ACCOUNTS CLERKS" /// 
434XXX "OFF-CORRESPONDENCE CLERKS AND ORDER CLERKS *" /// 
434161 "OFF-HUMAN RESOURCES ASSISTANTS, EXCEPT PAYROLL AND TIMEKEEPING" /// 
434171 "OFF-RECEPTIONISTS AND INFORMATION CLERKS" /// 
434181 "OFF-RESERVATION AND TRANSPORTATION TICKET AGENTS AND TRAVEL CLERKS" /// 
434199 "OFF-INFORMATION AND RECORD CLERKS, ALL OTHER" /// 
435011 "OFF-CARGO AND FREIGHT AGENTS" /// 
435021 "OFF-COURIERS AND MESSENGERS" /// 
435030 "OFF-DISPATCHERS" /// 
435041 "OFF-METER READERS, UTILITIES" /// 
435051 "OFF-POSTAL SERVICE CLERKS" /// 
435052 "OFF-POSTAL SERVICE MAIL CARRIERS" /// 
435053 "OFF-POSTAL SERVICE MAIL SORTERS, PROCESSORS, AND PROCESSING MACHINE OPERATORS" /// 
435061 "OFF-PRODUCTION, PLANNING, AND EXPEDITING CLERKS" /// 
435071 "OFF-SHIPPING, RECEIVING, AND TRAFFIC CLERKS" /// 
435081 "OFF-STOCK CLERKS AND ORDER FILLERS" /// 
435111 "OFF-WEIGHERS, MEASURERS, CHECKERS, AND SAMPLERS, RECORDKEEPING" /// 
436010 "OFF-SECRETARIES AND ADMINISTRATIVE ASSISTANTS" /// 
439011 "OFF-COMPUTER OPERATORS" /// 
439021 "OFF-DATA ENTRY KEYERS" /// 
439022 "OFF-WORD PROCESSORS AND TYPISTS" /// 
439041 "OFF-INSURANCE CLAIMS AND POLICY PROCESSING CLERKS" /// 
439051 "OFF-MAIL CLERKS AND MAIL MACHINE OPERATORS, EXCEPT POSTAL SERVICE" /// 
439061 "OFF-OFFICE CLERKS, GENERAL" /// 
439071 "OFF-OFFICE MACHINE OPERATORS, EXCEPT COMPUTER" /// 
439081 "OFF-PROOFREADERS AND COPY MARKERS" /// 
439111 "OFF-STATISTICAL ASSISTANTS" /// 
439XXX "OFF-MISCELLANEOUS OFFICE AND ADMINISTRATIVE SUPPORT WORKERS, INCLUDING DESKTOP PUBLISHERS *" /// 
451011 "FFF-FIRST-LINE SUPERVISORS OF FARMING, FISHING, AND FORESTRY WORKERS" /// 
452011 "FFF-AGRICULTURAL INSPECTORS" /// 
452041 "FFF-GRADERS AND SORTERS, AGRICULTURAL PRODUCTS" /// 
4520XX "FFF-MISCELLANEOUS AGRICULTURAL WORKERS, INCLUDING ANIMAL BREEDERS *" /// 
453000 "FFF-FISHING AND HUNTING WORKERS" /// 
454011 "FFF-FOREST AND CONSERVATION WORKERS" /// 
454020 "FFF-LOGGING WORKERS" /// 
471011 "CON-FIRST-LINE SUPERVISORS OF CONSTRUCTION TRADES AND EXTRACTION WORKERS" /// 
472011 "CON-BOILERMAKERS" /// 
472031 "CON-CARPENTERS" /// 
472040 "CON-CARPET, FLOOR, AND TILE INSTALLERS AND FINISHERS" /// 
472050 "CON-CEMENT MASONS, CONCRETE FINISHERS, AND TERRAZZO WORKERS" /// 
472061 "CON-CONSTRUCTION LABORERS" /// 
472071 "CON-PAVING, SURFACING, AND TAMPING EQUIPMENT OPERATORS" /// 
47207X "CON-CONSTRUCTION EQUIPMENT OPERATORS, EXCEPT PAVING, SURFACING, AND TAMPING EQUIPMENT OPERATORS *" /// 
472080 "CON-DRYWALL INSTALLERS, CEILING TILE INSTALLERS, AND TAPERS" /// 
472111 "CON-ELECTRICIANS" /// 
472121 "CON-GLAZIERS" /// 
472130 "CON-INSULATION WORKERS" /// 
472140 "CON-PAINTERS AND PAPERHANGERS" /// 
472150 "CON-PIPELAYERS, PLUMBERS, PIPEFITTERS, AND STEAMFITTERS" /// 
472161 "CON-PLASTERERS AND STUCCO MASONS" /// 
472181 "CON-ROOFERS" /// 
472211 "CON-SHEET METAL WORKERS" /// 
472221 "CON-STRUCTURAL IRON AND STEEL WORKERS" /// 
472XXX "CON-BRICKMASONS, BLOCKMASONS, STONEMASONS, AND REINFORCING IRON AND REBAR WORKERS" /// 
473010 "CON-HELPERS, CONSTRUCTION TRADES" /// 
474011 "CON-CONSTRUCTION AND BUILDING INSPECTORS" /// 
474021 "CON-ELEVATOR INSTALLERS AND REPAIRERS" /// 
474031 "CON-FENCE ERECTORS" /// 
474041 "CON-HAZARDOUS MATERIALS REMOVAL WORKERS" /// 
474051 "CON-HIGHWAY MAINTENANCE WORKERS" /// 
474061 "CON-RAIL-TRACK LAYING AND MAINTENANCE EQUIPMENT OPERATORS" /// 
47XXXX "CON-MISCELLANEOUS CONSTRUCTION WORKERS, INCLUDING SOLAR PHOTOVOLTAIC INSTALLERS, SEPTIC TANK SERVICERS AND SEWER PIPE CLEANERS *" /// 
4750YY "EXT-DERRICK, ROTARY DRILL, AND SERVICE UNIT OPERATORS, AND ROUSTABOUTS, OIL, GAS, AND MINING *" /// 
475021 "EXT-EARTH DRILLERS, EXCEPT OIL AND GAS" /// 
475031 "EXT-EXPLOSIVES WORKERS, ORDNANCE HANDLING EXPERTS, AND BLASTERS" /// 
475040 "EXT-MINING MACHINE OPERATORS" /// 
4750XX "EXT-MISCELLANEOUS EXTRACTION WORKERS, INCLUDING ROOF BOLTERS AND HELPERS *" /// 
491011 "RPR-FIRST-LINE SUPERVISORS OF MECHANICS, INSTALLERS, AND REPAIRERS" /// 
492011 "RPR-COMPUTER, AUTOMATED TELLER, AND OFFICE MACHINE REPAIRERS" /// 
492020 "RPR-RADIO AND TELECOMMUNICATIONS EQUIPMENT INSTALLERS AND REPAIRERS" /// 
492091 "RPR-AVIONICS TECHNICIANS" /// 
492092 "RPR-ELECTRIC MOTOR, POWER TOOL, AND RELATED REPAIRERS" /// 
49209X "RPR-ELECTRICAL AND ELECTRONICS REPAIRERS, TRANSPORTATION EQUIPMENT, AND INDUSTRIAL AND UTILITY *" /// 
492096 "RPR-ELECTRONIC EQUIPMENT INSTALLERS AND REPAIRERS, MOTOR VEHICLES" /// 
492097 "RPR-ELECTRONIC HOME ENTERTAINMENT EQUIPMENT INSTALLERS AND REPAIRERS" /// 
492098 "RPR-SECURITY AND FIRE ALARM SYSTEMS INSTALLERS" /// 
493011 "RPR-AIRCRAFT MECHANICS AND SERVICE TECHNICIANS" /// 
493021 "RPR-AUTOMOTIVE BODY AND RELATED REPAIRERS" /// 
493022 "RPR-AUTOMOTIVE GLASS INSTALLERS AND REPAIRERS" /// 
493023 "RPR-AUTOMOTIVE SERVICE TECHNICIANS AND MECHANICS" /// 
493031 "RPR-BUS AND TRUCK MECHANICS AND DIESEL ENGINE SPECIALISTS" /// 
493040 "RPR-HEAVY VEHICLE AND MOBILE EQUIPMENT SERVICE TECHNICIANS AND MECHANICS" /// 
493050 "RPR-SMALL ENGINE MECHANICS" /// 
493090 "RPR-MISCELLANEOUS VEHICLE AND MOBILE EQUIPMENT MECHANICS, INSTALLERS, AND REPAIRERS" /// 
499010 "RPR-CONTROL AND VALVE INSTALLERS AND REPAIRERS" /// 
499021 "RPR-HEATING, AIR CONDITIONING, AND REFRIGERATION MECHANICS AND INSTALLERS" /// 
499031 "RPR-HOME APPLIANCE REPAIRERS" /// 
49904X "RPR-INDUSTRIAL AND REFRACTORY MACHINERY MECHANICS *" /// 
499043 "RPR-MAINTENANCE WORKERS, MACHINERY" /// 
499044 "RPR-MILLWRIGHTS" /// 
499051 "RPR-ELECTRICAL POWER-LINE INSTALLERS AND REPAIRERS" /// 
499052 "RPR-TELECOMMUNICATIONS LINE INSTALLERS AND REPAIRERS" /// 
499060 "RPR-PRECISION INSTRUMENT AND EQUIPMENT REPAIRERS" /// 
499071 "RPR-MAINTENANCE AND REPAIR WORKERS, GENERAL" /// 
499091 "RPR-COIN, VENDING, AND AMUSEMENT MACHINE SERVICERS AND REPAIRERS" /// 
499094 "RPR-LOCKSMITHS AND SAFE REPAIRERS" /// 
499096 "RPR-RIGGERS" /// 
499098 "RPR-HELPERS--INSTALLATION, MAINTENANCE, AND REPAIR WORKERS" /// 
4990XX "RPR-MISCELLANEOUS INSTALLATION, MAINTENANCE, AND REPAIR WORKERS, INCLUDING WIND TURBINE SERVICE TECHNICIANS" /// 
511011 "PRD-FIRST-LINE SUPERVISORS OF PRODUCTION AND OPERATING WORKERS" /// 
512011 "PRD-AIRCRAFT STRUCTURE, SURFACES, RIGGING, AND SYSTEMS ASSEMBLERS" /// 
512020 "PRD-ELECTRICAL, ELECTRONICS, AND ELECTROMECHANICAL ASSEMBLERS" /// 
512031 "PRD-ENGINE AND OTHER MACHINE ASSEMBLERS" /// 
512041 "PRD-STRUCTURAL METAL FABRICATORS AND FITTERS" /// 
512090 "PRD-MISCELLANEOUS ASSEMBLERS AND FABRICATORS" /// 
513011 "PRD-BAKERS" /// 
513020 "PRD-BUTCHERS AND OTHER MEAT, POULTRY, AND FISH PROCESSING WORKERS" /// 
513091 "PRD-FOOD AND TOBACCO ROASTING, BAKING, AND DRYING MACHINE OPERATORS AND TENDERS" /// 
513092 "PRD-FOOD BATCHMAKERS" /// 
513093 "PRD-FOOD COOKING MACHINE OPERATORS AND TENDERS" /// 
513099 "PRD-FOOD PROCESSING WORKERS, ALL OTHER" /// 
514010 "PRD-COMPUTER CONTROL PROGRAMMERS AND OPERATORS" /// 
514021 "PRD-EXTRUDING AND DRAWING MACHINE SETTERS, OPERATORS, AND TENDERS, METAL AND PLASTIC" /// 
514022 "PRD-FORGING MACHINE SETTERS, OPERATORS, AND TENDERS, METAL AND PLASTIC" /// 
514023 "PRD-ROLLING MACHINE SETTERS, OPERATORS, AND TENDERS, METAL AND PLASTIC" /// 
514030 "PRD-MACHINE TOOL CUTTING SETTERS, OPERATORS, AND TENDERS,METAL AND PLASTIC" /// 
514041 "PRD-MACHINISTS" /// 
514050 "PRD-METAL FURNACE OPERATORS, TENDERS, POURERS, AND CASTERS" /// 
5140XX "PRD-MODEL MAKERS, PATTERNMAKERS, AND MOLDING MACHINE SETTERS, METAL AND PLASTIC" /// 
514111 "PRD-TOOL AND DIE MAKERS" /// 
514120 "PRD-WELDING, SOLDERING, AND BRAZING WORKERS" /// 
514XXX "PRD-MISCELLANEOUS METAL WORKERS AND PLASTIC WORKERS, INCLUDING MULTIPLE MACHINE TOOL SETTERS *" /// 
515111 "PRD-PREPRESS TECHNICIANS AND WORKERS" /// 
515112 "PRD-PRINTING PRESS OPERATORS" /// 
515113 "PRD-PRINT BINDING AND FINISHING WORKERS" /// 
516011 "PRD-LAUNDRY AND DRY-CLEANING WORKERS" /// 
516021 "PRD-PRESSERS, TEXTILE, GARMENT, AND RELATED MATERIALS" /// 
516031 "PRD-SEWING MACHINE OPERATORS" /// 
516040 "PRD-SHOE AND LEATHER WORKERS" /// 
516050 "PRD-TAILORS, DRESSMAKERS, AND SEWERS" /// 
51606X "PRD-TEXTILE BLEACHING AND DYEING, AND CUTTING MACHINE SETTERS, OPERATORS, AND TENDERS *" /// 
516063 "PRD-TEXTILE KNITTING AND WEAVING MACHINE SETTERS, OPERATORS, AND TENDERS" /// 
516064 "PRD-TEXTILE WINDING, TWISTING, AND DRAWING OUT MACHINE SETTERS, OPERATORS, AND TENDERS" /// 
516093 "PRD-UPHOLSTERERS" /// 
51609X "PRD-MISCELLANEOUS TEXTILE, APPAREL, AND FURNISHINGS WORKERS, EXCEPT UPHOLSTERERS *" /// 
517011 "PRD-CABINETMAKERS AND BENCH CARPENTERS" /// 
517021 "PRD-FURNITURE FINISHERS" /// 
517041 "PRD-SAWING MACHINE SETTERS, OPERATORS, AND TENDERS, WOOD" /// 
517042 "PRD-WOODWORKING MACHINE SETTERS, OPERATORS, AND TENDERS, EXCEPT SAWING" /// 
5170XX "PRD-MISCELLANEOUS WOODWORKERS, INCLUDING MODEL MAKERS AND PATTERNMAKERS *" /// 
518010 "PRD-POWER PLANT OPERATORS, DISTRIBUTORS, AND DISPATCHERS" /// 
518021 "PRD-STATIONARY ENGINEERS AND BOILER OPERATORS" /// 
518031 "PRD-WATER AND WASTEWATER TREATMENT PLANT AND SYSTEM OPERATORS" /// 
518090 "PRD-MISCELLANEOUS PLANT AND SYSTEM OPERATORS" /// 
519010 "PRD-CHEMICAL PROCESSING MACHINE SETTERS, OPERATORS, AND TENDERS" /// 
519020 "PRD-CRUSHING, GRINDING, POLISHING, MIXING, AND BLENDING WORKERS" /// 
519030 "PRD-CUTTING WORKERS" /// 
519041 "PRD-EXTRUDING, FORMING, PRESSING, AND COMPACTING MACHINE SETTERS, OPERATORS, AND TENDERS" /// 
519051 "PRD-FURNACE, KILN, OVEN, DRIER, AND KETTLE OPERATORS AND TENDERS" /// 
519061 "PRD-INSPECTORS, TESTERS, SORTERS, SAMPLERS, AND WEIGHERS" /// 
519071 "PRD-JEWELERS AND PRECIOUS STONE AND METAL WORKERS" /// 
519080 "PRD-MEDICAL, DENTAL, AND OPHTHALMIC LABORATORY TECHNICIANS" /// 
519111 "PRD-PACKAGING AND FILLING MACHINE OPERATORS AND TENDERS" /// 
519120 "PRD-PAINTING WORKERS" /// 
519151 "PRD-PHOTOGRAPHIC PROCESS WORKERS AND PROCESSING MACHINE OPERATORS" /// 
519191 "PRD-ADHESIVE BONDING MACHINE OPERATORS AND TENDERS" /// 
519194 "PRD-ETCHERS AND ENGRAVERS" /// 
519195 "PRD-MOLDERS, SHAPERS, AND CASTERS, EXCEPT METAL AND PLASTIC" /// 
519196 "PRD-PAPER GOODS MACHINE SETTERS, OPERATORS, AND TENDERS" /// 
519197 "PRD-TIRE BUILDERS" /// 
519198 "PRD-HELPERS-PRODUCTION WORKERS" /// 
5191XX "PRD-MISCELLANEOUS PRODUCTION WORKERS, INCLUDING SEMICONDUCTOR PROCESSORS *" /// 
531000 "TRN-SUPERVISORS OF TRANSPORTATION AND MATERIAL MOVING WORKERS" /// 
532010 "TRN-AIRCRAFT PILOTS AND FLIGHT ENGINEERS" /// 
532020 "TRN-AIR TRAFFIC CONTROLLERS AND AIRFIELD OPERATIONS SPECIALISTS" /// 
532031 "TRN-FLIGHT ATTENDANTS" /// 
533011 "TRN-AMBULANCE DRIVERS AND ATTENDANTS, EXCEPT EMERGENCY MEDICAL TECHNICIANS" /// 
533020 "TRN-BUS DRIVERS" /// 
533030 "TRN-DRIVER/SALES WORKERS AND TRUCK DRIVERS" /// 
533041 "TRN-TAXI DRIVERS AND CHAUFFEURS" /// 
533099 "TRN-MOTOR VEHICLE OPERATORS, ALL OTHER" /// 
534010 "TRN-LOCOMOTIVE ENGINEERS AND OPERATORS" /// 
534031 "TRN-RAILROAD CONDUCTORS AND YARDMASTERS" /// 
5340XX "TRN-SUBWAY, STREETCAR, AND OTHER RAIL TRANSPORTATION WORKERS *" /// 
5350XX "TRN-SAILORS AND MARINE OILERS, AND SHIP ENGINEERS *" /// 
535020 "TRN-SHIP AND BOAT CAPTAINS AND OPERATORS" /// 
536021 "TRN-PARKING LOT ATTENDANTS" /// 
536031 "TRN-AUTOMOTIVE AND WATERCRAFT SERVICE ATTENDANTS" /// 
536051 "TRN-TRANSPORTATION INSPECTORS" /// 
536061 "PRS-TRANSPORTATION ATTENDANTS, EXCEPT FLIGHT ATTENDANTS" /// 
5360XX "TRN-MISCELLANEOUS TRANSPORTATION WORKERS, INCLUDING BRIDGE AND LOCK TENDERS AND TRAFFIC TECHNICIANS *" /// 
537021 "TRN-CRANE AND TOWER OPERATORS" /// 
537030 "TRN-DREDGE, EXCAVATING, AND LOADING MACHINE OPERATORS" /// 
5370XX "TRN-CONVEYOR OPERATORS AND TENDERS, AND HOIST AND WINCH OPERATORS *" /// 
537051 "TRN-INDUSTRIAL TRUCK AND TRACTOR OPERATORS" /// 
537061 "TRN-CLEANERS OF VEHICLES AND EQUIPMENT" /// 
537062 "TRN-LABORERS AND FREIGHT, STOCK, AND MATERIAL MOVERS, HAND" /// 
537063 "TRN-MACHINE FEEDERS AND OFFBEARERS" /// 
537064 "TRN-PACKERS AND PACKAGERS, HAND" /// 
537070 "TRN-PUMPING STATION OPERATORS" /// 
537081 "TRN-REFUSE AND RECYCLABLE MATERIAL COLLECTORS" /// 
5371XX "TRN-MISCELLANEOUS MATERIAL MOVING WORKERS, INCLUDING MINE SHUTTLE CAR OPERATORS, AND TANK CAR, TRUCK, AND SHIP LOADERS *" /// 
551010 "MIL-MILITARY OFFICER SPECIAL AND TACTICAL OPERATIONS LEADERS" /// 
552010 "MIL-FIRST-LINE ENLISTED MILITARY SUPERVISORS" /// 
553010 "MIL-MILITARY ENLISTED TACTICAL OPERATIONS AND AIR/WEAPONS SPECIALISTS AND CREW MEMBERS" /// 
559830 "MIL-MILITARY, RANK NOT SPECIFIED" /// 
999920 "UNEMPLOYED AND LAST WORKED 5 YEARS AGO OR EARLIER OR NEVER WORKED"
capture label values SOCP socpLB


capture label variable VPS "Veteran period of service"
capture label define vpsLB ///
01 "Gulf War: 9/2001 or later" /// 
02 "Gulf War: 9/2001 or later and Gulf War: 8/1990 - 8/2001" /// 
03 "Gulf War: 9/2001 or later and Gulf War: 8/1990 - 8/2001 and Vietnam Era" /// 
04 "Gulf War: 8/1990 - 8/2001" /// 
05 "Gulf War: 8/1990 - 8/2001 and Vietnam Era" /// 
06 "Vietnam Era" /// 
07 "Vietnam Era and Korean War" /// 
08 "Vietnam Era, Korean War, and WWII" /// 
09 "Korean War" /// 
10 "Korean War and WWII" /// 
11 "WWII" /// 
12 "Between Gulf War and Vietnam Era only" /// 
13 "Between Vietnam Era and Korean War only" /// 
14 "Between Korean War and World War II only" /// 
15 "Pre-WWII only"
capture label values VPS vpsLB


capture label variable WAOB "World area of birth ****"
capture label define waobLB ///
1 "US state (POB = 001-059)" /// 
2 "PR and US Island Areas (POB = 060-099)" /// 
3 "Latin America (POB = 303,310-399)" /// 
4 "Asia (POB = 158-159,161,200-299)" /// 
5 "Europe (POB = 100-157,160,162-199)" /// 
6 "Africa (POB = 400-499)" /// 
7 "Northern America (POB = 300-302,304-309)" /// 
8 "Oceania and at Sea (POB = 500-554)"
capture label values WAOB waobLB


capture label variable FAGEP "Age allocation flag"
capture label define fagepLB ///
0 "No" /// 
1 "Yes"
capture label values FAGEP fagepLB


capture label variable FANCP "Ancestry allocation flag"
capture label define fancpLB ///
0 "No" /// 
1 "Yes"
capture label values FANCP fancpLB


capture label variable FCITP "Citizenship allocation flag"
capture label define fcitpLB ///
0 "No" /// 
1 "Yes"
capture label values FCITP fcitpLB


capture label variable FCITWP "Year of naturalization write-in allocation flag"
capture label define fcitwpLB ///
0 "No" /// 
1 "Yes"
capture label values FCITWP fcitwpLB


capture label variable FCOWP "Class of worker allocation flag"
capture label define fcowpLB ///
0 "No" /// 
1 "Yes"
capture label values FCOWP fcowpLB


capture label variable FDDRSP "Self-care difficulty allocation flag"
capture label define fddrspLB ///
0 "No" /// 
1 "Yes"
capture label values FDDRSP fddrspLB


capture label variable FDEARP "Hearing difficulty allocation flag"
capture label define fdearpLB ///
0 "No" /// 
1 "Yes"
capture label values FDEARP fdearpLB


capture label variable FDEYEP "Vision difficulty allocation flag"
capture label define fdeyepLB ///
0 "No" /// 
1 "Yes"
capture label values FDEYEP fdeyepLB


capture label variable FDISP "Disability recode allocation flag"
capture label define fdispLB ///
0 "No" /// 
1 "Yes"
capture label values FDISP fdispLB


capture label variable FDOUTP "Independent living difficulty allocation flag"
capture label define fdoutpLB ///
0 "No" /// 
1 "Yes"
capture label values FDOUTP fdoutpLB


capture label variable FDPHYP "Ambulatory difficulty allocation flag"
capture label define fdphypLB ///
0 "No" /// 
1 "Yes"
capture label values FDPHYP fdphypLB


capture label variable FDRATP "Disability rating percentage allocation flag"
capture label define fdratpLB ///
0 "No" /// 
1 "Yes"
capture label values FDRATP fdratpLB


capture label variable FDRATXP "Disability rating checkbox allocation flag"
capture label define fdratxpLB ///
0 "No" /// 
1 "Yes"
capture label values FDRATXP fdratxpLB


capture label variable FDREMP "Cognitive difficulty allocation flag"
capture label define fdrempLB ///
0 "No" /// 
1 "Yes"
capture label values FDREMP fdrempLB


capture label variable FENGP "Ability to speak English allocation flag"
capture label define fengpLB ///
0 "No" /// 
1 "Yes"
capture label values FENGP fengpLB


capture label variable FESRP "Employment status recode allocation flag"
capture label define fesrpLB ///
0 "No" /// 
1 "Yes"
capture label values FESRP fesrpLB


capture label variable FFERP "Gave birth to child within the past 12 months allocation flag"
capture label define fferpLB ///
0 "No" /// 
1 "Yes"
capture label values FFERP fferpLB


capture label variable FFODP "Field of Degree allocation flag"
capture label define ffodpLB ///
0 "No" /// 
1 "Yes"
capture label values FFODP ffodpLB


capture label variable FGCLP "Grandparents living with grandchildren allocation flag"
capture label define fgclpLB ///
0 "No" /// 
1 "Yes"
capture label values FGCLP fgclpLB


capture label variable FGCMP "Length of time responsible for grandchildren allocation flag"
capture label define fgcmpLB ///
0 "No" /// 
1 "Yes"
capture label values FGCMP fgcmpLB


capture label variable FGCRP "Grandparents responsible for grandchildren allocation flag"
capture label define fgcrpLB ///
0 "No" /// 
1 "Yes"
capture label values FGCRP fgcrpLB


capture label variable FHICOVP "Health insurance coverage recode allocation flag"
capture label define fhicovpLB ///
0 "No" /// 
1 "Yes"
capture label values FHICOVP fhicovpLB


capture label variable FHINS1P "Insurance through a current or former employer or union allocation flag"
capture label define fhins1pLB ///
0 "No" /// 
1 "Yes"
capture label values FHINS1P fhins1pLB


capture label variable FHINS2P "Insurance purchased directly from an insurance company allocation flag"
capture label define fhins2pLB ///
0 "No" /// 
1 "Yes"
capture label values FHINS2P fhins2pLB


capture label variable FHINS3C "Medicare coverage given through the eligibility coverage edit"
capture label define fhins3cLB ///
0 "No" /// 
1 "Yes"
capture label values FHINS3C fhins3cLB


capture label variable FHINS3P "Medicare, for people 65 or older, or people with certain disabilities"
capture label define fhins3pLB ///
0 "No" /// 
1 "Yes"
capture label values FHINS3P fhins3pLB


capture label variable FHINS4C "Medicaid coverage given through the eligibility coverage edit"
capture label define fhins4cLB ///
0 "No" /// 
1 "Yes"
capture label values FHINS4C fhins4cLB


capture label variable FHINS4P "Medicaid, medical assistance, or any kind of government-assistance plan"
capture label define fhins4pLB ///
0 "No" /// 
1 "Yes"
capture label values FHINS4P fhins4pLB


capture label variable FHINS5C "TRICARE coverage given through the eligibility coverage edit"
capture label define fhins5cLB ///
0 "No" /// 
1 "Yes"
capture label values FHINS5C fhins5cLB


capture label variable FHINS5P "TRICARE or other military health care allocation flag"
capture label define fhins5pLB ///
0 "No" /// 
1 "Yes"
capture label values FHINS5P fhins5pLB


capture label variable FHINS6P "VA (including those who have ever used or enrolled for VA health care)"
capture label define fhins6pLB ///
0 "No" /// 
1 "Yes"
capture label values FHINS6P fhins6pLB


capture label variable FHINS7P "Indian health service allocation flag"
capture label define fhins7pLB ///
0 "No" /// 
1 "Yes"
capture label values FHINS7P fhins7pLB


capture label variable FHISP "Detailed Hispanic origin allocation flag"
capture label define fhispLB ///
0 "No" /// 
1 "Yes"
capture label values FHISP fhispLB


capture label variable FINDP "Industry allocation flag"
capture label define findpLB ///
0 "No" /// 
1 "Yes"
capture label values FINDP findpLB


capture label variable FINTP "Interest, dividend, and net rental income allocation flag"
capture label define fintpLB ///
0 "No" /// 
1 "Yes"
capture label values FINTP fintpLB


capture label variable FJWDP "Time of departure to work allocation flag"
capture label define fjwdpLB ///
0 "No" /// 
1 "Yes"
capture label values FJWDP fjwdpLB


capture label variable FJWMNP "Travel time to work allocation flag"
capture label define fjwmnpLB ///
0 "No" /// 
1 "Yes"
capture label values FJWMNP fjwmnpLB


capture label variable FJWRIP "Vehicle occupancy allocation flag"
capture label define fjwripLB ///
0 "No" /// 
1 "Yes"
capture label values FJWRIP fjwripLB


capture label variable FJWTRP "Means of transportation to work allocation flag"
capture label define fjwtrpLB ///
0 "No" /// 
1 "Yes"
capture label values FJWTRP fjwtrpLB


capture label variable FLANP "Language spoken at home allocation flag"
capture label define flanpLB ///
0 "No" /// 
1 "Yes"
capture label values FLANP flanpLB


capture label variable FLANXP "Language other than English allocation flag"
capture label define flanxpLB ///
0 "No" /// 
1 "Yes"
capture label values FLANXP flanxpLB


capture label variable FMARP "Marital status allocation flag"
capture label define fmarpLB ///
0 "No" /// 
1 "Yes"
capture label values FMARP fmarpLB


capture label variable FMARHDP "Divorced in the past 12 months allocation flag"
capture label define fmarhdpLB ///
0 "No" /// 
1 "Yes"
capture label values FMARHDP fmarhdpLB


capture label variable FMARHMP "Married in the past 12 months allocation flag"
capture label define fmarhmpLB ///
0 "No" /// 
1 "Yes"
capture label values FMARHMP fmarhmpLB


capture label variable FMARHTP "Times married allocation flag"
capture label define fmarhtpLB ///
0 "No" /// 
1 "Yes"
capture label values FMARHTP fmarhtpLB


capture label variable FMARHWP "Widowed in the past 12 months allocation flag"
capture label define fmarhwpLB ///
0 "No" /// 
1 "Yes"
capture label values FMARHWP fmarhwpLB


capture label variable FMARHYP "Year last married allocation flag"
capture label define fmarhypLB ///
0 "No" /// 
1 "Yes"
capture label values FMARHYP fmarhypLB


capture label variable FMIGP "Mobility status allocation flag"
capture label define fmigpLB ///
0 "No" /// 
1 "Yes"
capture label values FMIGP fmigpLB


capture label variable FMIGSP "Migration state allocation flag"
capture label define fmigspLB ///
0 "No" /// 
1 "Yes"
capture label values FMIGSP fmigspLB


capture label variable FMILPP "Military periods of service allocation flag"
capture label define fmilppLB ///
0 "No" /// 
1 "Yes"
capture label values FMILPP fmilppLB


capture label variable FMILSP "Military service allocation flag"
capture label define fmilspLB ///
0 "No" /// 
1 "Yes"
capture label values FMILSP fmilspLB


capture label variable FOCCP "Occupation allocation flag"
capture label define foccpLB ///
0 "No" /// 
1 "Yes"
capture label values FOCCP foccpLB


capture label variable FOIP "All other income allocation flag"
capture label define foipLB ///
0 "No" /// 
1 "Yes"
capture label values FOIP foipLB


capture label variable FPAP "Public assistance income allocation flag"
capture label define fpapLB ///
0 "No" /// 
1 "Yes"
capture label values FPAP fpapLB


capture label variable FPERNP "Total person’s earnings allocation flag"
capture label define fpernpLB ///
0 "No" /// 
1 "Yes"
capture label values FPERNP fpernpLB


capture label variable FPINCP "Total person’s income (signed) allocation flag"
capture label define fpincpLB ///
0 "No" /// 
1 "Yes"
capture label values FPINCP fpincpLB


capture label variable FPOBP "Place of birth allocation flag"
capture label define fpobpLB ///
0 "No" /// 
1 "Yes"
capture label values FPOBP fpobpLB


capture label variable FPOWSP "Place of work state allocation flag"
capture label define fpowspLB ///
0 "No" /// 
1 "Yes"
capture label values FPOWSP fpowspLB


capture label variable FPRIVCOVP "Private health insurance coverage recode allocation flag"
capture label define fprivcovpLB ///
0 "No" /// 
1 "Yes"
capture label values FPRIVCOVP fprivcovpLB


capture label variable FPUBCOVP "Public health coverage recode allocation flag"
capture label define fpubcovpLB ///
0 "No" /// 
1 "Yes"
capture label values FPUBCOVP fpubcovpLB


capture label variable FRACP "Detailed race allocation flag"
capture label define fracpLB ///
0 "No" /// 
1 "Yes"
capture label values FRACP fracpLB


capture label variable FRELP "Relationship allocation flag"
capture label define frelpLB ///
0 "No" /// 
1 "Yes"
capture label values FRELP frelpLB


capture label variable FRETP "Retirement income allocation flag"
capture label define fretpLB ///
0 "No" /// 
1 "Yes"
capture label values FRETP fretpLB


capture label variable FSCHGP "Grade attending allocation flag"
capture label define fschgpLB ///
0 "No" /// 
1 "Yes"
capture label values FSCHGP fschgpLB


capture label variable FSCHLP "Highest education allocation flag"
capture label define fschlpLB ///
0 "No" /// 
1 "Yes"
capture label values FSCHLP fschlpLB


capture label variable FSCHP "School enrollment allocation flag"
capture label define fschpLB ///
0 "No" /// 
1 "Yes"
capture label values FSCHP fschpLB


capture label variable FSEMP "Self-employment income allocation flag"
capture label define fsempLB ///
0 "No" /// 
1 "Yes"
capture label values FSEMP fsempLB


capture label variable FSEXP "Sex allocation flag"
capture label define fsexpLB ///
0 "No" /// 
1 "Yes"
capture label values FSEXP fsexpLB


capture label variable FSSIP "Supplementary Security Income allocation flag"
capture label define fssipLB ///
0 "No" /// 
1 "Yes"
capture label values FSSIP fssipLB


capture label variable FSSP "Social Security income allocation flag"
capture label define fsspLB ///
0 "No" /// 
1 "Yes"
capture label values FSSP fsspLB


capture label variable FWAGP "Wages and salary income allocation flag"
capture label define fwagpLB ///
0 "No" /// 
1 "Yes"
capture label values FWAGP fwagpLB


capture label variable FWKHP "Usual hours worked per week past 12 months allocation flag"
capture label define fwkhpLB ///
0 "No" /// 
1 "Yes"
capture label values FWKHP fwkhpLB


capture label variable FWKLP "Last worked allocation flag"
capture label define fwklpLB ///
0 "No" /// 
1 "Yes"
capture label values FWKLP fwklpLB


capture label variable FWKWP "Weeks worked past 12 months allocation flag"
capture label define fwkwpLB ///
0 "No" /// 
1 "Yes"
capture label values FWKWP fwkwpLB


capture label variable FWRKP "Worked last week allocation flag"
capture label define fwrkpLB ///
0 "No" /// 
1 "Yes"
capture label values FWRKP fwrkpLB


capture label variable FYOEP "Year of entry allocation flag"
capture label define fyoepLB ///
0 "No" /// 
1 "Yes"
capture label values FYOEP fyoepLB


capture label variable PWGTP1 "Person's Weight replicate 1"


capture label variable PWGTP2 "Person's Weight replicate 2"


capture label variable PWGTP3 "Person's Weight replicate 3"


capture label variable PWGTP4 "Person's Weight replicate 4"


capture label variable PWGTP5 "Person's Weight replicate 5"


capture label variable PWGTP6 "Person's Weight replicate 6"


capture label variable PWGTP7 "Person's Weight replicate 7"


capture label variable PWGTP8 "Person's Weight replicate 8"


capture label variable PWGTP9 "Person's Weight replicate 9"


capture label variable PWGTP10 "Person's Weight replicate 10"


capture label variable PWGTP11 "Person's Weight replicate 11"


capture label variable PWGTP12 "Person's Weight replicate 12"


capture label variable PWGTP13 "Person's Weight replicate 13"


capture label variable PWGTP14 "Person's Weight replicate 14"


capture label variable PWGTP15 "Person's Weight replicate 15"


capture label variable PWGTP16 "Person's Weight replicate 16"


capture label variable PWGTP17 "Person's Weight replicate 17"


capture label variable PWGTP18 "Person's Weight replicate 18"


capture label variable PWGTP19 "Person's Weight replicate 19"


capture label variable PWGTP20 "Person's Weight replicate 20"


capture label variable PWGTP21 "Person's Weight replicate 21"


capture label variable PWGTP22 "Person's Weight replicate 22"


capture label variable PWGTP23 "Person's Weight replicate 23"


capture label variable PWGTP24 "Person's Weight replicate 24"


capture label variable PWGTP25 "Person's Weight replicate 25"


capture label variable PWGTP26 "Person's Weight replicate 26"


capture label variable PWGTP27 "Person's Weight replicate 27"


capture label variable PWGTP28 "Person's Weight replicate 28"


capture label variable PWGTP29 "Person's Weight replicate 29"


capture label variable PWGTP30 "Person's Weight replicate 30"


capture label variable PWGTP31 "Person's Weight replicate 31"


capture label variable PWGTP32 "Person's Weight replicate 32"


capture label variable PWGTP33 "Person's Weight replicate 33"


capture label variable PWGTP34 "Person's Weight replicate 34"


capture label variable PWGTP35 "Person's Weight replicate 35"


capture label variable PWGTP36 "Person's Weight replicate 36"


capture label variable PWGTP37 "Person's Weight replicate 37"


capture label variable PWGTP38 "Person's Weight replicate 38"


capture label variable PWGTP39 "Person's Weight replicate 39"


capture label variable PWGTP40 "Person's Weight replicate 40"


capture label variable PWGTP41 "Person's Weight replicate 41"


capture label variable PWGTP42 "Person's Weight replicate 42"


capture label variable PWGTP43 "Person's Weight replicate 43"


capture label variable PWGTP44 "Person's Weight replicate 44"


capture label variable PWGTP45 "Person's Weight replicate 45"


capture label variable PWGTP46 "Person's Weight replicate 46"


capture label variable PWGTP47 "Person's Weight replicate 47"


capture label variable PWGTP48 "Person's Weight replicate 48"


capture label variable PWGTP49 "Person's Weight replicate 49"


capture label variable PWGTP50 "Person's Weight replicate 50"


capture label variable PWGTP51 "Person's Weight replicate 51"


capture label variable PWGTP52 "Person's Weight replicate 52"


capture label variable PWGTP53 "Person's Weight replicate 53"


capture label variable PWGTP54 "Person's Weight replicate 54"


capture label variable PWGTP55 "Person's Weight replicate 55"


capture label variable PWGTP56 "Person's Weight replicate 56"


capture label variable PWGTP57 "Person's Weight replicate 57"


capture label variable PWGTP58 "Person's Weight replicate 58"


capture label variable PWGTP59 "Person's Weight replicate 59"


capture label variable PWGTP60 "Person's Weight replicate 60"


capture label variable PWGTP61 "Person's Weight replicate 61"


capture label variable PWGTP62 "Person's Weight replicate 62"


capture label variable PWGTP63 "Person's Weight replicate 63"


capture label variable PWGTP64 "Person's Weight replicate 64"


capture label variable PWGTP65 "Person's Weight replicate 65"


capture label variable PWGTP66 "Person's Weight replicate 66"


capture label variable PWGTP67 "Person's Weight replicate 67"


capture label variable PWGTP68 "Person's Weight replicate 68"


capture label variable PWGTP69 "Person's Weight replicate 69"


capture label variable PWGTP70 "Person's Weight replicate 70"


capture label variable PWGTP71 "Person's Weight replicate 71"


capture label variable PWGTP72 "Person's Weight replicate 72"


capture label variable PWGTP73 "Person's Weight replicate 73"


capture label variable PWGTP74 "Person's Weight replicate 74"


capture label variable PWGTP75 "Person's Weight replicate 75"


capture label variable PWGTP76 "Person's Weight replicate 76"


capture label variable PWGTP77 "Person's Weight replicate 77"


capture label variable PWGTP78 "Person's Weight replicate 78"


capture label variable PWGTP79 "Person's Weight replicate 79"

notes: or both Industry and Occupation lists in Data Dictionary:

capture label variable PWGTP80 "Person's Weight replicate 80"

quietly ds 
local varnames_upper `r(varlist)'
rename (`varnames_upper') (`varnames_orig')
