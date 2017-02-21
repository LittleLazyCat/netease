package com.netease.homework;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class LoggingAspect {
	/**
     * ��������ʱ����
     * @param jp���õ���Ϣ
     */
	@AfterReturning("execution(* com.netease.homework.*.*(..))")
	public void doLog(JoinPoint jp) {
		String className = jp.getSignature().getDeclaringTypeName();
        String methodName = jp.getSignature().getName();
        System.out.print("��������Log:����"+className+"��"+methodName+"����,����Ϊ��");
        for (Object obj : jp.getArgs()) {
            System.out.print(obj.toString());
        }
        System.out.println("");
	}
	
	  /**
     * �׳��쳣����ʱ����
     * @param jp ���õ���Ϣ
     * @param ex �쳣��Ϣ
     */
	@AfterThrowing(pointcut="execution(* com.netease.homework.*.*(..))",throwing="ex")
    public void logAfterThrowing(JoinPoint jp,Exception ex){
        String className = jp.getSignature().getDeclaringTypeName();
        String methodName = jp.getSignature().getName();
        System.out.print("�쳣Log:����"+className+"��"+methodName+"����,����Ϊ��");
        for (Object obj : jp.getArgs()) {
            System.out.print(obj.toString());
        }
        System.out.println("���׳��쳣:"+ex.getMessage()+"!");
    }
}
