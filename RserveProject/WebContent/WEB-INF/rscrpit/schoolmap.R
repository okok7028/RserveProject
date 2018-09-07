school<-read.csv("C:/rscript/school.csv")
school_f<-school%>%filter(str_detect(소재지지번주소, site))%>%
  select(학교명,학교급구분, 소재지지번주소, 위도, 경도)

school_f_e<-school_f%>%filter(학교급구분=="초등학교")
school_f_m<-school_f%>%filter(학교급구분=="중학교")
school_f_h<-school_f%>%filter(학교급구분=="고등학교")

school_cent<-school%>%filter(str_detect(소재지지번주소, site))%>%
  select(학교명,학교급구분, 소재지지번주소, 위도, 경도)

cent<-c(mean(school_cent$경도), mean(school_cent$위도))

school_map<-get_map(cent, zoom = zoom1, maptype = "roadmap")

fname1<-paste0(fname,'.png')
map<-ggmap(school_map)+
  geom_point(data = school_f_e, aes(x = school_f_e$경도, y = school_f_e$위도),size=1, alpha=0.7, col='blue')+
  geom_point(data = school_f_m, aes(x = school_f_m$경도, y = school_f_m$위도),size=1, alpha=0.7, col='red')+
  geom_point(data = school_f_h, aes(x = school_f_h$경도, y = school_f_h$위도),size=1, alpha=0.7, col='green')
ggsave(filename = fname1, plot = map)