package kr.koreait.vo;

import java.util.ArrayList;
import java.util.HashMap;

public class BoardList {
   private ArrayList<NoticeVO> noticeList = new ArrayList<NoticeVO>();
   private ArrayList<QnAVO> qnaList = new ArrayList<QnAVO>();
   private ArrayList<GoodsVO> itemList = new ArrayList<GoodsVO>();
   private ArrayList<GoodsReviewVO> reviewList = new ArrayList<GoodsReviewVO>();
   
   private int idx;
   
   private int pageSize = 0;
   private int totalCount = 0;
   private int totalPage = 0;
   private int currentPage = 1;
   private int startNo = 0;
   private int endNo = 0;
   private int startPage = 0;
   private int endPage = 0;
   private String userId;
   

private String searchType="";		// 검색 타입
   private String keyWord="";		// 키워드
   private HashMap<String, Integer> hmap = new HashMap<String, Integer>();



public BoardList() {}
   
   public void initBoardList(int pageSize, int totalCount, int currentPage) {
//		pageSize, totalCount, currentPage를 인수로 넘겨받아 멤버 변수를 초기화 시키는 메소드
      this.pageSize = pageSize;
      this.totalCount = totalCount;
      this.currentPage = currentPage;
      calculator();
   }
   
   private void calculator() {
      totalPage = (totalCount - 1) / pageSize + 1;
      currentPage = currentPage > totalPage ? totalPage : currentPage;
      startNo = (currentPage - 1) * pageSize + 1;
      endNo = startNo + pageSize - 1;
      endNo = endNo > totalCount ? totalCount : endNo;
      startPage = (currentPage - 1) / 10 * 10 + 1;
      endPage = startPage + 9;
      endPage = endPage > totalPage ? totalPage : endPage;
   }
	   
	
   public int getIdx() {
	return idx;
}

public void setIdx(int idx) {
	this.idx = idx;
}

public String getUserId() {
	   return userId;
   }
   
   public void setUserId(String userId) {
	   this.userId = userId;
   }
	public ArrayList<NoticeVO> getNoticeList() {
		return noticeList;
	}
	
	public void setNoticeList(ArrayList<NoticeVO> noticeList) {
		this.noticeList = noticeList;
	}
	
   public ArrayList<QnAVO> getQnaList() {
		return qnaList;
	}

	public void setQnaList(ArrayList<QnAVO> qnaList) {
		this.qnaList = qnaList;
	}
	
	

public ArrayList<GoodsVO> getItemList() {
		return itemList;
	}

	public void setItemList(ArrayList<GoodsVO> itemList) {
		this.itemList = itemList;
	}
	
public ArrayList<GoodsReviewVO> getReviewList() {
		return reviewList;
	}

	public void setReviewList(ArrayList<GoodsReviewVO> reviewList) {
		this.reviewList = reviewList;
	}

public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	public int getTotalPage() {
		return totalPage;
	}
	
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public int getStartNo() {
		return startNo;
	}
	
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	
	public int getEndNo() {
		return endNo;
	}
	
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public HashMap<String, Integer> getHmap() {
		return hmap;
	}

	public void setHmap(HashMap<String, Integer> hmap) {
		this.hmap = hmap;
	}

	@Override
	public String toString() {
		return "BoardList [noticeList=" + noticeList + ", qnaList=" + qnaList + ", itemList=" + itemList
				+ ", reviewList=" + reviewList + ", pageSize=" + pageSize + ", totalCount=" + totalCount
				+ ", totalPage=" + totalPage + ", currentPage=" + currentPage + ", startNo=" + startNo + ", endNo="
				+ endNo + ", startPage=" + startPage + ", endPage=" + endPage + ", userId=" + userId + ", searchType="
				+ searchType + ", keyWord=" + keyWord + ", hmap=" + hmap + "]";
	}

	

	



}