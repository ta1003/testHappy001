package com.happy.prj.model;

import java.util.List;

import com.happy.prj.dtos.Member_DTO;

public interface Member_Interface {
//	memberList 전체 회원 조회  
	public List<Member_DTO> memList();
//	signupmember : 회원가입
	public boolean signupmember(Member_DTO dto);
//	idDuplicateChk : 아이디 중복 체크
	public boolean idDuplicateChk(String id);
//	loginMember : 로그인
	public Member_DTO loginMember(Member_DTO dto);
}
