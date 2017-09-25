library(httr)
library(png)
library(rvest)

urle <- "https://maps.googleapis.com/maps/api/geocode/xml?address=nyköping"

resp <- GET(url = urle)

url_list <- jsonlite::fromJSON(content(resp, "text"), simplifyVector = FALSE)
n1 <- url_list$results[[1]]$geometry$viewport$northeast$lat
n2 <- url_list$results[[1]]$geometry$viewport$northeast$lng






urle <- "https://maps.googleapis.com/maps/api/geocode/json?address=nykoping"

resp <- GET(url = urle)
url_list <- jsonlite::fromJSON(content(resp, "text"), simplifyVector = FALSE)

location <- "nykoping"

map_generator <- function(location, zoom = 10 ){
  
  url <- paste("http://maps.googleapis.com/maps/api/staticmap?center=", location, "&zoom=", zoom,
               "&size=640x640&scale=3&maptype=terrain&language=en-EN&sensor=false", sep="")
  
  tmp <- tempfile()
  download.file(url = url, 
                destfile = tmp, quiet = TRUE, mode = "wb")
  map <- readPNG(tmp)
  plot(0:1,0:1,type="n",ann=FALSE,axes=FALSE)
  rasterImage(map,0,0,1,1)
}




map_generator("nykoping")


