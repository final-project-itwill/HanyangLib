package kr.co.itwill.community;

import kr.co.itwill.book.BookDTO;
import kr.co.itwill.notice.NoticeDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class CommunityDAO {
    
    public CommunityDAO(){
        System.out.println("-----CommunityDAO() 객체 생성됨");
    }//end

    @Autowired
    SqlSession sqlSession;

    //책 정보 가져와서 목록 출력
    public List<BookReadDTO> list1(){
        return sqlSession.selectList("community.list1");
    }//bookRead() end

    //페이징 있는 목록
    public List<BookReadDTO> list(BookReadDTO rows){
        return sqlSession.selectList("community.list", rows);
    }//list() end

    //총 행갯수
    public int totalRowCount(){
        return sqlSession.selectOne("community.totalRowCount");
    }//totalRowCount() end

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

    public List<CommacDTO> acList(CommacDTO dto){
        System.out.println(dto.toString());
        List<CommacDTO> textli = new ArrayList<>();
        for(int i=0; i<textli.size(); i++){
            System.out.println(textli.get(i));
        }
        return sqlSession.selectList("community.acList", dto);
    }//read() end

    //커뮤니티 모집상태 가져오기
    public CommunityDTO commCheck(String c_code){
        return sqlSession.selectOne("community.commCheck", c_code);
    }//commCheck() end

    //로그인id의 커뮤니티 가입상태 가져오기
//    public CommSignDTO idCheck(String c_code){
//        return sqlSession.selectOne("community.idCheck", c_code);
//    }//idCheck() end
//
//    public CommunityDTO idCheck2(String c_code){
//        return sqlSession.selectOne("community.idCheck2", c_code);
//    }//idCheck2() end

    public List<CommunityMylipDTO> listMylib(String loginID){
        return sqlSession.selectList("community.listMylib", loginID);
    }//listMylib() end

    public BookDTO readBook(String b_code){
        return sqlSession.selectOne("community.readBook", b_code);
    }//readBook() end

    public int insert(CommunityDTO community){
        return sqlSession.insert("community.insert", community);
    }//insert() end


    public String filename(String c_code){
        return sqlSession.selectOne("community.filename", c_code);
    }//filename() end
    public int delete(String c_code){
        return sqlSession.delete("community.delete", c_code);
    }//delete() end

    public int update(CommunityDTO dto){
        return sqlSession.update("community.update", dto);
    }//update() end


    public int createCode(){
        return sqlSession.selectOne("community.createCode");
    }//createCode() end

    public int acCount(String c_code) throws Exception{
        int cnt = 0;
        cnt = sqlSession.selectOne("community.acCount", c_code);
        return cnt;
    }//acCount() end

}//class end
