
library(htmlwidgets) 
library(ggVennDiagram) 
library(plotly) 
library(magrittr)  

# Create a data frame with the datasets for each set 
# Read in the CSV file 
df <- read.csv(file.choose(), header = TRUE)  

# Remove the first row from the dataframe 
df <- df[-1,]  

# Convert the data to a list of vectors 
dataset_list <- lapply(df, as.vector)  

# Plot basic ggVennDiagram and set the catergory names manually
venn <- 
    ggVennDiagram(dataset_list,category.names = c("Supermere overlap","EVs", "Exomeres", "NVs", "Cell pellets")) 

# Save Venn to pdf retaining the dimensions ggsave("DiFi.pdf", plot = venn, device = "pdf", width = 12, height = 10)

# Extract plotting data from venn and write it in Excel file
write.xlsx(process_region_data(Venn(dataset_list)),file = "vennjuly_1.xlsx", rowNames = FALSE)
