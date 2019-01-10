package com.kh.dc.search.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.Board;

@Repository
public class SearchDaoImpl implements SearchDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Board> searchResultList(String searchWord) {		
		System.out.println("searchWord : " + searchWord);
		return sqlSession.selectList("search_mapper.searchResultList", searchWord);
	}

}
