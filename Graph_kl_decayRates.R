library(tidyr)
library(dplyr)
library(ggplot2)

saveDir <- "\\\\Lin-file\\home$\\cfleit\\My Documents\\My papers\\2013-LucernePasture\\kl\\submitted\\round_6"

info <- read.table("C:\\GitHubRepos\\LP_analysis\\kl_decayRates.txt", header=TRUE)

head(info,30)

g <- info %>%
  tidyr::gather("rate", "kl_Multiplier",X0.01:X0.0005) %>%
  mutate(rate=factor(gsub('X','-',rate))) %>%
  filter(SoilDepth<=2100) %>%
#  ggplot(aes(x= kl_Multiplier, y=rev(SoilDepth/10), colour=factor(rate) )) +
  ggplot(aes(x= (SoilDepth/10)*-1, y=(kl_Multiplier), colour=factor(rate) )) +
  geom_line() +
  geom_point(size=2, alpha=0.5) +
  ylab("Surface kl multiplier (fractional)") +
  xlab("Depth in soil profile (cm)")+
  theme(text = element_text(size=15))+ 
 # theme(legend.title=element_blank())+
  labs(colour=expression(lambda["kl"])) +
  coord_flip() + 
  geom_vline(xintercept = 0, linetype=2)

g

# Save
ggsave(file="Fig_kl_decay.tiff", dpi = 300, path=saveDir, width = 12, height = 6, g)