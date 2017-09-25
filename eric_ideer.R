library(httr)
library(png)
library(rvest)

urle <- "https://maps.googleapis.com/maps/api/geocode/xml?address=nyköping"

resp <- GET(url = urle)

url_list <- jsonlite::fromJSON(content(resp, "text"), simplifyVector = FALSE)
n1 <- url_list$results[[1]]$geometry$viewport$northeast$lat
n2 <- url_list$results[[1]]$geometry$viewport$northeast$lng






urle <- "https://maps.googleapis.com/maps/api/geocode/json?address=sweden"

resp <- GET(url = urle)
url_list <- jsonlite::fromJSON(content(resp, "text"), simplifyVector = FALSE)

tmp <- tempfile()
download.file(url = "http://maps.googleapis.com/maps/api/staticmap?center=nykoping&zoom=17&size=640x640&scale=3&maptype=terrain&language=en-EN&sensor=false", 
              destfile = tmp, quiet = TRUE, mode = "wb")
map <- readPNG(tmp)
plot(0:1,0:1,type="n",ann=FALSE,axes=FALSE)
rasterImage(map,0,0,1,1)



map <- aperm(map, c(2, 1, 3))

getOption("max.print")


