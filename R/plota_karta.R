#'@title Plot a given address/destination
#'@description Plot a given address/destination with diffrent zoom
#'@param address shall be a address/destination of class character
#'@param zoom shall be a integer of class character or numeric
#'@export
#'@return Returns a plot of the address/destination
#'@examples 
#'#plot_address("linkoping",13)
#'#plot_address("karlebo 101 hjorted",14)
plot_address<-function(address,zoom=10){
  
  if(sum(which(c(class(zoom)=="numeric",class(zoom)=="character")==c(FALSE,FALSE)))==3){
    stop("zoom is not of class numeric or character")
  }
  
  min_data<-data_address(address)

  
  if(grepl("å|Å|ä|Ä",address)){
    address<-gsub("å|Å|ä|Ä","a",address)
  }
  if(grepl("ö|Ö",address)){
    address<-gsub("ö|Ö","o",address)
  }
  
  if(grepl(" ",address)){
    address<-gsub(" ","+",address)
  }
  karta_fil<- paste("http://maps.googleapis.com/maps/api/staticmap?center=",address,"&zoom=",zoom,"&size=640x640&scale=3&maptype=terrain&language=en-EN&sensor=false",sep="")

  tmp <- tempfile()
  download.file(url = karta_fil, 
                destfile = tmp, quiet = TRUE, mode = "wb")
  map <- readPNG(tmp)
  plot(0:1,0:1,type="n",ann=FALSE,axes=FALSE)
  rasterImage(map,0,0,1,1)
  title(min_data$namn)
}