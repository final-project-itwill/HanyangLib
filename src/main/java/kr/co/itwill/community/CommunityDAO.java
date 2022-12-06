package kr.co.itwill.community;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommunityDAO {
    
    public CommunityDAO(){
        System.out.println("-----CommunityDAO() 객체 생성됨");
    }//end

    @Autowired
    SqlSession sqlSession;

    //책 정보 가져와서 목록 출력
    public List<BookReadDTO> list(){
        return sqlSession.selectList("community.list");
    }//bookRead() end

    //목록페이지에서 검색
    public List<BookReadDTO> search(String keyword){
        return sqlSession.selectList("community.search", keyword);
    }//search() end


    //index페이지 커뮤니티 최신순 3개 출력
    public List<BookReadDTO> newComm(){
        return sqlSession.selectList("community.newComm");
    }//newComm() end


    public BookReadDTO read(String c_code){
        return sqlSession.selectOne("community.read", c_code);
    }//read() end

    public List<CommacDTO> acList(String c_code){
        return sqlSession.selectList("community.acList", c_code);
    }//read() end

}//class end
