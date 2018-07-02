package lawtion.dao;

import java.sql.*;
import java.util.*;
import lawtion.vo.*;

public interface joinNormalDAO {
   public int getResult(joinNormalVO vo);

   //회원 정보 리스트 출력
   public ArrayList<joinNormalVO> getResultList();
   public int getUpdateResult(joinNormalVO vo);
   
}