package kr.co.itwill.mylib;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MylibDAO {

	public MylibDAO() {
		System.out.println("-----MylibDAO() 객체 생성됌");
	} // 
	
	@Autowired
	SqlSession sqlSession;
	
	// 보유한 책 권 수 출력
	public int getCount(String lib_id) throws Exception {
		int cnt = 0;
		cnt = sqlSession.selectOne("mylib.getCount", lib_id);
		return cnt;
	} // count() end
	
	// 진행도 80% 이상 책 권수 출력
	public int get80Count(String lib_id) throws Exception {
		int cnt = 0;
		cnt = sqlSession.selectOne("mylib.get80Count", lib_id);
		return cnt;
	} // get80Count() end
	
	// 유저 정보 가져오기(닉네임, 온도)
	public List<LibinfoDTO> getLibInfo(String lib_id) throws Exception {
		return sqlSession.selectList("mylib.libInfoRead", lib_id);
	} // getLibInfo() end
	
	// 도서 정보 가져오기(도서 이름, 도서 커버 이름, 진행률)
	public List<LibReadDTO> getLibRead(String lib_id) throws Exception {
		return sqlSession.selectList("mylib.libRead", lib_id);
	} // getLibRead() end
	
	// 나만의 서재에 책 추가하기
	public int getBook() throws Exception {
		int cnt = 0;
		cnt = sqlSession.insert("mylib.getBook");
		return cnt;
	} // getBook() end
	
	// 나만의 서재의 커뮤니티 목록 조회
	public List<CommuReadDTO> getCommuRead(String lib_id) throws Exception {
		return sqlSession.selectList("mylib.commuRead", lib_id);
	} // getCommuRead() end
	
	// 나만의 서재의 서평 목록 조회
	public List<BookReviewDTO> getReviewList(String lib_id) throws Exception {
		return sqlSession.selectList("mylib.rvList", lib_id);
	} // getReviewRead() end
	
	// 서평 상세보기
	public List<BookReviewDTO> getReviewRead(int br_no) throws Exception {
		return sqlSession.selectList("mylib.rvRead", br_no);
	} // getReviewRead() end
	
	// 서평 insert
	public int insertRv(BookReviewDTO dto) throws Exception {
		return sqlSession.insert("mylib.rvInsert", dto);
	} // insertRv() end
	
} // class end
