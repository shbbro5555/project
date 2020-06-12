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
	public String goodsContentGO(HttpServletRequest request, Model model, HttpSession session, GoodsVO vo) {
		int idx = Integer.parseInt(request.getParameter("idx"));
		HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
		GoodsVO result = mapper.goodsContentGO(idx);
		
		System.out.println(result);
		model.addAttribute("item", result);
		return "/goods/goodsContent";
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
