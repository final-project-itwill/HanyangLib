package kr.co.itwill.survey;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Repository
public class SurveyDAO {
	
	public SurveyDAO() {
		System.out.println("------- ProductDAO() 객체 생성됨 ");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	// 설문지 전체 목록 불러오기
	public List<SurveyDTO> list() {
		return sqlSession.selectList("survey.list");
	}// surveylist() end
	
	// 커뮤니티의 가입신청서 문항 제목 조회
	public List<DsurveyDTO> svTitle(String dsv_code) throws Exception {
		return sqlSession.selectList("survey.title", dsv_code);
	}// detail() end
	
	// 커뮤니티 가입 신청서의 문항별 세부 선택 사항 조회
	public List<ChoiceDTO> svChoice(String dsv_code) throws Exception {
		return sqlSession.selectList("survey.choice", dsv_code);
	}// detail() end
	
	// insert문 실행
	public int insert(AnswerDTO answer) {
		return sqlSession.insert("survey.insert", answer);
	}
	
}// class end
