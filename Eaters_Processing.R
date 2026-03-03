### Mar 3 2026 
### Ryan Flake
### Uber Eaters list processing


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
  if(q == "01"|q == "02"|q == "03"){quar <- "Q1"}
if(q == "04"|q == "05"|q == "06"){quar <- "Q2"}
if(q == "07"|q == "08"|q == "09"){quar <- "Q3"}
if(q == "10"|q == "11"|q == "12"){quar <- "Q4"}

quarter <- paste(quar,"_",y,sep="")
Month <- format(today1, format="%B_%Y")
audience_email <- "users"

### Set working directory to Desktop folder

setwd(dir = "~/Desktop/Q_Uber/uber_lists/Eaters")

### US Eaters

### Update the below info for the specific file

upload_file <- "Master_Tracker_Eater_United_States_pre_v1.csv"
audience <- "GRO Eaters"
Language <- "EN"
country <- "United States"
final_file1 <- "2022_BHT_Eaters_US1_v1.csv"
final_file2 <- "2022_BHT_Eaters_US2_v1.csv"
final_file3 <- "2022_BHT_Eaters_US3_v1.csv"

### Read in CSV

df1 <- read.csv(upload_file)

### Dropping garbage befor uuid

if("X" %in% colnames(df)){
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
df1$audience_email <- c(audience_email)
df1$Q_Language <- c(Language)
df1$Month <- c(Month)
df1$quarter <- c(quarter)
df1$audience <- c(audience)

df2 <- df1 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### QC for value match

if(any(df2$Q_Language != Language)) cat("LANG MISMATCH")
if(any(df2$quarter != quarter)) cat("Q MISMATCH")
if(any(df2$audience != audience)) cat("AUDIENCE MISMATCH")
if(any(df2$country_name != country)) cat("COUNTRY MISMATCH")

### NEW A/B Testing

n <- 50000
sampled_rows <- df2 %>% slice_sample(n = n)
df2 <- df2 %>% anti_join(sampled_rows, by = names(df2))

### Chopping up large dataset

df3 <- df2 %>%
  slice(1:150000)
df4 <- df2 %>%
  slice(150001:n())


write.csv(sampled_rows, final_file1, row.names = FALSE)
write.csv(df3, final_file2, row.names = FALSE)
write.csv(df4, final_file3, row.names = FALSE)

### AUS Eaters

### Update the below info for the specific file

upload_file <- "Master_Tracker_Eater_Australia_pre_v1.csv"
audience <- "GRO Eaters"
Language <- "EN-AU"
country <- "Australia"
final_file1 <- "2022_BHT_Eaters_AUS1_v1.csv"
final_file2 <- "2022_BHT_Eaters_AUS2_v1.csv"
final_file3 <- "2022_BHT_Eaters_AUS3_v1.csv"

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
df1$audience_email <- c(audience_email)
df1$Q_Language <- c(Language)
df1$Month <- c(Month)
df1$quarter <- c(quarter)
df1$audience <- c(audience)

df2 <- df1 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### QC for value match

if(any(df2$Q_Language != Language)) cat("LANG MISMATCH")
if(any(df2$quarter != quarter)) cat("Q MISMATCH")
if(any(df2$audience != audience)) cat("AUDIENCE MISMATCH")
if(any(df2$country_name != country)) cat("COUNTRY MISMATCH")

### NEW A/B Testing

n <- 50000
sampled_rows <- df2 %>% slice_sample(n = n)
df2 <- df2 %>% anti_join(sampled_rows, by = names(df2))


df3 <- df2 %>%
  slice(1:100000)
df4 <- df2 %>%
  slice(100001:n())


write.csv(sampled_rows, final_file1, row.names = FALSE)
write.csv(df3, final_file2, row.names = FALSE)
write.csv(df4, final_file3, row.names = FALSE)

### Brazil Eaters

### Update the below info for the specific file

upload_file <- "Master_Tracker_eater_Brazil_pre.csv"
audience <- "GRO Eaters"
Language <- "PT-BR"
country <- "Brazil"
final_file1 <- "2024_BHT_eaters_Brazil1.csv"
final_file2 <- "2024_BHT_eaters_Brazil2.csv"
final_file3 <- "2024_BHT_eaters_Brazil3.csv"
final_file4 <- "2024_BHT_eaters_Brazil4.csv"


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
df1$audience_email <- c(audience_email)
df1$audience <- c(audience)
df2 <- df1 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### QC for value match

if(any(df2$Q_Language != Language)) cat("LANG MISMATCH")
if(any(df2$quarter != quarter)) cat("Q MISMATCH")
if(any(df2$audience != audience)) cat("AUDIENCE MISMATCH")
if(any(df2$country_name != country)) cat("COUNTRY MISMATCH")

### NEW A/B Testing

n <- 50000
sampled_rows <- df2 %>% slice_sample(n = n)
df2 <- df2 %>% anti_join(sampled_rows, by = names(df2))

### Chopping up large dataset

df3 <- df2 %>%
  slice(1:150000)
df4 <- df2 %>%
  slice(150001:300000)
df5 <- df2 %>%
  slice(300001:450000)
df6 <- df2 %>%
  slice(450001:n())


write.csv(sampled_rows, final_file1, row.names = FALSE)
write.csv(df3, final_file2, row.names = FALSE)
write.csv(df4, final_file3, row.names = FALSE)
write.csv(df5, final_file4, row.names = FALSE)

### Japan Eaters

### Update the below info for the specific file

upload_file <- "Master_Tracker_Eater_Japan_pre_v1.csv"
audience <- "GRO Eaters"
Language <- "JA"
country <- "Japan"
final_file1 <- "2022_BHT_Eaters_Japan1_v1.csv"
final_file2 <- "2022_BHT_Eaters_Japan2_v1.csv"
final_file3 <- "2022_BHT_Eaters_Japan3_v1.csv"

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
df1$audience_email <- c(audience_email)
df1$Q_Language <- c(Language)
df1$Month <- c(Month)
df1$quarter <- c(quarter)
df1$audience <- c(audience)

df2 <- df1 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### QC for value match

if(any(df2$Q_Language != Language)) cat("LANG MISMATCH")
if(any(df2$quarter != quarter)) cat("Q MISMATCH")
if(any(df2$audience != audience)) cat("AUDIENCE MISMATCH")
if(any(df2$country_name != country)) cat("COUNTRY MISMATCH")

### NEW A/B Testing

n <- 50000
sampled_rows <- df2 %>% slice_sample(n = n)
df2 <- df2 %>% anti_join(sampled_rows, by = names(df2))


df3 <- df2 %>%
  slice(1:150000)
df4 <- df2 %>%
  slice(150001:n())

write.csv(sampled_rows, final_file1, row.names = FALSE)
write.csv(df3, final_file2, row.names = FALSE)
write.csv(df4, final_file3, row.names = FALSE)

### France Eaters

### Update the below info for the specific file

upload_file <- "Master_Tracker_Eater_France_pre_v1.csv"
audience <- "GRO Eaters"
Language <- "FR"
country <- "France"
final_file1 <- "2022_BHT_Eaters_France1_v1.csv"

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
df1$audience_email <- c(audience_email)
df1$Q_Language <- c(Language)
df1$Month <- c(Month)
df1$quarter <- c(quarter)
df1$audience <- c(audience)

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

### Taiwan Eaters

### Update the below info for the specific file

upload_file <- "Master_Tracker_Eater_Taiwan_pre.csv"
audience <- "GRO Eaters"
Language <- "ZH-T"
country <- "Taiwan (ROC)"
final_file1 <- "2022_BHT_Eaters_Taiwan1_v1.csv"
final_file2 <- "2022_BHT_Eaters_Taiwan2_v1.csv"
final_file3 <- "2022_BHT_Eaters_Taiwan3_v1.csv"

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
df1$audience_email <- c(audience_email)
df1$Q_Language <- c(Language)
df1$Month <- c(Month)
df1$quarter <- c(quarter)
df1$audience <- c(audience)

df2 <- df1 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### QC for value match

if(any(df2$Q_Language != Language)) cat("LANG MISMATCH")
if(any(df2$quarter != quarter)) cat("Q MISMATCH")
if(any(df2$audience != audience)) cat("AUDIENCE MISMATCH")
if(any(df2$country_name != country)) cat("COUNTRY MISMATCH")

### NEW A/B Testing

n <- 50000
sampled_rows <- df2 %>% slice_sample(n = n)
df2 <- df2 %>% anti_join(sampled_rows, by = names(df2))

df3 <- df2 %>%
  slice(1:100000)
df4 <- df2 %>%
  slice(100001:n())

write.csv(sampled_rows, final_file1, row.names = FALSE)
write.csv(df3, final_file2, row.names = FALSE)
write.csv(df4, final_file3, row.names = FALSE)

### Mexico Eaters

### Update the below info for the specific file

upload_file <- "Master_Tracker_Eater_Mexico_pre_v1.csv"
audience <- "GRO Eaters"
Language <- "ES"
country <- "Mexico"
final_file1 <- "2022_BHT_Eaters_Mexico1_v1.csv"
final_file2 <- "2022_BHT_Eaters_Mexico2_v1.csv"
final_file3 <- "2022_BHT_Eaters_Mexico3_v1.csv"

### Read in CSV

df1 <- read.csv(upload_file)

### Dropping garbage befor uuid

if("X" %in% colnames(df1)){
  df1 <- df1 %>% 
    subset(
      select = -c(X)
    )
}

if("Unnamed..0" %in%  colnames(df1)){
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
df1$audience_email <- c(audience_email)
df1$Q_Language <- c(Language)
df1$Month <- c(Month)
df1$quarter <- c(quarter)
df1$audience <- c(audience)

df2 <- df1 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### QC for value match

if(any(df2$Q_Language != Language)) cat("LANG MISMATCH")
if(any(df2$quarter != quarter)) cat("Q MISMATCH")
if(any(df2$audience != audience)) cat("AUDIENCE MISMATCH")
if(any(df2$country_name != country)) cat("COUNTRY MISMATCH")

### NEW A/B Testing

n <- 50000
sampled_rows <- df2 %>% slice_sample(n = n)
df2 <- df2 %>% anti_join(sampled_rows, by = names(df2))

df3 <- df2 %>%
  slice(1:100000)
df4 <- df2 %>%
  slice(100001:n())

write.csv(sampled_rows, final_file1, row.names = FALSE)
write.csv(df3, final_file2, row.names = FALSE)
write.csv(df4, final_file3, row.names = FALSE)

### UK Eaters

### Update the below info for the specific file

upload_file <- "Master_Tracker_Eater_United_Kingdom_pre_v1.csv"
audience <- "GRO Eaters"
Language <- "EN-GB"
country <- "United Kingdom"
final_file1 <- "2022_BHT_Eaters_UK1_v1.csv"
final_file2 <- "2022_BHT_Eaters_UK2_v1.csv"

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
df1$audience_email <- c(audience_email)
df1$Q_Language <- c(Language)
df1$Month <- c(Month)
df1$quarter <- c(quarter)
df1$audience <- c(audience)

df2 <- df1 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### QC for value match

if(any(df2$Q_Language != Language)) cat("LANG MISMATCH")
if(any(df2$quarter != quarter)) cat("Q MISMATCH")
if(any(df2$audience != audience)) cat("AUDIENCE MISMATCH")
if(any(df2$country_name != country)) cat("COUNTRY MISMATCH")


### NEW A/B Testing

n <- 40000
sampled_rows <- df2 %>% slice_sample(n = n)
df2 <- df2 %>% anti_join(sampled_rows, by = names(df2))


write.csv(sampled_rows, final_file1, row.names = FALSE)
write.csv(df2, final_file2, row.names = FALSE)

### CANADA Eaters

### Update the below info for the specific file

upload_file <- "Master_Tracker_Eater_Canada_pre_v1.csv"
audience <- "GRO Eaters"
Language <- 
  country <- "Canada"
final_file1 <- "2022_BHT_Eaters_Canada1_v1.csv"

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

df1$Language <- NA
df1$Q_Language <- NA

df1.5 <-df1 %>%
  filter(language_code != "FR-CA") %>%
  select(user_uuid, Language, Q_Language) %>%
  mutate(Language = c("EN")) %>%
  mutate(Q_Language = c("EN"))

df1.6 <-df1 %>%
  filter(language_code == "FR-CA") %>%
  select(user_uuid, Language, Q_Language) %>%
  mutate(Language = c("FR-CA")) %>%
  mutate(Q_Language = c("FR-CA"))  

df1 <- dplyr::left_join(df1, df1.5, by = "user_uuid")

df1$Q_Language.y[is.na(df1$Q_Language.y)] = "FR-CA"
df1$Language.y[is.na(df1$Language.y)] = "FR-CA"

df1 <- df1 %>%
  mutate(Language = Language.y) 

df1 <- df1 %>%
  mutate(Q_Language = Q_Language.y)

df1 <- df1 %>%
  subset(
    select = -c(Q_Language.x, Q_Language.y, Language.x, Language.y)
  )

### adding in new collumns

df1$Month <- c(Month)
df1$audience_email <- c(audience_email)
df1$quarter <- c(quarter)
df1$audience <- c(audience)

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

### Spain Eaters

### Update the below info for the specific file

upload_file <- "Master_Tracker_Eater_spain_pre_v1.csv"
audience <- "GRO Eaters"
Language <- "ES-ES"
country <- "Spain"
final_file1 <- "2024_BHT_Eaters_Spain1_v1.csv"
final_file2 <- "2024_BHT_Eaters_Spain2_v1.csv"

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
df1$audience_email <- c(audience_email)
df1$Language <- c(Language)
df1$Q_Language <- c(Language)
df1$audience <- c(audience)

df2 <- df1 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### QC for value match

if(any(df2$Q_Language != Language)) cat("LANG MISMATCH")
if(any(df2$quarter != quarter)) cat("Q MISMATCH")
if(any(df2$audience != audience)) cat("AUDIENCE MISMATCH")
if(any(df2$country_name != country)) cat("COUNTRY MISMATCH")

df3 <- df2 %>%
  slice(1:100000)
df4 <- df2 %>%
  slice(100001:n())

write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)

### Germany Eaters

### Update the below info for the specific file

upload_file <- "Master_Tracker_Eater_germany_pre_v1.csv"
audience <- "GRO Eaters"
Language <- "DE"
country <- "Germany"
final_file1 <- "2024_BHT_Eaters_DE1_v1.csv"
final_file2 <- "2024_BHT_Eaters_DE2_v1.csv"

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
df1$audience_email <- c(audience_email)
df1$Language <- c(Language)
df1$Q_Language <- c(Language)
df1$audience <- c(audience)

df2 <- df1 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### QC for value match

if(any(df2$Q_Language != Language)) cat("LANG MISMATCH")
if(any(df2$quarter != quarter)) cat("Q MISMATCH")
if(any(df2$audience != audience)) cat("AUDIENCE MISMATCH")
if(any(df2$country_name != country)) cat("COUNTRY MISMATCH")

df3 <- df2 %>%
  slice(1:100000)
df4 <- df2 %>%
  slice(100001:n())

write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)
