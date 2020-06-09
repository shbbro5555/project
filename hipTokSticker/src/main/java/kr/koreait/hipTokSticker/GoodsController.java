package kr.koreait.hipTokSticker;

import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.koreait.Utill.FileUtills;
import kr.koreait.mybatis.HipTokDAO;
import kr.koreait.vo.GoodsVO;
@Controller
public class GoodsController {
	
	@Autowired
	public SqlSession sqlSession, sqlSession1;
	
	@Resource(name= "uploadPath")
	private String uploadPath;
	
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
//	업로드
	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public void uploadFormGET(Locale locale, Model model) {
		logger.info("uploadForm GET");
		
	}
	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
	public String uploadFormPOST(MultipartFile file, Model model, GoodsVO goodsVO) throws Exception {
		HipTokDAO mapper = sqlSession1.getMapper(HipTokDAO.class);
		int idx = 1;
		goodsVO.setIdx(idx);
		System.out.println(goodsVO.getIdx());
		String savedFileName = FileUtills.uploadFile(file,uploadPath, idx);
		goodsVO.setGoods_value(savedFileName);
		System.out.println(goodsVO);
		mapper.uploadFile(goodsVO);
		model.addAttribute("savedFileName", savedFileName);
		
		return "home";
	}
	@RequestMapping("/PouchGO")
	public String PouchGO(HttpServletRequest request, Model model, HttpSession session) {
		return "/goods/Pouch";
	}
	@RequestMapping("/StickerGO")
	public String StickerGO(HttpServletRequest request, Model model, HttpSession session) {
		return "/goods/Sticker";
	}
	@RequestMapping("/CaseGO")
	public String CaseGO(HttpServletRequest request, Model model, HttpSession session) {
		return "/goods/Case";
	}
}
