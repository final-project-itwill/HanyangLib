package kr.co.itwill.community;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommacDAO {
    public CommacDAO(){
        System.out.println("-----CommacDAO() 객체 생성됨");
    }//end

    @Autowired
    SqlSession sqlSession;


    public int InsertIntoCommunityActivity(CommacDTO commac){
        return sqlSession.insert("commac.insert", commac);
    }//InsertIntoCommunityActivity() end


    public List<CommacDTO> listActivity(String ac_ccode){
        return sqlSession.selectList("commac.list", ac_ccode);
    }//listActivity() end


    public int deleteActivity(int ac_no) throws Exception{
        return sqlSession.delete("commac.delete", ac_no);
    }//deleteActivity() end


    public int updateActivity(CommacDTO commac){
        return sqlSession.update("commac.update", commac);
    }//openActivityUpdatePanel() end

}//class end
