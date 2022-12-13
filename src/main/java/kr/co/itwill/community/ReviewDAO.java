package kr.co.itwill.community;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReviewDAO {
    public ReviewDAO(){
        System.out.println("-----ReviewDAO() 객체 생성됨");
    }//end

    @Autowired
    SqlSession sqlSession;


    public int InsertIntoCommunityActivity(ReviewDTO dto){
        return sqlSession.insert("review.insert", dto);
    }//InsertIntoCommunityActivity() end


    public List<ReviewDTO> listActivity(String ac_ccode){
        return sqlSession.selectList("review.list", ac_ccode);
    }//listActivity() end


    public int deleteActivity(int ac_no) throws Exception{
        return sqlSession.delete("review.delete", ac_no);
    }//deleteActivity() end


    public int updateActivity(ReviewDTO dto){
        return sqlSession.update("review.update", dto);
    }//openActivityUpdatePanel() end

}//class end
