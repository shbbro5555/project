package kr.koreait.hipTokSticker;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.koreait.Utill.UploadFileUtils;
import kr.koreait.mybatis.HipTokDAO;
import kr.koreait.vo.BoardList;
import kr.koreait.vo.GoodsQnAVO;
import kr.koreait.vo.GoodsReviewVO;
import kr.koreait.vo.GoodsVO;
@Controller
public class GoodsController {
	
	@Autowired
	public SqlSession sqlSession;
	
	
	@Resource(name= "uploadPath")
	private String uploadPath;
	
	
//	업로드
	@RequestMapping("/uploadFormGO")
	public String uploadFormGO(HttpServletRequest request, Model model, HttpSession session) {
		return "/goods/uploadForm";
	}
	@RequestMapping("/uploadFormDO")
	public String uploadFormDO(MultipartFile file,HttpServletRequest request, Model model, HttpSession session, GoodsVO vo) {
		HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
		try {
			String fileName = UploadFileUtils.fileUpload(uploadPath, file);
			System.out.println(fileName);
			vo.setFileName(fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(vo);
		mapper.uploadFormDO(vo);
		model.addAttribute("file", file);
		
		return "/goods/uploadForm";
	}
	
	@RequestMapping("/itemGO")
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
	
	@RequestMapping("/goodsContentGO")
	public String goodsContentGO(HttpServletRequest request, Model model, HttpSession session, GoodsVO vo, BoardList boardList) {
		System.out.println("goodsContentGO 상품내용창으로");
		int idx = Integer.parseInt(request.getParameter("idx"));
		HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
		GoodsVO result = mapper.goodsContentGO(idx);
		model.addAttribute("item", result);
		
//	페이징처리 시작
		int pageSize = 5;
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch(NumberFormatException e) { }
//	리뷰 페이징
		int totalCount = mapper.goodsReviewCount(boardList);
		boardList.setIdx(idx);
		//BoardList boardList = ctx.getBean("boardList", BoardList.class);
		boardList.initBoardList(pageSize, totalCount, currentPage);
		
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", boardList.getStartNo());
		hmap.put("endNo", boardList.getEndNo());
		boardList.setHmap(hmap);
		System.out.println("개수: " + totalCount + " boardList :" + boardList);
		boardList.setReviewList(mapper.goodsReviewList(boardList));
		System.out.println(boardList);
		model.addAttribute("reviewList", boardList);
//	QnA 페이징
		totalCount = mapper.goodsQnACount(boardList);
		boardList.setIdx(idx);
		//BoardList boardList = ctx.getBean("boardList", BoardList.class);
		boardList.initBoardList(pageSize, totalCount, currentPage);
		
		hmap = new HashMap<String, Integer>();
		hmap.put("startNo", boardList.getStartNo());
		hmap.put("endNo", boardList.getEndNo());
		boardList.setHmap(hmap);
		System.out.println("개수: " + totalCount + " boardList :" + boardList);
		boardList.setGoodsQnAList(mapper.goodsQnAList(boardList));
		System.out.println(boardList);
		model.addAttribute("QnAList", boardList);
		
		return "/goods/goodsContent";
	}
	
	
	@RequestMapping("/goodsReviewWriteGO")
	public String goodsReviewWriteGO(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("goodsReviewGO 리뷰등록창으로");
		int idx = Integer.parseInt(request.getParameter("idx"));
		model.addAttribute("idx", idx);
		return "/goods/goodsReviewWrite";
	}
	@RequestMapping("/goodsReviewWriteDO")
	public String goodsReviewWriteDO(HttpServletRequest request, Model model, HttpSession session, GoodsReviewVO vo, MultipartFile file) {
		System.out.println("goodsReviewWriteDO 리뷰등록하기");
		HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
		try {
			String fileName = UploadFileUtils.fileUpload(uploadPath, file);
			System.out.println(fileName);
			vo.setFilename(fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(vo);
		model.addAttribute("file", file);
		mapper.goodsReviewWriteDO(vo);
		return "redirect:goodsContentGO?idx="+request.getParameter("main_idx");
	}
	@RequestMapping("/goodsReviewContentGO")
	public String goodsReviewContentGO(HttpServletRequest request, Model model, HttpSession session, GoodsReviewVO vo) {
		System.out.println("reviewContentGO 상품리뷰 내용창으로");
		int idx = Integer.parseInt(request.getParameter("idx"));
		HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
		vo = mapper.selectGoodsReview(idx);
		model.addAttribute("review", vo);
		System.out.println(vo);
		return "/goods/goodsReviewContent";
	}
	
	
	

	
	@RequestMapping("/goodsQnAWriteGO")
	public String goodsQnAWriteGO(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("goodsQnAWriteGO QnA등록창으로");
		int idx = Integer.parseInt(request.getParameter("idx"));
		model.addAttribute("idx", idx);
		return "/goods/goodsQnAWrite";
	}
	
	@RequestMapping("/goodsQnAWriteDO")
	public String goodsQnAWriteDO(HttpServletRequest request, Model model, HttpSession session, GoodsQnAVO vo) {
		System.out.println("goodsQnAWriteDO QnA등록하기");
		HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
		
		System.out.println(vo);
		mapper.goodsQnAWriteDO(vo);
		return "redirect:goodsContentGO?idx="+request.getParameter("main_idx");
	}
	
	
	@RequestMapping("/orderFormGO")
	public String orderFormGO(HttpServletRequest request, Model model, HttpSession session, GoodsQnAVO vo) {
		
		
		String item_name = request.getParameter("item_name");
		int count = Integer.parseInt(request.getParameter("count"));
		int price = Integer.parseInt(request.getParameter("price"));
		System.out.println(item_name + count + price);
		
		model.addAttribute("item_name", item_name);
		model.addAttribute("count", count);
		model.addAttribute("price", price);
		
		return "/goods/order";
	}
	
	
	@RequestMapping("/pouchGO")
	public String pouchGO(HttpServletRequest request, Model model, HttpSession session) {
		return "/goods/pouch";
	}
	@RequestMapping("/stickerGO")
	public String stickerGO(HttpServletRequest request, Model model, HttpSession session) {
		return "/goods/sticker";
	}
	@RequestMapping("/caseGO")
	public String caseGO(HttpServletRequest request, Model model, HttpSession session) {
		return "/goods/case";
	}
	
	
}
