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
//		mav.addObject("title", surveyDAO.svTitle(dsv_code));
//		mav.addObject("choice", surveyDAO.svChoice(dsv_code));
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
		return "redirect:/survey/write";
	}// insert() end
	
	@RequestMapping("/create/{sv_code}")
	public ModelAndView create(@PathVariable String sv_code) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("survey/create");
		mav.addObject("sv_code",sv_code);
	return mav;
	} // create() end
	
	@RequestMapping("/create/insert")
	public String surveyinsert(@RequestBody SurveyDTO survey, ChoiceDTO item, DsurveyDTO question) {
		surveyDAO.surveyWrite(survey);
		surveyDAO.questionWrite(survey);

		return "/surveyprocess";
		
	}// surveyinsert() end
	
	

	public interface SurveyService {
		
	}
	
}// class end
