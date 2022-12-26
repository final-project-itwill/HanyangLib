package kr.co.itwill.cart;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.mylib.MylibDTO;
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
	public ModelAndView cartview(@RequestParam String cart_id, @RequestParam String cart_code, HttpSession session) throws Exception {
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
			
			// 세션의 장바구니 count 최신화
			int cartcheck = cartDao.checkCart(cart_id);
			session.setAttribute("s_cart", cartcheck);
			
			// 장바구니 리스트
			mav.addObject("listCart", cartDao.listCart(cart_id));
			
			// 장바구니 목록 페이지로 이동
			mav.setViewName("cart/list");
		}
		
		// 생성될 오늘 날짜가 주문서번호에 포함되어있는지 카운팅하기 위한 변수
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar c1 = Calendar.getInstance();
        String strToday = sdf.format(c1.getTime());
        String search = strToday+"%";
		mav.addObject("cnt", cartDao.count(search));
		
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
	public String delete(@PathVariable String s_id, HttpServletRequest req, HttpSession session) {	
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
		
		// 세션의 장바구니 count 최신화
		int cartcheck = cartDao.checkCart(s_id);
		session.setAttribute("s_cart", cartcheck);
		
		return "redirect:/cart/cartList?cart_id="+s_id+"&cart_code=";
	}
	
	// 선택한 항목을 결제 상세 테이블로 인서트 시키기
	@RequestMapping("/payment/{dpay_pno}/{s_id}")
	public ModelAndView addPayment(@PathVariable("dpay_pno") String dpay_pno, @PathVariable("s_id") String s_id, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		// 1) 상품 코드를 배열에 담기
		String[] check = req.getParameterValues("addPay");
		
		// 2) 상품 코드와 가격을 결제 상세 테이블에 담기
		List<DpaymentDTO> paymentList = new ArrayList();
		for(int i=0; i<check.length; i++) {
			// 상품 번호(도서코드, 구독코드) 변수에 담기
			String dpay_code = check[i];
			int dpay_price = cartDao.price(dpay_code); 
			DpaymentDTO dto = new DpaymentDTO();
			dto.setDpay_pno(dpay_pno);
			dto.setDpay_code(dpay_code);
			dto.setDpay_price(dpay_price);
			paymentList.add(dto);
		}

		cartDao.addPayment(paymentList);				
		
		mav.setViewName("redirect:/cart/paymentList?dpay_pno="+dpay_pno);
		return mav;
	}
	
	// 결제 페이지
	@RequestMapping("/paymentList")
	public ModelAndView paymentList(@RequestParam String dpay_pno) {
		ModelAndView mav = new ModelAndView();
		
		// 결제 상세 페이지에 인서트된 상품을 리스트로 출력시켜주기
		mav.addObject("paymentList", cartDao.payList(dpay_pno));
		mav.addObject("dpay_pno", dpay_pno);
		mav.setViewName("cart/payment");
		return mav;
	} // paymentList() end
	
	// 결제 상세 테이블에서 delete
	@RequestMapping("/payCancel")
	public ModelAndView payCancel(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String dpay_pno = req.getParameter("pay_no");
		String id = req.getParameter("pay_id");
		System.out.println("주문번호 : " + dpay_pno);
		System.out.println("주문아이디 : " + id);
		cartDao.cancel(dpay_pno);
		mav.setViewName("redirect:/cart/cartList?cart_id="+id+"&cart_code=");
		return mav;
	}
	
	
	// 결제 관련 컨트롤러
    @Setter(onMethod_ = @Autowired)
    private KakaoPay kakaopay;
    
    
    @GetMapping("/kakaoPay")
    public void kakaoPayGet() {
        
    }
    
    @PostMapping("/kakaoPay")
    public String kakaoPay(HttpServletRequest req) {
        log.info("kakaoPay post............................................");
        return "redirect:" + kakaopay.kakaoPayReady(req.getParameter("pay_total"), req.getParameter("pay_no"), req.getParameter("pay_id"));
 
    }
    
    // 결제를 성공했을 때
    @GetMapping("/kakaoPaySuccess")
    public ModelAndView kakaoPaySuccess(@RequestParam("pg_token") String pg_token,
    									Model model,
    									String pay_no,
    									String pay_id,
    									String pay_total,
    									@ModelAttribute PaymentDTO dto
    									,HttpSession session) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
                
        dto.setPay_id(pay_id);
        dto.setPay_no(pay_no);
        dto.setPay_total(Integer.parseInt(pay_total));
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token, pay_total));
        
        ModelAndView mav = new ModelAndView();
        // 1) 최종 결제 테이블 인서트
        mav.addObject("inPayment", cartDao.finalinsert(dto));
        
        // 2) 결제상세테이블에서 주문서 번호 안에 들어있는 도서 코드 다 가지고 오기
        List<DpaymentDTO> codeList = cartDao.findBookCode(pay_no);
        
        // 3) 가지고 온 도서 코드를 하나씩 나만의 서재에 인서트하기 위해 DTO에 담기
        List<MylibDTO> BookList = new ArrayList();
		for(int i=0; i<codeList.size(); i++) {
			// 상품 번호(도서코드, 구독코드) 변수에 담기
			System.out.println(codeList.get(i).getDpay_code());
			String lib_code = codeList.get(i).getDpay_code();
			MylibDTO lib = new MylibDTO();
			lib.setLib_bcode(lib_code);
			lib.setLib_id(pay_id);
			BookList.add(lib);
		}
		
		// 4) DTO로 INSERT문 반복 실행시키기
		cartDao.insertLib(BookList);
		
        // 5) 결제 상세 테이블 삭제하기		
		cartDao.cancel(pay_no);
		
		// 6) 장바구니에서도 삭제하기
		List<CartDTO> deleteList = new ArrayList();
		
		for(int i=0; i<codeList.size(); i++){
            //String ac_no = chkArray[i];
            //System.out.println(ac_no);

            CartDTO cart = new CartDTO();
            cart.setCart_code(codeList.get(i).getDpay_code());
            cart.setCart_id(pay_id);
            deleteList.add(cart);
        }//for end
		
		cartDao.deleteBook(deleteList);
		
		// 세션의 장바구니 count 최신화
		int cartcheck = cartDao.checkCart(pay_id);
		session.setAttribute("s_cart", cartcheck);
		
        mav.setViewName("cart/success");
        return mav;
    }
    
    // 결제를 취소했을 때 - 결제상세테이블을 삭제하고 장바구니로 돌아가기
    @RequestMapping("/kakaoPayCancel")
    public ModelAndView kakaoPayCancel(String pay_no, String pay_id, String pay_total, @ModelAttribute PaymentDTO dto) {        
        ModelAndView mav = new ModelAndView();
        cartDao.cancel(pay_no);
		mav.setViewName("redirect:/cart/cartList?cart_id="+pay_id+"&cart_code=");
		return mav;
    }
    
    // 결제에 실패했을 때 - 결제창으로 돌아가기
    @RequestMapping("/kakaoPaySuccessFail")
    public ModelAndView kakaoPaySuccessFail(String pay_no, String pay_id, String pay_total, @ModelAttribute PaymentDTO dto) {        
        ModelAndView mav = new ModelAndView();        
        mav.setViewName("cart/fail");        
        return mav;
    }
	
	
	
	
}//class end
