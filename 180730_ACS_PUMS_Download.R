################################################################################
# File name: 180730_ACS_PUMS_Download.R
# Author: Vincent Palacios
# Last Updated: 7/30/18
# Description: Download and extract ACS PUMS csv files to 
#   C:\users\USERNAME\Data\ACS\YEAR\
#
# Inputs: ACS PUMS 2016 - 2016 5-year zip files
#
# Outputs: ACS PUMS 2016 - 2016 5-year csv files
################################################################################

# Get 2012-2016 ACS PUMS 5-year data for IL, IN, and WI.



########################################################################################
# SET WORKING DIRECTORY, CREATE FOLDERS IF NECESSARY
########################################################################################
setwd("~/..")

# Check to see if the folder "/Data/ACS/2016" already exists. If not, create it.
if (!file.exists("~/../Data")) {
  dir.create("~/../Data")
}
setwd("~/../Data")


if (!file.exists("~/../Data/ACS")) {
  dir.create("~/../Data/ACS")
}
setwd("~/../Data/ACS")

if (!file.exists("~/../Data/ACS/2016")) {
  dir.create("~/../Data/ACS/2016")
}
setwd("~/../Data/ACS/2016")



########################################################################################
# DOWNLOAD 2012-2016 ACS PUMS 5-year data for IL
########################################################################################

# Check to see if the file "2016csv_pil.zip" already exists. If not, create it.
if (!file.exists("2016csv_pil.zip")) {
  fileUrl <- "http://www2.census.gov/programs-surveys/acs/data/pums/2016/5-Year/csv_pil.zip"
  download.file(fileUrl, destfile = "2016csv_pil.zip")
}

# Check to see if the file "2016pil.csv" already exists. If not, unzip "2016csv_pil.zip" 
# and rename its contents to "2016pil.csv". Then list the directory's contents.

if (!file.exists("2016pil_5year.csv")) {
  unzip("2016csv_pil.zip")
  file.rename("ss16pil.csv", "2016pil_5year.csv")
}


# Check to see if the file "2016csv_hil.zip" already exists. If not, create it.
if (!file.exists("2016csv_hil.zip")) {
  fileUrl <- "http://www2.census.gov/programs-surveys/acs/data/pums/2016/5-Year/csv_hil.zip"
  download.file(fileUrl, destfile = "2016csv_hil.zip")
}

# Check to see if the file "2016hil.csv" already exists. If not, unzip "2016csv_hil.zip" 
# and rename its contents to "2016hil.csv". Then list the directory's contents.

if (!file.exists("2016hil_5year.csv")) {
  unzip("2016csv_hil.zip")
  file.rename("ss16hil.csv", "2016hil_5year.csv")
}



########################################################################################
# DOWNLOAD 2012-2016 ACS PUMS 5-year data for IN
########################################################################################

# Check to see if the file "2016csv_pin.zip" already exists. If not, create it.
if (!file.exists("2016csv_pin.zip")) {
  fileUrl <- "http://www2.census.gov/programs-surveys/acs/data/pums/2016/5-Year/csv_pin.zip"
  download.file(fileUrl, destfile = "2016csv_pin.zip")
}

# Check to see if the file "2016pin.csv" already exists. If not, unzip "2016csv_pin.zip" 
# and rename its contents to "2016pin.csv". Then list the directory's contents.

if (!file.exists("2016pin_5year.csv")) {
  unzip("2016csv_pin.zip")
  file.rename("ss16pin.csv", "2016pin_5year.csv")
}


# Check to see if the file "2016csv_hin.zip" already exists. If not, create it.
if (!file.exists("2016csv_hin.zip")) {
  fileUrl <- "http://www2.census.gov/programs-surveys/acs/data/pums/2016/5-Year/csv_hin.zip"
  download.file(fileUrl, destfile = "2016csv_hin.zip")
}

# Check to see if the file "2016hin.csv" already exists. If not, unzip "2016csv_hin.zip" 
# and rename its contents to "2016hin.csv". Then list the directory's contents.

if (!file.exists("2016hin_5year.csv")) {
  unzip("2016csv_hin.zip")
  file.rename("ss16hin.csv", "2016hin_5year.csv")
}


########################################################################################
# DOWNLOAD 2012-2016 ACS PUMS 5-year data for WI
########################################################################################

# Check to see if the file "2016csv_pwi.zip" already exists. If not, create it.
if (!file.exists("2016csv_pwi.zip")) {
  fileUrl <- "http://www2.census.gov/programs-surveys/acs/data/pums/2016/5-Year/csv_pwi.zip"
  download.file(fileUrl, destfile = "2016csv_pwi.zip")
}

# Check to see if the file "2016pwi.csv" already exists. If not, unzip "2016csv_pwi.zip" 
# and rename its contents to "2016pwi.csv". Then list the directory's contents.

if (!file.exists("2016pwi_5year.csv")) {
  unzip("2016csv_pwi.zip")
  file.rename("ss16pwi.csv", "2016pwi_5year.csv")
}



# Check to see if the file "2016csv_hwi.zip" already exists. If not, create it.
if (!file.exists("2016csv_hwi.zip")) {
  fileUrl <- "http://www2.census.gov/programs-surveys/acs/data/pums/2016/5-Year/csv_hwi.zip"
  download.file(fileUrl, destfile = "2016csv_hwi.zip")
}

# Check to see if the file "2016hwi.csv" already exists. If not, unzip "2016csv_hwi.zip" 
# and rename its contents to "2016hwi.csv". Then list the directory's contents.

if (!file.exists("2016hwi_5year.csv")) {
  unzip("2016csv_hwi.zip")
  file.rename("ss16hwi.csv", "2016hwi_5year.csv")
}



########################################################################################
# CONFIRM FILES HAVE BEEN DOWNLOADED AND UNZIPED
########################################################################################

list.files(pattern = ".*[.]zip")
list.files(pattern = "^2016h.*[.]csv")
list.files(pattern = "^2016p.*[.]csv")




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
