### Apr 26 
### Ryan Flake
### Uber DRIVERS list processing


### Libraries

library(tidyverse)
library(lubridate)
library(magrittr)

### Month and quarter info from Base R

today <- Sys.Date()
Month <- format(today, format="%B_%Y")

q <- format(today, format="%m")
y <- format(today, format="%Y")
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

### Set working directory to Desktop folder

setwd(dir = "~/Desktop/Q_Uber/uber_lists/Drivers")

### US DRIVERS

### Update the below info for the specific file

upload_file <- "Master_Tracker_Driver_United_States_pre.csv"
audience <- "Drivers"
country <- "United States"
Language <- "EN"
final_file1 <- "2022_BHT_Drivers_US1.csv"
final_file2 <- "2022_BHT_Drivers_US2.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

if("X" %in% colnames(df)){
  df1 <- df %>% 
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
  slice(1:150000)
df4 <- df2 %>%
  slice(150001:n())


write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)

### AUS DRIVERS

### Update the below info for the specific file

upload_file <- "Master_Tracker_Driver_Australia_pre.csv"
audience <- "Drivers"
Language <- "EN-AU"
country <- "Australia"
dial_code <- 61
final_file1 <- "2022_BHT_Drivers_AUS1.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

if("X" %in% colnames(df)){
  df1 <- df %>% 
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

### Brazil Drivers

### Update the below info for the specific file

upload_file <- "Master_Tracker_Driver_Brazil_pre.csv"
audience <- "Drivers"
Language <- "PT-BR"
country <- "Brazil"
final_file1 <- "2022_BHT_Drivers_Brazil1.csv"
final_file2 <- "2022_BHT_Drivers_Brazil2.csv"
final_file3 <- "2022_BHT_Drivers_Brazil3.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

if("X" %in% colnames(df)){
  df1 <- df %>% 
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

### France Drivers

### Update the below info for the specific file

upload_file <- "Master_Tracker_Driver_France_pre.csv"
audience <- "Drivers"
country <- "France"
Language <- "FR"
final_file1 <- "2022_BHT_Drivers_France1.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

if("X" %in% colnames(df)){
  df1 <- df %>% 
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

### India Drivers

### Update the below info for the specific file

upload_file <- "Master_Tracker_Driver_India_pre.csv"
audience <- "Drivers"
country <- "India"
Language <- "EN-IN"
final_file1 <- "2022_BHT_Drivers_India1.csv"
final_file2 <- "2022_BHT_Drivers_India2.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

if("X" %in% colnames(df)){
  df1 <- df %>% 
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

df2 <- df1 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### Phone Number

df2$phone_number <- suppressWarnings(as.numeric(df2$phone_number))

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


### Mexico Drivers

### Update the below info for the specific file

upload_file <- "Master_Tracker_Driver_Mexico_pre.csv"
country <- "Mexico"
audience <- "Drivers"
Language <- "ES"
final_file1 <- "2022_BHT_Drivers_Mexico1.csv"
final_file2 <- "2022_BHT_Drivers_Mexico2.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

if("X" %in% colnames(df)){
  df1 <- df %>% 
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
  slice(1:150000)
df4 <- df2 %>%
  slice(150001:n())

write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)

### UK Drivers

### Update the below info for the specific file

upload_file <- "Master_Tracker_Driver_United_Kingdom_pre.csv"
country <- "United Kingdom"
audience <- "Drivers"
Language <- "EN-GB"
final_file1 <- "2022_BHT_Drivers_UK1.csv"
final_file2 <- "2022_BHT_Drivers_UK2.csv"
final_file3 <- "2022_BHT_Drivers_UK3.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

if("X" %in% colnames(df)){
  df1 <- df %>% 
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

### CANADA Drivers

### Update the below info for the specific file

upload_file <- "Master_Tracker_Driver_Canada_pre.csv"
audience <- "Drivers"
country <- "Canada"
final_file1 <- "2022_BHT_Drivers_Canada1.csv"
final_file2 <- "2022_BHT_Drivers_Canada2.csv"
final_file3 <- "2022_BHT_Drivers_Canada3.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

if("X" %in% colnames(df)){
  df1 <- df %>% 
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
###  filter(language_code != A") %>%
###  select(driver_uuid, Language, Q_Language) %>%
##  mutate(Language = c("EN")) %>%
#  mutate(Q_Language = c("EN"))

###df1.6 <-df1 %>%
###  filter(language_code == A") %>%
###  select(driver_uuid, Language, Q_Language) %>%
##  mutate(Language = c(A")) %>%
#  mutate(Q_Language = c(A"))  

#df1 <- dplyr::left_join(df1, df1.5, by = "driver_uuid")

#df1$Q_Language.y[is.na(df1$Q_Language.y)] = A"
#df1$Language.y[is.na(df1$Language.y)] = A"

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
