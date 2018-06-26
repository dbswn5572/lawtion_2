package lawtion.dao;

import java.sql.*;
import java.util.*;
import lawtion.vo.*;

public interface joinNormalDAO {
   public int getResult(joinNormalVO vo);

   //�쉶�썝 �젙蹂� 由ъ뒪�듃 異쒕젰
   public int getUpdateResult(joinNormalVO vo);
   public int execTotalCount();
   public ArrayList<joinNormalVO> getResultList(int startCount, int endCount);
   public int getDeleteResult(String id);
  
   
}