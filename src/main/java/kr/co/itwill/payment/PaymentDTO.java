package kr.co.itwill.payment;

import lombok.Data;

@Data
public class PaymentDTO {

	private String     pay_no;       //주문번호
	private String     pay_id;       //주문자 id
	private	int     pay_total;  	 //상품 총금액
	private int	    pay_point;   	 //사용 예정 마일리지
	private int	   pay_result;    	 //실제 결제 금액
	private String pay_status;		 //결과 상태
	
	
	
}//PaymentDTO
