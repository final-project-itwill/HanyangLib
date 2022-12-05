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
		return sqlSession.selectList("visitor.list", vis_pid);
	} // commentList() end
	
	public int visitorUpdate(VisitorDTO visitor) {
		return sqlSession.update("visitor.update", visitor);
	} // commentUpdate() end
	
	public int visitorDelete(int vis_no) throws Exception {
		return sqlSession.delete("visitor.delete", vis_no);
	} // delete() end
	
} // class end
