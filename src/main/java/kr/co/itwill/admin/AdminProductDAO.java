package kr.co.itwill.admin;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.co.itwill.book.BookDTO;

@Repository
public class AdminProductDAO {
	
	public AdminProductDAO() {
		System.out.println("---------------AdminProductDAO()객체 생성됨");
	}
	
	
	@Autowired
	SqlSession sqlSession;
	
	
	public List<BookDTO> productlist(){
		return sqlSession.selectList("product.productlist"); 
	}//list() end
	
	
	public void insert(Map<String, Object> map) {
		sqlSession.insert("book.insert");
	}//insert() end
	
	public String filename(String b_code) {
		return sqlSession.selectOne("product.filename", b_code);
	}//filename() end
	
	public void delete(String b_code) {
		sqlSession.delete("book.delete", b_code);
	}//delete() end
	
	
	public Map<String, Object> detail(String b_code){
		return sqlSession.selectOne("book.detail", b_code);
	}//detail() end
	
	
	public void update(Map<String, Object> map) {
		sqlSession.update("book.update", map);
	}// update() end
	
	
	//도서 총 행 갯수
		public int totalRowCount() {
			return sqlSession.selectOne("book.totalRowCount");
		}// totalRowCount() end



	
	
	
	
}
