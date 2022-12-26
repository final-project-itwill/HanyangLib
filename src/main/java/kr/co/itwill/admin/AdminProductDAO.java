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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.book.BookDTO;

@Repository
public class AdminProductDAO {
	
	public AdminProductDAO() {
		System.out.println("---------------AdminProductDAO()객체 생성됨");
	}
	
	
	@Autowired
	SqlSession sqlSession;
	
	
	public List<BookDTO> productlist(BookDTO rows){
		return sqlSession.selectList("product.productlist", rows); 
	}//list() end
	
	
	public int insert(BookDTO book) {
		System.out.println("DAO에서----"+book.toString());
		return sqlSession.insert("admin.productinsert", book);
	}//insert() end
	
	public BookDTO readBook(String b_code){
        return sqlSession.selectOne("book.readBook", b_code);
    }//readBook() end
	
	public String filename(String b_code) {
		return sqlSession.selectOne("admin.filename", b_code);
	}//filename() end
	
	public void delete(String b_code) {
		sqlSession.delete("admin.delete", b_code);
	}//delete() end

	
	
	//도서 총 행 갯수
		public int totalRowCount() {
			return sqlSession.selectOne("book.totalRowCount");
		}// totalRowCount() end


	//검색
	public List<BookDTO> search(String keyword){
		return sqlSession.selectList("admin.search", keyword);
	}
	
	//상세페이지
	public BookDTO productdetail(String b_code) throws Exception {
		return sqlSession.selectOne("admin.productdetail", b_code);
	}

	
	//수정
	public int update(BookDTO dto){
		return sqlSession.update("admin.update",dto);
	}//update() end
}
