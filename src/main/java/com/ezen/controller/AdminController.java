package com.ezen.controller;



import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lawtion.dao.NoticeDAO;
import lawtion.dao.PrecedentDAO;
import lawtion.dao.PrecedentDAO_review;
import lawtion.dao.joinLayerDAO;
import lawtion.dao.joinNormalDAO;
import lawtion.vo.NoticeVO;
import lawtion.vo.PrecedentVO;
import lawtion.vo.PrecedentVO_review;
import lawtion.vo.joinLayerVO;
import lawtion.vo.joinNormalVO;


@Controller
public class AdminController {
   @Autowired
   ServletContext context;

   @Autowired
   SqlSessionTemplate sqlSession;
 
   
   @RequestMapping(value="/admin.do",method=RequestMethod.GET)
	public ModelAndView admin(String rpage,String sid){
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
		
		mv.addObject("rpage",reqPage);
		mv.addObject("sid",sid);
		mv.addObject("list",list);
		mv.setViewName("/admin/admin");
		return mv;
	}
   
   @RequestMapping(value="/admin_notice_content.do",method=RequestMethod.GET)
	public ModelAndView admin_notice_content(String no, String rno){
		ModelAndView mv = new ModelAndView();
		NoticeDAO dao = sqlSession.getMapper(lawtion.dao.NoticeDAO.class);
		NoticeVO vo = dao.getResultVO(no);
		
		dao.getUpdateHits(no);
		mv.addObject("vo",vo);
		mv.addObject("rno",rno);
		mv.setViewName("/admin/admin_notice_content");
		
		return mv;
	}
   
   @RequestMapping(value="/admin_notice_write",method=RequestMethod.GET)
	public ModelAndView admin_notice_write(String rpage, String sid){
		ModelAndView mv = new ModelAndView();
		NoticeDAO dao = sqlSession.getMapper(lawtion.dao.NoticeDAO.class);
		int startCount = 0;
		int endCount = 0;
		int pageSize = 5;	
		int reqPage = 1;	
		int pageCount = 1;
		int dbCount = dao.execTotalCount();	
				
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
			endCount = 5;
		}
				
		//String sid = (String)session.getAttribute("sid");
		ArrayList<NoticeVO> list = dao.getResultList(startCount, endCount);
		//dao.closed();
		
		mv.addObject("rpage",rpage);
		mv.addObject("sid",sid);
		mv.addObject("list",list);
		mv.setViewName("/admin/admin_notice_write");
		
		
		return mv;
	}
   
   @RequestMapping(value="/admin_write_check.do",method=RequestMethod.POST)
	public ModelAndView admin_write_check(NoticeVO vo) throws Exception{
		UUID uuid = UUID.randomUUID();
	
		String fname = vo.getFile().getOriginalFilename();
		String rfname = uuid.toString()+"_"+fname;
		String path = context.getRealPath("/upload/"+rfname);
		
		FileOutputStream fos = new FileOutputStream(path);
		fos.write(vo.getFile().getBytes());
		fos.close();
		
		vo.setFname(fname);
		vo.setRfname(rfname);
		
		ModelAndView mv = new ModelAndView();
		NoticeDAO dao = sqlSession.getMapper(lawtion.dao.NoticeDAO.class);
		
		int result = dao.getInsertResult(vo);
		
		
		
		if(result==1){
			mv.setViewName("redirect:/admin.do");
		}
		return mv;
		
	}
   
   
   @RequestMapping(value="/admin_notice_update.do",method=RequestMethod.GET)
	public ModelAndView admin_notice_update(String no,String rno){
		ModelAndView mv = new ModelAndView();
		NoticeDAO dao = sqlSession.getMapper(lawtion.dao.NoticeDAO.class);
		NoticeVO vo = dao.getResultVO(no);
	
		
		mv.addObject("no",no);
		mv.addObject("rno",rno);
		mv.addObject("vo",vo);
		mv.setViewName("admin/admin_notice_update");
		
		return mv;
	}
	
   @RequestMapping(value="/admin_notice_update_check.do", method=RequestMethod.POST)
	public ModelAndView admin_notice_check(NoticeVO vo) throws Exception{ 
		
		ModelAndView mv = new ModelAndView();
		NoticeDAO dao = sqlSession.getMapper(lawtion.dao.NoticeDAO.class);
		
		int result = 0;
		
		if(vo.getCode().equals("exist")){
			result = dao.getUpdateResultNoFile(vo);
		
		}else{
			UUID uuid = UUID.randomUUID();
			String fname = vo.getFile().getOriginalFilename();
			String rfname = uuid.toString()+"_"+fname;
			String path = context.getRealPath("/upload/"+rfname);
		
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(vo.getFile().getBytes());
			fos.close();
		
			vo.setFname(fname);
			vo.setRfname(rfname);
		
			result = dao.getUpdateResult(vo);
		}

		if(result==1){
			mv.setViewName("redirect:/admin.do");
		}
		return mv;
		
	}
   
   @RequestMapping(value="/admin_notice_delete.do",method=RequestMethod.GET)
	public ModelAndView admin_notice_delete(String no, String rno){
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("no",no);
		mv.addObject("rno",rno);
		mv.setViewName("/admin/admin_notice_delete");
		
		return mv;
	}
	
	@RequestMapping(value="/admin_notice_delete_check.do",method=RequestMethod.GET)
	public ModelAndView admin_notice_delete_check(NoticeVO vo,String no){
		ModelAndView mv = new ModelAndView();
		NoticeDAO dao = sqlSession.getMapper(lawtion.dao.NoticeDAO.class);
		
		String rfname = dao.getRfnameResult(no);
		int result = dao.getDeleteResult(vo);
		String path = context.getRealPath("/upload/"+rfname);
		
		if(result==1){
			File file = new File(path);
			if(file.exists()){
				file.delete();
			}
			mv.setViewName("redirect:/admin.do");
		}
		mv.addObject("no",no);
		mv.addObject("vo",vo);
		
		return mv;
	}

   
   @RequestMapping(value="admin_precedent_normal.do",method=RequestMethod.GET)
   public ModelAndView admin_precedent_normal(String rpage){
      ModelAndView mv = new ModelAndView();
      
      PrecedentDAO dao = sqlSession.getMapper(PrecedentDAO.class);

      //占쏙옙占쏙옙징 처占쏙옙 - startCount, endCount 占쏙옙占싹깍옙
         int startCount = 0;
         int endCount = 0;
         int pageSize = 10;   //占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쌉시뱄옙 占쏙옙
         int reqPage = 1;   //占쏙옙청占쏙옙占쏙옙占쏙옙   
         int pageCount = 1;   //占쏙옙체 占쏙옙占쏙옙占쏙옙 占쏙옙
         int dbCount = dao.execTotalCount();   //DB占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙체 占쏙옙占�
         
         //占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙 占쏙옙占�
         if(dbCount % pageSize == 0){
            pageCount = dbCount/pageSize;
         }else{
            pageCount = dbCount/pageSize+1;
         }

         //占쏙옙청 占쏙옙占쏙옙占쏙옙 占쏙옙占�
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
   
   @RequestMapping(value="admin_precedent_normal_content.do", method=RequestMethod.GET)
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
         page="redirect:/admin_precedent_normal.do";
      }
      
      return page;
   }
   
   @RequestMapping(value="/admin_precedent_normal_update.do",method=RequestMethod.GET)
   public ModelAndView admin_precedent_normal_update(String no,String rno){
      ModelAndView mv = new ModelAndView();
      PrecedentDAO dao = sqlSession.getMapper(lawtion.dao.PrecedentDAO.class);
      PrecedentVO vo = dao.getResultVO(no);
      
      mv.addObject("no",no);
      mv.addObject("rno",rno);
      mv.addObject("vo",vo);
      mv.setViewName("/admin/admin_precedent_normal_update");
      return mv;
   }

    @RequestMapping(value="/admin_precedent_normal_update_check.do", method=RequestMethod.POST)
  	public ModelAndView admin_precedent_normal_update_check(PrecedentVO vo){ 
  		
  		ModelAndView mv = new ModelAndView();
  		PrecedentDAO dao = sqlSession.getMapper(lawtion.dao.PrecedentDAO.class);
  		
  		int result = 0;
  		result = dao.getUpdateResult(vo);
  		
  
  		
  		mv.addObject("vo",vo);
  		
  		if(result==1){
  			mv.setViewName("redirect:/admin_precedent_normal.do");
  		}
  		
  		return mv;
  		
  	}
    
    @RequestMapping(value="/admin_precedent_normal_delete.do",method=RequestMethod.GET)
	public ModelAndView admin_precedent_normal_delete(String no, String rno){
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("no",no);
		mv.addObject("rno",rno);
		mv.setViewName("/admin/admin_precedent_normal_delete");
		
		return mv;
	}
	
    @RequestMapping(value="/admin_precedent_normal_delete_check.do",method=RequestMethod.GET)
	public ModelAndView admin_precedent_normal_delete_check(String no){
		ModelAndView mv = new ModelAndView();
		
		int result = 0;
		PrecedentDAO dao = sqlSession.getMapper(lawtion.dao.PrecedentDAO.class);
		
		
		result = dao.getDeleteResult_notice(no);
	
		
		if(result==1){
			mv.setViewName("redirect:/admin_precedent_normal.do");
		}

		
		return mv;
	}
   
   @RequestMapping(value="/admin_precedent_review.do",method=RequestMethod.GET)
   public ModelAndView admin_precedent_review(String rpage){
      ModelAndView mv = new ModelAndView();
      
      PrecedentDAO_review dao = sqlSession.getMapper(lawtion.dao.PrecedentDAO_review.class);

      //占쏙옙占쏙옙징 처占쏙옙 - startCount, endCount 占쏙옙占싹깍옙
         int startCount = 0;
         int endCount = 0;
         int pageSize = 10;   //占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쌉시뱄옙 占쏙옙
         int reqPage = 1;   //占쏙옙청占쏙옙占쏙옙占쏙옙   
         int pageCount = 1;   //占쏙옙체 占쏙옙占쏙옙占쏙옙 占쏙옙
         int dbCount = dao.execTotalCount();   //DB占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙체 占쏙옙占�
         
         //占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙 占쏙옙占�
         if(dbCount % pageSize == 0){
            pageCount = dbCount/pageSize;
         }else{
            pageCount = dbCount/pageSize+1;
         }

         //占쏙옙청 占쏙옙占쏙옙占쏙옙 占쏙옙占�
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
   
   @RequestMapping(value="/admin_precedent_review_write.do",method=RequestMethod.GET)
   public ModelAndView admin_precedent_review_write(){
      ModelAndView mv = new ModelAndView();
      mv.setViewName("/admin/admin_precedent_review_write");
      return mv;
   }
   
   @RequestMapping(value="admin_precedent_review_ckeck.do",method=RequestMethod.POST)
   public String admin_precedent_review_ckeck(PrecedentVO_review vo){
      String page="";
      
      PrecedentDAO_review dao = sqlSession.getMapper(lawtion.dao.PrecedentDAO_review.class);
      int result = dao.InsertPrecedent(vo);
      
      if(result ==1){
         page="redirect:/admin_precedent_review.do";
      }
      
      return page;
   }
   
   @RequestMapping(value="admin_precedent_review_content.do", method=RequestMethod.GET)
   public ModelAndView admin_precedent_review_content(String no, String rno){
      ModelAndView mv = new ModelAndView();
      
      PrecedentDAO_review dao = sqlSession.getMapper(PrecedentDAO_review.class);

      PrecedentVO_review vo = dao.getResultVO(no);
               
      mv.addObject("no", no);
      mv.addObject("rno", rno);
      mv.addObject("vo", vo);
       mv.setViewName("/admin/admin_precedent_review_content");
      
      return mv;
   }
   
   @RequestMapping(value="/admin_precedent_review_update.do",method=RequestMethod.GET)
   public ModelAndView admin_precedent_review_update(String no,String rno){
      ModelAndView mv = new ModelAndView();
      PrecedentDAO_review dao = sqlSession.getMapper(lawtion.dao.PrecedentDAO_review.class);
      PrecedentVO_review vo = dao.getResultVO(no);
      
      mv.addObject("no",no);
      mv.addObject("rno",rno);
      mv.addObject("vo",vo);
      mv.setViewName("/admin/admin_precedent_review_update");
      return mv;
   }

    @RequestMapping(value="/admin_precedent_review_update_check.do", method=RequestMethod.POST)
  	public ModelAndView admin_precedent_review_update_check(PrecedentVO_review vo){ 
  		
  		ModelAndView mv = new ModelAndView();
  		PrecedentDAO_review dao = sqlSession.getMapper(lawtion.dao.PrecedentDAO_review.class);
  		
  		int result = 0;
  		result = dao.getUpdateResult(vo);
  		
  
  		
  		mv.addObject("vo",vo);
  		
  		if(result==1){
  			mv.setViewName("redirect:/admin_precedent_review.do");
  		}
  		
  		return mv;
  		
  	}
   
   @RequestMapping(value="/admin_precedent_review_delete.do",method=RequestMethod.GET)
	public ModelAndView admin_precedent_review_delete(String no, String rno){
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("no",no);
		mv.addObject("rno",rno);
		mv.setViewName("/admin/admin_precedent_review_delete");
		
		return mv;
	}
	
   @RequestMapping(value="/admin_precedent_review_delete_check.do",method=RequestMethod.GET)
	public ModelAndView admin_precedent_review_delete_check(String no){
		ModelAndView mv = new ModelAndView();
		
		int result = 0;
		PrecedentDAO_review dao = sqlSession.getMapper(lawtion.dao.PrecedentDAO_review.class);
		
		
		result = dao.getDeleteResult_notice(no);
	
		
		if(result==1){
			mv.setViewName("redirect:/admin_precedent_review.do");
		}

		
		return mv;
	}
   
   @RequestMapping(value="/admin_user.do",method=RequestMethod.GET)
   public ModelAndView admin_user_list(String rpage){
      joinNormalDAO dao = sqlSession.getMapper(lawtion.dao.joinNormalDAO.class);
      //페이징 처리 - startCount, endCount 구하기
      int startCount = 0;
      int endCount = 0;
      int pageSize = 5;   //한페이지당 게시물 수
      int reqPage = 1;   //요청페이지   
      int pageCount = 1;   //전체 페이지 수
      int dbCount = dao.execTotalCount();   //DB에서 가져온 전체 행수
            
      //총 페이지 수 계산
      if(dbCount % pageSize == 0){
         pageCount = dbCount/pageSize;
      }else{
         pageCount = dbCount/pageSize+1;
      }

      //요청 페이지 계산
      if(rpage != null){            
         reqPage = Integer.parseInt(rpage); 
         startCount = (reqPage-1) * pageSize+1;   
         endCount = reqPage * pageSize; 
      }else{
         startCount = 1;
         endCount = 10;
      }      
      ArrayList<joinNormalVO> list = dao.getResultList(startCount, endCount);
      ModelAndView mv = new ModelAndView();
      
      mv.addObject("list",list);
      mv.addObject("dbCount", dbCount);
      mv.addObject("rpage", reqPage);
      mv.setViewName("/admin/admin_user");
      return mv;
   }
   
   
   
   @RequestMapping(value="/admin_lawyer.do",method=RequestMethod.GET)
   public ModelAndView admin_lawyer_list(String rpage){
      joinLayerDAO dao = sqlSession.getMapper(lawtion.dao.joinLayerDAO.class);
      //페이징 처리 - startCount, endCount 구하기
      int startCount = 0;
      int endCount = 0;
      int pageSize = 5;   //한페이지당 게시물 수
      int reqPage = 1;   //요청페이지   
      int pageCount = 1;   //전체 페이지 수
      int dbCount = dao.execTotalCount();   //DB에서 가져온 전체 행수
            
      //총 페이지 수 계산
      if(dbCount % pageSize == 0){
         pageCount = dbCount/pageSize;
      }else{
         pageCount = dbCount/pageSize+1;
      }

      //요청 페이지 계산
      if(rpage != null){            
         reqPage = Integer.parseInt(rpage); 
         startCount = (reqPage-1) * pageSize+1;   
         endCount = reqPage * pageSize; 
      }else{
         startCount = 1;
         endCount = 10;
      }      
      ArrayList<joinLayerVO> list = dao.getResultList(startCount, endCount);
      ModelAndView mv = new ModelAndView();
      
      mv.addObject("list",list);
      mv.addObject("dbCount", dbCount);
      mv.addObject("rpage", reqPage);
      mv.setViewName("/admin/admin_lawyer");
      return mv;
   }
   
   
   @RequestMapping(value="/lawyer_info.do",method=RequestMethod.GET)
   public ModelAndView lawyer_info(String id){
	   joinLayerDAO dao = sqlSession.getMapper(lawtion.dao.joinLayerDAO.class);
	   ModelAndView mv = new ModelAndView();
	   
	   joinLayerVO vo = dao.getResultVO(id);
	   
	   mv.addObject("vo",vo);
	   mv.setViewName("/admin/lawyer_info");
	   return mv;
   }
   
   @RequestMapping(value="/user_delete.do",method=RequestMethod.GET)
   public ModelAndView user_delete(String id){
	   ModelAndView mv = new ModelAndView();
	   
	   mv.addObject("id",id);
	   mv.setViewName("/admin/user_delete");
	   return mv;
	   
   }
   @RequestMapping(value="/delete_check.do",method=RequestMethod.GET)
   public ModelAndView delete_check(String id){
	   ModelAndView mv = new ModelAndView();
	   int result = 0;
	   
	   joinNormalDAO dao = sqlSession.getMapper(lawtion.dao.joinNormalDAO.class);
	   result = dao.getDeleteResult(id);
	   if(result==1){
		   mv.setViewName("redirect:/admin_user.do");
	   }
	   
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