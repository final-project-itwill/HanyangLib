package kr.co.itwill.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itwill.community.CommSignDTO;


@Repository
public class CartDAO {
	
	public CartDAO() {
		System.out.println("-----CartDAO() end");
	}//CartDAO() end
	
	@Autowired
	SqlSession sqlSession;
	
	// 선택한 상품이 장바구니에 이미 있는 경우
	public int checkBook(CartDTO dto) {
		return sqlSession.selectOne("cart.checkBook", dto);
	}
	
	// 장바구니에 상품이 담겨 있는지
	public int checkCart(String cart_id) {
		return sqlSession.selectOne("cart.checkCart", cart_id);
	}
	
	// 장바구니 INSERT
	public int addCart(CartDTO dto) {
		return sqlSession.insert("cart.add", dto);
	} // addCart() end
	
	// 장바구니 SELECT
	public List<CartDTO> listCart(String cart_id) {
		return sqlSession.selectList("cart.list", cart_id);
	}
	
	// 장바구니 DELETE
	public int deleteBook(List<CartDTO> deleteList){
	
		for(int i=0; i<deleteList.size(); i++) {
			System.out.println("----------"+deleteList.get(i));
		}
		
      return sqlSession.delete("cart.deleteBook", deleteList);
	} // delete() end
	
	// 주문서 코드를 만들기 위해 오늘 날짜에 들어온 주문서가 또 있는지 확인하기
	public int count(String date) {
		return sqlSession.selectOne("cart.count", date);
	}
	
	
}//class end
