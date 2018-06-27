package lawtion.dao;

import java.util.ArrayList;

import lawtion.vo.*;

public interface LoginDAO {
   
   public int LoginLayerResult(joinLayerVO vo);
   public int LoginResult(joinNormalVO vo);
   public String getUserName(String sid);
   public String getLawyerName(String sid);
   public joinNormalVO getResultVO(String sid);
   public joinLayerVO getLayerResultVO(String sid);
   
}