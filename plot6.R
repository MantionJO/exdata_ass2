# 6.Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California fips == "06037". 
# Which city has seen greater changes over time in motor vehicle emissions?
library(dplyr)
library(ggplot2)
## reading in datas
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Source_names <- SCC %>% select(SCC, Short.Name)
Baltimore_pm <- NEI %>% filter(fips == "24510" & type== "ON-ROAD")
California <- NEI %>% filter(fips == "06037" & type== "ON-ROAD")
B_C <- rbind(Baltimore_pm, California) %>% mutate(ffips=factor(fips, labels=c("California", "Baltimore")))
ggplot(data = B_C, aes(as.factor(year),Emissions,  fill= as.factor(year)))+
        geom_histogram(stat = "identity")+facet_grid(facets = .~ffips)+
        labs(title = "Comparison PM25 emissions from motor vehicle
             in Baltimore  and California over the time")+
        xlab("Year")+ theme_bw(base_family = "Times")+
        ylab("PM[2.5] Emissions")
dev.copy(png, file= "plot6.png")
dev.off()        
        

