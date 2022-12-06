package kr.co.itwill.payment;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class PaymentDAO {
	
	public PaymentDAO() {
		System.out.println();
	}//PaymentDAO() end
	
	@Autowired
	SqlSession sqlSession;
	
}//class end
