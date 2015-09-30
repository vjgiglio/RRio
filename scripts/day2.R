## R course day 2
## 29 sept 2015
## that was awesome


## code/insert section - organizar os scripts em sessões

##load packages
library(ggplot2)


"C:/Users/Vinicius Giglio/Desktop/R RIO/data"
gapminder<-read.csv("gapminder.csv")


##subsetting review

#methods of subsetting
#x[a] for vectors
x<-c(10:1)
x
x[3]

#x[a,b] matrices, lists,data frames
x<-list(c(1:10),c(10:20))
x
x[1,2]

#x["a"] or x["a",] vectors, data frame, or matrix withi names
x<-c(1:10)
names(x)<-letters[1:10]
x
x["b"]

# x[[a]] for lists and data frames
x<-list(c(1:10), c(10:20))
x
x[[1]]

# x$a
names(x)<-c("one","two")
x
x$two

## more complex subsetting
#<, >, ==

gapminder[gapminder$country=="Brazil",]

x<-c(1:10)
x
x[x>7]
x[x<3]

# %in%

x<-c(1:10)
names(x)<-letters[1:10]
x
x==c("d","e","f") # this doesn´t work
x[x%in% c(4,5,6)]
x[names(x) %in% c("d", "e", "f")]


## exercise questions
gapminder[gapminder$year==1957,]  #1

gapminder[,-c(1:4)]  #2

gapminder[gapminder$lifeExp>80,]  #3

gapminder[1,c(4:5)]  #4

g1<-gapminder[gapminder$year==2002,]  #5
g2<-gapminder[gapminder$year==2007,]
rbind(g1,g2)

gm2<-gapminder[gapminder$year==2002|gapminder$year==2007,]
head(gm2)
gm2$year

# prefix
sum(2,3)

#infix
2+3

## infix como um prefix
'+'(2,3)


# plotting review ---------------------------------------------------------

ggplot(data=gapminder,aes(x=lifeExp, y=gdpPercap,colour=continent))+
  geom_point()


ggplot(data=gapminder,aes(x=year, y=pop, colour=continent, group=country))+
  geom_point(colour="black")+geom_line()+scale_y_log10()

## split up by continent
ggplot(data=gapminder,aes(x=year, y=pop, colour=continent, group=country))+
  geom_point(colour="black")+geom_line()+scale_y_log10()+facet_wrap(~continent)


ggplot(data=gapminder, aes(x=lifeExp, y=gdpPercap))+geom_point(colour="green", size=3)+scale_y_log10()+
  geom_smooth(method="lm",size=1.5)


## dark overlap
ggplot(data=gapminder, aes(x=lifeExp, y=gdpPercap))+geom_point(colour="black", size=3)+scale_y_log10()+
  geom_smooth(method="lm",size=1.5)

ggplot(data=gapminder, aes(x=lifeExp, y=gdpPercap))+geom_point(colour="black", size=3)+scale_y_log10()+
  geom_smooth(method="lm",size=1.5)


ggplot(data=gapminder, aes(x=gdpPercap))+geom_density()

ggplot(data=gapminder, aes(x=gdpPercap))+geom_density(aes(x=continent, 
colour=continent, fill=continent, alpha=20))

ggplot(data=gapminder, aes(x=gdpPercap, fill=continent))+theme_classic()+
  geom_density(alpha=0.2)+facet_wrap(~year)+
  scale_x_log10()+ggtitle("GDP per continent")+
  ylab("Density of GDP")+xlab("GDP")+
  scale_fill_manual(values=c("red", " blue", "green", "yellow"))

install.packages("multiplot")


# working with data frames-------------------------------------------------
# rbind and cbind can add rows and columns to data frames

iris
head(iris)

##add a new column
iris$Family <-"Iridaceae"
head(iris)

## add a column using data from the data frame
iris$Petal.Area<-iris$Petal.Width*iris$Petal.Length
head(iris)

iris$Sepal.Area<-with(iris, Sepal.Width*Sepal.Length)
head(iris)


## summary stats
mean(iris$Sepal.Width)
sd(iris$Petal.Width)
median(iris$Petal.Width)

sd_petal_width<-sd(iris$Petal.Width)
mean_petal_width<-mean(iris$Petal.Width)
sd_petal_width/mean_petal_width

sd_sepal_length<-sd(iris$Sepal.Length)
mean_sepal_length<-mean(iris$Sepal.Length)
sd_sepal_length/mean_sepal_length


## functions to calculate the CV
## takes a vector of numbers
## returno the CV

cal_CV<-function(x){
  mean_x<-mean(x)
  sd_x<-sd(x)
  CV<-sd_x/mean_x
  return(CV)
}

#function to calculate the CV
## takes a vector of numbers
## returns the cv

cal_CV<-function(x){
  mean_x<-mean(x)
  sd_x<-sd(x)
  CV<-sd_x/mean_x
  return(CV)
}

name<-function(variables){
  
}

# load functions ----------------------------------------------------------

source("scripts/functions.R")

cal_CV(iris$Sepal.Length)
cal_CV(iris$Sepal.Width)
cal_CV(iris$Petal.Area)
cal_CV(gapminder$gdpPercap)
cal_CV(rnorm(2000))


## area of a circle
circum_to_diameter(30)
circum_to_diameter(3)

## challenge: write a function that calculates the radius from the diameter!!

radium_to_diameter()
radius_to_diameter(4)
radius_from_diameter(4)



# make a data.frame -------------------------------------------------------

circs<-data.frame(xs=10:200)
head(circs)
circs$areas<-area_from_circum(circum=circs$xs)
head(circs)

ggplot(circs, aes(x=xs, y=areas))+geom_line()


# Saving data -------------------------------------------------------------

brazil<-gapminder[gapminder$country=="Brazil",]
brazil

write.table(x=brazil, file="cleaned data/brazil_data.csv", 
            sep=",")

since_1990<-gapminder[gapminder$year>1989,] 
write.table(x=since_1990, file="cleaned data/since_1990.csv", sep=",", row.names=F, quote=F)

