package com.kh.dc.common.vo;

public class AdminBoard {
	String boardType;
	String boardStatus;
	
	public AdminBoard() {
		super();
	}

	public AdminBoard(String boardType, String boardStatus) {
		super();
		this.boardType = boardType;
		this.boardStatus = boardStatus;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public String getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	@Override
	public String toString() {
		return "AdminBoard [boardType=" + boardType + ", boardStatus=" + boardStatus + "]";
	}
}
