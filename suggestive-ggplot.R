# --------------------------------------------------------------
# Suggestive violin/box plots, inspired by https://xkcd.com/1967
# --------------------------------------------------------------

require(ggplot2)

geom_suggestive <- function(violin.color = "indianred", box.color = "black", median.color = "white") {
  list(
    geom_violin(trim = FALSE, fill = violin.color, col = violin.color),
    geom_boxplot(width = 0.05, fill = box.color, col = box.color),
    stat_summary(fun.y = median, geom = "point", col = median.color)
  )
}

# --------------------------------------------------------------

# Data set for testing
num.plots <- 4
num.data.per.plot <- 50
df.test <- data.frame(x = rep(1:num.plots, each = num.data.per.plot), y = rnorm(num.plots*num.data.per.plot))

# Test
ggplot(df.test, aes(x, y, group = x)) + geom_suggestive()

# --------------------------------------------------------------
