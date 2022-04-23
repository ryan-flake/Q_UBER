### Apr 22 
### Ryan Flake
### Uber list update practice

library(tidyverse)
library(lubridate)
library(magrittr)

### Set working directory to Downloads folder and date

setwd('uber_lists/Riders')

### Update the below info for the specific file

upload_file <- "United_States_Riders_pre.csv"
audience <- "Riders"
Language <- "EN"
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
