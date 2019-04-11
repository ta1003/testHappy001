package com.happy.prj.model;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.happy.prj.dtos.Member_DTO;

@Repository
public class Member_Dao implements Member_Interface {

	private final String NS ="com.happy.prj.Statement_Member.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public List<Member_DTO> memList() {
		return sqlSession.selectList(NS+"memberList");
	}

	@Override
	public boolean signupmember(Member_DTO dto) {
		
		// 전달 받은 비밀번호를 암호화 처리 
		String encodePw = passwordEncoder.encode(dto.getPw());
		dto.setPw(encodePw);		
		int n = sqlSession.insert(NS+"signupmember", dto);
		return n > 0? true : false;
	}	

	@Override
	public boolean idDuplicateChk(String id) {
		int n = sqlSession.selectOne(NS+"idDuplicateChk", id);
		return n > 0? true : false;
	}

	@Override
	public Member_DTO loginMember(Member_DTO dto) {
		// ID를 통해 db의 패스워드 확인 : selStringPw
		
		// 교육용 방법 (실전에선 안슴)
		/*String securityPw = sqlSession.selectOne(NS+"selStringPw" ,dto);
		String encodePw = passwordEncoder.encode(dto.getPw());
		
		System.out.println("DB Pw :"+securityPw);
		System.out.println("Input Pw :"+encodePw);
		
		if(securityPw.equals(encodePw)) {
			System.out.println("비밀번호 일치");
			return sqlSession.selectOne(NS+"loginMember",dto);
		}*/
		
		// 실전용 
		String securityPw = sqlSession.selectOne(NS+"selStringPw" ,dto);
		if(passwordEncoder.matches(dto.getPw(), securityPw)) {
			dto.setPw(securityPw);
			System.out.println("비밀번호 일치");
			return sqlSession.selectOne(NS+"loginMember",dto);
		}		
		return null;
	}

}
