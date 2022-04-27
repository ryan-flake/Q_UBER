### Apr 26 
### Ryan Flake
### Uber RIDERS list processing
### NEED TO UPDATE CANADA

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

### US RIDERS

### Set working directory to Downloads folder and date

setwd(dir = "~/Desktop/Q_Uber/uber_lists/Riders")

### Update the below info for the specific file

upload_file <- "United_States_Riders_pre.csv"
audience <- "Riders"
Language <- "EN"
dial_code <- 1
final_file1 <- "2022_BHT_Riders_US1.csv"
final_file2 <- "2022_BHT_Riders_US2.csv"
final_file3 <- "2022_BHT_Riders_US3.csv"
final_file4 <- "2022_BHT_Riders_US4.csv"
final_file5 <- "2022_BHT_Riders_US5.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

df1 <- df %>%
  subset(
    select = -c(Unnamed..0)
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
  slice(200001:400000)
df5 <- df2 %>%
  slice(400001:600000)
df6 <- df2 %>%
  slice(600001:800000)
df7 <- df2 %>%
  slice(800001:n())


write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)
write.csv(df5, final_file3, row.names = FALSE)
write.csv(df6, final_file4, row.names = FALSE)
write.csv(df7, final_file5, row.names = FALSE)

### AUS RIDERS

### Update the below info for the specific file

upload_file <- "Australia_Riders_pre.csv"
audience <- "Riders"
Language <- "EN-AU"
dial_code <- 61
final_file1 <- "2022_BHT_Riders_AUS1.csv"
final_file2 <- "2022_BHT_Riders_AUS2.csv"
final_file3 <- "2022_BHT_Riders_AUS3.csv"
final_file4 <- "2022_BHT_Riders_AUS4.csv"


### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

df1 <- df %>%
  subset(
    select = -c(Unnamed..0)
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
  slice(200001:400000)
df5 <- df2 %>%
  slice(400001:600000)
df6 <- df2 %>%
  slice(600001:n())



write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)
write.csv(df5, final_file3, row.names = FALSE)
write.csv(df6, final_file4, row.names = FALSE)

### Brazil RIDERS

### Update the below info for the specific file

upload_file <- "Brazil_Riders_pre.csv"
audience <- "Riders"
Language <- "PT-BR"
dial_code <- 55
final_file1 <- "2022_BHT_Riders_Brazil1.csv"
final_file2 <- "2022_BHT_Riders_Brazil2.csv"
final_file3 <- "2022_BHT_Riders_Brazil3.csv"


### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

df1 <- df %>%
  subset(
    select = -c(Unnamed..0)
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
  slice(200001:400000)
df5 <- df2 %>%
  slice(400001:n())


write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)
write.csv(df5, final_file3, row.names = FALSE)

### France RIDERS

### Update the below info for the specific file

upload_file <- "France_Riders_pre.csv"
audience <- "Riders"
Language <- "FR"
dial_code <- 33
final_file1 <- "2022_BHT_Riders_France1.csv"
final_file2 <- "2022_BHT_Riders_France2.csv"
final_file3 <- "2022_BHT_Riders_France3.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

df1 <- df %>%
  subset(
    select = -c(Unnamed..0)
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
  slice(200001:400000)
df5 <- df2 %>%
  slice(400001:n())


write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)
write.csv(df5, final_file3, row.names = FALSE)


### India RIDERS

### Update the below info for the specific file

upload_file <- "India_Riders_pre.csv"
audience <- "Riders"
Language <- "EN-IN"
dial_code <- 91
final_file1 <- "2022_BHT_Riders_India1.csv"
final_file2 <- "2022_BHT_Riders_India2.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

df1 <- df %>%
  subset(
    select = -c(Unnamed..0)
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

### Mexico RIDERS

### Update the below info for the specific file

upload_file <- "Mexico_Riders_pre.csv"
audience <- "Riders"
Language <- "ES"
dial_code <- 52
final_file1 <- "2022_BHT_Riders_Mexico1.csv"
final_file2 <- "2022_BHT_Riders_Mexico2.csv"
final_file3 <- "2022_BHT_Riders_Mexico3.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

df1 <- df %>%
  subset(
    select = -c(Unnamed..0)
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
  slice(200001:400000)
df5 <- df2 %>%
  slice(400001:n())


write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)
write.csv(df5, final_file3, row.names = FALSE)

### UK RIDERS

### Update the below info for the specific file

upload_file <- "United_Kingdom_Riders_pre.csv"
audience <- "Riders"
Language <- "EN-GB"
dial_code <- 44
final_file1 <- "2022_BHT_Riders_UK1.csv"
final_file2 <- "2022_BHT_Riders_UK2.csv"
final_file3 <- "2022_BHT_Riders_UK3.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

df1 <- df %>%
  subset(
    select = -c(Unnamed..0)
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
  slice(200001:400000)
df5 <- df2 %>%
  slice(400001:n())


write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)
write.csv(df5, final_file3, row.names = FALSE)

### HOLDER FOR CANADA RIDERS

### Update the below info for the specific file

upload_file <- "Canada_Riders_pre.csv"
audience <- "Riders"
Language <-
dial_code <- 1
final_file1 <- "2022_BHT_Riders_Canada1.csv"
final_file2 <- "2022_BHT_Riders_Canada2.csv"
final_file3 <- "2022_BHT_Riders_Canada3.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

df1 <- df %>%
  subset(
    select = -c(Unnamed..0)
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
  slice(200001:400000)
df5 <- df2 %>%
  slice(400001:n())


write.csv(df3, final_file1, row.names = FALSE)
write.csv(df4, final_file2, row.names = FALSE)
write.csv(df5, final_file3, row.names = FALSE)