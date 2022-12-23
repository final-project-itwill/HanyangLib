package kr.co.itwill.mylib;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BrcommentDAO {
	
	public BrcommentDAO() {
		System.out.println("-----VisitorDAO 객체 생성");
	} // VisitorDAO() end
	
	@Autowired
	SqlSession sqlSession;
	
	public int cmInsert(BrcommentDTO comment) {
		return sqlSession.insert("comment.insert", comment);
	} // commentInsert() end
	
	public List<BrcommentDTO> commentList(BrcommentDTO dto) {
		return sqlSession.selectList("comment.list", dto);
	} // visitorList() end
	
	// 방명록 총 개수
	public int getCmCount(int brc_pno) throws Exception {
		int cnt = 0;
		cnt = sqlSession.selectOne("comment.getCmCount", brc_pno);
		return cnt;
	} // get80Count() end
	
	public int cmUpdate(BrcommentDTO comment) {
		return sqlSession.update("comment.update", comment);
	} // commentUpdate() end
	
	public int cmDelete(int vis_no) throws Exception {
		return sqlSession.delete("comment.delete", vis_no);
	} // delete() end
	
} // class end