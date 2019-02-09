mystring=scan("trump.txt",what = "character",sep = " ")
mystring1=paste(mystring,collapse = " ")
length(mystring1)
tr1
tr1=gsub(pattern = "\\W",replace=" ",mystring1)
tr1=gsub(pattern = "\\d",replace=" ",tr1)
tr1=tolower(tr2)
library("tm")
tr1=removeWords(tr1,stopwords())
tr1=gsub(pattern = "\\b[A-Z]\\b{1}",replace=" ",tr1)
tr1=stripWhitespace(tr1)
library(stringr)
tb2=str_split(tr1,pattern = "\\s+")
tb2=unlist(tb2)
tb2
library(wordcloud)
wordcloud(tb2,random.order = F,min.freq = 0.35,col=rainbow(7))
feel=get_sentiments("nrc")[,1]
feel=unlist(feel)
pos_feel=match(tb2,feel)
pos_feel
new_d=c(tb2,tb2)
pos_feel=match(new_d,feel)



###############3
feel_po1=pos_feel[!is.na(pos_feel)]
feel_po1
corres_feeling1=unlist(get_sentiments("nrc")[,2])
f_feel1=corres_feeling1[feel_po]
f_feel1
f_feel1=factor(f_feel1)
a1=length(f_feel1)
a1
anger="anger"
an1=0
anticipation="anticipation"
ant1=0
disgust="disgust"
dis1=0
fear="fear"
fe1=0
joy="joy"
jo1=0
negative="negative"
ne1=0
positive="positive"
po1=0
sadness="sadness"
sa1=0
surprise="surprise"
su1=0
trust="trust"
tr1=0
for(i in 1:a){
  if(f_feel1[i]==anger)
    an1=an1+1
  else if(f_feel1[i]==anticipation)
    ant1=ant1+1
  else if(f_feel1[i]==disgust)
    dis1=dis1+1
  else if(f_feel1[i]==fear)
    fe1=fe1+1
  else if(f_feel1[i]==joy)
    jo1=jo1+1
  else if(f_feel1[i]==negative)
    ne1=ne1+1
  else if(f_feel1[i]==positive)
    po1=po1+1
  else if(f_feel1[i]==sadness)
    sa1=sa1+1
  else if(f_feel1[i]==surprise)
    su1=su1+1
  else if(f_feel1[i]==trust)
    tr1=tr1+1
  else
    print("nothing")
  
}

vect1=c(an1,ant1,dis1,fe1,jo1,ne1,po1,sa1,su1,tr1)
vect1
sum(vect1)
#yes correct assignment has been done
length(f_feel1)
# both the above command are producing the same result
names(vect1)=c("T_Anger","T_Anticipation","T_Disgust","T_Fear","T_Joy","T_Negative","T_Positive","T_Sadness","T_Surprise","T_Trust")
barplot(vect1,main = "TRUMP",xlab = "sentiment",ylab = "scores",col = rainbow(10))

pie(vect1,labels = names(vect1),radius =1,col = rainbow(7))
##############################################################################
##############################################################################
library("Rfacebook")
library("RCurl")
fb=fbOAuth(app_id ="343605249390313",app_secret ="41beae43a75c0e40eacf7b3136342cef",extended_permissions=T)
m=getUsers("me",fb,private_info = T)
pages <- searchPages( string="HILLARY CLINTON", token=fb, n=10)
pages$name
#page <- getPage(page="hillaryclinton", token=fb, n=1000) 
post <- getPost(page$id[1], token=fb, n.comments=1000, likes=FALSE)
#opost is a list
t=post[[2]]
msg=t[,3]
#all the comments in msg
msg
trf=paste(msg,collapse = " ")
trf
trf=gsub(pattern = "\\W",replace=" ",trf)
trf
trf=gsub(pattern = "\\d"," ",trf)
trf=tolower(trf)
trf
library(tm)
trf=removeWords(trf,stopwords())
trf=gsub(pattern = "\\b[A-Z]\\b{1}",replace=" ",trf)
trf
trf=stripWhitespace(trf)
trf
library(stringr)
tb=str_split(trf,pattern = "\\s+")
tb
tb=unlist(tb)
tb
library(wordcloud)
#wordcloud(tb,random.order = F,min.freq = 0.2,col=rainbow(7))
#class(tb)
#length(tb)
#tb
library("tidytext")
#a=match(tb,get_sentiments("nrc"))
a
#pos=!is.na(a)
#pos
#sum(pos)
vc=get_sentiments("nrc")[,1]
vc
vc=unlist(vc)
#class(vc)
pos=match(tb,vc)
feel_po=pos[!is.na(pos)]
#feel_po
corres_feeling=unlist(get_sentiments("nrc")[,2])

f_feel=corres_feeling[feel_po]
#f_feel
f_feel=factor(f_feel)
a=length(f_feel)
a
anger="anger"
an=0
anticipation="anticipation"
ant=0
disgust="disgust"
dis=0
fear="fear"
fe=0
joy="joy"
jo=0
negative="negative"
ne=0
positive="positive"
po=0
sadness="sadness"
sa=0
surprise="surprise"

su=0
trust="trust"
tr=0
for(i in 1:a){
  if(f_feel[i]==anger)
    an=an+1
  else if(f_feel[i]==anticipation)
    ant=ant+1
  else if(f_feel[i]==disgust)
    dis=dis+1
  else if(f_feel[i]==fear)
    fe=fe+1
  else if(f_feel[i]==joy)
    jo=jo+1
  else if(f_feel[i]==negative)
    ne=ne+1
  else if(f_feel[i]==positive)
    po=po+1
  else if(f_feel[i]==sadness)
    sa=sa+1
  else if(f_feel[i]==surprise)
    su=su+1
  else if(f_feel[i]==trust)
    tr=tr+1
  else
    print("nothing")
  
}

vect=c(an,ant,dis,fe,jo,ne,po,sa,su,tr)
vect
sum(vect)
#yes correct assignment has been done
length(f_feel)
# both the above command are producing the same result
names(vect)=c("H_Anger","H_Anticipation","H_Disgust","H_Fear","H_Joy","H_Negative","H_Positive","H_Sadness","H_Surprise","H_Trust")
barplot(vect,main = "HILARY",xlab = "sentiment",ylab = "scores",col = rainbow(10))

pie(vect,labels = names(vect),radius =1,col = rainbow(7))

############################################################################
############################################################################


library("datasets")
par(mfrow=c(1,2))
barplot(vect1,main = "TRUMP",xlab = "sentiment",ylab = "scores",col = rainbow(10))
barplot(vect,main = "HILARY",xlab = "sentiment",ylab = "scores",col = rainbow(10))


par(mfrow=c(1,2))
pie(vect1,labels = names(vect1),radius =1,col = rainbow(7))
pie(vect,labels = names(vect),radius =1,col = rainbow(7))


#########################################################################
#########################################################################


