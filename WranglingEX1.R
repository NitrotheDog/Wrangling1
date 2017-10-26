library(tidyr)
library(dplyr)

refine_df <- tbl_df(refine_original)

# change first column to lowercase
refine_df$company <- tolower(refine_df$company)

# separate product code from product number
refine_df <- refine_df %>% 
  separate(`Product code / number`, c("product_code", "product_number"), sep = "-")


