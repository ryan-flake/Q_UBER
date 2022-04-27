### Apr 4 
### Ryan Flake
### Uber list update practice

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

### Update the below info for the specific file

upload_file <- "~/Downloads/Master Tracker_Driver_India_20220403.csv"
quarter <- "Q2_2022"
audience <- "Drivers"
Language <- "EN-GB"
final_file <- "2022_BHT_April_Drivers_UK.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

df1 <- df %>%
  subset(
    select = -c(X, Unnamed..0)
  )

### Month info from Base R

Month <- format(today, format="%B_%Y")

### Adding dial code based on Lang

if(Language == "EN" | Language == "FR-CA"){
  dial_code <- 1
}
if(Language == "EN-GB"){
  dial_code <- 44
}
if(Language == "EN-AU"){
  dial_code <- 61
}
if(Language == "ES"){
  dial_code <- 52
}
if(Language == "PT-BR"){
  dial_code <- 55
}
if(Language == "FR"){
  dial_code <- 33
}
if(Language == "JA"){
  dial_code <- 81
}
if(Language == "ZH-T"){
  dial_code <- 886
}
if(Language == "EN-IN"){
  dial_code <- 91
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

df2[is.na(df2)] = NA

write.csv(
  df2, 
  file=final_file,
  sep = ",",
  na="",
  row.names=FALSE,
  fileEncoding = "UTF-8"
)
