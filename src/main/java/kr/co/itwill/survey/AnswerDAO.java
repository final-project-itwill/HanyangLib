package kr.co.itwill.survey;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AnswerDAO {

	public AnswerDAO() {
		System.out.println("--------AnswerDAO() 객체가생성됨~");
	}// end
	
	@Autowired
	SqlSession sqlSession;
	
}// class end
