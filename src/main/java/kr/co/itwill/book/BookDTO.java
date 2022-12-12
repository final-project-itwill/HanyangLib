package kr.co.itwill.book;

import lombok.Data;

@Data
public class BookDTO {
    private String b_code;
    private String b_name;
    private String b_type;
    private String b_gudok;
    private String b_author;
    private String b_publish;
    private int b_page;
    private int b_price;
    private String b_cdate;
    private String b_rdate;
    private String b_bookcover;
    private int b_coversize;
    private String b_des;

}