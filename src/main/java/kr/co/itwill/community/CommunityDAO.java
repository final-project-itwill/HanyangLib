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


    //메인페이지 커뮤니티 3개씩 출력
    //MD Pick
    public List<BookReadDTO> mdPick(){
        return sqlSession.selectList("community.mdPick");
    }//mdPick() end

    //최신순
    public List<BookReadDTO> newComm(){
        return sqlSession.selectList("community.newComm");
    }//newComm() end

    //마감순
    public List<BookReadDTO> dueCommunity(){
        return sqlSession.selectList("community.dueCommunity");
    }//dueCommunity() end


    public BookReadDTO read(String c_code){
        return sqlSession.selectOne("community.read", c_code);
    }//read() end


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


    //가입 신청 제약 조건 (해당 커뮤 가입 전이여야 함)
    public CommSignDTO checkID(CommSignDTO sign){
        return sqlSession.selectOne("community.checkID", sign);
    }//checkID() end

    //커뮤니티장 확인하기
    public String checkOwner(String c_code){
        String owner = "";
        owner = sqlSession.selectOne("community.checkOwner", c_code);
        return owner;
    }//checkOwner() end

    public List<CommSignDTO> checkMember(String c_code){
        return sqlSession.selectList("community.checkMember", c_code);
    }//communityMember() end


    //후기 총 갯수
    public int reviewCnt(String c_code){
        int cnt = 0;
        cnt = sqlSession.selectOne("community.reviewCnt", c_code);
        return cnt;
    }//reviewCnt() end

    //후기 평균
    public int star(String c_code){
        int star = 0;
        star = sqlSession.selectOne("community.star", c_code);
        return star;
    }//star() end

    //승인된 멤버
    public List<AdminMemberDTO> approvedMember(String c_code){
        return sqlSession.selectList("community.approvedMember", c_code);
    }//approvedMember() end


    //기다리는 멤버
    public List<AdminMemberDTO> waitingMember(String c_code){
        return sqlSession.selectList("community.waitingMember", c_code);
    }//approvedMember() end


    //회원 업데이트 한 번에 하기
    public int updateMember(List<CommSignDTO> updateList){
//        for(int i=0; i<updateList.size(); i++){
//            System.out.println("-------------DAO!!!!!!!!!!!!-"+updateList.get(i));
//        }
        return sqlSession.update("community.updateMember", updateList);
    }//updateMember() end

    public int rejectMember(List<CommSignDTO> updateList){
        return sqlSession.update("community.rejectMember", updateList);
    }//rejectMember() end

}//class end
