package lawtion.dao;

import lawtion.vo.*;

public interface LoginDAO {
	
	public int LoginLayerResult(joinLayerVO vo);
	public int LoginResult(joinNormalVO vo);
	public String getUserName(joinNormalVO vo);
}
