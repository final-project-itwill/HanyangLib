package kr.co.itwill.mylib;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MylibDAO {

	public MylibDAO() {
		System.out.println("-----MylibDAO() 객체 생성됌");
	} // 
	
	@Autowired
	SqlSession sqlSession;
	
} // class end
