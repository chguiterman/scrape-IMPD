# Run script to generate full North American IMPD metadata record
## and all records including Gambel oak, with associated FHX files

library(rIMPD)
library(tidyverse)
library(sf)


impd_meta <- search_impd() %>%
  write.csv("data/impd_meta.csv")

quga_dat <- search_impd(species = "QUGA") %>%
  mutate(FHX = map(studyCode, get_impd_fhx))

save(quga_dat, file = "data/quga_dat.rda")
