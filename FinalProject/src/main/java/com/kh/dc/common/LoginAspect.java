package com.kh.dc.common;

import org.apache.ibatis.javassist.bytecode.Mnemonic;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.kh.dc.admin.member.controller.AdminMemberController;
import com.kh.dc.member.model.vo.Member;

@Component
@Aspect
public class LoginAspect {

/*	@Pointcut("execution(* com.kh.dc..*(..))")
	public void pointcut() {}
	
	@Around("execution(* com.kh.dc.admin..*(..))")
	public Object loginAdvice(ProceedingJoinPoint jp) throws Throwable {
		System.out.println("로그인 advice");
		
		Signature sig = jp.getSignature();
		System.out.println();
		
		Object[] args = jp.getArgs();
		
		for (Object arg : args) {
			System.out.println("args : " + arg);
		}
		
		String type = sig.getDeclaringTypeName();
		
		System.out.println("type : " + type);
		
		AdminMemberController amc = new AdminMemberController();
		Member member = amc.checkAuthMember(Integer.parseInt(args[0].toString()));
		
		System.out.println("aop 멤버 : " + member);
		
		if(member.getAuthNo() == 2) {
			return jp.proceed();
		}else {
			return "redirect:/";
		}
	}*/
}
