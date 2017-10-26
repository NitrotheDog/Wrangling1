library(tidyr)
library(dplyr)

refine_df <- tbl_df(refine_original)

refine_df$company <- tolower(refine_df$company)

View(refine_df)