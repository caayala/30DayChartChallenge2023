# Shiny compatible con shinylive/webR
library(shiny)
library(readr)
library(dplyr)
library(lubridate)
library(ggplot2)

ui <- fluidPage(
  titlePanel("Casos completos por fecha de aplicación"),
  plotOutput("plot_cases"),
  tableOutput("tabla")
)

server <- function(input, output, session) {
  datos <- reactive({
    read_csv("clean.csv", show_col_types = FALSE) |>
      mutate(fecha = as_date(fecha_aplicacion)) |>
      count(fecha, name = "completos")
  })

  output$plot_cases <- renderPlot({
    ggplot(datos(), aes(fecha, completos)) +
      geom_col() +
      labs(x = "Fecha", y = "N\u00ba casos completos")
  })

  output$tabla <- renderTable(datos())
}

shinyApp(ui, server)
