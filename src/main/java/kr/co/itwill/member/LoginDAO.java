package kr.co.itwill.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO {

	public LoginDAO() {
		System.out.println("-----LoginDAO() 객체 생성됌");
	} // LoginDAO() end
	
	@Autowired
	SqlSession sqlSession;
	
	// 로그인
	public String loginProc(LoginDTO dto) throws Exception {
		return sqlSession.selectOne("login.loginCheck", dto);
	} // loginProc() end
	
}
