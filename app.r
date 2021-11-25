# set working directory ----
library("rstudioapi")
setwd(dirname(getActiveDocumentContext()$path)) 
getwd()

# VARIABLES ----
numberOfCaptchas <- 100

# MODULES ----
# libraries ----
source("mod-libraries.R")

# random string generator ----
source("mod-randomString.R")

createCaptcha <- function(string){
  
  # background
  background <- image_read("img_input/350x150_background.png")
  
  # overlap text
  captcha <-
    image_annotate(
      background, 
      text = string, 
      style = "Normal",  
      size = 120, 
      color = '#000000', 
      gravity = "north",
      location = "+5+10",
      weight = 700,
      font = "serif"
    )
  
  # Create a string vector with multiple noise functions
  randomNoiseFunctions <- c(
    "image_blur(captcha, 2, 2)",
    "image_motion_blur(captcha, 6, 6, 45)",
    "image_charcoal(captcha)",
    "image_oilpaint(captcha, radius = 3)",
    "image_emboss(captcha)",
    "image_implode(captcha)",
    "image_negate(captcha)"
  )
  
  # Apply randomly
  captcha <- eval(parse(text=randomNoiseFunctions[sample(1:length(randomNoiseFunctions),1,TRUE)]))
  
  return(captcha)
}

# generate an iterable vector with the different texts
stringVector <- replicate(numberOfCaptchas,randomStringGenerator())

for(i in 1:length(stringVector)){
  print(i) # just for debbugging
  captcha <- createCaptcha(stringVector[i])
  
  # Export
  image_write(
    captcha, 
    path = sprintf("img_output/Captcha%s.png",i), 
    format = "png", 
    quality = 100
  )
}

# If you need the string vector, you can use this
# dput(stringVector)



