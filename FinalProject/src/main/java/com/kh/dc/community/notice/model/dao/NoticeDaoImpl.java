package com.kh.dc.community.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.BoardList;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> recentSort(int cPage, int numberPage, int locationNo) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numberPage, numberPage);
		return sqlSession.selectList("notice_mapper.noticerecentSort", locationNo, rowBounds);
	}
	
	@Override
	public int selectNoticeTotalContents(int locationNo) {
		return sqlSession.selectOne("notice_mapper.selectNoticeTotalContents", locationNo);
	}

	@Override
	public BoardList selectOneNotice(int bno) {
		return sqlSession.selectOne("notice_mapper.selectOneNotice", bno);
	}

	@Override
	public int insertBoard(Board board) {
		return sqlSession.insert("notice_mapper.insertNotice", board);
	}

	@Override
	public int noticeDelete(int bno) {
		return sqlSession.delete("notice_mapper.noticeDelete", bno);
	}

	@Override
	public int noticeUpdate(Board board) {
		return sqlSession.insert("notice_mapper.updateNotice", board);
	}
	
	@Override
	public int noticeViewCount(int bno) {
		return sqlSession.update("notice_mapper.noticeViewCount", bno);

	}

	@Override
	public List<Board> selectNoticeListData() {
		return sqlSession.selectList("notice_mapper.selectNoticeListData");
	}

}
