##ggplot2

library(ggplot2)
data(diamonds)
head(diamonds)

##Can save ggplot objects to variables
##aes stands for aesthetic
g <-ggplot(diamonds, aes(x-carat, y-price)) 
g + geom_point(aes(color=color))

ggplot(economics, aes(x=date, y=pop)) + geom_line()

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

Weight <- c(55, 85, 75, 42, 93, 63, 58, 75, 89, 67)
Height <- c(161, 185, 174, 154, 188, 178, 170, 167, 181, 178)
Sex <- c("female", "male", "male", "female", "male", "male", "female", "male", "male", "female")
sex_differences.df <- data.frame(Weight, Height, Sex)

print(sex_differences.df)

sd <- ggplot(sex_differences.df, aes(x=Height, y=Weight))
sd +  geom_point() 
+ labs(x = "Height", y = "Weight"))
