package com.kh.dc.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LoginAspect {

/*	@Pointcut("execution(* com.kh.dc..*(..))")
	public void pointcut() {}
	
	@Around("execution(* com.kh.dc.admin..*(..))")
	public Object loginAdvice(ProceedingJoinPoint jp) throws Throwable {
		System.out.println("로그인 advice");
		
		Signature sig = jp.getSignature();
		
		String type = sig.getDeclaringTypeName();
		
		return "redirect:/";
	}*/
}
