package kr.co.itwill.survey;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/survey")
public class SurveyCont {

	public SurveyCont() {
		System.out.println("----SurveyCont() 객체 생성");
	}// end
	
	@Autowired
	SurveyDAO surveyDAO;
	
	@RequestMapping("/survey") 
	public ModelAndView survey() { 
	ModelAndView mav = new ModelAndView();
	mav.setViewName("/survey/survey");
	mav.addObject("list", surveyDAO.list());
	return mav;
	} // home () end
	
	
// 설문지 작성 	
	@RequestMapping("/write/{c_code}")
	public ModelAndView write(@PathVariable String c_code) throws Exception {
		
		String dsv_code = surveyDAO.scodeget(c_code);
		//System.out.println(dsv_code);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/survey/write");
		mav.addObject("title", surveyDAO.svTitle(dsv_code));
		mav.addObject("count", surveyDAO.svCount(dsv_code));
		mav.addObject("choice", surveyDAO.svChoice(dsv_code));
		mav.addObject("dsv_code", dsv_code);
		mav.addObject("c_code", c_code);
		
		return mav;
	}// write() end
	
	
	@RequestMapping(value = "/write/answer", method = RequestMethod.POST)
	@ResponseBody
	private String insert(@RequestBody AnswerDTO dto) throws Exception {
		AnswerDTO answer = new AnswerDTO();
		answer.setAns_code(dto.getAns_code());	// 설문지 코드 글 번호
		answer.setAns_order(dto.getAns_order());		// 순서 코드(ex: od01)
		answer.setAns_anscode(dto.getAns_anscode());		// 답변 코드(ex: g01)
		answer.setAns_id(dto.getAns_id());	// 지금은 임의 배정
		answer.setAns_content(dto.getAns_content());
		surveyDAO.insert(answer);
		//System.out.println(answer.toString());
		return "생성되었습니다.";
			//	"redirect:/survey/answer/"+dto.getAns_code();
	}// insert() end
	
	
// 답변 학인하기	
	@RequestMapping("/answer/{dsv_code}/{s_id}")
	public ModelAndView answer(@PathVariable("dsv_code") String dsv_code,
								@PathVariable("s_id") String s_id) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/survey/answer");
		mav.addObject("title", surveyDAO.svTitle(dsv_code));
		mav.addObject("count", surveyDAO.svCount(dsv_code));
		mav.addObject("choice", surveyDAO.svChoice(dsv_code));
		AnswerDTO ans = new AnswerDTO();
		ans.setAns_code(dsv_code);
		ans.setAns_id(s_id);
		mav.addObject("answer", surveyDAO.svanswer(ans));
		
		return mav;
	} // answer() end
	
	
// 설문지 생성 	
	@RequestMapping("/create/{c_code}/{s_id}")
	public ModelAndView create(@PathVariable("s_id") String s_id,
								@PathVariable("c_code") String c_code) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("survey/create");
		// 템플릿 가져오기.
		mav.addObject("tpl", surveyDAO.tpl());
		mav.addObject("tplread", surveyDAO.tplread());
		mav.addObject("s_id", s_id);
		mav.addObject("c_code", c_code);
//		System.out.println(surveyDAO.tplread());
//		System.out.println(surveyDAO.tpl());
	return mav;
	} // create() end
	
	@RequestMapping(value = "/create/insert", method = RequestMethod.POST)
	public String surveyinsert(@RequestBody SurveyDTO dto , HttpServletRequest req) throws Exception {
		SurveyDTO survey = new SurveyDTO();
		survey.setSv_code(dto.getSv_code());
		survey.setSv_comcode(dto.getSv_comcode());
		survey.setSv_id(dto.getSv_id());	
		survey.setSv_title(dto.getSv_title());
		survey.setSv_des(dto.getSv_des());
		survey.setSv_max(dto.getSv_max());
		survey.setSv_edate(dto.getSv_edate());
		
		surveyDAO.surveyWrite(survey); 
		System.out.println(survey.toString());
		return "survey";
		
	}// surveyinsert() end
	
	@RequestMapping(value = "/create/dinsert", method = RequestMethod.POST)
	public String dsurveyinsert(@RequestBody DsurveyDTO dto)	throws Exception {
		
		DsurveyDTO dsurvey = new DsurveyDTO();
		dsurvey.setDsv_code(dto.getDsv_code());
		dsurvey.setDsv_subject(dto.getDsv_subject());
		dsurvey.setDsv_order(dto.getDsv_order());
		dsurvey.setDsv_type(dto.getDsv_type());
		
		surveyDAO.questionWrite(dsurvey);
		System.out.println(dsurvey.toString());
		return "dsurvey";
		
	}// dsurveyinsert() end
	
	@RequestMapping(value = "/create/cinsert", method = RequestMethod.POST)
	public String csurveyinsert(@RequestBody ChoiceDTO dto)	throws Exception {
		
		ChoiceDTO choice = new ChoiceDTO();
		choice.setCh_code(dto.getCh_code());
		choice.setCh_order(dto.getCh_order());
		choice.setCh_type(dto.getCh_type());
		choice.setCh_anscode(dto.getCh_anscode());
		choice.setCh_content(dto.getCh_content());
		
		surveyDAO.items(choice);
		System.out.println(choice.toString());
		return "choice";
		
	}// dsurveyinsert() end

// survey Update	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView update( String c_code) throws Exception {
		ModelAndView mav = new ModelAndView();
		String dsv_code = surveyDAO.scodeget(c_code);
		 System.out.println(dsv_code);
		mav.setViewName("/survey/update");
		// 안되는 이유가 뭙까??
		//mav.addObject("read", surveyDAO.read(dsv_code));
		mav.addObject("title", surveyDAO.svTitle(dsv_code));
		mav.addObject("count", surveyDAO.svCount(dsv_code));
		mav.addObject("choice", surveyDAO.svChoice(dsv_code));
		mav.addObject("dsv_code", dsv_code);
		mav.addObject("c_code", c_code);
		
		return mav;
	}// write() end	
	
	
	
// survey Delete
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public ModelAndView deleteForm(String c_code) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("survey/deleteForm");
		mav.addObject("c_code", c_code);
		return mav;
	} // deleteForm() end
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public ModelAndView deleteProc(String c_code) {
		ModelAndView mav = new ModelAndView();
		String sv_code = surveyDAO.scodeget(c_code);
		surveyDAO.delete(sv_code);
		mav.setViewName("redirect:/comm/admin/"+c_code);
		return mav;		
	} // deleteProc() end
	
	
// survey update
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public ModelAndView updateForm(String sv_code) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("survey/updateForm");
		mav.addObject("read", surveyDAO.read(sv_code));
		return mav;		
	} // updateForm() end
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public ModelAndView updateProc(@ModelAttribute SurveyDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/survey/survey");
		surveyDAO.update(dto);
		return mav;
	} // updateProc() end
	
	
	// 경환 작업 따로 기록
	// 설문지 생성페이지로 연결하는 컨트롤러
	@RequestMapping("/formCreate/{s_id}")
	public ModelAndView formCreate(@PathVariable String s_id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("survey/createForm");
	return mav;
	} // formCreate() end
	
  
	// 설문지를 생성시키는 컨트롤러
	@RequestMapping("/createProc")
	public ModelAndView createProc() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}	
  
  //	choice delete	
	@RequestMapping(value = "/answer/chdelete.do", method = RequestMethod.GET)
	public ModelAndView chdeleteForm(String ans_code) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("survey/chdeleteForm");
		mav.addObject("ans_code", ans_code);
		return mav;
	} // deleteForm() end
	
	@RequestMapping(value = "/answer/chdelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String chdeleteProc(@ModelAttribute AnswerDTO dto) throws Exception {
		
		AnswerDTO ans = new AnswerDTO();
		ans.setAns_code(dto.getAns_code());
		ans.setAns_id(dto.getAns_id());
		System.out.println(ans);
		
		surveyDAO.ansdelete(ans);
		
		return "redirect:/survey/survey";		
	} // deleteProc() end	
	
	
	
}// class end
