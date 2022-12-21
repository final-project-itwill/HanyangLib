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
	
	 public String imgname (String m_id) {
		 return sqlSession.selectOne("member.imagename", m_id);
	 }//imgname end
	 
	 //회원 탈퇴 (회원등급(m_grade)을 탈퇴('F')로  m_grade='F')
	 public int memberwithdraw(String m_id) {
		 return sqlSession.update("member.withdraw", m_id);
	 }//memberWithdraw() end
	 
	 
	 
	 	//회원있는지 여부 확인
		public Integer pwFind_Lookup(MemberDTO member ) {
			return sqlSession.selectOne("pwFind_lookup", member);
		}//pwFind_Lookup() end
		
		//회원 메일 있는지 확인
		public int pwFind_ok(MemberDTO member ) {
			return sqlSession.selectOne("pwFind_ok", member );
		}//pwFind_ok() end
		
		//회원 비밀번호 가져오기
		public MemberDTO pwFind_select(MemberDTO member) {
			return sqlSession.selectOne("pwFind_select", member);
		}//pwFind_select() end
	
	
}//class end