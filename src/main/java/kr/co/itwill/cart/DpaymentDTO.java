package kr.co.itwill.cart;

import lombok.Data;

@Data
public class DpaymentDTO {
	/** 인덱스 */
	private int dpay_no;
	/** 주문서 번호 */
	private String dpay_pno;
	/** 상품 코드 */
	private String dpay_code;
	/** 상품 가격 */
	private int dpay_price;
	
}