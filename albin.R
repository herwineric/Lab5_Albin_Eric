library(jsonlite)
library(httr)
library(plotGoogleMaps)

i=2
mina_adresser<-c("totebo","karlebo+101,Hjorted","nyköping","sweden")
mina_adresser<-paste("https://maps.googleapis.com/maps/api/geocode/json?address=",mina_adresser,"&key=AIzaSyBhxCAL3_jkKxyBjneWKGUYbqWkGZvnQUc",sep="")

min_data<-data.frame(namn=1,lat=1,lon=1,
                     W_northeast_lat=1,w_northeast_lng=1,w_southwest_lat=1,w_southwest_lng=1)
i=1
for(i in 1:length(mina_adresser)){
  nr1<-fromJSON(content(GET(mina_adresser[i]),"text"),simplifyVector = FALSE)
  min_data[i,1]<-nr1$results[[1]]$formatted_address
  min_data[i,2:3]<-as.numeric(nr1$results[[1]]$geometry$location)
  
  min_data[i,4:7]<-c(as.numeric(nr1$results[[1]]$geometry$viewport[[1]]),as.numeric(nr1$results[[1]]$geometry$viewport[[2]]))
}

test<-min_data[1:2,]

coordinates(test) <- ~lat+lon
proj4string(test) <- CRS("+init=epsg:4326")
plotGoogleMaps(test)



qmplot(lon, lat, data = min_data)
qmplot(lon, lat, data = chkpts[1:2,1:2],zoom = 11)

chkpts[1:2,1:2]

class(chkpts$lat)


class(min_data)




library(png)
library(ggmap)




tmp <- tempfile()
download.file(url = "http://maps.googleapis.com/maps/api/staticmap?center=kalmar&zoom=16&size=640x640&scale=3&maptype=terrain&language=en-EN&sensor=false", 
              destfile = tmp, quiet = TRUE, mode = "wb")
map <- readPNG(tmp)
plot(0:1,0:1,type="n",ann=FALSE,axes=FALSE)
rasterImage(map,0,0,1,1)


a<-get_map("linkoping",zoom = 16)
ggmap(a)


plot(1:10,1:10)