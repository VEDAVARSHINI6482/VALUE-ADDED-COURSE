#IMPORT LIBRARIES
library(rvest)
library(dply)

#SCRAPPING WEBSITE
link <- 'https://companiesmarketcap.com/'

#ALLOWABILITY
path = paths_allow(link)

#HTML ELEMENTS FROM WEBSITE
web <- read_html(link)
#SEGREGATING RANK
RANK <- web %>% html_nodes(".rank-td") %>% html_text()
#VIEWING RANK
View(RANK)
#SEGREGATING NAME
NAME <- web %>% html_nodes(".company-name") %>% html_text()
#VIEWING NAME
View(NAME)
#SEGREGATING MARKETFUND
MARKETFUND <- web %>% html_nodes(".name-td+ .td-right") %>% html_text()
#VIEWING MARKETFUND
View(MARKETFUND)
#SEGREGATING PRICE
PRICE  <- web %>% html_nodes(".td-right+ .td-right") %>% html_text()
#VIEWING PRICE
View(PRICE)
#CREATING DATA FRAME
companiesmarket.com <- data.frame(RANK, NAME, MARKETFUND, PRICE)
#VIEWING DATASET
View(companiesmarket.com)
#SAVING DATA
write.csv(companiesmarket.com,'LIST THE COMPANIES RANKING BASED ON MARKETFUND')