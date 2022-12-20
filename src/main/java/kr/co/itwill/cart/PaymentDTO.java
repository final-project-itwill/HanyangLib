package kr.co.itwill.cart;

import lombok.Data;

@Data
public class PaymentDTO {

	private String     pay_no;       //주문번호
	private String     pay_id;       //주문자 id
	private	int     pay_total;  	 //상품 총금액
	
}//PaymentDTO
