# --------------------------------------------------------------
# Suggestive violin/box plots, inspired by https://xkcd.com/1967
# --------------------------------------------------------------

library(ggplot2)

geom_suggestive <- function(violin_color = "indianred", box_color = "black", median_color = "white") {
  list(
    geom_violin(trim = FALSE, fill = violin_color, col = violin_color),
    geom_boxplot(width = 0.05, fill = box_color, col = box_color),
    stat_summary(fun = median, geom = "point", col = median_color)
  )
}

# --------------------------------------------------------------

# Data set for testing
num_plots <- 4
num_data_per_plot <- 50
df_test <- data.frame(x = rep(1:num_plots, each = num_data_per_plot), y = rnorm(num_plots*num_data_per_plot))

# Test
ggplot(df_test, aes(x, y, group = x)) + geom_suggestive()

# --------------------------------------------------------------
