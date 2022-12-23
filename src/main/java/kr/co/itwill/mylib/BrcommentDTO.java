package kr.co.itwill.mylib;

import lombok.Data;

@Data
public class BrcommentDTO {
	private int brc_no;
	private int brc_pno;
	private String brc_id;
	private String brc_content;
	private String brc_rdate;
	// 더보기를 위한 변수
	private int limit;	
}
