package kr.co.itwill.survey;

import lombok.Data;

@Data
public class SurveyDTO {
	private String sv_code;
	private String sv_comcode;
	private String sv_id;
	private String sv_title;
	private String sv_des;
	private String sv_rdate;
	private String sv_edate;
	private int sv_max;
	private String sv_status;

} // class end
