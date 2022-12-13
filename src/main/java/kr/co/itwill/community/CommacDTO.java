package kr.co.itwill.community;

import lombok.Data;

@Data
public class CommacDTO {

    private int ac_no;
    private String ac_id;
    private String ac_ccode;
    private String ac_cname;
    private int ac_manjok;
    private String ac_review;
    private String ac_rdate;

    private int limit;

}//class end
