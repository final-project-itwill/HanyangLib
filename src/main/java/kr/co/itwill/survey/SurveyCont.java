package kr.co.itwill.survey;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

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
	
	
	
	@RequestMapping("/write/{dsv_code}")
	public ModelAndView write(@PathVariable String dsv_code) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/survey/write");
		mav.addObject("title", surveyDAO.svTitle(dsv_code));
		mav.addObject("count", surveyDAO.svCount(dsv_code));
		mav.addObject("choice", surveyDAO.svChoice(dsv_code));
		mav.addObject("dsv_code", dsv_code);
		return mav;
	}// write() end
	
	
	@RequestMapping(value = "/write/answer", method = RequestMethod.POST)
	@ResponseBody
	private String insert(@RequestBody AnswerDTO dto) throws Exception {
		AnswerDTO answer = new AnswerDTO();
		answer.setAns_code(dto.getAns_code());	// 설문지 코드 글 번호
		//answer.setAns_dsvno(1);			// 질문 번호(부모 글번호)
		answer.setAns_order(dto.getAns_order());		// 순서 코드(ex: od01)
		answer.setAns_anscode(dto.getAns_anscode());		// 답변 코드(ex: g01)
		answer.setAns_id(dto.getAns_id());	// 지금은 임의 배정
		answer.setAns_content(dto.getAns_content());
		surveyDAO.insert(answer);
		System.out.println(answer.toString());
		return "redirect:/survey/answer/"+dto.getAns_code();
	}// insert() end
	
	@RequestMapping("/answer/{dsv_code}/{s_id}")
	public ModelAndView answer(@PathVariable("dsv_code") String dsv_code,
								@PathVariable("s_id") String s_id) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/survey/answer");
		mav.addObject("title", surveyDAO.svTitle(dsv_code));
		//mav.addObject("count", surveyDAO.svCount(dsv_code));
		mav.addObject("choice", surveyDAO.svChoice(dsv_code));
		AnswerDTO ans = new AnswerDTO();
		ans.setAns_code(dsv_code);
		ans.setAns_id(s_id);
		mav.addObject("answer", surveyDAO.svanswer(ans));
		
		return mav;
	} // answer() end
	
	
	@RequestMapping("/create/{s_id}")
	public ModelAndView create(@PathVariable String s_id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("survey/create");
	return mav;
	} // create() end
	
//	설문지 survey 생성, dsurvey choice 생성해야함..
	@RequestMapping(value = "/create/insert", method = RequestMethod.POST)
	public String surveyinsert(@RequestBody SurveyDTO dto, DsurveyDTO sdto) throws Exception {
		SurveyDTO survey = new SurveyDTO();
		survey.setSv_code(dto.getSv_code());
		survey.setSv_comcode("com002"); // 커뮤니티 코드 받아오기.
		survey.setSv_id(dto.getSv_id());	// 지금은 임의 배정
		survey.setSv_title(dto.getSv_title());
		survey.setSv_des(dto.getSv_des());
		
		surveyDAO.surveyWrite(survey); 
		System.out.println(survey.toString());
		
		DsurveyDTO dsurvey = new DsurveyDTO();
		
		
		return "redirect:/survey/survey";
		
	}// surveyinsert() end
	
	
	
// survey delete
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public ModelAndView deleteForm(String sv_code) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("survey/deleteForm");
		mav.addObject("sv_code", sv_code);
		return mav;
	} // deleteForm() end
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public ModelAndView deleteProc(String sv_code) {
		ModelAndView mav = new ModelAndView();
		surveyDAO.delete(sv_code);
		mav.setViewName("redirect:/survey/survey");
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
	@RequestMapping("/formCreate/{sv_code}")
	public ModelAndView formCreate(@PathVariable String sv_code) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("survey/createForm");
		mav.addObject("sv_code",sv_code);
	return mav;
	} // formCreate() end
	
  
	// 설문지를 생성시키는 컨트롤러
	@RequestMapping("/createProc")
	public ModelAndView createProc() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}	
  
  //	choice delete	
	@RequestMapping(value = "/answer/{dsv_code}/delete.do", method = RequestMethod.GET)
	public ModelAndView chdeleteForm(String dsv_code) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("survey/chdeleteForm");
		mav.addObject("dsv_code", dsv_code);
		return mav;
	} // deleteForm() end
	
	@RequestMapping(value = "/answer/{dsv_code}/{s_id}/delete.do", method = RequestMethod.POST)
	public ModelAndView chdeleteProc(@PathVariable("dsv_code") String dsv_code
									,@PathVariable("s_id") String s_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		AnswerDTO ans = new AnswerDTO();
		ans.setAns_code(dsv_code);
		ans.setAns_id(s_id);
		mav.addObject("ansdelete", surveyDAO.ansdelete(ans));
		System.out.println(ans);
		mav.setViewName("redirect:/survey/survey");
		return mav;		
	} // deleteProc() end	
	
	
	
}// class end
