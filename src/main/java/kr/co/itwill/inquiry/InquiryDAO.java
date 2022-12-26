package kr.co.itwill.inquiry;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class InquiryDAO {

    @Autowired
    SqlSession sqlSession;

    public List<InquiryDTO> list(){
        return sqlSession.selectList("inquiry.list");
    }//list() end

    public int insertInquiry(InquiryDTO ask){
        return sqlSession.insert("inquiry.insertInquiry", ask);
    }//insertInquiry() end

    /*
    * 관리자 페이지 관련 DAO
    * */
    public List<InquiryDTO> listInquiry(){
        return sqlSession.selectList("inquiry.listInquiry");
    }//listInquiry() end

    public int insertResponse(ResponseDTO answer){
        return sqlSession.insert("inquiry.insertResponse", answer);
    }//insertResponse() end

    public List<InquiryDTO> listResponse(){
        return sqlSession.selectList("inquiry.listResponse");
    }//listResponse() end

    public int delete(int ans_no){
        return sqlSession.delete("inquiry.delete", ans_no);
    }//delete() end

    public int update(ResponseDTO response){
        return sqlSession.update("inquiry.update", response);
    }//update() end

}//class end
