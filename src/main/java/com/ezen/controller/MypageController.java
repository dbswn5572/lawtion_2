package com.ezen.controller;


import javax.servlet.ServletContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lawtion.dao.LoginDAO;
import lawtion.dao.joinNormalDAO;
import lawtion.vo.joinNormalVO;

@Controller
public class MypageController {
		@Autowired
		ServletContext context;
		
		@Autowired	
		SqlSessionTemplate sqlSession;
	
	   @RequestMapping(value="/mypageuser.do", method=RequestMethod.GET)
	   public ModelAndView mypageuser(joinNormalVO vo) {
		   ModelAndView mv = new ModelAndView();
		   
		   LoginDAO dao = sqlSession.getMapper(lawtion.dao.LoginDAO.class);
		   String name = dao.getUserName(vo);
		   
		   mv.addObject("name", name);
		   mv.setViewName("/mypage/mypage_user");
		   
		   return mv;
	   }
	   
	   @RequestMapping(value="/mypageuserpro.do", method=RequestMethod.GET)
	   public String mypage_user_pro(){
	      return "/mypage/mypage_user_pro";
	   }
	   
	   @RequestMapping(value="/mypageusersuccess.do", method=RequestMethod.GET)
	   public String mypage_user_success(){
	      return "/mypage/mypage_user_success";
	   }
	   
	   @RequestMapping(value="/mypageuserinfo.do", method=RequestMethod.GET)
	   public String mypage_user_info(){
	      return "/mypage/mypage_user_info";
	   }
	   
	   @RequestMapping(value="/mypagelawyer.do", method=RequestMethod.GET)
	   public String mypage_laywer(){
	      return "/mypage/mypage_lawyer";
	   }
	   
	   @RequestMapping(value="/mypagelawyerpro.do", method=RequestMethod.GET)
	   public String mypage_lawyer_pro(){
	      return "/mypage/mypage_lawyer_pro";
	   }
	   
	   @RequestMapping(value="/mypagelawyersuccess.do", method=RequestMethod.GET)
	   public String mypage_lawyer_success(){
	      return "/mypage/mypage_lawyer_success";
	   }
	   
	   @RequestMapping(value="/mypagelawyerinfo.do", method=RequestMethod.GET)
	   public String mypage_lawyer_info(){
	      return "/mypage/mypage_lawyer_info";
	   }
}

