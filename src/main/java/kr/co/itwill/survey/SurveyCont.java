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
		mav.addObject("choice", surveyDAO.svChoice(dsv_code));
		mav.addObject("dsv_code", dsv_code);
		return mav;
	}// write() end
	
	@ResponseBody
	@RequestMapping(value = "/answer", method = RequestMethod.POST)
	private String insert(@PathVariable String dsv_code) {
		AnswerDTO answer = new AnswerDTO();
		answer.setAns_code(dsv_code);	// 설문지 코드 글 번호
		answer.setAns_dsvno(1);			// 질문 번호(부모 글번호)
		answer.setAns_order("od01");		// 순서 코드(ex: od01)
		answer.setAns_anscode("g03");		// 답변 코드(ex: g01)
		answer.setAns_id("mimimi05");	// 지금은 임의 배정
		answer.setAns_content("");
		surveyDAO.insert(answer);		
		return "redirect:/survey/survey";
	}// insert() end
	
	
	@RequestMapping("/create/{dsv_code}")
	public ModelAndView create(@PathVariable String dsv_code) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("survey/create");
		mav.addObject("dsv_code",dsv_code);
	return mav;
	} // create() end
	
//	설문지 survey 생성, dsurvey choice 생성해야함..
	@RequestMapping(value = "/create/insert", method = RequestMethod.POST)
	public String surveyinsert(@RequestBody SurveyDTO dto, DsurveyDTO sdto) throws Exception {
		SurveyDTO survey = new SurveyDTO();
		survey.setSv_code(dto.getSv_code());
		survey.setSv_comcode("com002"); // 커뮤니티 코드 받아오기.
		survey.setSv_id("mimimi05");	// 지금은 임의 배정
		survey.setSv_title(dto.getSv_title());
		survey.setSv_des(dto.getSv_des());
		
		surveyDAO.surveyWrite(survey); 
		
		return "/survey/survey";
		
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
	
	
	
	
}// class end
