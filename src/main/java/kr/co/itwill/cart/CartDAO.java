package kr.co.itwill.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itwill.community.CommSignDTO;
import kr.co.itwill.mylib.MylibDTO;


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
	
	/////////////////구독 상태 바꾸기
	public int gudokY(String s_id) {
		return sqlSession.update("cart.gudokY", s_id);
	}	
	
	/////////////////장바구니에서 결제 상세 테이블로////////////////////
	
	// 주문서 코드를 만들기 위해 오늘 날짜에 들어온 주문서가 또 있는지 확인하기
	public int count(String date) {
		return sqlSession.selectOne("cart.count", date);
	}
	
	// 상품 번호로 가격 불러오기
	public int price(String dpay_code) {
		return sqlSession.selectOne("cart.price", dpay_code);
	}
	
	// 결제 상세 테이블로 Insert
	public int addPayment(List<DpaymentDTO> paymentList){
		return sqlSession.insert("cart.addPayment", paymentList);
	}
	
	// 결제 상세 테이블 READ
	public List<DpaymentDTO> payList(String dpay_pno){
		return sqlSession.selectList("cart.payList", dpay_pno);
	}
	
	// 결제 상세 테이블 삭제
	public int cancel(String dpay_pno) {
		return sqlSession.delete("cart.cancel", dpay_pno);
	}
	
	////////////////////결제 상세 테이블에서 결제 테이블로//////////////////////
	// 결제 상세 테이블로 insert
	public int finalinsert(PaymentDTO dto) {
		return sqlSession.insert("cart.finalinsert", dto);
	}
	
	// 주문서 번호 안에 들어있는 도서 코드 다 담기
	public List<DpaymentDTO> findBookCode(String pay_no) {
		return sqlSession.selectList("cart.findBook", pay_no);
	}
	
	// 나만의 서제 insert 반복처리
	public int insertLib(List<MylibDTO> BookList) {
		return sqlSession.insert("cart.insertLib", BookList);
	}
	
}//class end
