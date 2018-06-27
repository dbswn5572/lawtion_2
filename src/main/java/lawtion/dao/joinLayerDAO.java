package lawtion.dao;

import java.sql.*;
import java.util.*;

import lawtion.vo.*;

public interface joinLayerDAO {
	
	public int getInsertResult(joinLayerVO vo);
	public int execTotalCount();
	public ArrayList<joinLayerVO> getResultList(int startCount, int endCount);
	public joinLayerVO getResultVO(String id);
	public int getUpdateResult(joinLayerVO vo);
	public int getUpdateResultNoFile(joinLayerVO vo);
}
