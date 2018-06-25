package com.ezen.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lawtion.dao.*;
import lawtion.vo.*;

@Controller
public class LoginController {
   
   @Autowired   
   SqlSessionTemplate sqlSession;
   
   @RequestMapping(value="/login.do", method=RequestMethod.GET)
   public String login(){
      return "/login/login";
   }
   
   @RequestMapping(value="/login_check.do", method=RequestMethod.POST)
   public ModelAndView login_check(joinNormalVO vo1, HttpSession session, joinLayerVO vo2, HttpServletRequest request, HttpServletResponse response) throws Exception{
      
      int result1 = login_check(vo2, session);
      ModelAndView mv = new ModelAndView();
      LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
      int result2 = dao.LoginResult(vo1);
      response.setContentType("text/html; charset=UTF-8");
      request.setCharacterEncoding("utf-8");
      PrintWriter w = response.getWriter();

      
      if((result2 == 1 && result1 == 0) || (result2 == 0 && result1 == 1)){
         if(result2==1){
         session.setAttribute("sid", vo1.getId());
         }else{
         session.setAttribute("sid", vo2.getId());
         }
         
         mv.setViewName("redirect:/index.do");
      }else{
    	  
    	  
    	 mv.setViewName("index");
    	 w.println("<script>");
    	 w.println("alert('���̵�� ��й�ȣ�� Ȯ���ϼ���.');");
    	 w.println("</script>");
    	 w.flush();
    	 
    	 
      }
      return mv;
   }
   
   
   
   public int login_check(joinLayerVO vo, HttpSession session){
      
      LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
      int result = dao.LoginLayerResult(vo);
      
      return result;
   }
   
   @RequestMapping(value="/logout.do", method=RequestMethod.GET)
   public String logout(HttpSession session){
      String sid = (String)session.getAttribute("sid");
      
      if(sid != null)
         session.invalidate();
      return "/index";
   }
}