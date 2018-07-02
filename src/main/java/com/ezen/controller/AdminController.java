package com.ezen.controller;



import java.util.ArrayList;

import javax.servlet.ServletContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import lawtion.dao.*;
import lawtion.vo.*;


@Controller
public class AdminController {
   @Autowired
   ServletContext context;

   @Autowired
   SqlSessionTemplate sqlSession;
   
   @RequestMapping(value="/admin_index.do", method=RequestMethod.GET)
   public String notice(){
      return "/admin/admin_index";
   }
   
   @RequestMapping(value="/admin_member_list.do",method=RequestMethod.GET)
   public ModelAndView admin_member_list(String sid){
      ModelAndView mv = new ModelAndView();
      joinNormalDAO dao = sqlSession.getMapper(joinNormalDAO.class);
      ArrayList<joinNormalVO> list = dao.getResultList();
      
      mv.addObject("sid",sid);
      mv.addObject("list",list);
      mv.setViewName("/admin/admin_member_list");
      return mv;
   }
   
   @RequestMapping(value="/admin_member_content.do",method=RequestMethod.GET)
   public ModelAndView admin_member_content(){
      ModelAndView mv = new ModelAndView();
      
      mv.setViewName("/admin/admin_member_content");
      return mv;
   }
   
   @RequestMapping(value="/admin.do",method=RequestMethod.GET)
   public ModelAndView admin(){
      ModelAndView mv = new ModelAndView();
      mv.setViewName("/admin/admin");
      return mv;
   }

   @RequestMapping(value="admin_precedent_normal.do",method=RequestMethod.GET)
   public ModelAndView admin_precedent_normal(String rpage){
      ModelAndView mv = new ModelAndView();
      
      PrecedentDAO dao = sqlSession.getMapper(PrecedentDAO.class);

      //����¡ ó�� - startCount, endCount ���ϱ�
         int startCount = 0;
         int endCount = 0;
         int pageSize = 10;   //���������� �Խù� ��
         int reqPage = 1;   //��û������   
         int pageCount = 1;   //��ü ������ ��
         int dbCount = dao.execTotalCount();   //DB���� ������ ��ü ���
         
         //�� ������ �� ���
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
            endCount = 10;
         }

         ArrayList<PrecedentVO> list = dao.getResultList(startCount, endCount);
         
         mv.addObject("dbCount", dbCount);
          mv.addObject("rpage", reqPage);
          mv.addObject("list",list);
      
      mv.setViewName("/admin/admin_precedent_normal");
      return mv;
   }
   
   @RequestMapping(value="admin_precedent_content.do", method=RequestMethod.GET)
   public ModelAndView admin_precedent_content(String no, String rno){
      ModelAndView mv = new ModelAndView();
      
      PrecedentDAO dao = sqlSession.getMapper(PrecedentDAO.class);

      PrecedentVO vo = dao.getResultVO(no);
               
      mv.addObject("no", no);
      mv.addObject("rno", rno);
      mv.addObject("vo", vo);
       mv.setViewName("/admin/admin_precedent_normal_content");
      
      return mv;
   }
   
   @RequestMapping(value="admin_precedent_normal_write.do",method=RequestMethod.GET)
   public ModelAndView adminprecedentnormalwrite(){
      ModelAndView mv = new ModelAndView();
      mv.setViewName("/admin/admin_precedent_normal_write");
      return mv;
   }
   
   @RequestMapping(value="admin_precedent_normal_ckeck.do",method=RequestMethod.POST)
   public String adminprecedentnormal_ckeck(PrecedentVO vo){
      String page="";
      
      PrecedentDAO dao = sqlSession.getMapper(lawtion.dao.PrecedentDAO.class);
      int result = dao.InsertPrecedent(vo);
      
      if(result ==1){
         page="redirect:/adminprecedentnormal.do";
      }
      
      return page;
   }
   
   @RequestMapping(value="admin_precedent_review_write.do",method=RequestMethod.GET)
   public ModelAndView adminprecedentreviewwrite(){
      ModelAndView mv = new ModelAndView();
      mv.setViewName("/admin/admin_precedent_normal_write");
      return mv;
   }
   
   @RequestMapping(value="admin_precedent_review.do",method=RequestMethod.GET)
   public ModelAndView admin_precedent_review(String rpage){
      ModelAndView mv = new ModelAndView();
      
      PrecedentDAO_review dao = sqlSession.getMapper(lawtion.dao.PrecedentDAO_review.class);

      //����¡ ó�� - startCount, endCount ���ϱ�
         int startCount = 0;
         int endCount = 0;
         int pageSize = 10;   //���������� �Խù� ��
         int reqPage = 1;   //��û������   
         int pageCount = 1;   //��ü ������ ��
         int dbCount = dao.execTotalCount();   //DB���� ������ ��ü ���
         
         //�� ������ �� ���
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
            endCount = 10;
         }

         ArrayList<PrecedentVO_review> list = dao.getResultList(startCount, endCount);
         
         mv.addObject("dbCount", dbCount);
          mv.addObject("rpage", reqPage);
          mv.addObject("list",list);
      
      mv.setViewName("/admin/admin_precedent_review");
      return mv;
   }
/*   @RequestMapping(value="/admin_member_list.do", method=RequestMethod.GET)
   public ModelAndView admin_member_list(String sid){
      ModelAndView mv = new ModelAndView();
      MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
      //String sid = (String)session.getAttribute("sid"); 
      //MemberDAO dao = new MemberDAO();
      ArrayList<MemberVO> list = dao.getResultList();
      //dao.closed();
      
      mv.addObject("sid",sid);
      mv.addObject("list",list);
      mv.setViewName("/admin/admin_member_list");
      return mv;
   }
   
   @RequestMapping(value="/admin_member_list.do", method=RequestMethod.GET)
   public String news(){
      return "/admin/admin_member_list";
   }
   @RequestMapping(value="/admin.do", method=RequestMethod.GET)
   public String noticeWrite(){
      return "/admin/admin_member_content";
   }*/
}