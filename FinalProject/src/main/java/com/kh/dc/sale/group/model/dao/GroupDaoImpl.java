package com.kh.dc.sale.group.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.Board;
import com.kh.dc.sale.group.model.vo.Group;

@Repository
public class GroupDaoImpl implements GroupDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectGroupList(int cPage, int numPerPage, int locationNo) {
		
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("group_mapper.selectGroupList", locationNo, rowBounds);
	}

	@Override
	public int selectGroupTotalContents(int locationNo) {
		
		return sqlSession.selectOne("group_mapper.selectGroupTotalContents", locationNo);
	}

	@Override
	public Group selectOneGroup(int boardNo) {
		
		return sqlSession.selectOne("group_mapper.selectOneGroup", boardNo);
	}
	
	@Override
	public Group selectOneGroup2(int boardNo) {
		
		return sqlSession.selectOne("group_mapper.selectOneGroup2", boardNo);
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

		return sqlSession.selectList("group_mapper.selectGroupHistory", groupNo);
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

	@Override
	public List<Map<String, String>> selectStatusList() {

		return sqlSession.selectList("group_mapper.selectStatusList");
	}

	@Override
	public int updateStatus(Map<String, String> status) {
		
		return sqlSession.update("group_mapper.updateStatus", status);
	}

	@Override
	public int selectRemainCount(int groupNo) {
			
		return sqlSession.selectOne("group_mapper.selectRemainCount", groupNo);
	}
	
	@Override
	public List<Board> getGroupListData() {

		return sqlSession.selectList("group_mapper.getGroupListData");
	}

	@Override
	public List<Board> selectGroupList() {
		return sqlSession.selectList("group_mapper.selectSumGroupList");
	}

	
}
