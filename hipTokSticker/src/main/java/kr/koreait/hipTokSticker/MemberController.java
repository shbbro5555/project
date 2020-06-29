package kr.koreait.hipTokSticker;

import java.text.SimpleDateFormat;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.koreait.mybatis.HipTokDAO;
import kr.koreait.vo.BoardList;
import kr.koreait.vo.MemberVO;

/**
 * 이 클래스는 멤버컨트롤러 입니다. 회원가입, 로그인 등 회원에 관련된 기능들을 실행하는 컨트롤러입니다.<br>
 * @author 이민형
 * @version 1.0
 * 
 *   
 *  
 */
@Controller
public class MemberController {
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	SqlSession sqlSession;
	HttpServletRequest request;

	/*
	 * @RequestMapping("/idCheck") public String idCheck(HttpServletRequest request,
	 * Model model) { System.out.println("idCheck(아이디 중복확인) 페이지로"); return
	 * "member/idCheck"; }
	 */
/**
 * 
 * @return 회원가입 페이지로 이동합니다.
 */

	@RequestMapping("/joinGO")			
	public String joinGO(HttpServletRequest request, Model model) {
		System.out.println("joinGO(회원가입) 페이지로");
		return "member/join";
	}
/**
 * 
 * @return 로그인 페이지로 이동합니다.
 */
	@RequestMapping("/loginGO")			
	public String loginGO(HttpServletRequest request, Model model) {
		System.out.println("loginGO(로그인) 페이지로");
		String referrer = request.getHeader("Referer");
		request.getSession().setAttribute("prevPage", referrer);
		return "member/login";
	}
	/**
	 * @param loginDO(vo)		vo형식으로 데이터베이스의 아이디 비밀번호를 비교해서 존재하면 로그인을 하고, 존재하지 않으면 로그인이 되지 않도록 합니다.<br>
	 * @param sf				"yyyy년 MM월 dd일"서식으로 가입일을 설정해서 보내줍니다.<br>
	 * @return					로그인 후 성공하면 홈페이지로 이동하고, 실패하면 로그인창에 머뭅니다.
	 */
		@RequestMapping("/loginDO")
		public String loginDO(HttpServletRequest request, Model model, MemberVO vo)  {
			SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");			//	날짜 서식 변환
			HttpSession session = request.getSession();
			HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
			MemberVO result = mapper.loginDO(vo);
			System.out.println("loginDO 로그인 메서드 실행");
			String prevPage = request.getParameter("prevPage").substring(36);
			if(result == null) {
				//로그인 실패			
				model.addAttribute("check",true);
				return "/member/login";
			}else {
				//로그인 성공
				session.setAttribute("member", result);
				session.setAttribute("userRegidate", sf.format(result.getRegiDate()));		// 날짜 서식변환 적용
				return "redirect:"+ prevPage;
			}
		}
/**
 * @param session.invalidate() 	현재 로그인 되어있는 아이디정보의 세션을 지워줍니다.(로그아웃)<br>
 * @return 						로그아웃 후에 홈페이지로 이동합니다.
 */
	@RequestMapping("/logoutDO")
	public String logoutDO(HttpServletRequest request, Model model, MemberVO vo, HttpSession session) {
		System.out.println("logutDO 로그아웃 메서드 실행");
		session.invalidate();
		String referrer = request.getHeader("Referer").substring(36);
		if(referrer.contains("myPageGO") || referrer.contains("shoppingCartGO") || referrer.contains("memberOutGO") ||
				referrer.contains("Modify") || referrer.contains("Write")) {
			return "home";
		}
		else {
			return "redirect:" + referrer;
		}
	}
/**
 * 
 * @return	마이페이지로 이동합니다.
 */
	@RequestMapping(value="/myPageGO", method = RequestMethod.GET)
	public String myPageGO(HttpServletRequest request, Model model, HttpSession session, BoardList boardList) {
		System.out.println("myPageGO(마이페이지) 페이지로");
		
		// 내가쓴 글을 받아온다.
		System.out.println("QnASearch QnA글 검색 메서드 실행");
		HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
		int pageSize = 10;
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch(NumberFormatException e) { }
		int totalCount = mapper.MyPageSelectCount(boardList);
		
		//BoardList boardList = ctx.getBean("boardList", BoardList.class);
		boardList.initBoardList(pageSize, totalCount, currentPage);
		
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", boardList.getStartNo());
		hmap.put("endNo", boardList.getEndNo());
		boardList.setHmap(hmap);
		System.out.println("개수: " + totalCount + " boardList :" + boardList);
		boardList.setQnaList(mapper.searchMyWrite(boardList));
		System.out.println(boardList);
		model.addAttribute("MyWrite", boardList);
		
		String userId= request.getParameter("userId");
		mapper.showOrder(userId);
		model.addAttribute("order", userId);
		return "/member/myPage";
	}
/**
 * @param joinDO(vo)		vo형식으로 회원가입을 실행합니다.<br>
 * @return					회원가입 후에 홈페이지로 이동합니다.
 */
	@RequestMapping("/joinDO")									
	public String joinOK(HttpServletRequest request, Model model, MemberVO vo) {
		HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
		mapper.joinDO(vo);
		System.out.println("joinDO 회원가입 메서드 실행");
		return "home";
	}

/**
 * 
 * @return	회원정보 수정 페이지로 이동합니다.
 */
	@RequestMapping("/memberModifyGO")
	public String modifyGo(HttpServletRequest request, Model model, MemberVO vo) {
		System.out.println("memberModifyGO(회원정보 수정) 페이지로");
		return "/member/modify";
	}
/**
 * 
 * @param memberModifyDO(vo)	vo형식으로 회원정보를 받아와서 수정(업데이트) 합니다.<br>
 * @return						회원정보 수정후에 마이페이지로 이동합니다.
 */
	@RequestMapping("/memberModifyDO")
	public String memberModifyDO(HttpServletRequest request, Model model, MemberVO vo, HttpSession session) {
		HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
		System.out.println("memberModifyDO 회원정보 수정 메서드 실행");
		mapper.memberModifyDO(vo);
		session.setAttribute("member", vo);
		System.out.println(vo);
		return "/member/myPage";
	}
/**
 * 
 * @return	회원탈퇴페이지로 이동합니다.
 */
	@RequestMapping("/memberOutGO") 
	public String memberOutGO(HttpServletRequest request, Model model, MemberVO vo) {
		System.out.println("memberOutGO(회원탈퇴) 페이지로");
		return "/member/outPage";
	}
/**
 * 
 * @param memberOutDO 	vo형식으로 회원정보를 받아와서 화원탈퇴(삭제)합니다.<br>
 * @return				회원탈퇴 후 홈페이지로 이동합니다.
 */
	@RequestMapping("/memberOutDO")
	public String memberOutDO(HttpServletRequest request, Model model, MemberVO vo, HttpSession session) {
		HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
		System.out.println("memberOutDO 회원탈퇴 메서드 실행");
		mapper.memberOutDO(vo);
		session.invalidate();
		return "home";
	}
	
}
