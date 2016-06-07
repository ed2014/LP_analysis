library(tidyr)
library(dplyr)
library(ggplot2)



info <- read.table("C:\\GitHubRepos\\LP_analysis\\BiomassAnnualRawData.txt", header=TRUE)

head(info)

info %>%
  mutate(Season = as.factor(Season)) %>%
  mutate(Irrigation = factor(Irrigation, levels=c("Hig", "Med", "Low", "Dry"))) %>%
  mutate(Season = as.factor(paste0("Season ",Season))) %>%
  group_by(Crop, Season, Irrigation) %>%
  dplyr::select(-Rep) %>%
  summarise_each(funs(mean,sd)) %>%
  ggplot(aes(x=Irrigation, y=mean)) +
  geom_bar(stat="identity") + 
  facet_grid(Crop~Season) +
  geom_errorbar(aes(ymax = mean + sd, ymin=mean - sd), 
                position=position_dodge(width=0.9), width=0.25) +
  ylab("Crop yield (t/ha)") +
  theme(text = element_text(size=20))
  


  