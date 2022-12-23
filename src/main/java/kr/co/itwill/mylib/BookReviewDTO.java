package kr.co.itwill.mylib;

import lombok.Data;

@Data
public class BookReviewDTO {
	private int br_no;
	private String br_bcode;
	private String br_id;
	private String br_title;
	private String br_content;
	private int br_star;
	private int br_count;
	private String br_rdate;
	private String b_code;
	private String b_name;
	private String b_bookcover;
	
	//페이징
	private int startRow;
	private int endRow;
	
} // class end
