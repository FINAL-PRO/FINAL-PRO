package com.kh.dc.sale.group.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.sale.group.model.vo.Group;

@Repository
public class GroupDaoImpl implements GroupDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectGroupList(int cPage, int numPerPage) {
		
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("group_mapper.selectGroupList", null, rowBounds);
	}

	@Override
	public int selectGroupTotalContents() {
		
		return sqlSession.selectOne("group_mapper.selectGroupTotalContents");
	}

	@Override
	public Group selectOneGroup(int boardNo) {
		
		return sqlSession.selectOne("group_mapper.selectOneGroup", boardNo);
	}

	@Override
	public int insertGroup(Group group) {
		
		return sqlSession.insert("group_mapper.insertGroup", group);
	}

	@Override
	public int insertBoard(Group group) {

		return sqlSession.insert("group_mapper.insertBoard", group);
	}

	@Override
	public int updateGroup(Group group) {

		return sqlSession.update("group_mapper.updateGroup", group);
	}

	@Override
	public int updateBoard(Group group) {

		return sqlSession.update("group_mapper.updateBoard", group);
	}

	@Override
	public int deleteGroup(int boardNo) {

		return sqlSession.update("group_mapper.deleteGroup", boardNo);
	}

	@Override
	public int updateViewCount(int boardNo) {

		return sqlSession.update("group_mapper.updateViewCount", boardNo);
	}

	@Override
	public List<Map<String, String>> selectBankList() {
		
		return sqlSession.selectList("group_mapper.selectBankList");
	}

	@Override
	public List<Map<String, String>> selectGroupHistory(int groupNo) {

		return sqlSession.selectList("group_mapper.selectGroupHistory");
	}

	@Override
	public Map<String, String> selectOneGroupHistory(Map<String, String> gh) {

		return sqlSession.selectOne("group_mapper.selectOneGroupHistory", gh);
	}

	@Override
	public int insertGroupHistory(Map<String, String> gh) {

		return sqlSession.insert("group_mapper.insertGroupHistory", gh);
	}

	@Override
	public int deleteGroupHistory(Map<String, String> gh) {

		return sqlSession.delete("group_mapper.deleteGroupHistory", gh);
	}

	
}
