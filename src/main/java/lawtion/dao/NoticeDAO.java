package lawtion.dao;

import java.util.ArrayList;


import lawtion.vo.NoticeVO;
import lawtion.vo.ReviewBoardVO;

public interface NoticeDAO {

   public ArrayList<NoticeVO> getResultList(int startConut, int endCount);
   public NoticeVO getResultVO(String no);
   public int getInsertResult(NoticeVO vo);
   public int getUpdateResult(NoticeVO vo);
   public int getUpdateResultNoFile(NoticeVO vo);
   public String getRfnameResult(String no);
   public int getDeleteResult(NoticeVO vo);
   public void getUpdateHits(String no);
   public int execTotalCount();
   public NoticeVO getNextPage(String no);
   public NoticeVO getPrePage(String no);
   
}