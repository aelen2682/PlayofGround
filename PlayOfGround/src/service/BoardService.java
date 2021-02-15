package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.BoardMapper;
import model.Board;
import model.Pagination;

@Service
public class BoardService {
	
	@Autowired
	BoardMapper boardMapper;
	
	//작성
	public int addBoard(Board board) {
		return boardMapper.insertBoard(board);
	}	
	
	
	//삭제
	public int deleteBoard(int id) {
		return boardMapper.deleteBoard(id);
	}
	
	//수정
	public int boardUpdate(Board board) {
		return boardMapper.updateBoard(board);
	}
	
	
	public Board boardRead(int id) {
		return boardMapper.boardRead(id);
	}
	
	public Board boarddetail(int id) {
		return boardMapper.detail(id);
	}
	
	//게시물 총 갯수
	public int getBoardListCnt() {
		return boardMapper.getBoardListCnt();				
	}
	
	//전체조회
	public List<Board> getBoardList(Pagination pagination){
		return boardMapper.getBoardList(pagination);
	}


	

	
}
