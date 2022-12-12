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
	
	public List<SurveyDTO> list() {
		return sqlSession.selectList("survey.list");
	}// surveylist() end
	
	public List<DsurveyDTO> detail(String sv_code) {
		return sqlSession.selectList("survey.detail", sv_code);
	}// detail() end
	
	public List<ChoiceDTO> details(String sv_code) {
		return sqlSession.selectList("survey.details", sv_code);
	}// detail2() end	
	
	public int insert(AnswerDTO answer) {
		return sqlSession.insert("survey.insert", answer);
	}
	

	public int surveyWrite(SurveyDTO survey) {
		return sqlSession.insert("survey.surveyWrite", survey);
	}// choiceinsert() end
	
	public int questionWrite(SurveyDTO survey) {
		return sqlSession.insert("survey.questionWrite", survey);
	}// choiceinsert() end
	
	public int items(DsurveyDTO question) {
		return sqlSession.insert("survey.items", question);
	} // items() end
	
}// class end
