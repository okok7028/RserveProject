fname1<-paste0(fname,'.png')
pal<-brewer.pal(9,"Set1")
png(fname1)
wordcloud(words = df_word$Var1,
          freq = df_word$Freq,
          min.freq = 5,
          max.words = Inf,
          random.order = F,
          rot.per = .1,
          scale = c(5,0.5),
          colors = pal)
dev.off()
