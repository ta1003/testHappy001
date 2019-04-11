package com.happy.prj.dtos;

import java.io.Serializable;

public class RowNum_DTO implements Serializable{
			
	private static final long serialVersionUID = -5719721873815571033L;
	
	private int pageList; //출력할 페이지 번호 개수
	private int index; 	  // 페이지 번호
	private int pageNum;  // 출력 페이지 시작번호
	private int listNum;  // 출력할 리스트 개수
	private int total;    // 전체 글 개수
	
	{
		pageList = 5;
		index = 0;
		pageNum = 1;
		listNum = 5;
	}
	
	public RowNum_DTO() {
		super();
	}

	public RowNum_DTO(String index, String pageNum, String listNum) {
		
		if(index != null) {
			this.index = Integer.parseInt(index);
		}
		if(pageNum != null) {
			this.pageNum = Integer.parseInt(pageNum);
		}
		if(listNum != null) {					
			this.listNum = Integer.parseInt(listNum);
		}
	}
	
	
	public int getStart() {
		return index*listNum+1;
	}
	
	public int getLast() {
		return (index*listNum)+listNum;
	}
	
	public int getCount() {
		int temp = total-listNum*(pageNum-1);
		int min = temp/listNum;  // min 1
		int count = 0;
		if(temp%listNum != 0) {
			min++;   // min 2
		}
		
		if(temp <= listNum) { 
			count = pageNum;  // 1 
		}else if(min <= pageList) {   // 2
			count = min+pageNum-1;
		}else {
			count = pageList+pageNum-1;
		}
		return count;
	}

	public int getPageList() {
		return pageList;
	}

	public void setPageList(int pageList) {
		this.pageList = pageList;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "RowNum_DTO [pageList=" + pageList + ", index=" + index + ", pageNum=" + pageNum + ", listNum=" + listNum
				+ ", total=" + total + "]";
	}
	
	
}
