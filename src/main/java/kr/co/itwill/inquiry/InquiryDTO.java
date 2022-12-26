package kr.co.itwill.inquiry;

import lombok.Data;

@Data
public class InquiryDTO {

    private int ask_no;
    private String ask_type;
    private String ask_id;
    private String ask_title;
    private String ask_content;
    private String ask_rdate;

    //response 관련 칼럼
    private int ans_no;
    private String ans_content;

}//class end
