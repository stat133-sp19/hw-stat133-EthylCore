## Overview
This R package binomial is an implementation for several functions for calculating prabilites of a Binomial random variable, and several calculations.

* bin_distribution() creates a bindis object
* bin_cumulative() creates a bincum object
* bin_variable() creates a named list binvar object
* plot() method for bindis and bincum objects to plot distributions.
* summary() method for binvar object

## Usage

```{r}
bin2 <- bin_cumulative(5, .5)
bin2
```


```{r}
bin3 <- bin_variable(5, .5)
bin3
```


```{r}
binsum1 <- summary(bin3)
binsum1
```

```{r}
plot(bin1)
plot(bin2)
```
