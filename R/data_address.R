#'@title Longitude and Latitude of a address/destination
#'@description Return the longitude and latitude of a address/destination
#'@param address shall be a address/destination of class character
#'@export
#'@return Returns a data.frame of the name of the address/destination, longitude and latitude.
#'@examples 
#'#data_address("linkoping")
#'#data_address("london")


data_address<-function(address){
  
  if(class(address)!="character"){
    stop("address is not of class character")
  }
  
  
  # if(grepl("å|Å|ä|Ä",address)){
  #   address<-gsub("å|Å|ä|Ä","a",address)
  # }
  # if(grepl("ö|Ö",address)){
  #   address<-gsub("ö|Ö","o",address)
  # }
  
  if(grepl(" ",address)){
    address<-gsub(" ","+",address)
  }
  
  
  address_lank<-paste("https://maps.googleapis.com/maps/api/geocode/json?address=",address,"&key=AIzaSyBhxCAL3_jkKxyBjneWKGUYbqWkGZvnQUc",sep="")
  data_mat<-jsonlite::fromJSON(httr::content(httr::GET(address_lank),"text"),simplifyVector = FALSE)
  
  if(data_mat$status=="ZERO_RESULTS"){
    stop("address not found!")
  }
  
  min_data<-data_mat$results[[1]]$formatted_address
  min_data<-data.frame(namn=min_data)
  
  min_data$Latitude<-data_mat$results[[1]]$geometry$location[[1]]
  min_data$Longitude<-data_mat$results[[1]]$geometry$location[[2]]
  
  min_data

}