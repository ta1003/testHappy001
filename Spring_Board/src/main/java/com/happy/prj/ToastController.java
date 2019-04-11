package com.happy.prj;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.happy.prj.model.Member_IService;

@Controller
public class ToastController {
private Logger logger = LoggerFactory.getLogger(HappyController.class);
		
	@RequestMapping(value="/intro.do",method = RequestMethod.GET)
	public String intro() {
		logger.info("처음 시작하는 Spring Intro Page");		
		return "intro";
	}
}
