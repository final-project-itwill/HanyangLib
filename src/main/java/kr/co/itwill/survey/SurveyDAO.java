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
	}// detail2() end	
	
	
	// survey/insert문 실행
	public int insert(AnswerDTO answer) {
		return sqlSession.insert("survey.insert", answer);
	} // insert() end
	// survey/Delete문 실행
	public int delete(String sv_code) {
		return sqlSession.delete("survey.delete",sv_code );
	} // delete() end
	
	// survey/update/read
	public SurveyDTO read(String sv_code) {
		return sqlSession.selectOne("survey.read", sv_code);
	} // read() end
	// survey/update
	public int update(SurveyDTO dto) {
		return sqlSession.update("survey.update", dto);
	} // update() end
	
	
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
