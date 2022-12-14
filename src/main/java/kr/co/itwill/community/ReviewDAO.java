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


    public int insertReview(ReviewDTO dto){
        return sqlSession.insert("review.insert", dto);
    }//insertReview() end


    public List<ReviewDTO> listReview(ReviewDTO dto){
        return sqlSession.selectList("review.list", dto);
    }//listReview() end


    public int deleteReview(int ac_no) throws Exception{
        return sqlSession.delete("review.delete", ac_no);
    }//deleteActivity() end


    public int updateReview(ReviewDTO dto){
        return sqlSession.update("review.update", dto);
    }//openActivityUpdatePanel() end

    public int countReviewByID(ReviewDTO review){
        int cnt = sqlSession.selectOne("review.reviewByID", review);
        return cnt;
    }//countReviewByID() end

}//class end
