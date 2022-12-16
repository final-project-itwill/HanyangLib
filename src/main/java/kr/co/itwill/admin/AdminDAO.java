package kr.co.itwill.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {

    @Autowired
    SqlSession sqlSession;

}//class end
