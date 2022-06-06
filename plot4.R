# 4.Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?
library(dplyr)

## reading in datas
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Source_names <- SCC %>% select(SCC, Short.Name)
NEIpm <- NEI %>% select(SCC, Emissions, year)
merged <- merge(Source_names, NEIpm, by="SCC")
comb <- grep("Combustion",merged$Short.Name)
coal_comb <- merged[merged$Short.Name[comb],] 
cl <- coal_comb %>% group_by(as.factor(year))%>% mutate(PM=mean(Emissions))
ggplot(data = cl, aes(year,PM))+
        geom_point(size = 3, shape = 2) +
        geom_line(col="red", linetype = 2)+
        labs(title = "Mean coal combustion-related changes fom 1999 to 2008")+
        xlab("Year")+ theme_bw(base_family = "Times")+
        ylab("PM[2.5] Emissions")   
        
dev.copy(png, file= "plot4.png")
dev.off()

