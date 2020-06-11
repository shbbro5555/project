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
	@RequestMapping("/uploadFormGO")
	public String uploadFormGO(HttpServletRequest request, Model model, HttpSession session) {
		return "/goods/uploadForm";
	}
	@RequestMapping("/uploadFormDO")
	public String uploadFormDO(HttpServletRequest request, Model model, HttpSession session, GoodsVO vo) {
		HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
		System.out.println(vo);
		mapper.uploadFormDO(vo);
		
		
		return "/goods/uploadForm";
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
