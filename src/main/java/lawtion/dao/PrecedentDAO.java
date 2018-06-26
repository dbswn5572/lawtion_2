package lawtion.dao;

import java.sql.*;
import java.util.ArrayList;
import lawtion.vo.PrecedentVO;




public interface PrecedentDAO {
	public ArrayList<PrecedentVO> getSearchList(String search, int startCount, int endCount); 
	
	public ArrayList<PrecedentVO> getResultList(); 

	
	public PrecedentVO getResultVO(String no); 
	
	public void getUpdateHits(String no); 
	
	public void getDeleteResult(); 
	
	public int execTotalCount(); 
	
	public int execTotalCount1(String search);
	
	public int InsertPrecedent(PrecedentVO vo);
	public ArrayList<PrecedentVO> getResultList(int startCount, int endCount);
	public int getUpdateResult(String no);
	public int getDeleteResult(String no);
}
