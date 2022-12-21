package kr.co.itwill.survey;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itwill.community.CommSignDTO;



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
	
	
	public String scodeget(String c_code) {
		return sqlSession.selectOne("survey.svcode", c_code);
	} // scodeget() end
	
	// 커뮤니티의 가입신청서 문항 제목 조회
	public List<DsurveyDTO> svTitle(String dsv_code) throws Exception {
		return sqlSession.selectList("survey.title", dsv_code);
	}// detail() end
	
	// 커뮤니티 count 가져오기
	public int svCount(String dsv_code) throws Exception {
		return sqlSession.selectOne("survey.count", dsv_code);
	}// svCount() end
	
	// 커뮤니티 가입 신청서의 문항별 세부 선택 사항 조회
	public List<ChoiceDTO> svChoice(String dsv_code) throws Exception {
		return sqlSession.selectList("survey.choice", dsv_code);
	}// detail2() end	
	
	public List<AnswerDTO> svanswer(AnswerDTO ans) throws Exception {
		return sqlSession.selectList("survey.answer", ans);
	} // svanswer() end
	
	public List<tempDTO> tpl() throws Exception {
		return sqlSession.selectList("survey.tpl");
	}// tpl() end
	
	public List<templetDTO> tplread(String tem_code) throws Exception {
		return sqlSession.selectList("survey.tplread", tem_code);
	} // tlpread() END
	
	
	// Answer Delete문 실
	public int ansdelete(AnswerDTO ans) {
		return sqlSession.delete("survey.ansdelete",ans );
	} // answer delete() end	
	
	
	// survey/insert문 실행
	public int insert(AnswerDTO answer) {
		return sqlSession.insert("survey.insert", answer);
	} // insert() end
	
	// 회원정보 nickname 가져오기
	public String getnick(String m_id) throws Exception {
		return sqlSession.selectOne("survey.getnick", m_id);
	}// svCount() end
	
	public int comsign(CommSignDTO comsign) {
		return sqlSession.insert("survey.comsign", comsign);
	}
	
	// survey/Delete문 실행
	public int delete(String sv_code) {
		return sqlSession.delete("survey.delete",sv_code );
	} // delete() end
	
	// survey/update/read
	public SurveyDTO sread(String sv_code) {
		return sqlSession.selectOne("survey.sread", sv_code);
	} // read() end
	// survey/update
	public int update(SurveyDTO dto) {
		return sqlSession.update("survey.update", dto);
	} // update() end
	
//	설문지작성 
	
	public int surveyWrite(SurveyDTO survey) { 
		return sqlSession.insert("survey.surveyWrite", survey);
	}// choiceinsert() end
	
	public int questionWrite(DsurveyDTO dsurvey) {
		return sqlSession.insert("survey.questionWrite", dsurvey);
	}// choiceinsert() end
	
	public int items(ChoiceDTO choice) {
		return sqlSession.insert("survey.items", choice);
	} // items() end

//	설문지 수정

	public int updelete(SurveyDTO survey) {
		return sqlSession.delete("survey.updelete",survey);
	} // updelete() end 

	
}// class end
