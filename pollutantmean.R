pollutantmean <- function(directory, pollutant, id = 1:332) {

  files_list <- list.files(directory, full.names = T)
  dat <- data.frame()
  for (i in 1:332) {dat <- rbind(dat, read.csv(files_list[i]))}
  
  if 
  (pollutant == "sulfate") { 
    mean(dat$sulfate[which(dat[ ,"ID"] %in% id)], na.rm = T)  }
  else { 
    mean(dat$nitrate[which(dat[ ,"ID"] %in% id)], na.rm = T)   }

}
  
