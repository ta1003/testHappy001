package com.happy.prj.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happy.prj.dtos.Answerboard_DTO;
import com.happy.prj.dtos.RowNum_DTO;

@Service
public class AnswerBoard_Service implements AnswerBoard_IService {

	@Autowired
	private AnswerBoard_Interface answerBoard_Interface;
	
	private Logger logger = LoggerFactory.getLogger(AnswerBoard_Service.class);
	
	
	@Override
	public boolean writeBoard(Answerboard_DTO dto) {
		logger.info("ㅅ ㅐ 글 작성 writeBoard {}",dto);
		return answerBoard_Interface.writeBoard(dto);
	}

	@Override
	public boolean reply(Answerboard_DTO dto) {
		logger.info("답글 작성 reply{}" , dto);
		boolean isc =  answerBoard_Interface.replyBoardUp(dto);
		isc =  answerBoard_Interface.replyBoardIn(dto);
		return isc;
	}

	@Override
	public Answerboard_DTO getOneBoard(String seq) {
		logger.info("하나 조회 getOneBoard{}" ,seq);
		return answerBoard_Interface.getOneBoard(seq);
	}

	@Override
	public boolean readcountBoard(String seq) {
		logger.info("조회수 증가 readcountBoard{}" ,seq);
		return answerBoard_Interface.readcountBoard(seq);
	}

	@Override
	public boolean modifyBoard(Answerboard_DTO dto) {
		logger.info("modifyBoard 변경 {}",dto);
		return answerBoard_Interface.modifyBoard(dto);
	}

	@Override
	public boolean delflagBoard(Map<String, String[]> map) {
		logger.info("delflagBoard {}" , map);
		return answerBoard_Interface.delflagBoard(map);
	}

	@Override
	public List<Answerboard_DTO> deleteBoardSel(String seq) {
		logger.info("하위 삭제글 확인 {}" , seq);
		return answerBoard_Interface.deleteBoardSel(seq);
	}

	@Override
	public boolean deleteBoard(Map<String, String[]> map) {
		logger.info("진짜 삭제 {}" , map);
		return answerBoard_Interface.deleteBoard(map);
	}

	@Override
	public List<Answerboard_DTO> userBoardList() {
		logger.info("전체글 조회 - 사용자");
		return answerBoard_Interface.userBoardList();
	}

	@Override
	public List<Answerboard_DTO> adminBoardList() {
		logger.info("전체글 조회 - 관리자");
		return answerBoard_Interface.adminBoardList();
	}

	@Override
	public List<Answerboard_DTO> userBoardListRow(RowNum_DTO dto) {
		logger.info("전체글 조회 - 사용자(페이징) {} " , dto);
		return answerBoard_Interface.userBoardListRow(dto);
	}

	@Override
	public List<Answerboard_DTO> adminBoardListRow(RowNum_DTO dto) {
		logger.info("전체글 조회 - 관리자(페이징) {} " , dto);
		return answerBoard_Interface.adminBoardListRow(dto);
	}

	@Override
	public int userBoardListTotal() {
		logger.info("전체글 숫자 사용자 userBoardListTotal");
		return answerBoard_Interface.userBoardListTotal();
	}

	@Override
	public int adminBoardListTotal() {
		logger.info("전체글 숫자 관리자 adminBoardListTotal");
		return answerBoard_Interface.adminBoardListTotal();
	}

}
