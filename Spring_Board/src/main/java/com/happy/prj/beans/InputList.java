package com.happy.prj.beans;

import java.util.List;

import com.happy.prj.dtos.Answerboard_DTO;
import com.happy.prj.dtos.Member_DTO;

public class InputList {
	private List<Answerboard_DTO> lists;
	private Member_DTO mem;
	
	
	public void setLists(List<Answerboard_DTO> lists) {
		this.lists = lists;
	}
	public void setMem(Member_DTO mem) {
		this.mem = mem;
	}
	
	// 날짜 포맷 변경 (2019-04-04 14:11:12.0) -> 2019-04-04
	private String dateFormat(String date) {
		return date.substring(0, date.indexOf(" "));
	}
	
	// 제목 포맷 변경 
	private String titleFormat(int depth) {
		//<img alt="리플" src="./image/reply.png">
		StringBuffer sb = new StringBuffer();
		for(int i = 0; i < depth; i++) {
			sb.append("&nbsp;&nbsp;&nbsp;");
		}
		if(depth>0) {
			sb.append("<img alt=\"리플\" src=\"./image/reply.png\">");
		}
		return sb.toString();
	}
	
	// 체크박스 , 글번호 , 제목 , 작성자 , 조회수 , if 삭제여부 , 작성일
	
	
	private String listformat(Answerboard_DTO dto) {
		StringBuffer sb = new StringBuffer();
		int n  = 6;
		sb.append("<tr><td><input type=\"checkbox\" name=\"chkVal\" value=\""+dto.getSeq()+"\"></td>");
		sb.append("<td>"+dto.getSeq()+"</td>");
		
		sb.append("<td><div class=\"panel-heading\"><a data-toggle='collapse' data-parent='#accordion' href='#collapse"+dto.getSeq()+"' onclick='collapse(\""+dto.getSeq()+"\")' >");
		sb.append(titleFormat(dto.getDepth())+dto.getTitle()+"</a></div></td>");
		
		sb.append("<td>"+dto.getId()+"</td>");
		sb.append("<td>"+dto.getReadcount()+"</td>");
		if(mem.getAuth().trim().equalsIgnoreCase("A")) {
			sb.append("<td>"+dto.getDelflag()+"</td>");
			n=7;
		}		
		sb.append("<td>"+dateFormat(dto.getRegdate())+"</td></tr>");
		
		
		//sb.append("<tr><td c>");
		sb.append("<tr><td colspan="+n+"><div id='collapse"+dto.getSeq()+"' class='panel-collapse collapse'>");
		sb.append("<div class='form-group'><label>내용</label>");
		sb.append("<textarea row='7' class='form-control' readonly='readonly'>"+dto.getContent()+"</textarea></div>");
		
		sb.append("<div class='form-group'>");
		
		if(mem.getId().trim().equalsIgnoreCase(dto.getId().trim())) {
			sb.append("<input class='btn btn-primary' type='button' value='글수정하기' onclick='modify(\""+dto.getSeq()+"\")'>");
		}
		if(mem.getId().trim().equalsIgnoreCase(dto.getId().trim()) || mem.getAuth().trim().equalsIgnoreCase("A")) {		
			sb.append("<input class='btn btn-primary' type='button' value='글삭제' onclick='del(\""+dto.getSeq()+"\")'>");
		}
		if(mem.getAuth().trim().equalsIgnoreCase("U")) {		
			sb.append("<input class='btn btn-primary' type='button' value='답글' onclick='reply(\""+dto.getSeq()+"\")'>");
		}
	
		
		sb.append("</div></div></td></tr>");
		return sb.toString();
	}
	public String getListformat() {
		StringBuffer sb = new StringBuffer();
		for(int i=0; i <lists.size(); i++) {
			sb.append(listformat(lists.get(i)));			
		}
		
		return sb.toString();
	}
	
}
