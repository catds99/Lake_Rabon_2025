# 2025-05-14
# CDS

# Plotting PAM data

library(tidyverse)
library(dplyr)
library(ggplot2)
library(readxl)


# Read in Data

data = read_xlsx("Data/2025_master.xlsx")


# find mean Fv/Fm

data = data %>% 
  mutate(FvFm_mean = rowMeans(select(., FvFm_1, FvFm_2, FvFm_3), na.rm = TRUE))

data = data %>% 
  mutate(Date = factor(Date))




# Plot PAM at depth with different sites highlighted

ggplot(data, aes(x=FvFm_mean, y=Depth_m, shape = Date, color = Site)) +
  geom_point(size=2) +
  scale_y_reverse() +
  theme_classic()



# Plot chl a at depth with different sites highlighted

ggplot(data, aes(x=`HPLC ALL Chl a`, y=Depth_m, shape = Date, color = Site)) +
  geom_point(size=2) +
  scale_y_reverse() +
  theme_classic()

chl = filter(data, Date == c("2025-04-02", "2025-04-15"))
