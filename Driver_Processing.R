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
  quar <- "Q2"
}

quarter <- paste(quar,"_",y,sep="")

### Set working directory to Downloads folder and date

setwd(dir = "~/Desktop/Q_Uber/uber_lists/Drivers")

### US DRIVERS

### Update the below info for the specific file

upload_file <- "Master Tracker_Driver_United States_pre.csv"
audience <- "Drivers"
Language <- "EN"
dial_code <- 1
final_file1 <- "2022_BHT_Drivers_US1.csv"
final_file2 <- "2022_BHT_Drivers_US2.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

df1 <- df %>%
  subset(
    select = -c(X, Unnamed..0)
  )

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
df1$audience <- c(audience)
df1$dial_code <- as.numeric(c(dial_code))
df2 <- df1 %>% unite(phone_number,
                     dial_code, 
                     phone_number,
                     sep = "",
                     remove = TRUE,
                     na.rm = FALSE
)
df2 <- df2 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)
### Chopping up large dataset

df3 <- df2 %>%
  slice(1:200000)
df4 <- df2 %>%
  slice(200001:n())


write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)

### AUS DRIVERS

### Update the below info for the specific file

upload_file <- "Master_Tracker_Australia_pre.csv"
audience <- "Drivers"
Language <- "EN-AU"
dial_code <- 61
final_file1 <- "2022_BHT_Drivers_AUS1.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

df1 <- df %>%
  subset(
    select = -c(X, Unnamed..0)
  )

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
df1$audience <- c(audience)
df1$dial_code <- as.numeric(c(dial_code))
df2 <- df1 %>% unite(phone_number,
                     dial_code, 
                     phone_number,
                     sep = "",
                     remove = TRUE,
                     na.rm = FALSE
)
df2 <- df2 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

write.csv(df2, final_file1, row.names = FALSE)

### Brazil Drivers

### Update the below info for the specific file

upload_file <- "Master Tracker_Driver_Brazil_pre.csv"
audience <- "Drivers"
Language <- "PT-BR"
dial_code <- 55
final_file1 <- "2022_BHT_Drivers_Brazil1.csv"
final_file2 <- "2022_BHT_Drivers_Brazil2.csv"
final_file3 <- "2022_BHT_Drivers_Brazil3.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

df1 <- df %>%
  subset(
    select = -c(X, Unnamed..0)
  )

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
df1$audience <- c(audience)
df1$dial_code <- as.numeric(c(dial_code))
df2 <- df1 %>% unite(phone_number,
                     dial_code, 
                     phone_number,
                     sep = "",
                     remove = TRUE,
                     na.rm = FALSE
)
df2 <- df2 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)


write.csv(df2, final_file1, row.names = FALSE)

### France Drivers

### Update the below info for the specific file

upload_file <- "Master Tracker_Driver_France_pre.csv"
audience <- "Drivers"
Language <- "FR"
dial_code <- 33
final_file1 <- "2022_BHT_Drivers_France1.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

df1 <- df %>%
  subset(
    select = -c(X, Unnamed..0)
  )

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
df1$audience <- c(audience)
df1$dial_code <- as.numeric(c(dial_code))
df2 <- df1 %>% unite(phone_number,
                     dial_code, 
                     phone_number,
                     sep = "",
                     remove = TRUE,
                     na.rm = FALSE
)
df2 <- df2 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

write.csv(df2, final_file1, row.names = FALSE)

### India Drivers

### Update the below info for the specific file

upload_file <- "Master Tracker_Driver_India_pre.csv"
audience <- "Drivers"
Language <- "EN-IN"
dial_code <- 91
final_file1 <- "2022_BHT_Drivers_India1.csv"
final_file2 <- "2022_BHT_Drivers_India2.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

df1 <- df %>%
  subset(
    select = -c(X)
  )

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
df1$audience <- c(audience)
df1$dial_code <- as.numeric(c(dial_code))
df2 <- df1 %>% unite(phone_number,
                     dial_code, 
                     phone_number,
                     sep = "",
                     remove = TRUE,
                     na.rm = FALSE
)
df2 <- df2 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### Chopping up large dataset

df3 <- df2 %>%
  slice(1:200000)
df4 <- df2 %>%
  slice(200001:n())

write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)

### Mexico Drivers

### Update the below info for the specific file

upload_file <- "Master Tracker_Driver_Mexico_pre.csv"
audience <- "Drivers"
Language <- "ES"
dial_code <- 52
final_file1 <- "2022_BHT_Drivers_Mexico1.csv"
final_file2 <- "2022_BHT_Drivers_Mexico2.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

df1 <- df %>%
  subset(
    select = -c(X, Unnamed..0)
  )

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
df1$audience <- c(audience)
df1$dial_code <- as.numeric(c(dial_code))
df2 <- df1 %>% unite(phone_number,
                     dial_code, 
                     phone_number,
                     sep = "",
                     remove = TRUE,
                     na.rm = FALSE
)
df2 <- df2 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

### Chopping up large dataset

df3 <- df2 %>%
  slice(1:150000)
df4 <- df2 %>%
  slice(1500001:n())

write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)

### UK Drivers

### Update the below info for the specific file

upload_file <- "Master Tracker_Driver_United Kingdom_pre.csv"
audience <- "Drivers"
Language <- "EN-GB"
dial_code <- 44
final_file1 <- "2022_BHT_Drivers_UK1.csv"
final_file2 <- "2022_BHT_Drivers_UK2.csv"
final_file3 <- "2022_BHT_Drivers_UK3.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

df1 <- df %>%
  subset(
    select = -c(X, Unnamed..0)
  )

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
df1$audience <- c(audience)
df1$dial_code <- as.numeric(c(dial_code))
df2 <- df1 %>% unite(phone_number,
                     dial_code, 
                     phone_number,
                     sep = "",
                     remove = TRUE,
                     na.rm = FALSE
)
df2 <- df2 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

write.csv(df2, final_file1, row.names = FALSE)

### CANADA Drivers

### Update the below info for the specific file

upload_file <- "Master Tracker_Driver_Canada_pre.csv"
audience <- "Drivers"
Language <- 
dial_code <- 1
final_file1 <- "2022_BHT_Drivers_Canada1.csv"
final_file2 <- "2022_BHT_Drivers_Canada2.csv"
final_file3 <- "2022_BHT_Drivers_Canada3.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

df1 <- df %>%
  subset(
    select = -c(X, Unnamed..0)
  )

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
  select(driver_uuid, Language, Q_Language) %>%
  mutate(Language = c("EN")) %>%
  mutate(Q_Language = c("EN"))

df1.6 <-df1 %>%
  filter(language_code == "FR-CA") %>%
  select(driver_uuid, Language, Q_Language) %>%
  mutate(Language = c("FR-CA")) %>%
  mutate(Q_Language = c("FR-CA"))  

df1 <- dplyr::left_join(df1, df1.5, by = "driver_uuid")

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
df1$quarter <- c(quarter)
df1$audience <- c(audience)
df1$dial_code <- as.numeric(c(dial_code))
df2 <- df1 %>% unite(phone_number,
                     dial_code, 
                     phone_number,
                     sep = "",
                     remove = TRUE,
                     na.rm = FALSE
)
df2 <- df2 %>% relocate(
  c(Language,Q_Language,Month,quarter,audience),
  .before = c(email)
)

write.csv(df2, final_file1, row.names = FALSE)