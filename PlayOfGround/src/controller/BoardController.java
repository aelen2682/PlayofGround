package controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mapper.BoardMapper;
import model.Board;
import model.Pagination;
import service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@GetMapping("/add")
	public String showBoardAddForm() {
		return "boardForm";
	}

	@PostMapping("/add")
	public String addBoard(Board board) {
		boardService.addBoard(board);
		return "resultAddBoard";
	}

	@GetMapping("/delete")
	public String boardDelete(int id) {
		boardService.deleteBoard(id);
		return "resultAddBoard";
	}

	//게시글 수정 상세내용 불러오기
	@GetMapping("/view")
	public String boardRead(int id, Model model) {
		Board data = boardService.boardRead(id);
		model.addAttribute("data", data);
		return "boardView";
	}

	//게시글 수정 실행
	@PostMapping("/update")
	public String boardUpdatedo(Board board) {
		boardService.boardUpdate(board);
		System.out.println("값:"+board);
		return "resultAddBoard";
	}

	// 게시글 상세페이지로 이동
	@GetMapping("/detail") 
	public String getdetail(int id, Model model) {
		Board data = boardService.boarddetail(id);
		model.addAttribute("data",data);
		return "detail";
	}
	
//	@GetMapping("/list")
//	public String selectBoard(Model m, Board board) {
//		List<Board> bList = boardService.selectBoardList(null);
//		m.addAttribute("bList", bList);	
//		return "gogo";
//	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getBoardList(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range
			) {
		
//		System.out.println(page+range);
		//전체 게시글 개수
		int listCnt = boardService.getBoardListCnt();			
		//Pagination 객체생성
		Pagination pagination = new Pagination();
		
		pagination.pageInfo(page, range, listCnt);
//		System.out.println(pagination);
		model.addAttribute("pagination", pagination);
		model.addAttribute("boardList",  boardService.getBoardList(pagination));
		return "boardPage";
	}
	

}

