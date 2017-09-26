## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

knitr::opts_chunk$set(fig.width=7, fig.height=7) 


## ----echo=FALSE,message=FALSE--------------------------------------------
library(Lab5InYourFace)


## ----message=FALSE-------------------------------------------------------
data_address("Stockholm")

data_address("sweden")


## ----message=FALSE-------------------------------------------------------
plot_address("Stockholm",zoom=12)



## ----message=FALSE-------------------------------------------------------
plot_address("sweden",zoom=4)



