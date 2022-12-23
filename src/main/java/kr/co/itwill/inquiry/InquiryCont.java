package kr.co.itwill.inquiry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/inquiry")
public class InquiryCont {

    @Autowired
    InquiryDAO inquiryDAO;

    @RequestMapping("/list")
    public ModelAndView list(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("inquiry/list");
        mav.addObject("list", inquiryDAO.list());
        return mav;
    }//list() end


    @RequestMapping("/insertForm")
    public String insertForm(){
        return "/inquiry/insertForm";
    }//insertForm() end

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@ModelAttribute InquiryDTO dto){

        InquiryDTO ask = new InquiryDTO();
        ask.setAsk_id(dto.getAsk_id());
        ask.setAsk_type(dto.getAsk_type());
        ask.setAsk_title(dto.getAsk_title());
        ask.setAsk_content(dto.getAsk_content());

        inquiryDAO.insertInquiry(ask);

        return "redirect:/inquiry/list";
    }//insert() end

}//class end
