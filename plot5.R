## 5.How have emissions from motor vehicle sources changed from 1999–2008 
## in Baltimore City?
library(dplyr)
library(ggplot2)
## reading in datas
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Source_names <- SCC %>% select(SCC, Short.Name)
Baltimore_pm <- NEI %>% filter(fips == "24510" & type== "ON-ROAD")

ggplot(data = Baltimore_pm, aes(as.factor(year),Emissions, fill= as.factor(year)))+
        geom_histogram(stat = "identity")+
        labs(title = "motor vehicle sources changed in PM")+
        xlab("Year")
dev.copy(png, file= "plot5.png")
dev.off()
