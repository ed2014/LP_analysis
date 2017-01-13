# Script was deprecated for similar name file in markdown (.Rmd file)

library(tidyr)
library(dplyr)
library(ggplot2)

info <- read.table("C:\\GitHubRepos\\LP_analysis\\BiomassAnnualRawData.txt", header=TRUE)

head(info)



# graph
info %>%
  mutate(Season = as.factor(Season)) %>%
  mutate(Irrigation = factor(Irrigation, levels=c("Hig", "Med", "Low", "Dry"))) %>%
  mutate(Season = as.factor(paste0("Season ",Season))) %>%
  tidyr::gather("Variable", "Value", 5:6) %>%
  group_by(Crop, Season, Irrigation, Variable) %>%
  dplyr::select(-Rep) %>%
  summarise_each(funs(mean,sd)) %>%
  ggplot(aes(x=Irrigation, y=mean)) +
  geom_bar(stat="identity") + 
  facet_grid(Variable+Crop~Season, scales = "free") +
  geom_errorbar(aes(ymax = mean + sd, ymin=mean - sd), 
                position=position_dodge(width=0.9), width=0.25) +
  xlab("Irrigation frequency") +
  ylab("Water use (mm/year)                      Crop yield (t/ha/year)") +
  theme(text = element_text(size=20))
  


  