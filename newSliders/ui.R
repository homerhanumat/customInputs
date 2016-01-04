library(shiny)
library(htmltools) #for htmlDependency

# custom inputs are defined here:
source("globals.R")

basicPage(
  # experiment with letting user set the ratepolicy in a div:
  HTML('<div id = "ratepolicy" data-delay = "1500"></div'),
  # this script determines the behavior of the custom inputs:
  singleton(tags$body(tags$script(src = "custom.js"))),
  title = "Inputs with Limited Update-Properties",
  h2("Slow Sliders"),
  p("These sliders wait a bit before updating."),
  slowSliderInput(inputId = "input1", label = "A Slow Number Slider",
                 min = 0, max = 100, step = 1, value = 0),
  verbatimTextOutput("out1")
  ,
  slowSliderInput(inputId = "input2", label = "A Slow Date Slider",
                  min = as.Date("2015-01-01"), max = as.Date("2015-12-31"),
                  step = 1, value = as.Date("2015-01-01")),
  verbatimTextOutput("out2"),
  h2("Patient Numeric Input"),
  p("This input updates when you press enter or shift focus."),
  slowNumericInput(inputId = "input3", label = "Slow Numeric",value = 0),
  verbatimTextOutput("out3"),
  h2("Codependecny"),
  p("Application to a problem posed by Weicheng Zhu:"),
  sliderInput("slider", NULL, 0, 100, 0),
  slowNumericInput("num", NULL, 0)
)