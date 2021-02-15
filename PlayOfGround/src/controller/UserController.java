package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Page_User;
import service.Page_UserSerivce;

@Controller
@RequestMapping("/PlayofGround")
public class UserController {

	@Autowired
	Page_UserSerivce pageUserService;

	@GetMapping("/joinForm")
	public String getPage_User() {
		return "page_User";
	}

	@PostMapping("/join")
	public String insertPage_User(Page_User page_user) {

		System.out.println("user: "+ page_user);
		pageUserService.InsertPage_User(page_user);

		System.out.println("가입된 user : " +page_user);
		return "resultUser";
	}

	@GetMapping("/main")
	public String main() {
		return "index";
	}
	
	@GetMapping("/logout")
	public String logout() {
		return "logout";
	}
	
	@PostMapping("/login")
	@ResponseBody
	public int loginCheck(Page_User page_user, HttpSession session) {//, HttpSession session

		String userId = page_user.getUserId();
		String password = page_user.getPassword();
		
		System.out.println("입력받은 값 : " + userId +","+ password);

		int num = 0;

		num = pageUserService.LoginChecking(userId, password);//, session	

		System.out.println("num :"+ num);

		if (num == 0) {
		
			System.out.println("아이디가 일치하지 않습니다.");
			
		} else if (num == 1) {
			
			Page_User User = pageUserService.SelectPage_UserById(userId);
			
			System.out.println("로그인 ID : " + User);
			System.out.println("로그인 성공!");
			session.setAttribute("userId", User.getUserId());
			session.setAttribute("password", User.getPassword());
			session.setAttribute("name", User.getName());
			session.setAttribute("phone", User.getPhone());
			session.setAttribute("birthDate", User.getBirthDate());
			session.setAttribute("manager", User.getManager());
		} else {

			System.out.println("비밀번호가 일치하지 않습니다.");
		}
		
		return num;
		
	}

	@RequestMapping("/idcheck")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String userId) {
		
		System.out.println(userId);
		int count = 0;

		Map<Object, Object> map = new HashMap<Object, Object>();
		
		count = pageUserService.SelectCountById(userId);

		if (count == 0) {
		}
		
		map.put("cnt", count);

		return map;
	}
}