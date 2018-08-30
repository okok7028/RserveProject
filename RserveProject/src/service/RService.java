package service;

import java.util.ArrayList;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.stereotype.Component;

@Component
public class RService {

	private REXP x = null;
	private RConnection c =null;
	
	public String testR() {
		String retStr="done";
		String keyword="축제";
		String fname="test22";
		try {
			initR();
			c.assign("keyword", keyword);
			x = c.eval("keyword<-keyword");		
			System.out.println(x.asString());
			c.assign("fname", fname);
			x= c.eval("fname<-fname");
			System.out.println(x.asString());
			c.voidEval("basic_url<-paste0('https://search.naver.com/search.naver?&where=news&query=',keyword,'&start=')");
			for(int i=0; i<=50; i++){
				c.voidEval("urls["+(i+1)+"]<-paste0(basic_url,"+(i*10+1)+")");
			}
			x=c.eval("urls");
			String urls[] = x.asStrings();
			for(int i=0; i<urls.length; i++){
				c.voidEval("url='"+urls[i]+"'");
				c.voidEval("html<-read_html(url)");
				c.voidEval("subjects<-c(subjects, html%>%"
						+ "html_nodes('._sp_each_title')%>%"
						+ "html_text())");
//				System.out.println(urls[i]);
			}
			x=c.eval("subjects");
//			String subjects[]=x.asStrings();
//			for(int i=0; i<subjects.length;i++){
//				System.out.println(subjects[i]);
//			}
			c.voidEval("text<-str_replace_all(subjects, \"\\\\W\",\" \")");
			c.voidEval("text<-str_replace_all(subjects, keyword,\" \")");
			c.voidEval("nouns<-extractNoun(text)");
			c.voidEval("wordcount<-table(unlist(nouns))");
			c.voidEval("df_word<-as.data.frame(wordcount, stringsAsFactors = F)");
			c.voidEval("df_word<-filter(df_word,nchar(Var1)>=2)");
			c.voidEval("fname2<-paste0('C:/rpngtest/',fname,'.csv')");
			c.voidEval("write.csv(x = df_word, file = fname2)");
			c.voidEval("source('C:/rpngtest/savewordcloud.R', encoding = 'UTF-8')");
			
		} catch (RserveException e) {
			e.printStackTrace();
		}catch(REXPMismatchException e){
			
		}catch (REngineException e) {
			e.printStackTrace();
		}finally{
        c.close();
		}
		return retStr;
	}
	
	public void initR(){
		try {
			c = new RConnection();
			c.voidEval("library(rvest)");
			c.voidEval("library(dplyr)");
			c.voidEval("library(httr)");
			c.voidEval("library(plyr)");
			c.voidEval("library(KoNLP)");
			c.voidEval("library(wordcloud)");
			c.voidEval("library(stringr)");
			c.voidEval("library(RColorBrewer)");
			c.voidEval("useNIADic()");
			c.voidEval("keyword<-NULL");
			c.voidEval("fname<-NULL");
			c.voidEval("fname1<-NULL");
			c.voidEval("basic_url<-NULL");
			c.voidEval("subjects<-NULL");
			c.voidEval("urls<-NULL");
		} catch (RserveException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
