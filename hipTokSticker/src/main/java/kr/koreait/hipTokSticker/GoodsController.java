package kr.koreait.hipTokSticker;

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
import kr.koreait.vo.GoodsVO;
@Controller
public class GoodsController {
	
	@Autowired
	public SqlSession sqlSession, sqlSession1;
	
	
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
