package lawtion.dao;


import java.util.ArrayList;

import lawtion.vo.PrecedentVO_review;

public interface PrecedentDAO_review {
	
	public ArrayList<PrecedentVO_review> getSearchList(String search, int startCount, int endCount); 
	
	public ArrayList<PrecedentVO_review> getResultList(); 
	
	public PrecedentVO_review getResultVO(String no); 
	
	public void getUpdateHits(String no); 
	
	public void getDeleteResult(); 
	
	public int execTotalCount(); 
	public int execTotalCount1(String search); 
	
	public ArrayList<PrecedentVO_review> getResultList(int startCount, int endCount); 
	
	public int InsertPrecedent(PrecedentVO_review vo);
	
	public int getDeleteResult_notice(String no);
	
	public int getUpdateResult(PrecedentVO_review vo);
}
