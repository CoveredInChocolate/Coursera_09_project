require(shiny)
require(png)
require(scales)

shinyServer(
    function(input, output) {
        
        # Generating output image
        output$dartboard <- renderPlot({
            # ima <- readPNG("C:\\Users\\Sindre\\Dropbox\\R\\Coursera\\9_DevelopingDataProducts\\Project\\images\\d2.png")
            ima <- readPNG("d2.png")
            
            # Make plot
            plot(-2:2,
                 -2:2,
                 type='n',
                 xlab="",
                 xaxt='n',
                 ylab="",
                 yaxt='n',
                 bty="n")
            
            #Get the plot information so the image will fill the plot box, and draw it
            lim <- par()
            
            # Plot image
            rasterImage(ima, lim$usr[1], lim$usr[3], lim$usr[2], lim$usr[4])

            
            # Simulating dart hits
            N <- input$numThrows
            
            # Random noise
            xvar <- rnorm(N, mean=0, sd=0.25)
            yvar <- rnorm(N, mean=0, sd=0.25)
            
            # Simulating random variables for dart hits
            if(input$choice == "uniform") {
                px <- runif(N, min=-2, max=2) + xvar + 0.015
                py <- runif(N, min=-2, max=2) + yvar
            } else {
                px <- rnorm(N, mean=0, sd = 1) + xvar + 0.015
                py <- rnorm(N, mean=0, sd = 1) + yvar
            }
            
            # Restrict values to avoid hits outside board
            px <- pmin(px, 2)
            py <- pmin(py, 2)
            px <- pmax(px, -2)
            py <- pmax(py, -2)
            
            dist <- sqrt(px^2 + py^2) <= 1.865
            # Hits
            points(x=px[dist], y=py[dist], type="p", pch=16,  cex = 2.4,
                   col=alpha(input$hitcol, input$decimal))
            # Miss
            points(x=px[!dist], y=py[!dist], type="p", pch=16,  cex = 2.4,
                   col=alpha("gray", input$decimal))
            
                        
        })
        
    }
)