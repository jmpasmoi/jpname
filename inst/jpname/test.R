x <- "Shiko meaning"
y <- GET("http://google.com/", path = "search", query = list(q = x))

bigData <- read_html(y$url) %>%
            html_nodes("div h3")%>%
            html_text()

bigData


y <- y %>% html_nodes("div div") %>% html_text()

z <- y[3]

b <- unlist(gregexpr("<",z))

substr(z,1, b[1]-1)


####

y <- xml2::read_html(y)
y <- rvest::html_nodes(y,"div div")
y <- rvest::html_text(y)

z <- y[3]

b <- unlist(gregexpr("<",z))

sch <- substr(z,1, b[1]-1)

resp <- list(Japanese_Name = x, Search = sch)

return (resp)
