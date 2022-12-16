package kr.co.itwill.community;

import lombok.Data;

@Data
public class AdminMemberDTO {
    private int s_no;
    private String s_code;
    private String s_id;
    private String s_nick;
    private String s_state;
    private String s_surveycode;
    private String s_rdate;
    private String c_bcode;
    private String lib_bcode;
    private int lib_proc;
}//class end
