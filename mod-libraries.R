# LIBRARIES -------------------------------------------------------------------

paquetes <- list(
  "Images" = list("magick"),
  "Generales" = list("rstudioapi")
)
lapply(as.list(c(paquetes, recursive = T, use.names = F)),
       function(x) {
         if (x %in% rownames(installed.packages()) == FALSE) {
           install.packages(x, verbose = F)
         }
         library(x, character.only = T, verbose = F)
       })
rm(list = c("paquetes"))