
library(tidycensus)
library(tidyverse)
library(tmap)
library(sf)
library(here)
library(MatchIt)
library(optmatch)
library(cobalt)
library(readr)
library(modelsummary)
library(broom)
library(hrbrthemes)
library(extrafont)
library(ggthemes)
library(ggplot2)
library(ggpubr)

here()




### Great Recession from End 2007 to Mid 2009

state_gdp <- read_csv(here("data/recession_gdp_state.csv"))

state_employment <- read_csv(here("data/recession_employment_state.csv"))

county_gdp <- read_csv(here("data/recession_gdp_county.csv"))

county_income <- read_csv(here("data/recession_income_county.csv"))



state_gdp %>%
  ggplot() +
  geom_line(aes(x = year, y = gdp_estimate), color = "chocolate4", linewidth = 1.5) +
  geom_point(aes(x = year, y = gdp_estimate), color = "chocolate4", size = 5) +
  scale_x_continuous(breaks = seq(min(state_gdp$year), max(state_gdp$year), by = 1)) +
  scale_y_continuous(breaks = seq(-3, 4, by = 0.5)) +
  labs(title = "Nationales jährliches Bruttoinlandsprodukt (BIP) der USA",
       subtitle = "Reales Bruttoinlandsprodukt (BIP) (prozentuale Veränderung gegenüber dem Vorjahr)",
       caption = "Quuelle: U.S. Bureau of Economic Analysis",
       y = "Prozentuale Veränderung im BIP",
       x = "Jahr") +
  theme_fivethirtyeight() +
  theme(axis.title = element_text(), text = element_text(family = "Rubik"))


state_employment %>%
  ggplot() +
  geom_line(aes(x = year, y = employment_estimate), color = "chocolate4", linewidth = 1.5) +
  geom_point(aes(x = year, y = employment_estimate), color = "chocolate4", size = 5) +
  scale_x_continuous(breaks = seq(min(state_employment$year), max(state_employment$year), by = 1)) +
  scale_y_continuous(breaks = seq(-3.5, 2.5, by = 0.5)) +
  labs(title = "Jährliche nationale Beschäftigungsschätzungen der USA",
       subtitle = "Gesamtbeschäftigung (prozentuale Veränderung gegenüber dem Vorjahr)",
       caption = "Quelle: U.S. Bureau of Economic Analysis",
       y = "Prozentuale Veränderung in der Gesamtbeschäftigung",
       x = "Jahr") +
  theme_fivethirtyeight() +
  theme(axis.title = element_text(), text = element_text(family = "Rubik"))


county_gdp %>%
  ggplot() +
  geom_line(aes(x = year, y = gdp_estimate), color = "chocolate4", linewidth = 1.5) +
  geom_point(aes(x = year, y = gdp_estimate), color = "chocolate4", size = 5) +
  scale_x_continuous(breaks = seq(min(county_gdp$year), max(county_gdp$year), by = 1)) +
  scale_y_continuous(breaks = seq(-5, 5, by = 1)) +
  labs(title = "Jährliches Bruttoinlandsprodukt (BIP) des Los Angeles County",
       subtitle = "Reales Bruttoinlandsprodukt (BIP) (prozentuale Veränderung gegenüber dem Vorjahr)",
       caption = "Quelle: U.S. Bureau of Economic Analysis",
       y = "Prozentuale Veränderung im BIP",
       x = "Jahr") +
  theme_fivethirtyeight() +
  theme(axis.title = element_text(), text = element_text(family = "Rubik"))


county_income %>%
  ggplot() +
  geom_line(aes(x = year, y = income_estimate), color = "chocolate4", linewidth = 1.5) +
  geom_point(aes(x = year, y = income_estimate), color = "chocolate4", size = 5) +
  scale_x_continuous(breaks = seq(min(county_income$year), max(county_income$year), by = 1)) +
  scale_y_continuous(breaks = seq(-5, 10, by = 1)) +
  labs(title = "Jährliche Zusammenfassung des persönlichen Einkommens im County",
       subtitle = "Persönliches Pro-Kopf-Einkommen (prozentuale Veränderung gegenüber dem Vorjahr)",
       caption = "Quelle: U.S. Bureau of Economic Analysis",
       y = "Prozentuale Veränderung im Pro-Kopf-Einkommen",
       x = "Jahr") +
  theme_fivethirtyeight() +
  theme(axis.title = element_text(), text = element_text(family = "Rubik"))
