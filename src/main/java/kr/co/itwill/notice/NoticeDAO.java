package kr.co.itwill.notice;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Locale;


@Repository
public class NoticeDAO {

    public NoticeDAO(){
        System.out.println("-----NoticeDAO()객체 생성됨");
    }//end

    @Autowired
    SqlSession sqlSession;

    //페이징 없는 목록
/*    public List<NoticeDTO> list(){
        return sqlSession.selectList("notice.list");
    }//list() end*/

    //페이징 있는 목록
    public List<NoticeDTO> list(NoticeDTO rows){
        return sqlSession.selectList("notice.list", rows);
    }//list() end

    public int insert(NoticeDTO notice){
        return sqlSession.insert("notice.insert", notice);
    }//insert() end


    public List<NoticeDTO> search(String keyword){
        return sqlSession.selectList("notice.search", keyword);
    }//search() end

    public NoticeDTO read(int n_no){
        return sqlSession.selectOne("notice.read", n_no);
    }//read() end


    public void delete(int n_no){
        sqlSession.delete("notice.delete", n_no);
    }//delete() end


    public int update(NoticeDTO notice){
        return sqlSession.update("notice.update", notice);
    }//update() end

    //총 행 갯수
    public int totalRowCount(){
        return sqlSession.selectOne("notice.totalRowCount");
    }//totalRowCount() end

}//class end
