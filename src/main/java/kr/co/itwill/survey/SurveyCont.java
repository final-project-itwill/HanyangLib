
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
	
	@RequestMapping("/write/{sv_code}")
	public ModelAndView write(@PathVariable String sv_code) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/survey/write");
		mav.addObject("detail", surveyDAO.detail(sv_code));
		mav.addObject("details", surveyDAO.details(sv_code));
		return mav;
	}// write() end
	
	@RequestMapping(value = "/write/{sv_code}", method = RequestMethod.POST)
	public String insert(@ModelAttribute AnswerDTO dto) {
		AnswerDTO answer = new AnswerDTO();
		answer.setAns_anscode(dto.getAns_anscode());
		answer.setAns_code(dto.getAns_code());
		answer.setAns_content(dto.getAns_content());
		answer.setAns_dsvno(dto.getAns_dsvno());
		answer.setAns_order(dto.getAns_order());
		answer.setAns_id("mimimi05"); // 나중에 session변수를
		
		surveyDAO.insert(answer);
		
		return "redirect:/survey/write";
	}// insert() end
	
//	
//	@RequestMapping("/answer")
//	public String insert(@RequestParam Map<String, Object> map) {
//		surveyDAO.insert(map);
//		return "redirect:/survey/answer";
//	}// insert() end
//	
	
	

	@RequestMapping("/create")
	public String create() {
	return "/survey/create";
	} // create() end
	
	@ResponseBody
	@RequestMapping(value= "test", method = RequestMethod.GET)
	public String test() {
		return " testest :testest";
	}// test() end

	
}// class end
