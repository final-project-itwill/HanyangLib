package kr.co.itwill.book;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class CrawNovel {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
		// 소설 주간베스트 페이지 책제목 크롤링

		try {
			
				String fileName = "D:/java202207/title.txt";
				FileWriter fw=new FileWriter(fileName, true);
				PrintWriter out=new PrintWriter(fw, true);
				
				String URL = "http://www.yes24.com/24/Category/More/001001046";
				String params = "?ElemNo=104";	
				params += "&ElemSeq=1";
				params += "&PageNumber=";
				
				CrawlingDTO dto = new CrawlingDTO();
				
				// 웹페이지 (1~50)까지 가져오기
				for(int p=1; p<=50; p++) {
					System.out.println("데이터 수집중...");
					Document doc=Jsoup.connect(URL + params + p).get();
					
					//책제목
					Elements n_title = doc.select(".cCont_listArea .goods_name");
					for(Element element : n_title) {
						out.println(element.text());

					}//for end
					

				}//for end	

			}catch (Exception e) {
						System.out.println("크롤링 실패"+e);
			
			}//end
		
		
		// 책저자 크롤링
		
		try {
			
			String fileName = "D:/java202207/ad.txt";
			FileWriter fw=new FileWriter(fileName, true);
			PrintWriter out=new PrintWriter(fw, true);
			
			String URL = "http://www.yes24.com/24/Category/More/001001046";
			String params = "?ElemNo=104";	
			params += "&ElemSeq=1";
			params += "&PageNumber=";
			
			CrawlingDTO dto = new CrawlingDTO();
			
			// 웹페이지 (1~50)까지 가져오기
			for(int p=1; p<=50; p++) {
				System.out.println("데이터 수집중...");
				Document doc=Jsoup.connect(URL + params + p).get();
				
				Elements n_auth = doc.select(".cCont_listArea .goods_auth");
				for(Element element : n_auth) {
					out.println(element.text());

				}//for end
				

			}//for end	

		}catch (Exception e) {
					System.out.println("크롤링 실패"+e);
		
		}//end


		//출판사 크롤링
		try {

			String fileName = "D:/java202207/pub.txt";
			FileWriter fw = new FileWriter(fileName, true);
			PrintWriter out = new PrintWriter(fw, true);

			String URL = "http://www.yes24.com/24/Category/More/001001046";
			String params = "?ElemNo=104";
			params += "&ElemSeq=1";
			params += "&PageNumber=";

			CrawlingDTO dto = new CrawlingDTO();

			// 웹페이지 (1~50)까지 가져오기
			for (int p = 1; p <= 50; p++) {
				System.out.println("데이터 수집중...");
				Document doc = Jsoup.connect(URL + params + p).get();

				// 출판사
				Elements n_pub = doc.select(".cCont_listArea .goods_pub");
				for (Element element : n_pub) {
					out.println(element.text());

				} // for end

			} // for end

		} catch (Exception e) {
			System.out.println("크롤링 실패" + e);

		} // end

		
		//출판일
		try {

			String fileName = "D:/java202207/rdate.txt";
			FileWriter fw = new FileWriter(fileName, true);
			PrintWriter out = new PrintWriter(fw, true);

			String URL = "http://www.yes24.com/24/Category/More/001001046";
			String params = "?ElemNo=104";
			params += "&ElemSeq=1";
			params += "&PageNumber=";

			CrawlingDTO dto = new CrawlingDTO();

			// 웹페이지 (1~50)까지 가져오기
			for (int p = 1; p <= 50; p++) {
				System.out.println("데이터 수집중...");
				Document doc = Jsoup.connect(URL + params + p).get();

				// 출판일
				Elements n_cdate = doc.select(".cCont_listArea .goods_date");
				for (Element element : n_cdate) {
					out.println(element.text());

				} // for end

			} // for end

		} catch (Exception e) {
			System.out.println("크롤링 실패" + e);

		} // end

		
		//책소개
		try {

			String fileName = "D:/java202207/des.txt";
			FileWriter fw = new FileWriter(fileName, true);
			PrintWriter out = new PrintWriter(fw, true);

			String URL = "http://www.yes24.com/24/Category/More/001001046";
			String params = "?ElemNo=104";
			params += "&ElemSeq=1";
			params += "&PageNumber=";

			CrawlingDTO dto = new CrawlingDTO();

			// 웹페이지 (1~50)까지 가져오기
			
		
			for (int p = 1; p <= 50; p++) {
				System.out.println("데이터 수집중...");
				Document doc = Jsoup.connect(URL + params + p).get();
				String read = ".cCont_listArea";
				doc.select(read);
				
				// 책소개
				Elements n_des = doc.select(".cCont_listArea .goods_read");
					for (Element element : n_des) {
						out.println(element.text());
					} //for() end
					
				} // for end
		} catch (Exception e) {
			System.out.println("크롤링 실패" + e);
		} // end
	
	
		//이미지 링크 크롤링
		
				try {

					String fileName = "D:/java202207/image.txt";
					FileWriter fw = new FileWriter(fileName, true);
					PrintWriter out = new PrintWriter(fw, true);

					String URL = "http://www.yes24.com/24/Category/More/001001046";
					String params = "?ElemNo=104";
					params += "&ElemSeq=1";
					params += "&PageNumber=";

					CrawlingDTO dto = new CrawlingDTO();

					// 웹페이지 (1~50)까지 가져오기
					
				
					for (int p = 1; p <= 50; p++) {
						System.out.println("데이터 수집중...");
						Document doc = Jsoup.connect(URL + params + p).get();
						String read = ".cCont_listArea";
						doc.select(read);
						
						//이미지링크
						Elements n_img = doc.select(".imgBdr img");
						for(Element element : n_img) {
							out.println(element.attr("src"));
						}//for() end
						
						} // for end
				} catch (Exception e) {
					System.out.println("크롤링 실패" + e);
				} // end
	
				
				//가격 크롤링
				try {

					String fileName = "D:/java202207/price.txt";
					FileWriter fw = new FileWriter(fileName, true);
					PrintWriter out = new PrintWriter(fw, true);

					String URL = "http://www.yes24.com/24/Category/More/001001046";
					String params = "?ElemNo=104";
					params += "&ElemSeq=1";
					params += "&PageNumber=";

					CrawlingDTO dto = new CrawlingDTO();

					// 웹페이지 (1~50)까지 가져오기
					
				
					for (int p = 1; p <= 50; p++) {
						System.out.println("데이터 수집중...");
						Document doc = Jsoup.connect(URL + params + p).get();
						String read = ".cCont_listArea";
						doc.select(read);
						
						//가격
						Elements n_price = doc.select(".cCont_listArea .goods_price .yes_b");
						for(Element element : n_price) {
							out.println(element.text());
						}//for() end	
						
						} // for end
				} catch (Exception e) {
					System.out.println("크롤링 실패" + e);
				} // end
	
				*/
				
				//상품코드 크롤링
				
				try {

					String fileName = "D:/java202207/code.txt";
					FileWriter fw = new FileWriter(fileName, true);
					PrintWriter out = new PrintWriter(fw, true);

					String URL = "http://www.yes24.com/24/Category/More/001001046";
					String params = "?ElemNo=104";
					params += "&ElemSeq=1";
					params += "&PageNumber=";

					CrawlingDTO dto = new CrawlingDTO();

					// 웹페이지 (1~50)까지 가져오기
					
				
					for (int p = 1; p <= 50; p++) {
						System.out.println("데이터 수집중...");
						Document doc = Jsoup.connect(URL + params + p).get();
						String read = ".cCont_listArea";
						doc.select(read);
						
						//이미지링크
						Elements n_img = doc.select(".imgBdr a");
						for(Element element : n_img) {
							String str=element.attr("href");
							out.println(str.substring(15));
						}//for() end
						
						} // for end
				} catch (Exception e) {
					System.out.println("크롤링 실패" + e);
				} // end
	
	}// main() end
}// class() end

