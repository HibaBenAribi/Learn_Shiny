
library(shiny)

ui <- fluidPage(

    # Application title
    titlePanel("Codeathon Shiny"),

    sidebarLayout( 
        sidebarPanel( width=6, 
            h2("Sidebar"),
            fileInput("file", label = h3("File input")),
            numericInput("bins", label = h3("Number of bins:"), value = 30),
            textInput("title", label = h3("add title"), value = "Enter text..."),
            actionButton("action", label = "Submit"),
   
        ),

        mainPanel(width=6,
                  fluidRow(h2("MainPanel")),
                  fluidRow(
                    plotOutput("distPlot", height =400)
                  ),
                  fluidRow(
                    h2("fluidrow"),
                   column(12, verbatimTextOutput("value"))
                 )
        )
    )
)

server <- function(input, output) {
    output$value <- renderPrint({
      if (input$action != 0) {
      str(input$file)
      }
    })
    output$distPlot <- renderPlot({
      if (input$action != 0) {
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        title <- input$title
       
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = title)
      }
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
