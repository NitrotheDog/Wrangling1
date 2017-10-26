library(tidyr)
library(dplyr)

refine <- read.csv(refine_original)
refine_df <- tbl_df(refine)

refine_df %>%
  mutate()