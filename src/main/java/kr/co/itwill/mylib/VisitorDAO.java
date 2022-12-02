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
	
	public List<VisitorDTO> visitorList(String vis_pid) {
		return sqlSession.selectList("comment.list", vis_pid);
	} // commentList() end
	
	public int commentUpdate(VisitorDTO comment) {
		return sqlSession.update("comment.update", comment);
	} // commentUpdate() end
	
	public int commentDelete(int cno) throws Exception {
		return sqlSession.delete("comment.delete", cno);
	} // delete() end
	
} // class end
