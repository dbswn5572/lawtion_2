package com.ezen.controller;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lawtion.dao.NoticeDAO;
import lawtion.dao.TalkBoardDAO;
import lawtion.vo.NoticeVO;
import lawtion.vo.TalkBoardVO;

@Controller
public class NoticeController {
   
   @Autowired
   SqlSessionTemplate sqlSession;
   
   @RequestMapping(value="/notice.do", method=RequestMethod.GET)
   public ModelAndView notice(String rpage){
      ModelAndView mv = new ModelAndView();
      NoticeDAO dao = sqlSession.getMapper(lawtion.dao.NoticeDAO.class);
      
      
      int startCount = 0;
      int endCount = 0;
      int pageSize = 5;   
      int reqPage = 1;   
      int pageCount = 1;   
      int dbCount = dao.execTotalCount();
      
      if(dbCount % pageSize == 0){
         pageCount = dbCount/pageSize;
      }else{
         pageCount = dbCount/pageSize+1;
      }

      //��û ������ ���
      if(rpage != null){
         reqPage = Integer.parseInt(rpage);
         startCount = (reqPage-1) * pageSize+1; 
         endCount = reqPage *pageSize;
      }else{
         startCount = 1;
         endCount = 8;
      }
      
      
      ArrayList<NoticeVO> list = dao.getResultList(startCount, endCount);
      //dao.closed();
      
      mv.addObject("list",list);
      mv.addObject("dbCount",dbCount);
      mv.addObject("rpage",reqPage);
      mv.setViewName("/notice/notice");
      return mv;
   }

   @RequestMapping(value="/notice_content.do")
   public ModelAndView notice_content(String no, String rno){
      ModelAndView mv = new ModelAndView();
      NoticeDAO dao = sqlSession.getMapper(lawtion.dao.NoticeDAO.class);
      NoticeVO vo = dao.getResultVO(no);
      
      dao.getUpdateHits(no);
      mv.addObject("vo",vo);
      mv.addObject("rno",rno);
      mv.setViewName("/notice/notice_content");
   
      return mv;
   }
   
   @RequestMapping(value="/notice_content_pre.do",method=RequestMethod.GET)
   public ModelAndView notice_content_pre(String no, String rno){
      ModelAndView mv = new ModelAndView();
      
      NoticeDAO dao = sqlSession.getMapper(lawtion.dao.NoticeDAO.class);
      NoticeVO vo = dao.getNextPage(no);
      dao.getUpdateHits(no);
      
      mv.addObject("rno",rno);
      mv.addObject("vo",vo);

      mv.setViewName("/notice/notice_content");
      
      return mv;
   }
   
   @RequestMapping(value="/notice_content_next.do",method=RequestMethod.GET)
   public ModelAndView notice_content_next(String no, String rno){
      ModelAndView mv = new ModelAndView();
      
      NoticeDAO dao = sqlSession.getMapper(lawtion.dao.NoticeDAO.class);
      NoticeVO vo = dao.getPrePage(no);
      dao.getUpdateHits(no);
      
      mv.addObject("rno",rno);
      mv.addObject("vo",vo);

      mv.setViewName("/notice/notice_content");
      
      return mv;
   }
   
   
}