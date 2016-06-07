library(tidyr)
library(dplyr)
library(ggplot2)

#info <- read.table("\\\\Lindfs12\\home$\\Cfleit\\My Documents\\My papers\\2013-LucernePasture\\kl\\graphs\\kl_decayRates.txt", header=TRUE)

info <- read.table("C:\\GitHubRepos\\LP_analysis\\kl_decayRates.txt", header=TRUE)

head(info)

info %>%
  tidyr::gather("rate", "kl_Multiplier",2:8) %>%
  ggplot(aes(x= kl_Multiplier, y= Depth*-0.1 , colour=factor(rate) )) +
  geom_line() +
  geom_point() +
  xlab("kl Multiplier (fractional)") +
  ylab("Depth in soil profile (mm)")