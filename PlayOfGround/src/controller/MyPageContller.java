package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import model.API_User;
import model.Page_User;
import service.API_UserSerivce;
import service.Page_UserSerivce;

@Controller
@RequestMapping("/MyPage")
public class MyPageContller {

	@Autowired
	API_UserSerivce APIUserSerivce;
	
	@Autowired
	Page_UserSerivce PageUserSerivce;
	
	@GetMapping("/Information")
	public String updatePage() {
		
		return "mypage";
	}
	
	@GetMapping("/main")
	public String main() {
		return "logo";
	}
	@GetMapping("/logout")
	public String logout() {
		return "index";
	}
	
	@PostMapping("/Update")
	public String updatePage(Page_User page_user) {
		
		PageUserSerivce.UpdatePage_User(page_user);
		System.out.println("수정 후: "+ page_user);
		
		return "mypage_UpdateResult";
	}
	
	@PostMapping("/APIUpdate")
	public String APIUpdatePage(API_User api_user) {
		
		APIUserSerivce.UpdateAPI_User(api_user);
		System.out.println("수정 후: "+ api_user);
		
		return "mypage_UpdateResult";
	}
	
	@RequestMapping(value = "/mypageDelete", method = RequestMethod.GET)
	public String deleteForm() {
		System.out.println("딜리트 이동!");
		return "mypageDelete";
	}
	
	@RequestMapping(value = "/Delete", method = RequestMethod.POST)
	public String deleteCheck(Page_User page_user, HttpSession session, RedirectAttributes rttr) {
		
		String userId = (String) session.getAttribute("userId");
		System.out.println("session: " + userId);
		
		Page_User user = PageUserSerivce.SelectPage_UserById(userId);
		System.out.println("select한 정보: " + user);
		int id = user.getId();
		String password = user.getPassword();
		System.out.println("select한 password: " + password);
		String inputPw = page_user.getPassword();
		System.out.println("입력받은  password: " + inputPw);
		
		if (!(password.equals(inputPw))) {
			System.out.println("비밀번호 틀림");
			rttr.addFlashAttribute("msg", false);
			return "redirect:/MyPage/mypageDelete";
		}
		PageUserSerivce.DaletePage_User(id);
		System.out.println("삭제완료");
		session.invalidate();
		
		return "index"; 
	}
	
	@RequestMapping(value = "/APIDelete", method = RequestMethod.POST)
	public String APIDeletePage(API_User api_user, HttpSession session, RedirectAttributes rttr) {
		
		Integer apiId = (Integer) session.getAttribute("apiId");
		System.out.println("session apiId: "+ apiId);
		API_User user = APIUserSerivce.SelectAPI_UserById(apiId);
		System.out.println("select한 정보: " + user);
		String name = user.getName();
		System.out.println("select한 name: " + name);
		String inputname = api_user.getName();
		System.out.println("입력받은  password: " + inputname);
		String phone = user.getPhone();
		System.out.println("select한 phone: " + phone);
		String inputphone = api_user.getPhone();
		System.out.println("입력받은  phone: " + inputphone);
		
		if (name.equals(inputname) && (phone.equals(inputphone))) {
			APIUserSerivce.DeleteAPI_User(apiId);
			System.out.println("삭제완료");
			session.invalidate();
			return "index";
		}
		System.out.println("비밀번호 틀림");
		rttr.addFlashAttribute("msg", false);
		return "redirect:/MyPage/mypageDelete";
	}
	
}
