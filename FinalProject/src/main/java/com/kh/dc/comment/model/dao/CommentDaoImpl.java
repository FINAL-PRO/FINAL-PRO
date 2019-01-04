package com.kh.dc.comment.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.Comment;


@Repository
public class CommentDaoImpl implements CommentDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int totalComment(int bno) {
		return sqlSession.selectOne("comment_mapper.totalComment", bno);
	}

	@Override
	public List<Comment> commentList(int bno) {

		return sqlSession.selectList("comment_mapper.selectCommentList", bno);
	}

	@Override
	public int commentDelete(int cno) {
		return sqlSession.delete("comment_mapper.deleteComment", cno);
	}

	@Override
	public int commentInsert(Comment comment) {
		return sqlSession.insert("comment_mapper.insertComment", comment);
	}

	@Override
	public int commentUpdate(Comment comment) {
		return sqlSession.update("comment_mapper.updateComment", comment);
	}



}
