package kr.co.itwill.payment;

import lombok.Data;

@Data
public class PaymentDTO {
	
	private String     pay_no;       
	private String     pay_id;    
	private	int     pay_total;  
	private int	    pay_point;   
	private int	   pay_result;    
	private String pay_status;
	
	
	
}
