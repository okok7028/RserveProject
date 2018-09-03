package service;

import java.util.List;
import java.util.Random;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.FileDAO;
import repository.ListDAO;
import vo.RequestFileVO;
import vo.RequestListVO;
import vo.ResultFileVO;

@Component
public class RService {

	@Autowired
	private ListDAO ldao;
	@Autowired
	private FileDAO fdao;
	
	private REXP x = null;
	private RConnection c =null;
	
	public boolean insertRequestList(String request_id, String request_code){
		if(ldao.insertRequestList(request_id, request_code)>0){
			return true;
		}else{
			return false;
		}
	}
	
	// 유저 간편요청 전체 리스트
	public List<RequestListVO> getSimpleRequestList(String request_id){
		return ldao.selectWaitListfromId(request_id);
	}
	//유저 간편요청 완료 리스트
	public List<RequestListVO> getSimpleCompleteList(String request_id){
		return ldao.selectCompleteList(request_id);
	}
	
	public String wordcloudNews(String request_code, HttpServletRequest request) {
		List<RequestListVO> list = ldao.selectWaitListfromCode(request_code);
		String dirPath = request.getServletContext().getRealPath("/resource/img/");
		String work="";
		int requestNum;
		String keyword="";
		String fname="";
		String code="";
		String originalName="";
		ResultFileVO vo=new ResultFileVO();
		if(list !=null){
		for(int j=0; j<list.size(); j++){
			code=list.get(j).getRequest_code();
			StringTokenizer stz = new StringTokenizer(code, "_");
			work=stz.nextToken();
			keyword=stz.nextToken();
			originalName=stz.nextToken();
			fname = dirPath+new Random().nextInt(1000000) + "";
			requestNum=list.get(j).getRequest_num();
			System.out.println(keyword+"   "+originalName+"  "+fname);
			vo.setOriginal_name(originalName);
			vo.setSaved_path(fname);
			vo.setRequest_num(requestNum);
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
			c.voidEval("fname2<-paste0(fname,'.csv')");
			c.voidEval("write.csv(x = df_word, file = fname2)");
			c.voidEval("source('C:/rpngtest/savewordcloud.R', encoding = 'UTF-8')");
			fdao.insertResultFile(vo);
			ldao.updateDoneList(requestNum);
		} catch (RserveException e) {
			e.printStackTrace();
			return "fail";
		}catch(REXPMismatchException e){
			e.printStackTrace();
			return "fail";
		}finally{
        c.close();
		}
		}//end for
		return "success";
		}else{
			return "empty";
		}
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
