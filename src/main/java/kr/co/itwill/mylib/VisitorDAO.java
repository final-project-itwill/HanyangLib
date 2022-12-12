package kr.co.itwill.mylib;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VisitorDAO {
	
	public VisitorDAO() {
		System.out.println("-----VisitorDAO 객체 생성");
	} // VisitorDAO() end
	
	@Autowired
	SqlSession sqlSession;
	
	public int visitorInsert(VisitorDTO visitor) {
		return sqlSession.insert("visitor.insert", visitor);
	} // commentInsert() end
	
	public List<VisitorDTO> visitorList(VisitorDTO dto) {
		return sqlSession.selectList("visitor.list", dto);
	} // visitorList() end
	
	// 방명록 총 개수
	public int getVsCount(String lib_id) throws Exception {
		int cnt = 0;
		cnt = sqlSession.selectOne("visitor.getVsCount", lib_id);
		return cnt;
	} // get80Count() end
	
	public int visitorUpdate(VisitorDTO visitor) {
		return sqlSession.update("visitor.update", visitor);
	} // commentUpdate() end
	
	public int visitorDelete(int vis_no) throws Exception {
		return sqlSession.delete("visitor.delete", vis_no);
	} // delete() end
	
} // class end