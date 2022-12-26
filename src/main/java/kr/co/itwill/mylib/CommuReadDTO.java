package kr.co.itwill.mylib;

import lombok.Data;

@Data
public class CommuReadDTO {
	private String c_code;
	private String c_name;
	private String c_state;
	private String c_banner;
	private String ac_ccode;
	private int ac_manjok;
	private String ac_review;
	private String ac_id;
	private String ac_rdate;
}
