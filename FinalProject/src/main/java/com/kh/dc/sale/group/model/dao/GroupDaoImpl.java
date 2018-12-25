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

	
}
