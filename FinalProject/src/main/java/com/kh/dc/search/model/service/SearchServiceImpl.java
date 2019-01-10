package com.kh.dc.search.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.common.vo.Board;
import com.kh.dc.search.model.dao.SearchDao;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SearchDao searchDao;

	@Override
	public List<Board> searchResultList(String searchWord) {		
		return searchDao.searchResultList(searchWord);		
	}

}
