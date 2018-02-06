library(tidyr)
library(dplyr)
library(ggplot2)
round1Dir <- "\\\\Lindfs12\\home$\\cfleit\\My Documents\\My papers\\2013-LucernePasture\\kl\\submitted\\round_1" # for graphs

#info <- read.table("\\\\Lindfs12\\home$\\Cfleit\\My Documents\\My papers\\2013-LucernePasture\\kl\\graphs\\kl_decayRates.txt", header=TRUE)

info <- read.table("C:\\GitHubRepos\\LP_analysis\\kl_decayRates.txt", header=TRUE)

head(info,30)

g <- info %>%
  tidyr::gather("rate", "kl_Multiplier",X0.01:X0.0005) %>%
  mutate(rate=factor(gsub('X','-',rate))) %>%
  ggplot(aes(x= SoilDepth, y=kl_Multiplier, colour=factor(rate) )) +
  geom_line() +
  geom_point() +
  ylab("Surface kl multiplier (fractional)") +
  xlab("Depth in soil profile (mm)")+
  theme(text = element_text(size=10))+ 
 # theme(legend.title=element_blank())+
  labs(colour=expression(lambda["kl"]))

g

# Save
ggsave(file="Fig_5_kl_decay.tiff", dpi = 300, path=round1Dir, g)