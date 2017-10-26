library(tidyr)
library(dplyr)

refine_df <- tbl_df(refine_original)

# change first column to lowercase
refine_df$company <- tolower(refine_df$company)

# separate product code from product number
refine_df <- refine_df %>% 
  separate(`Product code / number`, c("product_code", "product_number"), sep = "-")

# add product category
refine_df <- refine_df %>% 
  mutate(product_category = ifelse(product_code == "p", "Smartphone",
                                   ifelse(product_code == "v", "TV",
                                          ifelse(product_code == "x", "Laptop",
                                                 ifelse(product_code == "q", "Tablet", " ")))))

# full address in one column
refine_df <- refine_df %>% 
  unite(full_address, address, city, country, sep = ",", remove = TRUE)

# add four binary columns for company and four for product category
refine_df <- refine_df %>% 
  mutate(company_philips = ifelse(company == "phillips", 1, 0)) %>% 
  mutate(company_akzo = ifelse(company == "akzo", 1, 0)) %>%
  mutate(company_van_houten = ifelse(company == "van houten", 1, 0)) %>%
  mutate(company_unilever = ifelse(company == "unilever", 1, 0)) %>% 
  mutate(product_smartphone = ifelse(product_category == "Smartphone", 1, 0)) %>%
  mutate(product_tv = ifelse(product_category == "TV", 1, 0)) %>%
  mutate(product_laptop = ifelse(product_category == "Laptop", 1, 0)) %>%
  mutate(product_tablet = ifelse(product_category == "Tablet", 1, 0))


write.csv(refine_df, file = "refine_clean.csv")
