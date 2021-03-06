# libraries
library(OpenML)
source('./create_summary_json.R')

# config
set.seed(1)
source <- 'openml'


# download data
list_all_openml_dataset <- listOMLDataSets()

openml_id <- 	1018L
data_name <- list_all_openml_dataset[list_all_openml_dataset[,'data.id'] == openml_id,'name']

dataset_openml <- getOMLDataSet(data.id = openml_id)
dataset_raw <- dataset_openml$data
target_column <- dataset_openml$target.features


#Removing year column evary value the same 

dataset_raw <- dataset_raw[,-1]

dataset <- dataset_raw
## create json
summary_1<- CreateSummary(data = dataset_raw, target_column = target_column, id = openml_id, data_name = data_name, source = 'openml', added_by = 'jjanborowka')
write(summary_1,'./dataset.json')



vis_dat(dataset_raw)

