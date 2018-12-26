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
