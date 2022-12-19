package kr.co.itwill.cart;

import lombok.Data;

@Data
public class CartDTO {
	
	private int		cart_no;			 //일련 번호
	private String  cart_code;  		 //상품 코드
	private String  cart_id;     		 //주문자 id
	private String	b_name;
	private int		b_price;
	private String	b_bookcover;	
	
}//CartDTO end class end
