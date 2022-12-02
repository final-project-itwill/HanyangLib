package kr.co.itwill.mylib;

import lombok.Data;

@Data
public class BookReviewDTO {
	private String br_bcode;
	private String br_id;
	private String br_title;
	private int br_star;
	private int br_count;
	private String br_rdate;
	private String b_code;
	private String b_name;
} // class end
