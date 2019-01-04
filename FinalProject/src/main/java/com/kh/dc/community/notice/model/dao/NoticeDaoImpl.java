package com.kh.dc.community.notice.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.Board;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Board> selectNoticeListData() {
		return sqlSession.selectList("notice_mapper.selectNoticeListData");
	}

}
