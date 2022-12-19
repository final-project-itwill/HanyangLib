package kr.co.itwill.admin;

import kr.co.itwill.community.CommunityDTO;
import kr.co.itwill.member.MemberDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdminDAO {

    @Autowired
    SqlSession sqlSession;


    public int countMemeber(){
        int memberCnt = sqlSession.selectOne("admin.countMember");
        return memberCnt;
    }//countMemeber() end

    public int countBook(){
        int bookCnt = sqlSession.selectOne("admin.countBook");
        return bookCnt;
    }//countBook() end

    public int totalSales(){
        int totalSales = sqlSession.selectOne("admin.totalSales");
        return totalSales;
    }//totalSales() end


    public List<MemberDTO> listMember(){
        return sqlSession.selectList("admin.memberList");
    }//listMember() end


    public List<CommunityDTO> listCommunity(){
        return sqlSession.selectList("admin.communityList");
    }//end

}//class end
