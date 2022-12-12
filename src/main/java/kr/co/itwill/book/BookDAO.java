package kr.co.itwill.book;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class BookDAO {
	
	public BookDAO() {
		System.out.println("-------------BookDAO()객체 생성됨");
	}// end
	
	@Autowired
	SqlSession sqlSession;
	
	
	// 책 출판사 출력
	public List<BookDTO> list_n() throws  Exception{
		return sqlSession.selectList("book.list_n");		
	}//list_n() end
	
	
	
	
	/*
	public List<BookDTO> booklist(String b_no) {
		return sqlSession.selectList("book.booklist", b_no);
	}
	
	
	public void insert(Map<String, Object> map) {
		sqlSession.insert("book.insert", map);
	}//insert() end
	
	
	public List<Map<String, Object>> search(String b_name){
		return sqlSession.selectList("b_name", "%" + b_name + "%");
	}//search() end
	
	
	public Map<String, Object> detail(String b_code){
		return sqlSession.selectOne("book.detail", b_code);
	}//detail() end
	
	
	public void  update(Map<String, Object> map) {
		sqlSession.update("book.update", map);
	}//update() end
	
	
	public String filename(String b_code) {
		return sqlSession.selectOne("book.filename", b_code);
	}//filename() end
	
	public void delete(String b_code) {
		sqlSession.delete("book.delete", b_code);
	}//delete() end
	*/

	
}//class end
