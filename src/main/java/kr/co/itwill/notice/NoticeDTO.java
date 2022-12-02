package kr.co.itwill.notice;

import lombok.Data;

@Data
public class NoticeDTO {
    //field
    private int n_no;
    private String n_type;
    private String n_title;
    private String n_content;
    private String n_rdate;
    private String n_writer;

}//class end
