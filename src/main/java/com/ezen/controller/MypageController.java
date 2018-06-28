package com.ezen.controller;


import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import lawtion.vo.AuctionCommentVO;
import lawtion.vo.NoticeVO;
import lawtion.vo.joinLayerVO;
import lawtion.vo.joinNormalVO;

@Controller
public class MypageController {
      @Autowired
      ServletContext context;
      
      @Autowired   
      SqlSessionTemplate sqlSession;
      
      @RequestMapping(value="/mypage_check.do", method=RequestMethod.GET)
      public String mypage_check(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	  String s = "";
     	  
     	  
         	try{
         	s = session.getAttribute("sid").toString();
         	}catch (NullPointerException e){
         		
         	}
         
         AuctionBoardDAO dao2 = sqlSession.getMapper(AuctionBoardDAO.class);
         
         int a = dao2.WhoAreYou(s);
         
         if(a==0){
        	 return "redirect:/mypagelawyer.do";
         }else{
        	 return "redirect:/mypageuser.do";
         }
      }
   
      @RequestMapping(value="/mypageuser.do", method=RequestMethod.GET)
      public ModelAndView mypageuser(HttpSession session, HttpServletRequest request, HttpServletResponse response)throws Exception{
         ModelAndView mv = new ModelAndView();
         
        String s = "";
   	  	String n = "";
   	    String l = "";
   	  
   	  
   	try{
   	s = session.getAttribute("sid").toString();
   	if(session.getAttribute("no").toString()==null){
   		n="";
   	}else{
   		n = session.getAttribute("no").toString();
   	}
   	if(session.getAttribute("lid").toString()==null){
   		
   	}else{
   		l = session.getAttribute("lid").toString();
   	}
   	}catch (NullPointerException e){
   		
   	}
         
         LoginDAO dao = sqlSession.getMapper(lawtion.dao.LoginDAO.class);
         AuctionBoardDAO dao2 = sqlSession.getMapper(AuctionBoardDAO.class);
         int past = dao2.getPastBiddingCount(s);
         int bidding = 0;
         
         
       	if(l.equals(""))
       	{
       		bidding = dao2.execTotalBiddingCount(n);
       	}else{
           	 
       	}
       	
       	String name = dao.getUserName(s);
            
       	 mv.addObject("name", name);
       	 mv.addObject("past",past);
         mv.addObject("bidding", bidding);
         mv.setViewName("/mypage/mypage_user");
         
         
         
         
         
         return mv;
      }
      
      @RequestMapping(value="/mypageuser_check_user.do", method=RequestMethod.GET)
      public ModelAndView mypageuser_check_user(String sid, String no, String lid, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
         ModelAndView mv = new ModelAndView();
         
         LoginDAO dao = sqlSession.getMapper(lawtion.dao.LoginDAO.class);
         AuctionBoardDAO dao2 = sqlSession.getMapper(AuctionBoardDAO.class);
         
         int bidding = 0;
         String name = dao.getUserName(sid);
         
         dao2.getBiddingSuccess(lid);
         dao2.getBiddingSuccessBoard(sid);
         session.setAttribute("lid", lid);
         
         int past = dao2.getPastBiddingCount(sid);
         ArrayList<AuctionCommentVO> list = dao2.getPastBidding(sid);
         
         mv.addObject("list", list);
         mv.addObject("name", name);
         mv.addObject("past",past);
         mv.addObject("bidding", bidding);
         mv.setViewName("/mypage/mypage_user_success");
         
         return mv;
      }
      
      
      @RequestMapping(value="/mypageuserpro.do", method=RequestMethod.GET)
      public ModelAndView mypage_user_pro(HttpSession session, HttpServletRequest request, HttpServletResponse response)throws Exception{
    	  ModelAndView mv = new ModelAndView();
    	  
    	  String s = "";
    	  String n = "";
    	  String l = "";
    	  
    	  
    	try{
    	s = session.getAttribute("sid").toString();
    	if(session.getAttribute("no").toString()==null){
    		n="";
    	}else{
    		n = session.getAttribute("no").toString();
    	}
    	if(session.getAttribute("lid").toString()==null){
    		
    	}else{
    		l = session.getAttribute("lid").toString();
    	}
    	}catch (NullPointerException e){
    		
    	}
      
    	  LoginDAO dao = sqlSession.getMapper(lawtion.dao.LoginDAO.class);
          AuctionBoardDAO dao2 = sqlSession.getMapper(AuctionBoardDAO.class);
          int past = dao2.getPastBiddingCount(s);
          int bidding = 0;
          if(l.equals("")){
        	 ArrayList<AuctionCommentVO> list = dao2.getReplyListBiddingNo(n);
             bidding = dao2.execTotalBiddingCount(n);
             mv.addObject("list", list);
             
          }else{
        	 
          }
          String name = dao.getUserName(s);
          
          mv.addObject("name", name);
          mv.addObject("bidding", bidding);
          mv.addObject("past",past);
          mv.setViewName("/mypage/mypage_user_pro");
          
          return mv;
      }
      
      @RequestMapping(value="/mypageusersuccess.do", method=RequestMethod.GET)
      public ModelAndView mypage_user_success(HttpSession session, HttpServletRequest request, HttpServletResponse response)throws Exception{
    	  ModelAndView mv = new ModelAndView();
    	  
    	  String s = "";
    	  String n = "";
    	  String l = "";
    	  
    	  
    	try{
    	s = session.getAttribute("sid").toString();
    	if(session.getAttribute("no").toString()==null){
    		n="";
    	}else{
    		n = session.getAttribute("no").toString();
    	}
    	if(session.getAttribute("lid").toString()==null){
    		
    	}else{
    		l = session.getAttribute("lid").toString();
    	}
    	}catch (NullPointerException e){
    		
    	}
      
    	  LoginDAO dao = sqlSession.getMapper(lawtion.dao.LoginDAO.class);
          AuctionBoardDAO dao2 = sqlSession.getMapper(AuctionBoardDAO.class);
          int past = dao2.getPastBiddingCount(s);
          int bidding = 0;
          String name = dao.getUserName(s);
          if(l.equals("")){
             bidding = dao2.execTotalBiddingCount(n);
             ArrayList<AuctionCommentVO> list = dao2.getPastBidding(s);
        	 mv.addObject("list", list);
             
          }else{
        	 ArrayList<AuctionCommentVO> list = dao2.getPastBidding(s);
        	 mv.addObject("list", list);
          }
          
          
          mv.addObject("name", name);
          mv.addObject("bidding", bidding);
          mv.addObject("past",past);
          mv.setViewName("/mypage/mypage_user_success");
          
          return mv;
      }
      
      @RequestMapping(value="/mypageuserinfo.do", method=RequestMethod.GET)
      public ModelAndView mypage_user_info(HttpSession session, HttpServletRequest request, HttpServletResponse response)throws Exception{
          ModelAndView mv = new ModelAndView();
          
          String s = "";
     	  
     	  
     	try{
     	s = session.getAttribute("sid").toString();
     	}catch (NullPointerException e){
     		
     	}
          
          LoginDAO dao = sqlSession.getMapper(lawtion.dao.LoginDAO.class);
          joinNormalVO vo = dao.getResultVO(s);
          
          mv.addObject("vo", vo);
          
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
      public ModelAndView mypage_laywer(HttpSession session, HttpServletRequest request, HttpServletResponse response)throws Exception{
    	  ModelAndView mv = new ModelAndView();
    	  
    	  String s = "";
     	  
     	  
       	try{
       	s = session.getAttribute("sid").toString();
       	}catch (NullPointerException e){
       		
       	}
          
          LoginDAO dao = sqlSession.getMapper(lawtion.dao.LoginDAO.class);
          AuctionBoardDAO dao2 = sqlSession.getMapper(AuctionBoardDAO.class);
          
          String name = dao.getLawyerName(s);
          
          mv.addObject("name", name);
          mv.setViewName("/mypage/mypage_lawyer");
          
          return mv;
      }
      
      @RequestMapping(value="/mypagelawyerpro.do", method=RequestMethod.GET)
      public ModelAndView mypage_lawyer_pro(HttpSession session, HttpServletRequest request, HttpServletResponse response)throws Exception{
    	  ModelAndView mv = new ModelAndView();
    	  
    	
    	  String s = "";
    	  
    	  
    	  try{
    		  s = session.getAttribute("sid").toString();
    	  }catch (NullPointerException e){
    		
    	  }
    	  
    	  
    	  LoginDAO dao = sqlSession.getMapper(lawtion.dao.LoginDAO.class);
          AuctionBoardDAO dao2 = sqlSession.getMapper(AuctionBoardDAO.class);
          int bidding = 0;
          
          
          ArrayList<AuctionCommentVO> list = dao2.getReplyListBiddingIdLawyer(s);
          
          
          
          String name = dao.getUserName(s);
          
          mv.addObject("list", list);
          mv.addObject("name", name);
          mv.addObject("bidding", bidding);
          mv.setViewName("/mypage/mypage_lawyer_pro");
          
          return mv;
          
      }
      
      @RequestMapping(value="/mypagelawyersuccess.do", method=RequestMethod.GET)
      public ModelAndView mypage_lawyer_success(HttpSession session, HttpServletRequest request, HttpServletResponse response)throws Exception{
    	  ModelAndView mv = new ModelAndView();
    	  
      	
    	  String s = "";
    	  
    	  
    	  try{
    		  s = session.getAttribute("sid").toString();
    	  }catch (NullPointerException e){
    		
    	  }
    	  
    	  
    	  LoginDAO dao = sqlSession.getMapper(lawtion.dao.LoginDAO.class);
          AuctionBoardDAO dao2 = sqlSession.getMapper(AuctionBoardDAO.class);
          int bidding = 0;
          
          
          ArrayList<AuctionCommentVO> list = dao2.getReplyListBiddingIdLawyerPast(s);
          
          
          
          String name = dao.getUserName(s);
          
          mv.addObject("list", list);
          mv.addObject("name", name);
          mv.addObject("bidding", bidding);
          mv.setViewName("/mypage/mypage_lawyer_pro");
          
          return mv;
      }
      
      @RequestMapping(value="/mypagelawyerinfo.do", method=RequestMethod.GET)
      public ModelAndView mypage_lawyer_info(HttpSession session, HttpServletRequest request, HttpServletResponse response)throws Exception{
    	  ModelAndView mv = new ModelAndView();
          
          String s = "";
     	  
     	  
     	try{
     	s = session.getAttribute("sid").toString();
     	}catch (NullPointerException e){
     		e.printStackTrace();
     	}
          
          LoginDAO dao = sqlSession.getMapper(lawtion.dao.LoginDAO.class);
          joinLayerVO vo = dao.getLayerResultVO(s);
         
          mv.addObject("vo", vo);
          
          
          mv.setViewName("/mypage/mypage_lawyer_info");
          
          return mv;
      }
      
      
      @RequestMapping(value="/mypagelawyerinfo_update.do", method=RequestMethod.POST)
  	public ModelAndView mypage_lawyer_check(HttpSession session, HttpServletRequest request, HttpServletResponse response,joinLayerVO vo) throws Exception{ 
  		
  		ModelAndView mv = new ModelAndView();
  		 String s = "";
    	  
    	 System.out.println("----------------------1"); 
      	try{
      	s = session.getAttribute("sid").toString();
      	}catch (NullPointerException e){
      		e.printStackTrace();
      	}
      	System.out.println("----------------------2");
  		joinLayerDAO dao = sqlSession.getMapper(lawtion.dao.joinLayerDAO.class);
  		
  		int result = 0;
  		System.out.println("----------------------3");
  		if(vo.getCode().equals("exist")){
  			result = dao.getUpdateResultNoFile(vo);
  			System.out.println("----------------------4");
  		}else{
  			UUID uuid = UUID.randomUUID();
  			System.out.println("----------------------4---2");
  			String business = vo.getFileBusiness().getOriginalFilename();
  			System.out.println("----------------------4---3");
  			String rbusiness = uuid.toString()+"_"+business;
  			
  			String path = context.getRealPath("/businessUpload/"+rbusiness);
  			
  			FileOutputStream fos = new FileOutputStream(path);
  			fos.write(vo.getFileBusiness().getBytes());
  			fos.close();
  		
  			vo.setBusiness(business);
  			vo.setRbusiness(rbusiness);
  		
  			result = dao.getUpdateResult(vo);
  		}
  		System.out.println("----------------------8");
  		if(result==1){
  			mv.setViewName("redirect:/index.do");
  		}
  		return mv;
  		
  	}
     
}
