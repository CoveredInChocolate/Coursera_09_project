require(shiny)

shinyUI(
    shinyUI(pageWithSidebar(
        headerPanel("daRt"),
        sidebarPanel(
            h3('Choose Parameters'),
            
            # Distribution
            radioButtons(inputId="choice", label="Choose Distribution for Throws:", 
                         choices=c("normal","uniform")),
            
            # How many throws
            numericInput("numThrows", "Choose Number of Throws [1-1000]:", 20, min = 1, max = 1000),
            
            # Color of hits
            radioButtons(inputId="hitcol", label="Choose Color of Hit indicator:", 
                         choices=c("Red","Blue")),
            
            # Alpha level of Hit indicators
            sliderInput("decimal", "Alpha Level:", 
                        min = 0.2, max = 1, value = 0.75, step= 0.01),
            
            # adding the new div tag to the sidebar            
            tags$div(class="header", checked=NA,
                     tags$h2("Documentation"),
                     tags$p("daRt is a simple 1-2 player dart simulator built with R Shiny. Just as the application is quite simple, so are the user instructions!"),
                     tags$h3("How to play"),
                     tags$b("Distribution for Throws"),
                     tags$p("In order to play there are a few choices you need to make. First you need to choose a distribution for the dart hits. The dart board is placed on an invisible coordinate system with the bullseye placed in the origin. Both the y and x axes go from -2 to 2."),
                     tags$br(),
                     tags$p("For each dart hit the uniform distribution draws two random uniform variables between -2 to 2 for the x and y coordinates of the dart hit. The normal distribution draws two standard normal variables (with expectation 0 and standard deviation 1). In addition there is some noise added to both distributions (a normal distribution with expectation 0 and standard deviation 0.25)."),
                     tags$b("Number of Throws"),
                     tags$p("daRt supports anywhere between 1 and 1000 throws. To simulate a game we recommend 3 throws. To view the effects of the distribution you can set it to 1000."),
                     tags$br(),
                     tags$b("Color of Hit indicator"),
                     tags$p("If two players are playing they. An switch turns simply by changing the color setting. There are blue and red. Any dart hits that go outside the dartboard are displayed in gray."),
                     tags$br(),
                     tags$b("Alpha level"),
                     tags$p("daRt also supports an alpha level setting, which determines how transparent the hot indicators are. For normal play we recommend an alpha level of 1 (no transparency)."),
                     tags$br()
            )
        ),
        mainPanel(
            imageOutput("dartboard", width = "580px", height = "580px")
        )
    )
    )
)