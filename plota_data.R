plota_data("linköping",9)
plota_data<-function(adress,zoom=10){
  
  if(class(adress)!="character"){
    stop("adress is not of class character")
  }
  
  if(class(zoom)!="numeric"){
    stop("zoom is not of class numeric")
  }
  
  if(grepl("å|Å|ä|Ä",adress)){
    adress<-gsub("å|Å|ä|Ä","a",adress)
  }
  if(grepl("ö|Ö",adress)){
    adress<-gsub("ö|Ö","o",adress)
  }
  
  adress_lank<-paste("https://maps.googleapis.com/maps/api/geocode/json?address=",adress,"&key=AIzaSyBhxCAL3_jkKxyBjneWKGUYbqWkGZvnQUc",sep="")
  data_mat<-fromJSON(content(GET(adress_lank),"text"),simplifyVector = FALSE)
  
  if(data_mat$status=="ZERO_RESULTS"){
    stop("Adress not found!")
  }
  
  min_data<-data_mat$results[[1]]$formatted_address
  min_data<-data.frame(namn=min_data)
  
  min_data$Latitude<-data_mat$results[[1]]$geometry$location[[1]]
  min_data$longitude<-data_mat$results[[1]]$geometry$location[[2]]
  
 min_data
}