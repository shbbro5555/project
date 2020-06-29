package kr.koreait.mybatis;

import java.util.ArrayList;
import java.util.HashMap;

import kr.koreait.vo.BoardList;
import kr.koreait.vo.GoodsQnAVO;
import kr.koreait.vo.GoodsReviewVO;
import kr.koreait.vo.GoodsVO;
import kr.koreait.vo.ItemOrderVO;
import kr.koreait.vo.MemberVO;
import kr.koreait.vo.NoticeComment;
import kr.koreait.vo.NoticeVO;
import kr.koreait.vo.QnAComment;
import kr.koreait.vo.QnAVO;
import kr.koreait.vo.ShoppingCartVO;

/**
 *  컨트롤러에서  메서드들을 받아와서 mappers로 보내주는 DAO입니다.
 * @author 이민형
 * @version 1.0
 */
public interface HipTokDAO {
/**
 * 
 * @param joinDO(MemberVO vo)		회원가입
 */
	void joinDO(MemberVO vo);
/**
 * 
 * @param loginDO(MemberVO vo) 		로그인
 */
	MemberVO loginDO(MemberVO vo);
/**
 * 
 * @param memberModifyDO(MemberVO vo) 회원정보 수정
 */
	void memberModifyDO(MemberVO vo);
/**
 * 
 * @param memberOutDO(MemberVO vo)	회원탈퇴
 */
	void memberOutDO(MemberVO vo);

//********************************************************************************************************************
	
/**
 * 
 * @param noticeGO(NoticeVO vo)	공지글 창 불러오기
 */
	int selectCount();						// 전체 글의 갯수 받아오기
	ArrayList<NoticeVO> noticeList(HashMap<String, Integer> hmap);
	
/**
 * 
 * @param noticeWriteDO(NoticeVO vo) 공지글 작성
 */
	void noticeWriteDO(NoticeVO vo);
	
	
/**
 * 
 * @param noticeContentGO(int idx)	공지글 내용 불러오기
 */
	void noticeNOV(int idx); 							// 공지글 조회수 증가
	NoticeVO noticeContentGO(int idx);					// 공지글 내용 불러오기
	ArrayList<NoticeComment> noticeComment(int idx);	// 공지글 댓글 목록 보여주기
	
// 공지글 삭제, 해당 공지글의 댓글 삭제
	void noticeDelete(NoticeVO vo);						// 공지글 삭제
	void noticeDelete2(NoticeComment vo1);				// 해당 공지글의 댓글 삭제

// 공지글 수정
	void noticeModify(NoticeVO vo);
	
// 공지글 댓글 작성
	void noticeCommentDO(NoticeComment vo);		// 공지글 댓글 작성
	void commentIncrease(NoticeVO vo1);			// 공지글의 댓글 개수 증가
	
//	공지글 댓글 삭제
	void noticeCommentDelete(int idx);			// 공지글 댓글 삭제
	void commentDecrease(int idx);				// 공지글 댓글 개수 감소
	
	
//	공지글 검색 
	int selectCount2(BoardList boardList);
	ArrayList<NoticeVO> searchNotice(BoardList boardList);
	
//************************************************************************************************************************	
	
	int selectCountQnA();		// QnA글의 전체 개수 받아오기
	ArrayList<QnAVO> qnaList(HashMap<String, Integer> hmap);	// 글 찍기
	
//	QnA글 작성
	void QnAWriteDO(QnAVO vo);
	
// 	QnA글 내용 불러오기
	void QnANOV(int idx);							// QnA글 조회수 증가
	QnAVO QnAContentGO(int idx);					// QnA글 내용 불러오기
	ArrayList<QnAComment> QnAComment(int idx);		// QnA글 댓글 목록 보여주기	
	
//	QnA 삭제, 해당  QnA글의 댓글 삭제
	void QnADelete(QnAVO vo);						// QnA글 삭제
	void QnADelete2(QnAComment vo1);	// 해당 QnA글의 댓글 삭제
	
//	QnA 글 수정
	void QnAModify(QnAVO vo);
	
//	QnA글 댓글 작성
	void QnACommentDO(QnAComment vo);		// QnA글 댓글 작성
	void QnAcommentIncrease(QnAVO vo1);		// QnA글의 댓글 개수 증가
	
//	QnA글 댓글 삭제
	void QnACommentDelete(int idx);			// QnA글 댓글 삭제
	void QnAcommentDecrease(int main_idx);	// QnA글 댓글 개수 감소
	
//	QnA글 검색
	int QnAselectCount(BoardList boardList);
	ArrayList<QnAVO> searchQnA(BoardList boardList);
	
//	마이페이지에 내가쓴 글 띄우기
	int MyPageSelectCount(BoardList boardList); // 갯수
	ArrayList<QnAVO> searchMyWrite(BoardList boardList); // 글 받아오기
	
	
	




	// 상품 업로드,등록
	int selectCount1();

	ArrayList<GoodsVO> ProductList(HashMap<String, Integer> hmap);

	void commentIncrease(GoodsVO vo1);
	void uploadDO(GoodsVO vo);
	void listDO(GoodsVO vo);
	void insertGoods(GoodsVO goodsVO);	//상품등록
	int selectGoodsIdx();		//상품순서
	
	
	void uploadFile(GoodsVO goodsVO);
	
	
	//상품 등록
	void uploadFormDO(GoodsVO vo);
	
	
//	전체상품 보여주기
	int itemCount(BoardList boardList);
	ArrayList<GoodsVO> itemList(BoardList boardList);
	
//	pouch창
	int pouchCount(BoardList boardList);
	ArrayList<GoodsVO> pouchList(BoardList boardList);

//	sticker창
	int stickerCount(BoardList boardList);
	ArrayList<GoodsVO> stickerList(BoardList boardList);

//	case창
	int caseCount(BoardList boardList);
	ArrayList<GoodsVO> caseList(BoardList boardList);
	
//	상품 내용창으로
	GoodsVO goodsContentGO(int idx);
	
	
//	상품 리뷰등록
	void goodsReviewWriteDO(GoodsReviewVO vo);

	
//	상품 리뷰 개수
	int goodsReviewCount(BoardList boardList);
//	상품 리뷰 목록
	ArrayList<GoodsReviewVO> goodsReviewList(BoardList boardList);
//	상품 리뷰 창 보여주기
	GoodsReviewVO selectGoodsReview(int idx);
	
	
	
//	상품 QnA등록
	void goodsQnAWriteDO(GoodsQnAVO vo);
	

//	상품 QnA 개수
	int goodsQnACount(BoardList boardList);
//	상품  QnA 목록
	ArrayList<GoodsQnAVO> goodsQnAList(BoardList boardList);
	
//	장바구니 담기
	void shoppingCartDO(ShoppingCartVO vo);
	
//	장바구니 상품 개수
	int cartCount(String userId);
	
//	장바구니 상품 페이징
	ArrayList<ShoppingCartVO> cartList(BoardList boardList);
	
//	주문하기 
	void itemOrderDO(ItemOrderVO vo);
	
//	마이페이지에서 내가 구매한 아이템 불러오기
	void showOrder(String userId);
	

	








	



	


	
}
