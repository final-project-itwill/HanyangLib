package kr.co.itwill.community;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class CommunityDTO {
    private String c_code;
    private String c_name;
    private String c_des;
    private String c_bcode;
    private String c_local;
    private String c_id;
    private String c_chat;
    private String c_banner;
    private int c_count;
    private String c_state;
    private String c_rdate;
    private String c_pick;
    private String c_svcode;

    private MultipartFile poster;

}//class end
