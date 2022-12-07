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


    public int commacInsert(CommacDTO commac){
        return sqlSession.insert("commac.insert", commac);
    }//commacInsert() end


    public List<CommacDTO> commacList(String ac_ccode){
        return sqlSession.selectList("commac.list", ac_ccode);
    }//commacList() end


    public int commacDelete(int ac_no) throws Exception{
        return sqlSession.delete("commac.delete", ac_no);
    }//commacDelete() end


    public int commacUpdate(CommacDTO commac){
        return sqlSession.update("commac.update", commac);
    }//commacUpdate() end

}//class end
