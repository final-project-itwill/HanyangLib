package kr.co.itwill.survey;

import java.io.File;
import java.util.ArrayList;
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
		
//		String dsv_code = (String)surveyDAO.scodeget(c_code);
//		System.out.println(dsv_code);
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
		mav.addObject("count", surveyDAO.svCount(dsv_code));
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
	public String surveyinsert(@RequestBody SurveyDTO dto, HttpServletRequest req) throws Exception {
		SurveyDTO survey = new SurveyDTO();
		survey.setSv_code(dto.getSv_code());
		survey.setSv_id(dto.getSv_id());	// 지금은 임의 배정
		survey.setSv_title(dto.getSv_title());
		survey.setSv_des(dto.getSv_des());
		survey.setSv_max(dto.getSv_max());
		survey.setSv_edate(dto.getSv_edate());
		
		surveyDAO.surveyWrite(survey); 
		System.out.println(survey.toString());
		return "redirect:/survey/survey";
		
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
		return "redirect:/survey/survey";
		
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
		return "redirect:/survey/survey";
		
	}// dsurveyinsert() end
	
	
		
//		String[] question = req.getParameterValues("q_title");
//		
//		List<DsurveyDTO> dsy = new ArrayList<>();
//		
//		for(int i=0; i<question.length; i++) {
//			DsurveyDTO dsurvey = new DsurveyDTO();
//			System.out.println(question[i]);
//		}
//		 
		
		

	
	
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
