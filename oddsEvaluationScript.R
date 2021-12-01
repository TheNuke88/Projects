# Data Preprocessing Template
rm(list = ls(all.names = TRUE)) #clear data/lists/everything in memory

as.numeric.factor <- function(x) {as.numeric(levels(x))[x]}

library(tidyverse)
library(caTools)
library(mltools)
library(randomForest)
library(DT)
library(htmltools)
library(xtable)
library(data.table)
library(dplyr)
library(formattable)
library(tidyr)

customGreen0 = "#DeF7E9"
customGreen = "#71CA97"
customRed = "#ff7f7f"

setwd("<insert path to directory>")


# Betting work calculations

# Variables. Estimate win-rates and odds given on the bet
Win_rate1 = 0.78 
Win_rate2 = 0.5 
Odds = 2.2 
Margin4error = 10

# If there are multiple teams, then you have to multiply each teams winner chances with eachother. 
# Win_rate1 * Win_rate2 = W_total

W_total = if( Win_rate1 * Win_rate2 > 0){
              Win_rate1 * Win_rate2
            } else {Win_rate1}

# Bookie's fair odds is calculated by: 
# odds_fair = fair odds used by the Bookie

odds_fair = 1/W_total
P_oddsFair = 100/odds_fair

# Now we can estimate if the bookie has given too good odds on an event to occur 
# Formula for "too good" is listed below, including an arbitrary margin for error.

M = 100/(odds_fair-1)*(Odds-1)-Margin4error
M

# If you locate a bet with an M-value above 100, then you have a better chance at making money on the bet.
# 
# ... results may vary.