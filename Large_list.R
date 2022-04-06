### Apr 4 
### Ryan Flake
### Uber list update for large files

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

upload_file <- "~/Downloads/Australia_Riders_20220204.csv"
quarter <- "Q2_2022"
audience <- "Riders"
Language <- "EN-AU"
final_file1 <- "2022_BHT_April_Riders_AU1.csv"
final_file2 <- "2022_BHT_April_Riders_AU2.csv"
final_file3 <- "2022_BHT_April_Riders_AU3.csv"

### Read in CSV

df <- read.csv(upload_file)

### Dropping garbage befor uuid

df1 <- df %>%
  subset(
    select = -c(Unnamed..0)
  )

Month <- format(today, format="%B_%Y")

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


### Chopping up large dataset

df3 <- df2 %>%
  slice(1:300000)
df4 <- df2 %>%
  slice(300001:n())
df6 <- df2 %>%
  slice(550000:n())


write.csv(df3, final_file1, na = "", row.names = FALSE)
write.csv2(df4, final_file2, na = "", row.names = FALSE)
write.csv2(df5, final_file3, na = "", row.names = FALSE)

write.csv(
  df2, 
  file=final_file1, 
  na="NA",
  row.names=FALSE
)
max(nchar(df2$rid))
