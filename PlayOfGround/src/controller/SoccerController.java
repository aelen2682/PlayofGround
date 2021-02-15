package controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.Basketball;
import model.Board;
import model.Soccer;
import service.SoccerService;

@Controller
@RequestMapping("/soccer")
public class SoccerController {

	@Autowired
	SoccerService soccerSerivce;

	@GetMapping("/Form")
	public String SoccerForm() {

		return "soccerForm";
	}

	@GetMapping("/list")
	public String SoccerList(Model m,Soccer soccer) {
		List<Soccer> soccerList = soccerSerivce.SoccerList();
		System.out.println("list값 : " + soccerList);
		m.addAttribute("soccerList", soccerList);
		return "soccerList";
	}

	@PostMapping("/insert")
	public String SoccerInsert(Soccer soccer, MultipartFile[] file) {
		System.out.println("입력받은 값 : " + soccer);

		for (int i = 0; i < file.length; i++) {

			String path = "C:\\Users\\박돌맹\\git\\WebProject\\Project\\WebContent\\soccer_img";

			if (!file[i].isEmpty()) {

				File f = new File(path, file[i].getOriginalFilename());
				System.out.println("f : " + f);
				try {
					f.mkdirs();
					file[i].transferTo(f);
					soccer.setSoccerImg(file[i].getOriginalFilename());
				} catch (Exception e) {

					e.printStackTrace();
				}
			}
			soccerSerivce.InsertSoccer(soccer);
			System.out.println(soccer);
		}
		return "redirect:list";
	}	

	//Soccer 상세페이지
	@GetMapping("/detail")
	public String SoccerDetail(int id, Model m) {
		Soccer soccer = soccerSerivce.SelectSoccerById(id);
		System.out.println("SoccerDetail : "+soccer);
		m.addAttribute("soccer", soccer);
		return "soccerDetail";
	}

	@GetMapping("/updateForm")
	public String SoccerUpdateForm(int id, Model m) {
		Soccer soccer = soccerSerivce.SelectSoccerById(id);
		System.out.println("수정전 : " + soccer);
		m.addAttribute("soccer", soccer);
		return "soccerUpdate";
	}

	//Soccer 상세페이지 수정
	@PostMapping("/update")
	public String SoccerUpdate(Soccer soccer, Model m, MultipartFile[] file) {

		for (int i = 0; i < file.length; i++) {

			String path = "C:\\Users\\박돌맹\\git\\WebProject\\Project\\WebContent\\soccer_img";

			if (!file[i].isEmpty()) {

				File f = new File(path, file[i].getOriginalFilename());
				System.out.println("f : " + f);
				try {
					f.mkdirs();
					file[i].transferTo(f);
					soccer.setSoccerImg(file[i].getOriginalFilename());
				} catch (Exception e) {

					e.printStackTrace();
				}
			}
			soccerSerivce.UpdateSoccer(soccer);
			System.out.println("수정 값:"+soccer);
		}
		return "redirect:list";
	}

	//Soccer 삭제
	@GetMapping("/delete")
	public String SoccerDelete(int id) {
		soccerSerivce.DeleteSoccer(id);
		return "redirect:list";
	}
	
	//에약 기능
	@GetMapping("/reservation")
	public String SoocerReservationUpdateForm(int id, Model m) {
		Soccer soccer = soccerSerivce.SelectSoccerById(id);
		System.out.println("예약구장 정보 : " + soccer);
		m.addAttribute("soccer", soccer);
		return "reservation";
	}
}
