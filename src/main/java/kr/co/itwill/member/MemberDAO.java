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
	
	
	public List<Map<String, Object>>  emailCheck(String m_email){
		return sqlSession.selectList("member.emailCheck",m_email);
	}// emailCheck() end
	
	public List<Map<String, Object>> idcheck(String m_id){
		return sqlSession.selectList("member.idcheck",m_id);
	}//idcheck() end
	
	
}//class end
