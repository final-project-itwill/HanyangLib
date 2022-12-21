package kr.co.itwill.mylib;

import lombok.Data;

@Data
public class LibinfoDTO {
	
	private String lib_id;
	private String m_id;
	private String m_nick;
	private double m_heat;
	private int m_month;
	private int m_year;
	private String m_img;

} // class end
