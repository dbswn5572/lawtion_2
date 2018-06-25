package com.ezen.controller;

import java.util.ArrayList;

import javax.servlet.ServletContext;

import lawtion.dao.AuctionBoardDAO;
import lawtion.vo.AuctionCommentVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AuctionCommentController{
	@Autowired
	ServletContext context;

	@Autowired
	SqlSessionTemplate sqlSession;
	
	/* �Խ��� ��� ��� */
	@RequestMapping(value="/reply_write_check.do", method=RequestMethod.GET)
	@ResponseBody
	public String reply_write_check(String id, String content, String no){
		//System.out.println("content=" + content);
		//System.out.println("no=" + no);
		AuctionCommentVO vo = new AuctionCommentVO();
		AuctionBoardDAO dao = sqlSession.getMapper(AuctionBoardDAO.class);
		
		vo.setId(id);
		vo.setContent(content);
		vo.setAno(Integer.parseInt(no));
		vo.setLawyer(dao.WhoAreYou(id));
				
		//��� �߰��۾� : CGV_BOARD_REPLY		
		int result = dao.getReplyInsertResult(vo);
		//dao.closed();
				
		return String.valueOf(result);
	}
	
	/* 
	 * 
	 * �ӽ÷� ���� ���� ��û�ϱ�
	 * 
	 * */
	@RequestMapping(value="/reply_write_check2.do", method=RequestMethod.GET)
	@ResponseBody
	public String reply_write_check2(String id, String content, String no){
		//System.out.println("content=" + content);
		//System.out.println("no=" + no);
		AuctionCommentVO vo = new AuctionCommentVO();
		AuctionBoardDAO dao = sqlSession.getMapper(AuctionBoardDAO.class);
		
		vo.setId(id);
		vo.setContent(content);
		vo.setAno(Integer.parseInt(no));
		vo.setLawyer(2);
				
		//��� �߰��۾� : CGV_BOARD_REPLY	
		int result = dao.getReplyInsertResult(vo);
		//dao.closed();
		
		return String.valueOf(result);
	}
	
	/* �Խ��� ��� �������� */
	@RequestMapping(value="/reply_list.do", method=RequestMethod.GET)
	@ResponseBody
	public JSONArray reply_list(String no){
		//System.out.println("no=" + no);
		
		JSONArray jarray = new JSONArray();		
		
		//��۰������� - ArrayList<BoardReplyVO>	
		AuctionBoardDAO dao = sqlSession.getMapper(AuctionBoardDAO.class);
		ArrayList<AuctionCommentVO> list = dao.getReplyList(no);
		//dao.closed();
		AuctionCommentVO cvo = new AuctionCommentVO();
		cvo.setTotal(dao.execTotalCommentCount(no));
		cvo.setTotal2(dao.execTotalBiddingCount(no));
		
		
		//ArrayList<BoardReplyVO> Ÿ�� �����͸� JSON ���·� �ٲپ ����
		for(AuctionCommentVO vo:list){
			JSONObject obj = new JSONObject();
			obj.put("id",vo.getId());
			obj.put("rid", vo.getAno());
			obj.put("content", vo.getContent());
			obj.put("rdate", vo.getCdate());
			obj.put("bid", vo.getCno());
			obj.put("total", cvo.getCtotal());
			obj.put("total2", cvo.getBtotal());
			obj.put("lawyer", vo.getLawyer());
			
			jarray.add(obj);
		}
		
		return jarray;
		
	}

}
