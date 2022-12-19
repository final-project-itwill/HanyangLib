package kr.co.itwill.cart;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.book.BookDAO;
import kr.co.itwill.book.BookDTO;
import kr.co.itwill.community.CommSignDTO;
import kr.co.itwill.payment.PaymentDTO;
import lombok.Setter;
import lombok.extern.java.Log;

@Log
@RequestMapping("/cart")
@Controller
public class CartCont {
	
	public CartCont() {
		System.out.println("-----CartCont() 객체 생성됨");
	}//CartCont() end
	
	@Autowired
	CartDAO cartDao;
	
	// 장바구니 페이지를 불러오는 명령어
	@RequestMapping("/cartList")
	public ModelAndView cartview(@RequestParam String cart_id, @RequestParam String cart_code) throws Exception {
		ModelAndView mav=new ModelAndView();
		
		int checkCart = cartDao.checkCart(cart_id);
		// 바로 장바구니 버튼을 눌렀을 때
		if(cart_code == "") {
				// 장바구니에 아무것도 없을 때
			if(checkCart == 0) {
				mav.setViewName("cart/none");
			} else {
				// 장바구니 리스트
				mav.addObject("listCart", cartDao.listCart(cart_id));
				
				// 장바구니 목록 페이지로 이동
				mav.setViewName("cart/list");
			}
		} else {
		// 책 상세 페이지에서 장바구니에 넣기를 눌렀을 때
			// 책을 장바구니에 넣으려 할 때
			CartDTO dto = new CartDTO();
			dto.setCart_id(cart_id);
			dto.setCart_code(cart_code);
			
			// 장바구니에 상품이 있는지 확인하기
			int checkBook = cartDao.checkBook(dto);
			mav.addObject("checkBook", checkBook);
			
			// 상품이 없다면 INSERT
			if(checkBook==0) {
				mav.addObject("addCart", cartDao.addCart(dto));
			} // if end
			
			// 장바구니 리스트
			mav.addObject("listCart", cartDao.listCart(cart_id));
						
			// 장바구니 목록 페이지로 이동
			mav.setViewName("cart/list");
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar c1 = Calendar.getInstance();
        String strToday = sdf.format(c1.getTime());
		mav.addObject("cnt", cartDao.count(strToday+"%"));
		return mav;
	}//list() end
	
	// 결제창으로 이동
	@RequestMapping("/payment")
	public ModelAndView payment() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cart/payment");
		return mav;
	} // payment() end
	
	
	// 장바구니에서 선택한 항목 삭제시키기
	@RequestMapping("/delete/{s_id}")
	public String delete(@PathVariable String s_id, HttpServletRequest req) {	
		System.out.println("아이디는!!!!!!" + s_id);
		String[] check = req.getParameterValues("addPay");
		
		List<CartDTO> deleteList = new ArrayList();
		
		for(int i=0; i<check.length; i++){
            //String ac_no = chkArray[i];
            //System.out.println(ac_no);

            CartDTO dto = new CartDTO();
            dto.setCart_code(check[i]);
            dto.setCart_id(s_id);
            deleteList.add(dto);
        }//for end
		
		cartDao.deleteBook(deleteList);
		return "redirect:/cart/cartList?cart_id="+s_id;
	}
	
	// 선택한 항목을 결제 상세 테이블로 인서트 시키기
	
	
	
	
	// 결제 관련 컨트롤러
    @Setter(onMethod_ = @Autowired)
    private KakaoPay kakaopay;
    
    
    @GetMapping("/kakaoPay")
    public void kakaoPayGet() {
        
    }
    
    @PostMapping("/kakaoPay")
    public String kakaoPay() {
        log.info("kakaoPay post............................................");
        
        return "redirect:" + kakaopay.kakaoPayReady();
 
    }
    
    @GetMapping("/kakaoPaySuccess")
    public ModelAndView kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
        ModelAndView mav = new ModelAndView();
        mav.setViewName("cart/none");        
        return mav;
    }
    
    @RequestMapping("/kakaoPayCancel")
    public ModelAndView kakaoPayCancel() {        
        ModelAndView mav = new ModelAndView();
        mav.setViewName("cart/payment");        
        return mav;
    }
    
    @RequestMapping("/kakaoPaySuccessFail")
    public ModelAndView kakaoPaySuccessFail() {        
        ModelAndView mav = new ModelAndView();
        mav.setViewName("cart/payment");        
        return mav;
    }
	
	
	
	
}//class end
