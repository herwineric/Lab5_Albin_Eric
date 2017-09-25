plota_karta("karlebo 101 hjorted",9)

plota_karta<-function(adress,zoom=10){
  
  if(class(adress)!="character"){
    stop("adress is not of class character")
  }
  
  if(sum(which(c(class(zoom)!="numeric",class(zoom)!="character")==c(FALSE,FALSE)))==3){
    stop("zoom is not of class numeric or character")
  }
  
  
  if(grepl("å|Å|ä|Ä",adress)){
    adress<-gsub("å|Å|ä|Ä","a",adress)
  }
  if(grepl("ö|Ö",adress)){
    adress<-gsub("ö|Ö","o",adress)
  }
  
  if(grepl(" ",adress)){
    adress<-gsub(" ","+",adress)
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
  
  
  karta_fil<- paste("http://maps.googleapis.com/maps/api/staticmap?center=",adress,"&zoom=",zoom,"&size=640x640&scale=3&maptype=terrain&language=en-EN&sensor=false",sep="")

  tmp <- tempfile()
  download.file(url = karta_fil, 
                destfile = tmp, quiet = TRUE, mode = "wb")
  map <- readPNG(tmp)
  plot(0:1,0:1,type="n",ann=FALSE,axes=FALSE)
  rasterImage(map,0,0,1,1)
  title(min_data$namn)
}