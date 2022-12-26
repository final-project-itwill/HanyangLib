package kr.co.itwill;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itwill.community.CommunityDTO;
import kr.co.itwill.mylib.BookReviewDTO;

@Repository
public class indexDAO {

	@Autowired
	SqlSession sqlSession;
	
	// 커뮤니티 3개 출력
	public List<CommunityDTO> mdComm() throws Exception {
		return sqlSession.selectList("index.mdComm");
	} // getReviewRead() end
	
	// 커뮤니티 3개 출력
	public List<BookReviewDTO> mdReview() throws Exception {
		return sqlSession.selectList("index.mdReview");
	} // getReviewRead() end
	
}
