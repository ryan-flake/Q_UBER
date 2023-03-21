### Apr 26 
### Ryan Flake
### Uber RIDERS list processing

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

### Set working directory to Desktops folder

setwd(dir = "~/Desktop/Q_Uber/uber_lists/Riders")

### US RIDERS

### Merge datasets

Merge1 <-read.csv("Master_Tracker_Rider_United_States_File_1_pre.csv")
Merge2 <-read.csv("Master_Tracker_Rider_United_States_File_2_pre.csv")
Merge3 <-read.csv("Master_Tracker_Rider_United_States_File_3_pre.csv")

merge_final <- bind_rows(Merge1, Merge2, Merge3)

### Update the below info for the specific file

upload_file <- merge_final
audience <- "Riders"
Language <- "EN"
country <- "United States"
final_file1 <- "2022_BHT_Riders_US1.csv"
final_file2 <- "2022_BHT_Riders_US2.csv"
final_file3 <- "2022_BHT_Riders_US3.csv"
final_file4 <- "2022_BHT_Riders_US4.csv"
final_file5 <- "2022_BHT_Riders_US5.csv"
final_file6 <- "2022_BHT_Riders_US6.csv"

### Read in CSV

df <- upload_file

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
  slice(150001:300000)
df5 <- df2 %>%
  slice(300001:450000)
df6 <- df2 %>%
  slice(450001:600000)
df7 <- df2 %>%
  slice(600001:750000)
df8 <- df2 %>%
  slice(750001:n())


write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)
write.csv(df5, final_file3, row.names = FALSE)
write.csv(df6, final_file4, row.names = FALSE)
write.csv(df7, final_file5, row.names = FALSE)
write.csv(df8, final_file6, row.names = FALSE)

### AUS RIDERS

### Update the below info for the specific file

upload_file <- "Master_Tracker_Rider_Australia_pre.csv"
audience <- "Riders"
Language <- "EN-AU"
country <- "Australia"
final_file1 <- "2022_BHT_Riders_AUS1.csv"
final_file2 <- "2022_BHT_Riders_AUS2.csv"
final_file3 <- "2022_BHT_Riders_AUS3.csv"
final_file4 <- "2022_BHT_Riders_AUS4.csv"


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
  slice(150001:300000)
df5 <- df2 %>%
  slice(300001:475000)
df6 <- df2 %>%
  slice(475001:n())



write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)
write.csv(df5, final_file3, row.names = FALSE)
write.csv(df6, final_file4, row.names = FALSE)

### Brazil RIDERS

### Update the below info for the specific file

upload_file <- "Master_Tracker_Rider_Brazil_pre.csv"
audience <- "Riders"
Language <- "PT-BR"
country <- "Brazil"
final_file1 <- "2022_BHT_Riders_Brazil1.csv"
final_file2 <- "2022_BHT_Riders_Brazil2.csv"
final_file3 <- "2022_BHT_Riders_Brazil3.csv"
final_file4 <- "2022_BHT_Riders_Brazil4.csv"


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
  slice(150001:300000)
df5 <- df2 %>%
  slice(300001:450000)
df6 <- df2 %>%
  slice(450001:n())


write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)
write.csv(df5, final_file3, row.names = FALSE)
write.csv(df6, final_file4, row.names = FALSE)

### France RIDERS

### Update the below info for the specific file

upload_file <- "Master_Tracker_Rider_France_pre.csv"
audience <- "Riders"
Language <- "FR"
country <- "France"
final_file1 <- "2022_BHT_Riders_France1.csv"
final_file2 <- "2022_BHT_Riders_France2.csv"
final_file3 <- "2022_BHT_Riders_France3.csv"

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
  slice(1:175000)
df4 <- df2 %>%
  slice(175001:325000)
df5 <- df2 %>%
  slice(325001:n())


write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)
write.csv(df5, final_file3, row.names = FALSE)


### India RIDERS

### Update the below info for the specific file

upload_file <- "Master_Tracker_Rider_India_pre.csv"
audience <- "Riders"
country <- "India"
Language <- "EN-IN"
final_file1 <- "2022_BHT_Riders_India1.csv"
final_file2 <- "2022_BHT_Riders_India2.csv"
final_file3 <- "2022_BHT_Riders_India3.csv"
final_file4 <- "2022_BHT_Riders_India4.csv"

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
  slice(1:150000)
df4 <- df2 %>%
  slice(150001:300000)
df5 <- df2 %>%
  slice(300001:450000)
df6 <- df2 %>%
  slice(450001:n())

write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)
write.csv(df5, final_file3, row.names = FALSE)

### Mexico RIDERS

### Update the below info for the specific file

upload_file <- "Master_Tracker_Rider_Mexico_pre.csv"
audience <- "Riders"
Language <- "ES"
country <- "Mexico"
final_file1 <- "2022_BHT_Riders_Mexico1.csv"
final_file2 <- "2022_BHT_Riders_Mexico2.csv"
final_file3 <- "2022_BHT_Riders_Mexico3.csv"
final_file4 <- "2022_BHT_Riders_Mexico4.csv"

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
  slice(150001:300000)
df5 <- df2 %>%
  slice(300001:450000)
df6 <- df2 %>%
  slice(450001:n())


write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)
write.csv(df5, final_file3, row.names = FALSE)
write.csv(df6, final_file4, row.names = FALSE)

### UK RIDERS

### Update the below info for the specific file

upload_file <- "Master_Tracker_Rider_UK_pre.csv"
audience <- "Riders"
Language <- "EN-GB"
country <- "United Kingdom"
final_file1 <- "2022_BHT_Riders_UK1.csv"
final_file2 <- "2022_BHT_Riders_UK2.csv"
final_file3 <- "2022_BHT_Riders_UK3.csv"
final_file4 <- "2022_BHT_Riders_UK4.csv"

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
  slice(150001:300000)
df5 <- df2 %>%
  slice(300001:450000)
df6 <- df2 %>%
  slice(450001:n())


write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)
write.csv(df5, final_file3, row.names = FALSE)
write.csv(df6, final_file4, row.names = FALSE)

### CANADA RIDERS

### Update the below info for the specific file

upload_file <- "Master_Tracker_Rider_Canada_pre.csv"
audience <- "Riders"
country <- "Canada"
final_file1 <- "2022_BHT_Riders_Canada1.csv"
final_file2 <- "2022_BHT_Riders_Canada2.csv"
final_file3 <- "2022_BHT_Riders_Canada3.csv"
final_file4 <- "2022_BHT_Riders_Canada4.csv"

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

### df1$Language <- NA
### df1$Q_Language <- NA

### df1.5 <-df1 %>%
#  filter(language_code != "FR-CA") %>%
#  select(user_uuid, Language, Q_Language) %>%
#  mutate(Language = c("EN")) %>%
#  mutate(Q_Language = c("EN"))

### df1.6 <-df1 %>%
## select(user_uuid, Language, Q_Language) %>%
#  mutate(Language = c("FR-CA")) %>%
#  mutate(Q_Language = c("FR-CA"))  

#df1 <- dplyr::left_join(df1, df1.5, by = "user_uuid")

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

df2 <- df1 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### QC for value match

if(any(df2$Q_Language != df2$Language)) cat("LANG MISMATCH")
if(any(df2$quarter != quarter)) cat("Q MISMATCH")
if(any(df2$audience != audience)) cat("AUDIENCE MISMATCH")
if(any(df2$country_name != country)) cat("COUNTRY MISMATCH")

### Chopping up large dataset

df3 <- df2 %>%
  slice(1:150000)
df4 <- df2 %>%
  slice(150001:300000)
df5 <- df2 %>%
  slice(300001:450000)
df6 <- df2 %>%
  slice(450001:n())

write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)
write.csv(df5, final_file3, row.names = FALSE)
write.csv(df6, final_file4, row.names = FALSE)
