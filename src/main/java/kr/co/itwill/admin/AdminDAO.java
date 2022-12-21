package kr.co.itwill.admin;

import kr.co.itwill.community.CommunityDTO;
import kr.co.itwill.community.CommunityUnionDTO;
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

    public List<CommunityUnionDTO> listCommunity(String c_state){
        return sqlSession.selectList("admin.communityList", c_state);
    }//end

    //mdPick 업데이트
    public int allNull(){
        return sqlSession.update("admin.allNull");
    }//allNull() end

    public int updatePick(List<CommunityDTO> mdList){
        return sqlSession.update("admin.updatePick", mdList);
    }//updatePick() end



}//class end
