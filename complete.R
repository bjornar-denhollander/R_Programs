complete <- function(directory, id2 = 1:332) {
  library(dplyr)  
  files_list <- list.files("specdata", full.names = T)
  dat <- data.frame()
  for (i in 1:332) {dat <- rbind(dat, read.csv(files_list[i]))}
  
  na_sulfate <- complete.cases(dat$sulfate)
  na_nitrate <- complete.cases(dat$nitrate)
  total_na <- na_nitrate + na_sulfate
  NAlist <- mutate(dat, totalNA = total_na)
  NAdata <- select(NAlist, ID, totalNA)
  
  NAdatagrouped <- group_by(NAdata, ID)
  NAfinaldata <- summarize(NAdatagrouped, totalNA = n())
  colnames(NAfinaldata) <- c("id", "nobs")
  filter(NAfinaldata, id %in% id2)
   
}

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases