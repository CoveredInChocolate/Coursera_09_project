---
title       : daRt - A display of pure Awesomeness
subtitle    : A dart simulator in R Shiny
author      : Sindre Froyn
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Why do you need daRt?

Dart has a proven effect of:

1. Calming nerves
2. Improving productivity
3. Improving coworker relationships

This is why you need to get dart implemented in your organisation immediately.

--- .class #id 

## It is completely free!

daRt is completely free.

## No installation required!

There is no installation required. You can simply run it in your browser.

Did I mention that daRt is completely free?

---

## Still undecided?

Look, we will make this simple. We will decide by the luck of the draw. We will draw a standard normal random variable: if it is negative: you will not get daRt. If it is positive, you will get daRt!!!

---

## The results...


```r
d <- rnorm(1)
print(d)
```

```
## [1] 0.8219703
```

```r
if(d < 0) {
    print("Nope. You are apparantely too good for my game... :(")
} else {
    print("Congrats! You will get daRt!")
}
```

```
## [1] "Congrats! You will get daRt!"
```




