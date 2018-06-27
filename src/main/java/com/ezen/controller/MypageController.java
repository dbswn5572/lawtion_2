package com.ezen.controller;


import java.io.FileOutputStream;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lawtion.dao.AuctionBoardDAO;
import lawtion.dao.LoginDAO;
import lawtion.dao.NoticeDAO;
import lawtion.dao.joinLayerDAO;
import lawtion.dao.joinNormalDAO;
import lawtion.vo.NoticeVO;
import lawtion.vo.joinLayerVO;
import lawtion.vo.joinNormalVO;

@Controller
public class MypageController {
      @Autowired
      ServletContext context;
      
      @Autowired   
      SqlSessionTemplate sqlSession;
   
      @RequestMapping(value="/mypageuser.do", method=RequestMethod.GET)
      public ModelAndView mypageuser(String sid) {
         ModelAndView mv = new ModelAndView();
         
         System.out.println(sid);
         
         LoginDAO dao = sqlSession.getMapper(lawtion.dao.LoginDAO.class);
         AuctionBoardDAO dao2 = sqlSession.getMapper(AuctionBoardDAO.class);
         
         int bidding = dao2.execTotalBiddingCountId(sid);
         String name = dao.getUserName(sid);
         
         System.out.println(name);
         mv.addObject("name", name);
         mv.addObject("bidding", bidding);
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
      public ModelAndView mypage_user_info(String sid){
          ModelAndView mv = new ModelAndView();
          
          LoginDAO dao = sqlSession.getMapper(lawtion.dao.LoginDAO.class);
          joinNormalVO vo = dao.getResultVO(sid);
          
          mv.addObject("vo", vo);
          mv.addObject("sid", sid);
          
          mv.setViewName("/mypage/mypage_user_info");
         
         return mv;
      }
      
      @RequestMapping(value="/mypageuser_update.do", method=RequestMethod.POST)
      public ModelAndView mypageuser_update(joinNormalVO vo) throws Exception{
         ModelAndView mv = new ModelAndView();
        
         int result = 0;
         
         joinNormalDAO dao = sqlSession.getMapper(lawtion.dao.joinNormalDAO.class);
         result = dao.getUpdateResult(vo);
         
         if (result == 1) {
            mv.setViewName("redirect:/index.do");
         }
         
         return mv;
      }
      
      @RequestMapping(value="/mypagelawyer.do", method=RequestMethod.GET)
      public ModelAndView mypage_laywer(String sid){
    	  ModelAndView mv = new ModelAndView();
          
          System.out.println(sid);
          
          LoginDAO dao = sqlSession.getMapper(lawtion.dao.LoginDAO.class);
          
          String name = dao.getLawyerName(sid);
          
          System.out.println(name);
          mv.addObject("name", name);
          mv.setViewName("/mypage/mypage_lawyer");
          
          return mv;
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
      public ModelAndView mypage_lawyer_info(String sid){
    	  ModelAndView mv = new ModelAndView();
          
          LoginDAO dao = sqlSession.getMapper(lawtion.dao.LoginDAO.class);
          joinLayerVO vo = dao.getLayerResultVO(sid);
          
          mv.addObject("vo", vo);
          mv.addObject("sid", sid);
          
          mv.setViewName("/mypage/mypage_lawyer_info");
          
          return mv;
      }
      
      
      @RequestMapping(value="/mypagelawyerinfo_update.do", method=RequestMethod.POST)
  	public ModelAndView mypage_lawyer_check(joinLayerVO vo) throws Exception{ 
  		
  		ModelAndView mv = new ModelAndView();
  		joinLayerDAO dao = sqlSession.getMapper(lawtion.dao.joinLayerDAO.class);
  		
  		int result = 0;
  		
  		if(vo.getCode().equals("exist")){
  			result = dao.getUpdateResultNoFile(vo);
  		
  		}else{
  			UUID uuid = UUID.randomUUID();
  			String fname = vo.getFileBusiness().getOriginalFilename();
  			String rfname = uuid.toString()+"_"+fname;
  			String path = context.getRealPath("/upload/"+rfname);
  		
  			FileOutputStream fos = new FileOutputStream(path);
  			fos.write(vo.getFileBusiness().getBytes());
  			fos.close();
  		
  			vo.setBusiness(fname);
  			vo.setRbusiness(rfname);
  		
  			result = dao.getUpdateResult(vo);
  		}

  		if(result==1){
  			mv.setViewName("redirect:/index.do");
  		}
  		return mv;
  		
  	}
     
}
