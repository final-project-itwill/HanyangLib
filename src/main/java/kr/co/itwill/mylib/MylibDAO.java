package kr.co.itwill.mylib;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itwill.member.MemberDTO;
import kr.co.itwill.notice.NoticeDTO;

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
	
	// 도서 정보 3권 가져오기(도서 이름, 도서 커버 이름, 진행률)
	public List<LibReadDTO> getLibThree(String lib_id) throws Exception {
		return sqlSession.selectList("mylib.libThree", lib_id);
	} // getLibRead() end
	
	// 도서 정보 전체 가져오기(도서 이름, 도서 커버 이름, 진행률)
	public List<LibReadDTO> getLibRead(String lib_id) throws Exception {
		return sqlSession.selectList("mylib.libRead", lib_id);
	} // getLibRead() end
	
	// 나만의 서재에 책 추가하기
	public int getBook(MylibDTO dto) throws Exception {
		return sqlSession.insert("mylib.getBook", dto);
	} // getBook() end
	
	// 나만의 서재의 커뮤니티 목록 조회
	public List<CommuReadDTO> getCommuRead(String lib_id) throws Exception {
		return sqlSession.selectList("mylib.commuRead", lib_id);
	} // getCommuRead() end
	
	// 나만의 서재의 서평 목록 조회
	public List<BookReviewDTO> getReviewList(String lib_id) throws Exception {
		return sqlSession.selectList("mylib.rvList", lib_id);
	} // getReviewRead() end
	
	// 나만의 서재의 서평 목록 조회(페이징)
	public List<BookReviewDTO> getReviewList2(BookReviewDTO dto) throws Exception {
		return sqlSession.selectList("mylib.rvList2", dto);
	} // getReviewRead() end
	
	// 서평 총 개수
	public int rvTotal(String br_id) throws Exception {
		int cnt = 0;
		cnt = sqlSession.selectOne("mylib.rvTotal", br_id);
		return cnt;
	} // count() end
	
	// 나만의 서재의 서평 목록 5개만 조회
	public List<BookReviewDTO> getReviewList5(String lib_id) throws Exception {
		return sqlSession.selectList("mylib.rvList5", lib_id);
	} // getReviewRead() end
	
	// 서평 상세보기
	public BookReviewDTO getReviewRead(int br_no) throws Exception {
		return sqlSession.selectOne("mylib.rvRead", br_no);
	} // getReviewRead() end
	
	// 서평 insert
	public int insertRv(BookReviewDTO dto) throws Exception {
		return sqlSession.insert("mylib.rvInsert", dto);
	} // insertRv() end
	
	// 서평 Delete
    public void delete(int br_no){
        sqlSession.delete("mylib.rvDelete", br_no);
    }//delete() end

    // 서평 Update
    public int update(BookReviewDTO review){
        return sqlSession.update("mylib.rvUpdate", review);
    }//update() end

	//eBookRead에 진행률 가져오기
	public MylibDTO readMylib(MylibDTO dto){
		return sqlSession.selectOne("mylib.readMylib", dto);
	}//ebookProc() end

	public int updateProc(MylibDTO dto){
		return sqlSession.update("mylib.updateProc", dto);
	}//updateProc() end
	
	// 서평 조회수 증가
	public int rvCount(int br_no) {
		return sqlSession.update("mylib.rvCount", br_no);
	}
	
	// 월간, 연간 목표 정하기
	public int setGoal(MemberDTO dto) {
		return sqlSession.update("mylib.setGoal", dto);
	}

} // class end
