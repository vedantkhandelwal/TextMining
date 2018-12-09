library(tm)
library(NLP)
library(pdftools)
library(wordcloud)
txt=pdf_text("E:\\Github\\TextMining\\CART.pdf")
cat(txt)
#create corpus
txt_corpus=Corpus(VectorSource(txt))
#clean corpus
txt_corpus=tm_map(txt_corpus,tolower)
txt_corpus=tm_map(txt_corpus,removePunctuation)
txt_corpus=tm_map(txt_corpus,stripWhitespace)
#remove stop
head(stopwords("en"))
txt_corpus=tm_map(txt_corpus,removeWords,stopwords("en"))

#view content of corpus
txt_corpus$content
#wordcloud
wordcloud(txt_corpus$content,min.freq = 10,scale=c(2,1))
dtm=DocumentTermMatrix(txt_corpus)
dtm=as.matrix(dtm)
dtm=t(dtm)
number_occrence=rowSums(dtm)
number_occrence=sort(number_occrence,decreasing = TRUE)
wordcloud(head(names(number_occrence),30),head(number_occrence,30),scale=c(2,1))
