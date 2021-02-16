##ggplot2
##Notes are taken from "R for Everyone: Advanced Analytics and Graphics" 
##by Jared P. Lander
##Install these packages: ggplot, dplyr, themes, and lubridate

library(ggplot2)
data(diamonds)
head(diamonds)

##Base histogram (not using ggplot)
hist(diamonds$carat, main = "Carat Histogram", xlab = "Carat")

##ggplot histogram
ggplot(data = diamonds) + geom_histogram(aes(x = carat))
##ggplot density plots
ggplot(data = diamonds) + geom_density(aes(x = carat))
##ggplot histogram faceted by clolor
ggplot(diamonds, aes(x = carat)) + geom_histogram() + facet_wrap(~color)

##Base Scatterplot (not using ggplot)
plot(price ~ carat, data = diamonds)
##Below method can use variables not in a data.frame
plot(diamonds$carat, diamonds$price)

##ggplot Scatterplot
ggplot(diamonds, aes(x = carat, y = price)) + geom_point()

##Can save ggplot objects to variables
##aes stands for aesthetic
g <-ggplot(diamonds, aes(x-carat, y-price)) 
g + geom_point(aes(color=color))

##Scatterplot faceted by color
g + geom_point(aes(color = color)) + facet_wrap(~color)

##Scatterplot faceted by cut and clarity. 
##Notice that cut is aligned vertically whle calirty is aligned horizontally.
g + geom_point(aes(color = color)) + facet_grid(cut ~ clarity)

##Base Boxplot
boxplot(diamonds$carat)

##ggplot2 Boxplot
ggplot(diamonds, aes(y = carat, x = 1)) + geom_boxplot()

ggplot(diamonds, aes(y = carat, x = cut)) + geom_boxplot()

ggplot(economics, aes(x=date, y=pop)) + geom_line()

##Violin plot
ggplot(diamonds, aes(y = carat, x = cut)) + geom_violin()

##Violin plot with points. The order of the layers matters.
ggplot(diamonds, aes(y = carat, x = cut)) + geom_point() + geom_violin()
ggplot(diamonds, aes(y = carat, x = cut)) + geom_violin() + geom_point() 

##ggplot Line Graphs
ggplot(economics, aes(x = date, y = pop)) + geom_line()

## Install lubridate package, 
## which has convenient functions for manipulating dates.

# load lubridate package
require(lubridate)

## create year and month variables
economics$year <- year(economics$date)
# the label argument to month means that the result should be
# the names of the month instead of the number
economics$month <- month(economics$date, label=TRUE)

# subset the data
# the which function returnr the indices of observations where the 
# tested condition was TRUE
econ2000 <- economics[which(economics$year >= 2000), ]

# load the scales package for better axis formatting
require(scales)

# build the foundation of the plot
g <- ggplot(econ2000, aes(x=month, y=pop))
# add lines color coded and grouped by year
# the group aesthetic breaks the data into separate groups
g <- g + geom_line(aes(color=factor(year), group=year))
# name the legend "Year"
g <- g + scale_color_discrete(name="Year")
# format the y axis 
g <- g + scale_y_continuous(labels=comma)
# add a title and axis labels
g <- g + labs(title="Population Growth", x="Month", y="Population")
# plot the graph
g

## Themes
require(ggthemes)
# build a plot and store it in g2
g2 <- ggplot(diamonds, aes(x=carat, y=price)) +
  geom_point(aes(color=color))
# apply a few themes
g2 + theme_economist() + scale_colour_economist()
g2 + theme_excel() + scale_colour_excel()
g2 + theme_tufte()
g2 + theme_wsj()

test = c(1:100) 
x <- c(8, 12, 9, 4, 7, 10)
y <- c(6, 8, 2, 14, 1, 5)

##Matrix
sample_matrix <- cbind(x, y)

type 
##Tells R how to plot the supplied coordinates
##(for example, as stand-alone points or joined by lines or both dots and lines)

main, xlab, ylab
##Options to include plot title, the horizontal axis label,
##and the vertical axis label, respectively

col
##Color (or colors) to use for plotting points and lines

pch
##Stands for point character. This selects which character to use
##for indivudual plot points and lines

cex
##Stands for character expansion.
##This controls the size of plotted point characters

lty
##stands for line type. 
##This specifies the type of line to use to connect the points
##(for example, solid, dotted, or dashed)

lwd
##stands for line width.
##This controls the thickness of plotted lines

xlim, ylim
##This provides limits for the horizontel range 
##and vertical range (respectively) of the plotting region


##High-Level Plot Functions

##Scatterplot
##x-axis value ~ y-axis value
plot(price ~ carat, data=diamonds)
##Without formula interface
plot(diamonds$carat, diamonds$price)

##Histogram
hist(diamonds$carat, main="Carat Histogram", xlab="Carat")

##Boxplot
boxplot(diamonds$price)

##Quantile Plots
qqplot(x, y)
qqnorm()
qqline(x, y)

##Interaction Plot
interaction.plot()

##Sunflower Scatterplot
sunflowerplot(x, y)

##Scatter plot Matrix
pairs()

##Draw symbols on a plot
symbols()

##Dot chart, bar chart, pie chart
dotchart(sample_matrix)
barplot(sample_matrix)
pie(sample_matrix)

##Draw a curve from a given function
curve()

##Create a grid of colored rectangle 
##with colors based on the values of a third variable
image(sample_matrix)

##Contour plot
contour(sample_matrix)
filled.contour(sample_matrix)

##Plot 3-D surface
persp(sample_matrix)

##Low-Level Plot Functions

##Add points to a figure
points()

##Add lines to a figure
lines()

##Insert text in the plot regions
text()

##Insert text in the figure and outer margins
mtext()

##Add figure title or outer title
legend()

##Customize Axis
axis()
axis.Date()

##Add horizontal and vertical lines or single line
abline()

##Draw a box around the current plot
box()

##Add a 1-D plot of the data to the figure
rug()

##Draw a polygon
polygon()

##Draw a rectangle
rect()

##Draw arrows
arrows()

##Draw line segments
segments()

##Add 2-D components toa  3-D plot
trans3d()


##Example plot - Heights and weights of men vs. women
Weight <- c(55, 85, 75, 42, 93, 63, 58, 75, 89, 67)
Height <- c(161, 185, 174, 154, 188, 178, 170, 167, 181, 178)
Sex <- c("female", "male", "male", "female", "male", "male", "female", "male", "male", "female")
sex_differences.df <- data.frame(Weight, Height, Sex)

sd <- ggplot(sex_differences.df, aes(x=Weight, y=Height, color=Sex))
sd +  geom_point()
+ labs(x = "Height", y = "Weight")

library(dplyr)
dplyr(starwars)

library(dplyr)
data(starwars)
head(starwars)

## 1

Weight <- c(55, 85, 75, 42, 93, 63, 58, 75, 89, 67)
Height <- c(161, 185, 174, 154, 188, 178, 170, 167, 181, 178)
Sex <- c("female", "male", "male", "female", "male", "male", "female", "male", "male", "female")
sex_differences.df <- data.frame(Weight, Height, Sex)

sd <- ggplot(sex_differences.df, aes(x=Weight, y=Height, color=Sex))
sd +  geom_point()
+ labs(x = "Height", y = "Weight")


## 2

library(dplyr)
sw <- data(starwars)
head(starwars)

ggplot(starwars, aes(x = height, y = mass)) + geom_point() 
labs(title="Star Wars Characters", x="Height", y="Mass")

## 3

#Create a histogram using ggplot2 of birth year of starwars characters’ birth year.

##ggplot histogram
ggplot(data = starwars) + geom_histogram(aes(x = birth_year))
