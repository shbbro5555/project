package kr.koreait.hipTokSticker;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.koreait.mybatis.HipTokDAO;
import kr.koreait.vo.BoardList;
import kr.koreait.vo.MemberVO;
import kr.koreait.vo.NoticeComment;
import kr.koreait.vo.NoticeVO;
import kr.koreait.vo.QnAComment;
import kr.koreait.vo.QnAVO;

/**
 * 이 클래스는 보드컨트롤러 입니다. 게시판에 관련된 기능들을 실행하는 컨트롤러입니다.<br>
 * @author 이민형
 * @version 1.0
 * 
 *   
 *  
 */

@Controller
public class BoardController {
		
//		private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
		@Autowired
		SqlSession sqlSession;
		HttpServletRequest request;
	
/**
 * 
 * @param noticeGO(vo)	NoticeVO에서 vo를 받아와서 ArrayList형식으로 저장해서 페이지에 공지글을 띄웁니다.<br>
 * @return				공지글을 띄우고 공지글 페이지로 이동합니다.
 */
	@RequestMapping("/noticeGO")
	public String noticeGO(HttpServletRequest request, Model model, NoticeVO vo, HttpSession session) {
		System.out.println("noticeGO(공지글) 페이지로, 메서드1 실행");
		HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
		int pageSize = 10;
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch(NumberFormatException e) { }
		int totalCount = mapper.selectCount();
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationCTX.xml");
		BoardList noticeList = ctx.getBean("boardList", BoardList.class);
		noticeList.initBoardList(pageSize, totalCount, currentPage);
		
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNO", noticeList.getStartNo());
		hmap.put("endNO", noticeList.getEndNo());
		noticeList.setNoticeList(mapper.noticeList(hmap));
		model.addAttribute("noticeList", noticeList);
		
		return "/board/notice";
	}
	
/**
 * 
 * @return	공지글 쓰기 페이지로 이동합니다.
 */
		@RequestMapping("/noticeWriteGO")
		public String noticeWriteGO(HttpServletRequest request, Model model, MemberVO vo, HttpSession session) {
			System.out.println("noticeWriteGO(공지글 쓰기) 페이지로");
			return "/board/noticeWrite";
		}
/**
 * 
 * @param noticeWriteDO(vo)	NoticeVO에서 vo를 받아와 공지글을 씁니다.<br>
 * @return					공지글을 쓰고 공지글 페이지로 이동합니다.
 */
		@RequestMapping("/noticeWriteDO")
		public String noticeWrite(HttpServletRequest request, Model model, NoticeVO vo, HttpSession session)  {
			System.out.println("noticeWriteDO 공지글 쓰기 메서드 실행");
			HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
			mapper.noticeWriteDO(vo);
			return "redirect:noticeGO";
		}
/**
 * 
 * @param noticeNOV(idx) 		공지글 중에서 클릭하는 글의 idx를 받아와서 그 idx의 글의 조회수를 증가시킵니다.<br>
 * @param noticeContentGO(idx)	idx를 받아온 글의 내용을 result변수에 넣고 notice에 넣어줘서 view단에서 ${notice}형식으로 쓸 수 있도록 지정해줍니다.<br>
 * @return						공지글 내용 페이지로 이동합니다.
 */
		@RequestMapping("/noticeContentGO")
		public String noticeContentGO(HttpServletRequest request, Model model, NoticeComment vo, HttpSession session) {
			System.out.println("noticeContenGO(공지글 내용) 페이지로, 메서드 실행");
			int idx = Integer.parseInt(request.getParameter("idx"));
			HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
			mapper.noticeNOV(idx);	// 조회수 증가
			NoticeVO result = mapper.noticeContentGO(idx);	// 내용받아옴
			model.addAttribute("notice", result);
			
			// 공지글 댓글 목록 받아옴
			ArrayList<NoticeComment> list = mapper.noticeComment(idx);
			model.addAttribute("comment", list);
			return "/board/noticeContent";
			
		}
		
		
//		1건의 공지글(해당 공지글)을 삭제한다. 공지글에 담겨있는 댓글들도 삭제한다.
		@RequestMapping("/noticeDelete")
		public String noticeDelete(HttpServletRequest request, Model model, NoticeComment vo1, NoticeVO vo, HttpSession session) {
			System.out.println("noticeDelete 공지글 삭제 메서드 실행");
			HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
			mapper.noticeDelete(vo);
			mapper.noticeDelete2(vo1);
			return "redirect:noticeGO";
		}
				
/**
 * 
 * @return			공지글 수정 페이지로 이동합니다.
 */
		@RequestMapping("/noticeModifyGO")
		public String noticeModifyGO(HttpServletRequest request, Model model, NoticeVO vo, HttpSession session) {
			System.out.println("noticeModifyGO(공지글 수정) 페이지로");
			int idx = Integer.parseInt(request.getParameter("idx"));	// idx를 넘겨준다.
			String title = request.getParameter("title");				// 제목을 넘겨준다.
			String content = request.getParameter("content");			// 내용을 넘겨준다.
			model.addAttribute("idx",idx);
			model.addAttribute("title", title);
			model.addAttribute("content", content);
			
			return "/board/noticeModify";
		}
		@RequestMapping("/noticeModifyDO")
		public String noticeModifyDO(HttpServletRequest request, Model model, NoticeVO vo, HttpSession session) {
			System.out.println("noticeModifyDO 공지글 수정 메서드 실행");
			HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
			mapper.noticeModify(vo);
			return "redirect:noticeContentGO?idx="+request.getParameter("idx");
		}
		

//		공지글 댓글 작성
		@RequestMapping("/noticeCommentDO")
		public String noticeCommentDO(HttpServletRequest request, Model model, NoticeComment vo, NoticeVO vo1, HttpSession session) {
			System.out.println("noticeCommentDO 공지글 댓글 작성 메서드 실행");
			HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
			mapper.noticeCommentDO(vo);
			mapper.commentIncrease(vo1);
			return "redirect:noticeContentGO?idx="+request.getParameter("idx"); 
		}
		
//		공지글 댓글 삭제
		@RequestMapping("/noticeCommentDelete")
		public String noticeCommentDelete(HttpServletRequest request, Model model, NoticeComment vo, NoticeVO vo1, HttpSession session) {
			System.out.println("noticeCommentDelete 공지글 댓글 삭제 메서드 실행");
			int idx = Integer.parseInt(request.getParameter("idx"));
			int main_idx = Integer.parseInt(request.getParameter("main_idx"));
			HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
			mapper.noticeCommentDelete(idx);
			mapper.commentDecrease(main_idx); 
			return "redirect:noticeContentGO?idx="+request.getParameter("main_idx");
		}
		
		
//		게시글 검색 기능
		@RequestMapping("/search")
		public String noticeSearch(HttpServletRequest request, Model model, BoardList boardList, HttpSession session) {
			System.out.println("noticeSearch 공지글 검색 메서드 실행");
			HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
//			String searchType = request.getParameter("searchType");	//추가
//			String keyWord = request.getParameter("keyWord");						//추가
			int pageSize = 10;
			int currentPage = 1;
			try {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			} catch(NumberFormatException e) { }
			int totalCount = mapper.selectCount2(boardList);
			
			//BoardList boardList = ctx.getBean("boardList", BoardList.class);
			boardList.initBoardList(pageSize, totalCount, currentPage);
			
			HashMap<String, Integer> hmap = new HashMap<String, Integer>();
			hmap.put("startNo", boardList.getStartNo());
			hmap.put("endNo", boardList.getEndNo());
			boardList.setHmap(hmap);
			System.out.println("개수: " + totalCount + " boardList :" + boardList);
			boardList.setNoticeList(mapper.searchNotice(boardList));
			System.out.println(boardList);
			model.addAttribute("searchNotice", boardList);
			
			return "/board/noticeSearch";
		}
	
		
//*********************************************************************************************************************************************************************
		@RequestMapping("/QnAGO")
		public String QnAGO(HttpServletRequest request, Model model, MemberVO vo, HttpSession session) {
			System.out.println("QnAGO(QnA) 페이지로, 메서드 실행");
			HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
			int pageSize = 10;
			int currentPage = 1;
			try {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			} catch(NumberFormatException e) { }
			int totalCount = mapper.selectCountQnA();
			AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationCTX.xml");
			BoardList qnaList = ctx.getBean("boardList", BoardList.class);
			qnaList.initBoardList(pageSize, totalCount, currentPage);
			
			HashMap<String, Integer> hmap = new HashMap<String, Integer>();
			hmap.put("startNO", qnaList.getStartNo());
			hmap.put("endNO", qnaList.getEndNo());
			qnaList.setQnaList(mapper.qnaList(hmap));
			model.addAttribute("qnaList", qnaList);
			return "/board/QnA";
		}
		
		@RequestMapping("/QnAWriteGO")
		public String QnAWriteGO(HttpServletRequest request, Model model, MemberVO vo, HttpSession session) {
			System.out.println("QnAWriteGO(QnA글 쓰기) 페이지로");
			return "/board/QnAWrite";
		}
		
		@RequestMapping("/QnAWriteDO")
		public String QnAWriteDO(HttpServletRequest request, Model model, QnAVO vo, HttpSession session)  {
			System.out.println("QnAWriteDO QnA글 쓰기 메서드 실행");
			HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
			mapper.QnAWriteDO(vo);
			System.out.println("qna글쓰기 : " + vo);
			return "redirect:QnAGO";
		}
		
		@RequestMapping("/QnAContentGO")
		public String QnAContentGO(HttpServletRequest request, Model model, QnAComment vo, HttpSession session) {
			System.out.println("QnAContentGO(QnA글 내용) 페이지로, 메서드 실행");
			int idx = Integer.parseInt(request.getParameter("idx"));
			HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
			mapper.QnANOV(idx);	// 조회수 증가
			QnAVO result = mapper.QnAContentGO(idx);	// 내용받아옴
			model.addAttribute("qna", result);
			
			// QnA 댓글 목록 받아옴
			ArrayList<QnAComment> list = mapper.QnAComment(idx);
			model.addAttribute("comment", list);
			return "/board/QnAContent";
			
		}
		
//		1건의 QnA글(해당 QnA글)을 삭제한다. QnA글에 담겨있는 댓글들도 삭제한다.
		@RequestMapping("/QnADelete")
		public String QnADelete(HttpServletRequest request, Model model, QnAComment vo1, QnAVO vo, HttpSession session) {
			System.out.println("noticeDelete QnA글 삭제 메서드 실행");
			HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
			mapper.QnADelete(vo);
			mapper.QnADelete2(vo1);
			return "redirect:QnAGO";
		}
		
		@RequestMapping("/QnAModifyGO")
		public String QnAModifyGO(HttpServletRequest request, Model model, QnAVO vo, HttpSession session) {
			System.out.println("noticeModifyGO(QnA글 수정) 페이지로");
			int idx = Integer.parseInt(request.getParameter("idx"));	// idx를 넘겨준다.
			String title = request.getParameter("title");				// 제목을 넘겨준다.
			String content = request.getParameter("content");			// 내용을 넘겨준다.
			model.addAttribute("idx",idx);
			model.addAttribute("title", title);
			model.addAttribute("content", content);
			
			return "/board/QnAModify";
		}
		@RequestMapping("/QnAModifyDO")
		public String QnAModifyDO(HttpServletRequest request, Model model, QnAVO vo, HttpSession session) {
			System.out.println("noticeModifyDO QnA글 수정 메서드 실행");
			HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
			mapper.QnAModify(vo);
			return "redirect:QnAContentGO?idx="+request.getParameter("idx");
		}
		
//		QnA글 댓글 작성
		@RequestMapping("/QnACommentDO")
		public String QnACommentDO(HttpServletRequest request, Model model, QnAComment vo, QnAVO vo1, HttpSession session) {
			System.out.println("noticeCommentDO QnA글 댓글 작성 메서드 실행");
			HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
			mapper.QnACommentDO(vo);
			mapper.QnAcommentIncrease(vo1);
			return "redirect:QnAContentGO?idx="+request.getParameter("idx"); 
		}
		
//		QnA글 댓글 삭제
		@RequestMapping("/QnACommentDelete")
		public String QnACommentDelete(HttpServletRequest request, Model model, QnAComment vo, QnAVO vo1, HttpSession session) {
			System.out.println("noticeCommentDelete QnA글 댓글 삭제 메서드 실행");
			int idx = Integer.parseInt(request.getParameter("idx"));
			int main_idx = Integer.parseInt(request.getParameter("main_idx"));
			HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
			mapper.QnACommentDelete(idx);
			mapper.QnAcommentDecrease(main_idx); 
			return "redirect:QnAContentGO?idx="+request.getParameter("main_idx");
		}
		
//		QnA글 검색 기능
		@RequestMapping("/QnAsearch")
		public String QnAsearch(HttpServletRequest request, Model model, BoardList boardList, HttpSession session) {
			System.out.println("QnASearch QnA글 검색 메서드 실행");
			HipTokDAO mapper = sqlSession.getMapper(HipTokDAO.class);
//			String searchType = request.getParameter("searchType");	//추가
//			String keyWord = request.getParameter("keyWord");						//추가
			int pageSize = 10;
			int currentPage = 1;
			try {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			} catch(NumberFormatException e) { }
			int totalCount = mapper.QnAselectCount(boardList);
			
			//BoardList boardList = ctx.getBean("boardList", BoardList.class);
			boardList.initBoardList(pageSize, totalCount, currentPage);
			
			HashMap<String, Integer> hmap = new HashMap<String, Integer>();
			hmap.put("startNo", boardList.getStartNo());
			hmap.put("endNo", boardList.getEndNo());
			boardList.setHmap(hmap);
			System.out.println("개수: " + totalCount + " boardList :" + boardList);
			boardList.setQnaList(mapper.searchQnA(boardList));
			System.out.println(boardList);
			model.addAttribute("searchQnA", boardList);
			
			return "/board/QnASearch";
		}
}