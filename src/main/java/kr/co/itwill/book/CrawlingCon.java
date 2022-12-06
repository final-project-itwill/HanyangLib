package kr.co.itwill.book;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/crawling")
public class CrawlingCon {
	
	@Autowired
	
	public void crawling(){	
	

	//교보문고 소설 주간베스트 페이지 책제목 크롤링

	/*try {
		
			String URL = "http://www.yes24.com/24/Category/More/001001046";
			String params = "?ElemNo=104";	
			params += "&ElemSeq=1";
			params += "&PageNumber=";
			
			// 웹페이지 (1~50)까지 가져오기
			for(int p=1; p<=50; p++) {
				System.out.println("데이터 수집중...");
				Document doc=Jsoup.connect(URL + params + p).get();
				
				//책제목
				Elements n_title = doc.select(".goods_name");
				for(Element element : n_title) {
					System.out.println(element.text());
					
				}//for end
				
				
				//저자
				Elements n_auth = doc.select(".goods_auth");
				for(Element element : n_auth) {
					System.out.println(element.text());
				}//for end
				
				//출판사
				Elements n_pub = doc.select(".goods_pub");
				for(Element element : n_pub) {
					System.out.println(element.text());
				}//for end
				
				
				//출판일
				Elements n_cdate = doc.select(".goods_date");
				for(Element element : n_cdate) {
					System.out.println(element.text());
				}//for end
				
				
				//책소개
				Elements n_des = doc.select(".goods_read");
				for(Element element : n_des) {
					System.out.println(element.text());
				}//for end
				
				
				//가격
				Elements n_price = doc.select(".goods_price > .yes_b");
				for(Element element : n_price) {
					System.out.println(element.text());
				}//for end]
				
				//이미지링크
				Elements n_img = doc.select(".imgBdr img");
				for(Element element : n_img) {
					System.out.println(element.attr("src"));
				}
			
				
				
			}//for end	

		}catch (Exception e) {
					System.out.println("크롤링 실패"+e);
		
		}//end
	
System.out.println("================================================================================================================");		
	
	//교보문고 에세이 주간베스트 페이지 책제목 크롤링
	
			try {
				
					String URL = "http://www.yes24.com/24/Category/More/001001047";
					String params = "?ElemNo=104";	
					params += "&ElemSeq=1";
					params += "&PageNumber=";
					
					// 웹페이지 (1~50)까지 가져오기
					for(int p=1; p<=50; p++) {
						System.out.println("데이터 수집중...");
						Document doc=Jsoup.connect(URL + params + p).get();
						
						//책제목
						Elements e_title = doc.select(".goods_name");
						for(Element element : e_title) {
							System.out.println(element.text());
						}//for end
						
						
						//저자
						Elements e_auth = doc.select(".goods_auth");
						for(Element element : e_auth) {
							System.out.println(element.text());
						}//for end
						
						//출판사
						Elements e_pub = doc.select(".goods_pub");
						for(Element element : e_pub) {
							System.out.println(element.text());
						}//for end
						
						
						//출판일
						Elements e_cdate = doc.select(".goods_date");
						for(Element element : e_cdate) {
							System.out.println(element.text());
						}//for end
						
						
						//책소개
						Elements e_des = doc.select(".goods_read");
						for(Element element : e_des) {
							System.out.println(element.text());
						}//for end
						
						
						//가격
						Elements e_price = doc.select(".goods_price > .yes_b");
						for(Element element : e_price) {
							System.out.println(element.text());
						}//for end]
						
						//이미지링크
						Elements e_img = doc.select(".imgBdr img");
						for(Element element : e_img) {
							System.out.println(element.attr("src"));
						}
					
						
					}//for end	
		
				}catch (Exception e) {
							System.out.println("크롤링 실패"+e);
				
				}//end

System.out.println("================================================================================================================");			

//교보문고 인문 주간베스트 페이지 책제목 크롤링

	try {
		
			String URL = "http://www.yes24.com/24/Category/More/001001019";
			String params = "?ElemNo=104";	
			params += "&ElemSeq=1";
			params += "&PageNumber=";
			
			// 웹페이지 (1~50)까지 가져오기
			for(int p=1; p<=50; p++) {
				System.out.println("데이터 수집중...");
				Document doc=Jsoup.connect(URL + params + p).get();
				
				//책제목
				Elements h_title = doc.select(".goods_name");
				for(Element element : h_title) {
					System.out.println(element.text());
				}//for end
				
				
				//저자
				Elements h_auth = doc.select(".goods_auth");
				for(Element element : h_auth) {
					System.out.println(element.text());
				}//for end
				
				//출판사
				Elements h_pub = doc.select(".goods_pub");
				for(Element element : h_pub) {
					System.out.println(element.text());
				}//for end
				
				
				//출판일
				Elements h_cdate = doc.select(".goods_date");
				for(Element element : h_cdate) {
					System.out.println(element.text());
				}//for end
				
				
				//책소개
				Elements h_des = doc.select(".goods_read");
				for(Element element : h_des) {
					System.out.println(element.text());
				}//for end
				
				
				//가격
				Elements h_price = doc.select(".goods_price > .yes_b");
				for(Element element : h_price) {
					System.out.println(element.text());
				}//for end]
				
				//이미지링크
				Elements h_img = doc.select(".imgBdr img");
				for(Element element : h_img) {
					System.out.println(element.attr("src"));
				}
			
				
			}//for end	
	
		}catch (Exception e) {
					System.out.println("크롤링 실패"+e);
		
		}//end

System.out.println("================================================================================================================");			

//교보문고 자연과학 주간베스트 페이지 책제목 크롤링

	try {
		
			String URL = "http://www.yes24.com/24/Category/More/001001002";
			String params = "?ElemNo=104";	
			params += "&ElemSeq=1";
			params += "&PageNumber=";
			
			// 웹페이지 (1~50)까지 가져오기
			for(int p=1; p<=50; p++) {
				System.out.println("데이터 수집중...");
				Document doc=Jsoup.connect(URL + params + p).get();
				
				//책제목
				Elements s_title = doc.select(".goods_name");
				for(Element element : s_title) {
					System.out.println(element.text());
				}//for end
				
				
				//저자
				Elements s_auth = doc.select(".goods_auth");
				for(Element element : s_auth) {
					System.out.println(element.text());
				}//for end
				
				//출판사
				Elements s_pub = doc.select(".goods_pub");
				for(Element element : s_pub) {
					System.out.println(element.text());
				}//for end
				
				
				//출판일
				Elements s_cdate = doc.select(".goods_date");
				for(Element element : s_cdate) {
					System.out.println(element.text());
				}//for end
				
				
				//책소개
				Elements s_des = doc.select(".goods_read");
				for(Element element : s_des) {
					System.out.println(element.text());
				}//for end
				
				
				//가격
				Elements s_price = doc.select(".goods_price > .yes_b");
				for(Element element : s_price) {
					System.out.println(element.text());
				}//for end]
				
				//이미지링크
				Elements s_img = doc.select(".imgBdr img");
				for(Element element : s_img) {
					System.out.println(element.attr("src"));
				}
			
				
			}//for end	
	
		}catch (Exception e) {
					System.out.println("크롤링 실패"+e);
		
		}//end
	
*/	
	
}}
