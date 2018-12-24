package com.kh.dc.community.free.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.Comment;


@Repository
public class FreeDaoImpl implements FreeDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectFreeList(int cPage, int numberPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numberPage, numberPage);
		return sqlSession.selectList("free_mapper.selectFreeList", null, rowBounds);
	}

	@Override
	public int selectFreeTotalContents() {
		return sqlSession.selectOne("free_mapper.selectFreeTotalContents");
	}

	@Override
	public Board selectOneFree(int no) {
		return sqlSession.selectOne("free_mapper.selectOneFree", no);
	}

	@Override
	public int insertBoard(Board board) {
		return sqlSession.insert("free_mapper.insertFree", board);
	}

	@Override
	public int freeDelete(int no) {
		return sqlSession.delete("free_mapper.freeDelete", no);
	}

	@Override
	public int freeUpdate(Board board) {
		return sqlSession.insert("free_mapper.updateFree", board);
	}
	
	@Override
	public int freeViewCount(int no) {
		return sqlSession.update("free_mapper.freeViewCount", no);
	}

	@Override
	public int commentInsert(Comment comment) {
		return sqlSession.insert("comment_mapper.insertComment", comment);
	}
	
	@Override
	public int totalComment(int no) {
		return sqlSession.selectOne("comment_mapper.totalComment", no);
	}

	@Override
	public List<Comment> commentList(int no) {

		return sqlSession.selectList("comment_mapper.selectCommentList", no);
	}

	@Override
	public int commentDelete(int no) {
		return sqlSession.delete("comment_mapper.deleteComment", no);
	}


}
