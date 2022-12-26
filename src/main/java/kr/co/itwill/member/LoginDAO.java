package kr.co.itwill.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itwill.mylib.MylibDTO;

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
	
	// 구독 여부 확인
	public String subCheck(String s_id) throws Exception {
		return sqlSession.selectOne("login.subCheck", s_id);
	} // subCheck() end
	
	// 책 보유 여부 확인
	public int haveBook(MylibDTO dto) throws Exception {
		return sqlSession.selectOne("login.haveBook", dto);
	}
	
}
