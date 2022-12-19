package kr.co.itwill.book;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.aop.ThrowsAdvice;
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
	public List<BookDTO> list_n(BookDTO rows){
		return sqlSession.selectList("book.list_n", rows);		
	}//list_n() end

	
	public List<BookDTO> list_e(BookDTO rows) {
		return sqlSession.selectList("book.list_e", rows);		
	}//list_e() end
	
	
	public List<BookDTO> list_h(BookDTO rows) {
		return sqlSession.selectList("book.list_h", rows);		
	}//list_h() end
	
	
	public List<BookDTO> list_s(BookDTO rows) {
		return sqlSession.selectList("book.list_s", rows);		
	}//list_s() end
	
	
	public List<BookDTO> list(BookDTO rows){
		System.out.println(rows.getStartRow() + "첫째줄 소환");
		System.out.println(rows.getEndRow() + "막줄 소환");
		return sqlSession.selectList("book.list", rows);		
	}//list() end
	
	public BookDTO bookdetail(String b_code) throws Exception {
		return sqlSession.selectOne("book.bookdetail",b_code);
	}//bookdetail() end
	
	
	
	//소설 총 행 갯수
	public int totalRowCount_n() {
		return sqlSession.selectOne("book.totalRowCount_n");
	}// totalRowCount() end
	
	
	//에세이 총 행 갯수
	public int totalRowCount_e() {
		return sqlSession.selectOne("book.totalRowCount_e");
	}// totalRowCount() end\
	
	
	
	//인문 총 행 갯수
	public int totalRowCount_h() {
		return sqlSession.selectOne("book.totalRowCount_h");
	}// totalRowCount() end
	
	
	
	//자연과학 총 행 갯수
	public int totalRowCount_s() {
		return sqlSession.selectOne("book.totalRowCount_s");
	}// totalRowCount() end
	
	//자연과학 총 행 갯수
	public int totalRowCount() {
		return sqlSession.selectOne("book.totalRowCount");
	}// totalRowCount() end
	
	//상품등록
	public int insert(BookDTO book) {
		return sqlSession.insert("book.insert", book);
	}
	
	
	
	
	

}//class end
