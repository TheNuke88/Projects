# -----------------------------------------------------------------------------------------------------------
# Sample script for querying different databases, merging the data.tables in the script. 
# -----------------------------------------------------------------------------------------------------------

rm(list = ls())

# PREAMBLE
# -----------------------------------------------------------------------------------------------------------------------------------
setwd("<Insert path to working dir>")

library(DBI)
library(dplyr)
library(RcppRoll)
library(odbc)
library(rstudioapi)
library(data.table)
library(compare)
library(lubridate)
library(caTools)
library(caret)
library(xgboost)
library(ggplot2)

# -----------------------------------------------------------------------------------------------------------------------------------
# Connecting / querying SQL database
# ------------------------------------------------------------------------------------------------------------------------------------
con_data1 <- dbConnect(odbc(),
                                     Driver = "SQL Server",
                                     Server = "<serverName1>",
                                     Database = "<DB1>",
                                     Port = <port>)
con_data2   <- dbConnect(odbc(),
                                 Driver = "SQL Server",
                                 Server = "<serverName2>",
                                 Database = "<DB2>",
                                 Port = <port>)

# -----------------------------------------------------------------------------------------------------------------------------------
dt_data1   <- data.table(dbGetQuery(con_data1,'<Insert SQL query here>
                                                    '))
# -----------------------------------------------------------------------------------------------------------------------------------
dt_data2a   <- data.table(dbGetQuery(con_data2,'<Insert SQL query here>
                                                    '))
# -----------------------------------------------------------------------------------------------------------------------------------
dt_data2b   <- data.table(dbGetQuery(con_data2,'<Insert SQL query here>
                                                    '))
# -----------------------------------------------------------------------------------------------------------------------------------
# Merging the data tables

dt_fullData_2a1 <- unique(merge(dt_data2a, dt_data1, by = '<insert merge key>'))
dt_fullData_2b1 <- unique(merge(dt_data2b, dt_data1, by = '<insert merge key>'))


# Write CSV
fwrite(dt_fullData_2a1, "dt_fullData_2a1.csv")
fwrite(dt_fullData_2b1, "dt_fullData_2b1.csv")
