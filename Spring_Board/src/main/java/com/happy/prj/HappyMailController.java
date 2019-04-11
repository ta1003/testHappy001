package com.happy.prj;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.ibatis.builder.MapperBuilderAssistant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HappyMailController {

	private Logger logger = LoggerFactory.getLogger(HappyMailController.class);
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value="/mail.do" , method =RequestMethod.GET)
	public String mail() {
		logger.info("MailController");
		return "mailForm";
	}
	
	@RequestMapping(value="/mailSending.do" , method= RequestMethod.POST)
	public String mailSending(String toMail , String title , String content){
		String setFrom = "info.happy0612@gmail.com"; // 안적으면 에러가 뜸 반드시 작성할것
		// toMail // 받는 사람
		// title // 메일 제목
		// content // 메일 내용
				
		//String subject = "Happy corp 공지";
		
		try {
			MimeMessage message = mailSender.createMimeMessage(); // 메일 보내는 객체
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
			
			messageHelper.setFrom(setFrom); //  messageHelper.setFrom(setFrom,"이름"); 
			messageHelper.setTo(toMail);
			messageHelper.setSubject(title);
			//messageHelper.setText(content); // setText(content ,boolean); // boolean HTML 사용여부
			messageHelper.setText(content,true);
			
			DataSource dataSource = new FileDataSource("D:\\message.png");
			messageHelper.addAttachment(MimeUtility.encodeText("메세지.png","UTF-8","B"), dataSource);
		
			
			// messageHelper.setSentDate(sentDate);	 : 예약 메일
			// setCC(String) , setCC (String[]): 참조 메일 주소
			// setBCC(String) , setBCC (String[]): 숨은참조 메일 주소
			// 
			
			mailSender.send(message); //
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/memberList.do";
	}
	
}
