
library(DBI)
library(RMySQL)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

dbListTables(MyDataBase)

dbListFields(MyDataBase, 'CountryLanguage')

DataDB <- dbGetQuery(MyDataBase, "select * from City")

CountryLanguage <- dbGetQuery(MyDataBase,"select * from CountryLanguage")

library(dplyr)

countrySpanish <-  CountryLanguage %>% filter(Language == "Spanish")

library(ggplot2)

countrySpanish %>% ggplot() +
  aes(Percentage, CountryCode, fill = IsOfficial) +
  geom_bin2d()
