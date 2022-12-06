package kr.co.itwill.survey;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class SurveyDAO {
	
	public SurveyDAO() {
		System.out.println("------- ProductDAO() 객체 생성됨 ");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public List<Map<String, Object>> list() {
		return sqlSession.selectList("survey.list");
	}// surveylist() end
	
	public List<Map<String,  Object>> detail(String sv_code) {
		return sqlSession.selectList("survey.detail", sv_code);
	}// detail() end
	
	public List<Map<String,  Object>> details(String sv_code) {
		return sqlSession.selectList("survey.details", sv_code);
	}// detail2() end	
	public int insert(AnswerDTO answer) {
		return sqlSession.insert("survey.insert", answer);
	}
	
}// class end
