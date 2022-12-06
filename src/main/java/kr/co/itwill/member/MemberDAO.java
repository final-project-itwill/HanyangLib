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
	
	public void insert(Map<String, Object> map) {
		sqlSession.insert("member.insert", map);
	}//insert() end
	
	public List<Map<String, Object>>  duplecateEmail(String email){
		return sqlSession.selectList("member.select",email);
	}//select() end
	
	
}//class end
