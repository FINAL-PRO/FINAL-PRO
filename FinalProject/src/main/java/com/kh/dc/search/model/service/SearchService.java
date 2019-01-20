package com.kh.dc.search.model.service;

import java.util.List;

import com.kh.dc.common.vo.Board;

public interface SearchService {

	List<Board> searchResultList(String searchWord);
	

}
