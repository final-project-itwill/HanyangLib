package kr.co.itwill.survey;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

import kr.co.itwill.community.AdminMemberDTO;
import kr.co.itwill.community.CommSignDTO;
import kr.co.itwill.community.CommunityDAO;
import kr.co.itwill.community.CommunityDTO;

@Controller
@RequestMapping("/survey")
public class SurveyCont {

	public SurveyCont() {
		System.out.println("----SurveyCont() 객체 생성");
	}// end
	
    @Autowired
    CommunityDAO commDao;
    
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
	public ModelAndView write(@PathVariable String c_code, HttpSession session) throws Exception {
		
		String dsv_code = surveyDAO.scodeget(c_code);
		//System.out.println(dsv_code);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/survey/write");
		mav.addObject("title", surveyDAO.svTitle(dsv_code));
		mav.addObject("count", surveyDAO.svCount(dsv_code));
		mav.addObject("choice", surveyDAO.svChoice(dsv_code));
		mav.addObject("dsv_code", dsv_code);
		mav.addObject("c_code", c_code);
		mav.addObject("c_name", surveyDAO.getcname(c_code));
		
		String m_id = (String)session.getAttribute("s_id");
		// System.out.println(m_id);
		mav.addObject("s_id", m_id);
		mav.addObject("s_nick", surveyDAO.getnick(m_id));
		System.out.println(surveyDAO.getnick(m_id));
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
		// System.out.println(answer.toString());
		return "생성되었습니다.";
			//	"redirect:/survey/answer/"+dto.getAns_code();
	}// insert() end
	
	// 커뮤니티 신청 테이블	
	@RequestMapping(value = "/write/comsign", method = RequestMethod.POST)
	@ResponseBody
	private String insert(@RequestBody CommSignDTO comsign) throws Exception {
		CommSignDTO dto = new CommSignDTO();
		dto.setS_code(comsign.getS_code());
		dto.setS_id(comsign.getS_id());
		dto.setS_nick(comsign.getS_nick());
		dto.setS_surveycode(comsign.getS_surveycode());
		surveyDAO.comsign(dto);
		// System.out.println(dto);
		return "생성되었습니다.";
			//	"redirect:/survey/answer/"+dto.getAns_code();
	}// insert() end
	
	
//// 관리자 페이	
	
// 답변 학인하기	
	@RequestMapping("/answer/{dsv_code}/{s_id}")
	public ModelAndView answer(@PathVariable("dsv_code") String dsv_code,
								@PathVariable("s_id") String s_id) throws Exception{
		AnswerDTO ans = new AnswerDTO();
		System.out.println(dsv_code);
		System.out.println(s_id);
		ans.setAns_code(dsv_code);
		ans.setAns_id(s_id);
		String checksv = surveyDAO.idscodeget(ans);
		
		ModelAndView mav = new ModelAndView();
		
		if(checksv == null) {			
			System.out.println(checksv);
			mav.setViewName("/survey/answerfail");
//			
		} else {
			
			mav.setViewName("/survey/answer");
			mav.addObject("title", surveyDAO.svTitle(dsv_code));
			mav.addObject("count", surveyDAO.svCount(dsv_code));
			mav.addObject("choice", surveyDAO.svChoice(dsv_code));
			mav.addObject("answer", surveyDAO.svanswer(ans));
			System.out.println(ans);
		}
		
		// 경로설정
		String c_code = dsv_code.substring(dsv_code.length()-6, dsv_code.length());
		// System.out.println(c_code);
		mav.addObject("sv_code", dsv_code);
		mav.addObject("c_code", c_code);
		mav.addObject("read", commDao.read(c_code));
		
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
		// mav.addObject("tplread", surveyDAO.tplread(c_code));
		mav.addObject("s_id", s_id);
		mav.addObject("c_code", c_code);
		mav.addObject("read", commDao.read(c_code));
		mav.addObject("checkOwner", commDao.checkOwner(c_code));
		// System.out.println(surveyDAO.tplread());
		// System.out.println(surveyDAO.tpl());
	return mav;
	} // create() end
	
// templete 불러오기	
	@RequestMapping("/create/{c_code}/{s_id}/{tem_code}")
	public ModelAndView create(@PathVariable("s_id") String s_id,
								@PathVariable("c_code") String c_code,
								@PathVariable("tem_code") String tem_code) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("survey/create");
		// 템플릿 가져오기.
		mav.addObject("tpl", surveyDAO.tpl());
		mav.addObject("tplread", surveyDAO.tplread(tem_code));
		mav.addObject("s_id", s_id);
		mav.addObject("c_code", c_code);
		mav.addObject("read", commDao.read(c_code));
		mav.addObject("checkOwner", commDao.checkOwner(c_code));
		// System.out.println(surveyDAO.tplread());
		// System.out.println(surveyDAO.tpl());
	return mav;
	} // create() end
	
	@RequestMapping("/create/tplread")
	@ResponseBody
	public List<templetDTO> tplread(@RequestParam String tem_code) throws Exception {
		//System.out.println(tem_code);
		return surveyDAO.tplread(tem_code);
	} // tplread() end
	
	@RequestMapping(value = "/create/insert", method = {RequestMethod.POST})
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
		// System.out.println(survey.toString());
		return "survey";
		
	}// surveyinsert() end
	
	@RequestMapping(value = "/create/dinsert", method = {RequestMethod.POST})
	public String dsurveyinsert(@RequestBody DsurveyDTO dto)	throws Exception {
		
		DsurveyDTO dsurvey = new DsurveyDTO();
		dsurvey.setDsv_code(dto.getDsv_code());
		dsurvey.setDsv_subject(dto.getDsv_subject());
		dsurvey.setDsv_order(dto.getDsv_order());
		dsurvey.setDsv_type(dto.getDsv_type());
		
		surveyDAO.questionWrite(dsurvey);
		// System.out.println(dsurvey.toString());
		return "dsurvey";
		
	}// dsurveyinsert() end
	
	@RequestMapping(value = "/create/cinsert", method = { RequestMethod.POST})
	public String csurveyinsert(@RequestBody ChoiceDTO dto)	throws Exception {
		
		ChoiceDTO choice = new ChoiceDTO();
		choice.setCh_code(dto.getCh_code());
		choice.setCh_order(dto.getCh_order());
		choice.setCh_type(dto.getCh_type());
		choice.setCh_anscode(dto.getCh_anscode());
		choice.setCh_content(dto.getCh_content());
		
		surveyDAO.items(choice);
		// System.out.println(choice.toString());
		return "choice";
		
	}// dsurveyinsert() end

// survey Update	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView update( String c_code) throws Exception {
		ModelAndView mav = new ModelAndView();
		String dsv_code = surveyDAO.scodeget(c_code);
		// System.out.println(dsv_code);
		mav.setViewName("/survey/update");
		mav.addObject("sread", surveyDAO.sread(dsv_code));
		mav.addObject("title", surveyDAO.svTitle(dsv_code));
		mav.addObject("count", surveyDAO.svCount(dsv_code));
		mav.addObject("choice", surveyDAO.svChoice(dsv_code));
		mav.addObject("sv_code", dsv_code);
		mav.addObject("c_code", c_code);
		mav.addObject("read", commDao.read(c_code));
		mav.addObject("checkOwner", commDao.checkOwner(c_code));
		
		
		return mav;
	}// Update end	
	
	@RequestMapping(value = "update/updelete", method = RequestMethod.POST)
	public String updateProc(@RequestBody SurveyDTO dto) throws Exception {
		SurveyDTO survey = new SurveyDTO();
		survey.setSv_code(dto.getSv_code());
		surveyDAO.updelete(survey);
		// System.out.println(survey);
		return "updelete";		
	} // deleteProc() end		
	
	
	
	
// survey Delete
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public ModelAndView deleteForm(String c_code, HttpServletRequest session) throws Exception {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("survey/deleteForm");
		mav.addObject("c_code", c_code);
		
		String loginID = (String) session.getAttribute("s_id"); 
        // 설문지 코드 생성, ahead 경로
        mav.addObject("sv_code", surveyDAO.scodeget(c_code));
        mav.addObject("read", commDao.read(c_code));
        mav.addObject("tpl", surveyDAO.tpl());
        
        mav.addObject("s_id", loginID);
        
        mav.addObject("checkOwner", commDao.checkOwner(c_code));
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
	public ModelAndView updateForm(String c_code) {
		ModelAndView mav = new ModelAndView();
		// 설문지 코드 생성, ahead 경
		String sv_code = surveyDAO.scodeget(c_code);
		mav.addObject("read", commDao.read(c_code));
		mav.addObject("sv_code", sv_code);
		mav.setViewName("survey/updateForm");
		mav.addObject("sread", surveyDAO.sread(sv_code));
		
		mav.addObject("checkOwner", commDao.checkOwner(c_code));
		return mav;		
	} // updateForm() end
	
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public ModelAndView updateProc(@ModelAttribute SurveyDTO dto, @RequestParam String sv_comcode) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/comm/admin/"+sv_comcode);
		surveyDAO.update(dto);
		return mav;
	} // updateProc() end
	
	
//	// 경환 작업 따로 기록
//	// 설문지 생성페이지로 연결하는 컨트롤러
//	@RequestMapping("/formCreate/{s_id}")
//	public ModelAndView formCreate(@PathVariable String s_id) {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("survey/createForm");
//	return mav;
//	} // formCreate() end
//	
//  
//	// 설문지를 생성시키는 컨트롤러
//	@RequestMapping("/createProc")
//	public ModelAndView createProc() {
//		ModelAndView mav = new ModelAndView();
//		return mav;
//	}	
  
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
	public String chdeleteProc(@ModelAttribute AnswerDTO dto, HttpServletRequest req) throws Exception {
		AnswerDTO ans = new AnswerDTO();
		ans.setAns_code(dto.getAns_code());
		ans.setAns_id(dto.getAns_id());
		surveyDAO.ansdelete(ans);
		
		return "redirect:/comm/admin/";		
	} // deleteProc() end	
	
	
	
// surveyChart
	@RequestMapping(value = "/line", method = RequestMethod.GET)
	@ResponseBody
	public List<AdminMemberDTO> chart(@RequestParam String c_code) {
		// System.out.println(c_code);
		return surveyDAO.Member(c_code);
	}// 

// surveypie
	@RequestMapping(value = "/pie", method = RequestMethod.GET)
	@ResponseBody
	public List<pieDTO> pie(@RequestParam String c_code) {
		// System.out.println(surveyDAO.pie(c_code));
		return surveyDAO.pie(c_code);
	}// 	

}// class end
