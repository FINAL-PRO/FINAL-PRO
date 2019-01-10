package com.kh.dc.search.model.dao;

import java.util.List;

import com.kh.dc.common.vo.Board;

public interface SearchDao {
	
	List<Board> searchResultList(String searchWord);

}
