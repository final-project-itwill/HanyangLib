package kr.co.itwill.mylib;

import lombok.Data;

@Data
public class VisitorDTO {
	private int vis_no;
	private String vis_pid;
	private String vis_myid;
	private String vis_content;
	private String vis_rdate;
	
	// 더보기를 위한 변수
	private int limit;
} // class end
