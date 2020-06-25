package kr.koreait.hipTokSticker;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.koreait.mybatis.HipTokDAO;
import kr.koreait.vo.BoardList;
import kr.koreait.vo.GoodsVO;
import kr.koreait.vo.MemberVO;


/**
 * 이 클래스는 홈컨트롤러 입니다. 홈페이지에 관련된 기능들을 실행하는 컨트롤러 입니다.<br>
 * @author 이민형
 * @version 1.0
 * 
 *   
 *  
 */
@Controller
public class HomeController {
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	SqlSession sqlSession;
	HttpServletRequest request;
/**
 * 
 * @return	홈페이지에서 시작합니다.
 */
	@RequestMapping(value = "/", method = RequestMethod.GET)	
	public String itemGO(HttpServletRequest request, Model model, BoardList boardList, HttpSession session, GoodsVO vo) {
		System.out.println("itemGO 상품창으로");
		HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
		int pageSize = 9;
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch(NumberFormatException e) { }
		int totalCount = mapper.itemCount(boardList);
		
		//BoardList boardList = ctx.getBean("boardList", BoardList.class);
		boardList.initBoardList(pageSize, totalCount, currentPage);
		
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", boardList.getStartNo());
		hmap.put("endNo", boardList.getEndNo());
		boardList.setHmap(hmap);
		System.out.println("개수: " + totalCount + " boardList :" + boardList);
		boardList.setItemList(mapper.itemList(boardList));
		System.out.println(boardList);
		model.addAttribute("itemList", boardList);
		
		return "/goods/item";
	}
/**
 * 
 * @return	사이트 소개페이지로 이동합니다.
 */
	@RequestMapping("/introductionGO")
	public String introductionGo(HttpServletRequest request, Model model, MemberVO vo, HttpSession session) {
		System.out.println("introductionGo (사이트소개)페이지로 이동");
		return "introduction";
	}

}












