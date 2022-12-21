package kr.co.itwill.community;

import lombok.Data;

@Data
public class CommSignDTO {
    private int s_no;
    private String s_code;
    private String s_id;
    private String s_nick;
    private String s_state;
    private String s_surveycode;
    private String s_rdate;

    //member 테이블 join
    private String m_id;
    private String m_nick;
    private String m_img;

}//class end
