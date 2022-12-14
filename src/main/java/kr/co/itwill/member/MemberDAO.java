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
	
	//회원가입
	public int memberinsert(MemberDTO member) {
		return sqlSession.insert("member.memberinsert", member);
	}//memberinsert() end
	
	//가입했을때 입력했던 정보들 불러오기
	public MemberDTO detail(String s_id) {
		return sqlSession.selectOne("member.detail", s_id);
	}//detail() end

	
	//회원폼에서 수정
	 public int memberupdate(MemberDTO member) { 
		 //System.out.println("dao에서----" + member.toString());
		 return sqlSession.update("member.update", member);
	 }//memberupdate() end
	
	 
	 //회원 탈퇴 (회원등급(m_grade)을 탈퇴('F')로  m_grade='F')
	 public int memberwithdraw(String m_id) {
		 return sqlSession.update("member.withdraw", m_id);
	 }//memberWithdraw() end
	 
	 
	
	
}//class end