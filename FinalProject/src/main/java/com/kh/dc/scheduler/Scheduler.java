package com.kh.dc.scheduler;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {
    
	@Autowired
	SqlSessionTemplate sqlSession;
   /* 크론탭 실행 */
/*    @Scheduled(cron="0 * * * * *")
    public void HofScheduler() {
        try{
            System.out.println("스케줄러 실행");
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }*/
	
	/*광고 상태 변경*/
	/*매일 0시 0분 0초 실행*/
	/*@Scheduled(cron="0 0 0 * * *")*/
	public void adStatusChange() {
		
		int start = sqlSession.update("scheduler_mapper.adStatusStart");
		int end = sqlSession.update("scheduler_mapper.adStatusEnd");
		
		System.out.println("광고 스케줄러 실행 : start : " + start);
		System.out.println("광고 스케줄러 실행 : end : " + end);
	}
    
	// (크론 = 초 분 시 일 월 요일)
	/*게시글 삭제 */
	/*매시 1분 0초 실행*/
	/*@Scheduled(cron="0 0 * * * *")*/
	public void deletBoardList() {
		
	}
	
	@Scheduled(cron="0 0 0 * * *")
	public void checkGroupDday() {
		
		
	}
    
    
    
}