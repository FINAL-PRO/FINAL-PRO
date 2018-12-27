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
	public int totalComment(int cno) {
		return sqlSession.selectOne("comment_mapper.totalComment", cno);
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
	public void commentInsert(Comment comment) {
		sqlSession.insert("comment_mapper.insertComment", comment);
	}



}
