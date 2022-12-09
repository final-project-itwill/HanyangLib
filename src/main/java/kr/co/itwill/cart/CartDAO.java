package kr.co.itwill.cart;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class CartDAO {
	
	public CartDAO() {
		System.out.println("-----CartDAO() end");
	}//CartDAO() end
	
	@Autowired
	SqlSession sqlSession;
	
	
	
	
}//class end
