### June 27 24 
### Ryan Flake
### Uber Couriers list processing


### Libraries

library(tidyverse)
library(lubridate)
library(magrittr)

### Month and quarter info from Base R

today <- Sys.Date()

day_of_month <- as.integer(format(today, "%d"))

if (day_of_month <= 15) {
  today1 <- as.Date(format(today, "%Y-%m-01"))
} else {
  today1 <- today + months(1)
}

q <- format(today1, format="%m")
y <- format(today1, format="%Y")
quar <- 
  
  if (q == "01" | q == "02 "| q == "03") {
    quar <- "Q1"
  } 
if (q == "04" | q == "05" | q == "06") {
  quar <- "Q2"
}
if (q == "07" | q == "08" | q == "09") {
  quar <- "Q3"
}
if (q == "10" | q == "11" | q == "12") {
  quar <- "Q4"
}

quarter <- paste(quar,"_",y,sep="")
Month <- format(today1, format="%B_%Y")

### Set working directory to Desktop folder

setwd(dir = "~/Desktop/Q_Uber/uber_lists/Couriers")

### US Couriers

### Update the below info for the specific file

upload_file <- "Master_Tracker_Courier_United_States_pre.csv"
audience <- "Couriers"
Language <- "EN"
country <- "United States"
final_file1 <- "2022_BHT_Couriers_US1.csv"
final_file2 <- "2022_BHT_Couriers_US2.csv"

### Read in CSV

df1 <- read.csv(upload_file)

### Dropping garbage befor uuid

if("X" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(X)
    )
}

if("Unnamed..0" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(Unnamed..0)
    )
}

if("month" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(month)
    )
}
### Test to see if language exists and removes it

if("language" %in% colnames(df1)){
  df1 <- df1 %>%
    mutate(language_preference = language) %>%
    subset(
      select = -c(language)
    )
}

### adding in new collumns

df1$Month <- c(Month)
df1$quarter <- c(quarter)
df2 <- df1 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### QC for value match

if(any(df2$Q_Language != Language)) cat("LANG MISMATCH")
if(any(df2$quarter != quarter)) cat("Q MISMATCH")
if(any(df2$audience != audience)) cat("AUDIENCE MISMATCH")
if(any(df2$country_name != country)) cat("COUNTRY MISMATCH")

### Chopping up large dataset

df3 <- df2 %>%
  slice(1:100000)
df4 <- df2 %>%
  slice(100001:n())


write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)

### AUS Couriers

### Update the below info for the specific file

upload_file <- "Master_Tracker_Courier_Australia_pre.csv"
audience <- "Couriers"
Language <- "EN-AU"
country <- "Australia"
final_file1 <- "2022_BHT_Couriers_AUS1.csv"

### Read in CSV

df1 <- read.csv(upload_file)

### Dropping garbage befor uuid

if("X" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(X)
    )
}

if("Unnamed..0" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(Unnamed..0)
    )
}

if("month" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(month)
    )
}
### Test to see if language exists and removes it

if("language" %in% colnames(df1)){
  df1 <- df1 %>%
    mutate(language_preference = language) %>%
    subset(
      select = -c(language)
    )
}

### adding in new collumns

df1$Month <- c(Month)
df1$quarter <- c(quarter)

df2 <- df1 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### QC for value match

if(any(df2$Q_Language != Language)) cat("LANG MISMATCH")
if(any(df2$quarter != quarter)) cat("Q MISMATCH")
if(any(df2$audience != audience)) cat("AUDIENCE MISMATCH")
if(any(df2$country_name != country)) cat("COUNTRY MISMATCH")

write.csv(df2, final_file1, row.names = FALSE)

### Japan Couriers

### Update the below info for the specific file

upload_file <- "Master_Tracker_Courier_Japan_pre.csv"
audience <- "Couriers"
Language <- "JA"
country <- "Japan"
final_file1 <- "2022_BHT_Couriers_Japan1.csv"

### Read in CSV

df1 <- read.csv(upload_file)

### Dropping garbage befor uuid

if("X" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(X)
    )
}

if("Unnamed..0" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(Unnamed..0)
    )
}

if("month" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(month)
    )
}
### Test to see if language exists and removes it

if("language" %in% colnames(df1)){
  df1 <- df1 %>%
    mutate(language_preference = language) %>%
    subset(
      select = -c(language)
    )
}

### adding in new collumns

df1$Month <- c(Month)
df1$quarter <- c(quarter)

df2 <- df1 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### QC for value match

if(any(df2$Q_Language != Language)) cat("LANG MISMATCH")
if(any(df2$quarter != quarter)) cat("Q MISMATCH")
if(any(df2$audience != audience)) cat("AUDIENCE MISMATCH")
if(any(df2$country_name != country)) cat("COUNTRY MISMATCH")

write.csv(df2, final_file1, row.names = FALSE)

### France Couriers

### Update the below info for the specific file

upload_file <- "Master_Tracker_Courier_France_pre.csv"
audience <- "Couriers"
Language <- "FR"
country <- "France"
final_file1 <- "2022_BHT_Couriers_France1.csv"

### Read in CSV

df1 <- read.csv(upload_file)

### Dropping garbage befor uuid

if("X" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(X)
    )
}

if("Unnamed..0" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(Unnamed..0)
    )
}

if("month" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(month)
    )
}

### Test to see if language exists and removes it

if("language" %in% colnames(df1)){
  df1 <- df1 %>%
    mutate(language_preference = language) %>%
    subset(
      select = -c(language)
    )
}

### adding in new collumns

df1$Month <- c(Month)
df1$quarter <- c(quarter)

df2 <- df1 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### QC for value match

if(any(df2$Q_Language != Language)) cat("LANG MISMATCH")
if(any(df2$quarter != quarter)) cat("Q MISMATCH")
if(any(df2$audience != audience)) cat("AUDIENCE MISMATCH")
if(any(df2$country_name != country)) cat("COUNTRY MISMATCH")

write.csv(df2, final_file1, row.names = FALSE)

### Taiwan Couriers

### Update the below info for the specific file

upload_file <- "Master_Tracker_Courier_Taiwan_pre.csv"
audience <- "Couriers"
Language <- "ZH-T"
country <- "Taiwan (ROC)"
final_file1 <- "2022_BHT_Couriers_Taiwan1.csv"

### Read in CSV

df1 <- read.csv(upload_file)

### Dropping garbage befor uuid

if("X" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(X)
    )
}

if("Unnamed..0" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(Unnamed..0)
    )
}

if("month" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(month)
    )
}

### Test to see if language exists and removes it

if("language" %in% colnames(df1)){
  df1 <- df1 %>%
    mutate(language_preference = language) %>%
    subset(
      select = -c(language)
    )
}

### adding in new collumns

df1$Language <- c(Language)
df1$Q_Language <- c(Language)
df1$Month <- c(Month)
df1$quarter <- c(quarter)

df2 <- df1 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### QC for value match

if(any(df2$Q_Language != Language)) cat("LANG MISMATCH")
if(any(df2$quarter != quarter)) cat("Q MISMATCH")
if(any(df2$audience != audience)) cat("AUDIENCE MISMATCH")
if(any(df2$country_name != country)) cat("COUNTRY MISMATCH")

write.csv(df2, final_file1, row.names = FALSE)

### Mexico Couriers

### Update the below info for the specific file

upload_file <- "Master_Tracker_Courier_Mexico_pre.csv"
audience <- "Couriers"
Language <- "ES"
country <- "Mexico"
final_file1 <- "2022_BHT_Couriers_Mexico1.csv"

### Read in CSV

df1 <- read.csv(upload_file)

### Dropping garbage befor uuid

if("X" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(X)
    )
}

if("Unnamed..0" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(Unnamed..0)
    )
}

if("month" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(month)
    )
}

### Test to see if language exists and removes it

if("language" %in% colnames(df1)){
  df1 <- df1 %>%
    mutate(language_preference = language) %>%
    subset(
      select = -c(language)
    )
}

### adding in new collumns

df1$Month <- c(Month)
df1$quarter <- c(quarter)

df2 <- df1 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### QC for value match

if(any(df2$Q_Language != Language)) cat("LANG MISMATCH")
if(any(df2$quarter != quarter)) cat("Q MISMATCH")
if(any(df2$audience != audience)) cat("AUDIENCE MISMATCH")
if(any(df2$country_name != country)) cat("COUNTRY MISMATCH")

write.csv(df2, final_file1, row.names = FALSE)

### UK Couriers

### Update the below info for the specific file

upload_file <- "Master_Tracker_Courier_United_Kingdom_pre.csv"
audience <- "Couriers"
Language <- "EN-GB"
country <- "United Kingdom"
final_file1 <- "2022_BHT_Couriers_UK1.csv"

### Read in CSV

df1 <- read.csv(upload_file)

### Dropping garbage befor uuid

if("X" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(X)
    )
}

if("Unnamed..0" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(Unnamed..0)
    )
}

if("month" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(month)
    )
}
### Test to see if language exists and removes it

if("language" %in% colnames(df1)){
  df1 <- df1 %>%
    mutate(language_preference = language) %>%
    subset(
      select = -c(language)
    )
}

### adding in new collumns

df1$quarter <- c(quarter)
df1$Month <- c(Month)

df2 <- df1 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### QC for value match

if(any(df2$Q_Language != Language)) cat("LANG MISMATCH")
if(any(df2$quarter != quarter)) cat("Q MISMATCH")
if(any(df2$audience != audience)) cat("AUDIENCE MISMATCH")
if(any(df2$country_name != country)) cat("COUNTRY MISMATCH")

write.csv(df2, final_file1, row.names = FALSE)

### CANADA Couriers

### Update the below info for the specific file

upload_file <- "Master_Tracker_Courier_Canada_pre.csv"
audience <- "Couriers"
country <- "Canada"
final_file1 <- "2022_BHT_Couriers_Canada1.csv"

### Read in CSV

df1 <- read.csv(upload_file)

### Dropping garbage befor uuid

if("X" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(X)
    )
}

if("Unnamed..0" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(Unnamed..0)
    )
}

if("month" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(month)
    )
}

### Test to see if language exists and removes it

if("language" %in% colnames(df1)){
  df1 <- df1 %>%
    mutate(language_preference = language) %>%
    subset(
      select = -c(language)
    )
}

### French and English Distinction

###df1$Language <- NA
###df1$Q_Language <- NA

####df1.5 <-df1 %>%
###  filter(language_code != "FR-CA") %>%
###  select(Courier_uuid, Language, Q_Language) %>%
##  mutate(Language = c("EN")) %>%
#  mutate(Q_Language = c("EN"))

###df1.6 <-df1 %>%
###  filter(language_code == "FR-CA") %>%
###  select(Courier_uuid, Language, Q_Language) %>%
##  mutate(Language = c("FR-CA")) %>%
#  mutate(Q_Language = c("FR-CA"))  

#df1 <- dplyr::left_join(df1, df1.5, by = "Courier_uuid")

#df1$Q_Language.y[is.na(df1$Q_Language.y)] = "FR-CA"
#df1$Language.y[is.na(df1$Language.y)] = "FR-CA"

#df1 <- df1 %>%
#  mutate(Language = Language.y) 

#df1 <- df1 %>%
#  mutate(Q_Language = Q_Language.y)

#df1 <- df1 %>%
#  subset(
#    select = -c(Q_Language.x, Q_Language.y, Language.x, Language.y)
#  )

### adding in new collumns

df1$Month <- c(Month)
df1$quarter <- c(quarter)

df2 <- df1 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### QC for value match

if(any(df2$Q_Language != df2$Language)) cat("LANG MISMATCH")
if(any(df2$quarter != quarter)) cat("Q MISMATCH")
if(any(df2$audience != audience)) cat("AUDIENCE MISMATCH")
if(any(df2$country_name != country)) cat("COUNTRY MISMATCH")

write.csv(df2, final_file1, row.names = FALSE)

### Spain Couriers

### Update the below info for the specific file

upload_file <- "Master_Tracker_Courier_spain_pre.csv"
audience <- "Couriers"
Language <- "ES-ES"
country <- "Spain"
final_file1 <- "2024_BHT_Couriers_Spain1.csv"

### Read in CSV

df1 <- read.csv(upload_file)

### Dropping garbage befor uuid

if("X" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(X)
    )
}

if("Unnamed..0" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(Unnamed..0)
    )
}

if("month" %in% colnames(df)){
  df1 <- df1 %>% 
    subset(
      select = -c(month)
    )
}
### Test to see if language exists and removes it

if("language" %in% colnames(df1)){
  df1 <- df1 %>%
    mutate(language_preference = language) %>%
    subset(
      select = -c(language)
    )
}

### adding in new collumns

df1$Month <- c(Month)
df1$Language <- c(Language)
df1$Q_Language <- c(Language)

df2 <- df1 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### QC for value match

if(any(df2$Q_Language != Language)) cat("LANG MISMATCH")
if(any(df2$quarter != quarter)) cat("Q MISMATCH")
if(any(df2$audience != audience)) cat("AUDIENCE MISMATCH")
if(any(df2$country_name != country)) cat("COUNTRY MISMATCH")

write.csv(df2, final_file1, row.names = FALSE)

### Germany Couriers

### Update the below info for the specific file

upload_file <- "Master_Tracker_Courier_germany_pre.csv"
audience <- "Couriers"
Language <- "DE"
country <- "Germany"
final_file1 <- "2024_BHT_Couriers_DE1.csv"

### Read in CSV

df1 <- read.csv(upload_file)

### Dropping garbage befor uuid

if("X" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(X)
    )
}

if("Unnamed..0" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(Unnamed..0)
    )
}

if("month" %in% colnames(df)){
  df1 <- df1 %>% 
    subset(
      select = -c(month)
    )
}
### Test to see if language exists and removes it

if("language" %in% colnames(df1)){
  df1 <- df1 %>%
    mutate(language_preference = language) %>%
    subset(
      select = -c(language)
    )
}

### adding in new collumns

df1$Month <- c(Month)
df1$Language <- c(Language)
df1$Q_Language <- c(Language)

df2 <- df1 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### QC for value match

if(any(df2$Q_Language != Language)) cat("LANG MISMATCH")
if(any(df2$quarter != quarter)) cat("Q MISMATCH")
if(any(df2$audience != audience)) cat("AUDIENCE MISMATCH")
if(any(df2$country_name != country)) cat("COUNTRY MISMATCH")

write.csv(df2, final_file1, row.names = FALSE)
