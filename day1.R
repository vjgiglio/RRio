# R course in Rio
## September 2015
# Dia 1

## objects

x<-5
x*2

## math functions
x^10
log(x)
log10(x)
sin(30)

## doubts about the function
?sin

x>2
x<3
x==5
x<-1000
x

# chalenge: Is mass large than age?
mass<-47.5
age<-122
mass<-mass*2.3
age<-age-20
mass>age
age<mass

## DATA TYPES

# logical
a<-T
b<-F

#integer
c <- 5L 

#double
d<-5

#complex number
e<-1+2i
e

#character
f<-"cat"
f

## What tyoe of data type do I have?
typeof(c)
typeof(d)

is.integer(c)
is.double(c)
is.character(c)
is.logical(c)
is.complex(c)

answer<-T
is.logical(answer)

height<-110
is.numeric(height)

dog_name<-"max"
is.character("max")

## Data structures
#Vector

vec1<-vector("character")
vec1

vec2<-vector("character", length=5)
vec2

vec3<-c(1,2,3,4,5)
vec3

vec4<-c(0:100)
vec4

vec5<-seq(0,100,by=0.5)
vec5

vec6<-c(TRUE,10L,"cat")
vec6
typeof(vec6)
as.double(vec6)

## Getting information about an object´s structure
x<-0:10000
length(x)
str(x)
head(x)
tail(x)
summary(x)

ages<-c(23,24,25,32,49)
ages
names(ages)<-c("Juliana", "Rodrigo", "Carlos", "Bella", 'Andrew')
ages

## Matrices
x<-matrix(1:10,nrow=5,ncol=2)
x
str(x)

rownames(x)<-c("a","b","c","d","e")
colnames(x)<-c("a","b")
x

x<-matrix(rnorm(18), ncol=6,nrow=3)
length(x)
x
help("matrix")

y<-matrix(1:50, ncol=5,byrow=T)
y

## Factors

x<-factor(c("yes","no","yes","yes"))
x
typeof(x)
str(x)

x<-factor(c("case","control","control","case"), levels=c("control","case"))
x
str(x)

## Lists: contain multiple data types

x<-list(1,"a",TRUE,5L)
x

xlist<-list(name="Iris Data", nums=1:10, data=head(iris))

## Data frame
df<-data.frame(a=c(1,2,3),b=c("a", "b", "c"), c=c(T,F,F))
df

df<-data.frame(id=c('a','b','c','d','e','f'),x=16,y=c(214:219))
df
length(df)

##Adding rows and columns to data frames
rbind(df,df)       #row bind
cbind(df,df)       #Column bind

vf<-data.frame(firstname="Vinicius", lastname= "Giglio", age=30)
vf

vf2<-data.frame(firstname="10000000", lastname= "Insect", age=23)
vf2

total<-rbind(vf,vf2)
str(total)

### subsetting
###taking out parts of larger objects
x<-c(5.4,6.2,7.1,4.8,7.5)
names(x)<-c("a","b","c","d","e")
x
typeof(x)
is.double(x)
is.numeric(x)

x[1]
x
x[3]
c(3,5)
x[c(3,5)]
x[2:4]
x[c(1,1,1,4)]
x[10]
x[1:5]
x[5:1]

## skippink elements
x[-1]
x[-c(2,4)]
x[c(-2,-4)]

x<-c(5.4,6.2,7.1,4.8,7.5)
names(x)<-c('a','b','c','d','e')
x

x[2:4]
x[-c(1,5)]
x[c(2,3,4)]
x[c("b","c","d")]
x[c(F,T,T,T,F)]

## subsetting by name
x["a"]
names(x)=="b"

##for matching multiple things
names(x) %in% c("b","c","d")
names(x)

## multiple conditions
a<-1:10
a
a>7
a[a>7]
a[a<7]
a[a<=7]

1:5*2
1:5*1:5

## find number higher than 4 and lower than 7
x[x>4&x<7]
a<-x>4
b<-x<7
a
b
a&b
x[a&b]

## how many times is x greater than 6??
as.numeric(x>6)
sum(x>6)
x&T

## matrices
set.seed(1)
m<-matrix(rnorm(6*4),ncol=4,nrow=6)
m

## first 3 rows
## second and third columns

m[1:3,c(2,3)]
m[,3]
m[3,]
m[1:2,]
m

## exercise
m<-matrix(1:18, nrow=3,ncol=6)
print(m)

## find the values 11 and 14
m[2,4,2,5]
m[2:5]
m[4:5,2]
m[2,c(4,5)]  ## correct command

## subsetting lists
xlist<-list(a="UFRJ", b=1:10, c=head(iris))
xlist
xlist[1]
xlist["a"]
xlist$a
xlist[[1]]
xlist[["a"]]

newobj<-xlist[["b"]]
newobj[2]

xlist[["b"]][2]


## reading in data
gapminder<-read.csv("gapminder.csv")
head(gapminder)
str(gapminder)
gapminder[,"pop"]  ## reading opopulation variable
gapminder$pop
gapminder[["pop"]]
gapminder[1:2,]

BRASIL<-gapminder$country=="Brazil"
gapminder[BRASIL,]

## ploting
library(ggplot2)

##life expectancy and GDP
ggplot(data=gapminder,aes(x=lifeExp,y=gdpPercap))+geom_point()

## Colour by country
ggplot(data=gapminder,
              aes(x=year,
       y=lifeExp,
       color=country))+
  geom_line(aes(colour=country))+geom_point(color="blue")


## switch the order

ggplot(data=gapminder, aes(x=year,y=lifeExp))+geom_point(color="blue")+
  geom_line(aes(colour=country))

##transformation and statistics

ggplot(gapminder,aes(x=lifeExp,y=gdpPercap))+geom_point()+scale_y_log10()+
  stat_smooth(method="lm")

ggplot(gapminder,aes(x=lifeExp,y=gdpPercap,colour=continent))+geom_point()+
  scale_y_log10()+theme_bw()+stat_smooth(method="lm") +
  theme(legend.background = element_blank())

ggplot(gapminder,aes(x=lifeExp,y=gdpPercap,colour=continent))+geom_point()+
  scale_y_log10()+theme_bw()+stat_smooth(method="lm",se = F) +
  theme(legend.background = element_blank())


gm90<-gapminder[gapminder$year>1990,]
head(gm90)

ggplot(gm90,aes(x=lifeExp,y=gdpPercap))+
  geom_point()+scale_y_log10()+
  geom_smooth(method="lm")+
  facet_wrap(continent~year)


