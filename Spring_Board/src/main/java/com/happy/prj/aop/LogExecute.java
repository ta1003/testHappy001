package com.happy.prj.aop;

import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogExecute {
	
	// 메소드 전에
	public void before(JoinPoint j) {
		Logger logger = LoggerFactory.getLogger(j.getTarget()+"");
		logger.info("----------aop 로거 시작");
		
		Object[] args =  j.getArgs();
		if(args != null) {
			for (int i = 0; i < args.length; i++) {
				logger.info(i+"번째\n:"+args[i]);
			}
		}
		
		logger.info("----------"+j.getSignature().getName()+"aop args 끗");
	}
	
	//메소드 예외 발생시
	public void afterThrowing(JoinPoint j) {
		Logger logger = LoggerFactory.getLogger(j.getTarget()+"");
		logger.info("에러:"+j.getKind());
		logger.info("에러:"+j.toString());
	}
	
	// 메소드 반환 있을때만
	public void afterReturning(JoinPoint j) {
		Logger logger = LoggerFactory.getLogger(j.getTarget()+"");
		logger.info("----------------끝~~~~!@$!@#!@#!@#");
	}
}
