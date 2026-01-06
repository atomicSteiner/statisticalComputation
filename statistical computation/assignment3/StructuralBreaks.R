install.packages("tidyverse")
install.packages("ggplot2")
install.packages("lubridate")
install.packages("forecast")
install.packages("xts")
install.packages("strucchange")
install.packages("CPAT")
library(tidyverse)
library(ggplot2)
library(lubridate)
library(forecast)
library(tseries)
library(xts)
library(strucchange)
library(CPAT)
# Specify sheet by its name
data <- read_csv("C:/Users/carpi/Desktop/AirPassengers.csv")

head(data)

# 1. Define Passengers as a Time Series Object
Passengers <- ts(data$`#Passengers`, start = 1949, end = 1960, frequency = 12)

#From previous analysis, we know that the data is not stationary. Anyways, in Structural Break Analysis
#You could test for breaks using several breakpoint tests just fine. 
#It is the other direction that you should be extra careful. 
#Tests for stationarity or unit root are biased in the presence of a structural break.

# 2. We go on with the search for structural changes.
bp.Passengers <- breakpoints(Passengers~1, data = data, h = 0.1, breaks = 8)
plot(bp.Passengers)

#To interpret this graph, we want to choose the number of breakpoints 
#where the BIC and RSS cross. We see that this cross happens around 
#the two-in-a-half mark; however, we only want to choose full breaks, not partial;
#thus, we’ll continue this analysis assuming two breaks.

#3. The plot of the observed and fitted time series, along with confidence
#intervals for the breakpoints, is given by:

plot(Passengers) 
lines(fitted(bp.Passengers, breaks = 2), lwd = 3, col = 'blue')
lines(confint(bp.Passengers, breaks = 2), lwd = 3)

#4. Now we want to figure out where the breaks are located:
confint(bp.Passengers, breaks =2)
#Creating a confidence interval for breakpoints of optimal 3-segment partition,
#we find that the first break is between February 1952 and June 1952,. 
#while the second one is between November 1955 and March 1956