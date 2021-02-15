package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import model.Board;
import model.Pagination;

@Repository
@Mapper
public interface BoardMapper {
	
	//작성
	public int insertBoard(Board board);
	
	//삭제
	public int deleteBoard(int id);
	
	//게시물 상세내용 
	public Board boardRead(int id);
	
	//수정
	public int updateBoard(Board board);
	
	public Board detail(int id);
	
	//총 게시글 개수 확인
	public int getBoardListCnt();

	//목록보기
	public List<Board> getBoardList(Pagination pagination);

}
