package kr.co.itwill.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDAO {
	
	public MemberDAO() {
		System.out.println("-----MemberDAO() 객체 생성됨");
	}//MemberDAO() end
	
	@Autowired 
	SqlSession sqlSession;
	
	public int memberinsert(MemberDTO member) {
		return sqlSession.insert("member.memberinsert", member);
	}//memberinsert() end
	
	public MemberDTO detail(String m_id) {
		return sqlSession.selectOne("member.memberdetail", m_id);
	}//detail() end
	
	
	public int memberupdate(MemberDTO member) {
		return sqlSession.update("member.memberupdate", member);
	}//memberupdate() end
	
	
	
	
}//class end
