### Apr 4 
### Ryan Flake
### Uber list update practice
### Need to change Driver uuid to uuid 

library(tidyverse)
library(lubridate)
library(magrittr)

### Set working directory to Downloads folder and date

setwd('~/Downloads')
today <- Sys.Date()

### Update this section for each wave
### US/CA     = EN
### French CA = FR-CA
### UK        = EN-GB
### Australia = EN-AU
### Mexico    = ES
### Brazil    = PT-BR
### France    = FR
### Japan     = JA
### Taiwan    = ZH-T
### India     = EN-IN

upload_file <- "~/Downloads/Canada_Riders_20220204.csv"
quarter <- "Q2_2022"
audience <- "Riders"
final_file1 <- "2022_BHT_April_Riders_Canada1.csv"
final_file2 <- "2022_BHT_April_Riders_Canada2.csv"
final_file3 <- "2022_BHT_April_Riders_Canada3.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

df1 <- df %>%
  subset(
    select = -c(Unnamed..0)
  )

### Setting month variable

Month <- format(today, format="%B_%Y")

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

### Logic for Dial codes based upon language code

if(df1$Language == "EN" | df1$Language == "FR-CA"){
  dial_code <- 1
}
if(df1$Language == "EN-GB"){
  dial_code <- 44
}
if(df1$Language == "EN-AU"){
  dial_code <- 61
}
if(df1$Language == "ES"){
  dial_code <- 52
}
if(df1$Language == "PT-BR"){
  dial_code <- 55
}
if(df1$Language == "FR"){
  dial_code <- 33
}
if(df1$Language == "JA"){
  dial_code <- 81
}
if(df1$Language == "ZH-T"){
  dial_code <- 886
}
if(df1$Language == "EN-IN"){
  dial_code <- 91
}


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

### Chopping up large dataset

df3 <- df2[1:300000,]
df4 <- df2[300001:600000,]
df5 <- df2[-600000,]

write_csv2(df3, final_file1)
write_csv2(df4, final_file2)
write_csv2(df5, final_file3)



write.csv(
  df2, 
  file=final_file, 
  na="",
  row.names=FALSE
)
