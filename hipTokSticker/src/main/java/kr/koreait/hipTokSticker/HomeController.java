package kr.koreait.hipTokSticker;

import java.util.Locale;

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
	public String home(Locale locale, Model model) {
		System.out.println("홈페이지 시이~작");
		return "home";
	}
/**
 * 
 * @return	홈페이지로 이동합니다.
 */
	@RequestMapping("/homeGO")			
	public String home(HttpServletRequest request, Model model) {
		System.out.println("homeGO (홈페이지)로 이동");
		return "home";
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
/**
 * 		
 * @return	장바구니로 이동합니다. (아직기능구현안함)
 */
	@RequestMapping("/shoppingCartGO")
	public String shoppingCartGO(HttpServletRequest request, Model model, MemberVO vo, HttpSession session) {
		System.out.println("shoppingCartGO 장바구니 페이지로 이동");
		return "member/shoppingCart";
	}
	
	
}












