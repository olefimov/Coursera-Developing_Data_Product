---
title       : Using Shiny for interactive plots of Sunshine hours in the UK
subtitle    : Source - the UK's National Weather Service
author      : Oleg Efimov
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : standalone # {selfcontained, draft}
knit        : slidify::knit2slides
---

## What is Shiny?

It is a web application framework for R.

Shiny apps are easy to write. No web development skills are required.

Shiny combines the computational power of R with the interactivity of the modern web. 

In this example we wil use time-series of monthly, seasonal and annual regional sunshine values published by the UK's National Weather Service as a data source and power of R code and Shiny to create an interactive plots of total hours of sunshine in the UK by month or by years range.

---
## Computations
Regular R code is used for a computation in shiny apps.




```r
#Loading weather stats
sh <- read.csv(
  "http://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/UK.txt", 
  skip = 7, sep = "")
dim(sh)
```

```
## [1] 87 18
```

```r
#Subsetting data
sh <- sh[1:86,1:13]
sh <- melt(sh,id='Year', variable_name = "Month")
dim(sh)
```

```
## [1] 1032    3
```

---
## Plots in Shiny
Using inputs in a web page allows to create interactive plots 

![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3-1.png) 

---
## Plots in Shiny
![plot of chunk unnamed-chunk-4](assets/fig/unnamed-chunk-4-1.png) 
