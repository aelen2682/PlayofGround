package controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import model.Basketball;
import service.BasketballService;

@Controller
@RequestMapping("/basketball")
public class BasketballController {

	@Autowired
	BasketballService basketballService;
	
	@Autowired
	
	
	@GetMapping("/Form")
	public String BasketballForm() {

		return "basketballForm";
	}

	@GetMapping("/list")
	public String BasketballList(Model m, Basketball basketball) {
		List<Basketball> basketballList = basketballService.BasketballList();
		System.out.println("list값 : " + basketballList);
		m.addAttribute("basketballList", basketballList);
		return "basketballList";
	}

	@PostMapping("/insert")
	public String BasketballInsert(Basketball basketball, MultipartFile[] file) {
		System.out.println("입력받은 값 : " + basketball);

		for (int i = 0; i < file.length; i++) {

			String path = "C:\\Users\\박돌맹\\git\\WebProject\\Project\\WebContent\\basketball_img";

			if (!file[i].isEmpty()) {

				File f = new File(path, file[i].getOriginalFilename());
				System.out.println("f : " + f);
				try {
					f.mkdirs();
					file[i].transferTo(f);
					basketball.setBasketballImg(file[i].getOriginalFilename());
				} catch (Exception e) {

					e.printStackTrace();
				}
			}
		}
		basketballService.InsertBasketball(basketball);
		System.out.println(basketball);
		return "redirect:list";
	}

	//Basketball 상세페이지
	@GetMapping("/detail")
	public String BasketballDetail(int id, Model m) {
		Basketball basketball = basketballService.SelectBasketballById(id);
		m.addAttribute("basketball", basketball);
		return "basketballDetail";
	}

	@GetMapping("/updateForm")
	public String BasketballUpdateForm(int id, Model m) {
		Basketball basketball = basketballService.SelectBasketballById(id);
		System.out.println("수정전 : " + basketball);
		m.addAttribute("basketball", basketball);
		return "basketballUpdate";
	}

	//Basketball 상세페이지 수정
	@PostMapping("/update")
	public String BasketballUpdate(Basketball basketball, Model m, MultipartFile[] file) {

		for (int i = 0; i < file.length; i++) {

			String path = "C:\\Users\\박돌맹\\git\\WebProject\\Project\\WebContent\\basketball_img";

			if (!file[i].isEmpty()) {

				File f = new File(path, file[i].getOriginalFilename());
				System.out.println("f : " + f);
				try {
					f.mkdirs();
					file[i].transferTo(f);
					basketball.setBasketballImg(file[i].getOriginalFilename());
				} catch (Exception e) {

					e.printStackTrace();
				}
			}
			basketballService.UpdateBasketball(basketball);
			System.out.println("수정 값:"+basketball);
		}
		return "redirect:list";
	}
	
	//Basketball 삭제
	@GetMapping("/delete")
	public String BasketballDelete(int id) {
		basketballService.DeleteBasketball(id);
		return "redirect:list";
	}

	//Basketball 상세페이지 수정
	@PostMapping("/reservationUpdate")
	public String BasketballReservationUpdate(Basketball basketball, Model m, MultipartFile[] file) {
			basketballService.UpdateBasketball(basketball);
			System.out.println("수정 값:"+basketball);
		return "redirect:list";
	}
	
	//에약 기능
	@GetMapping("/reservation")
	public String BasketballReservationUpdateForm(int id, Model m) {
		Basketball basketball = basketballService.SelectBasketballById(id);
		System.out.println("예약구장 정보 : " + basketball);
		m.addAttribute("basketball", basketball);
		return "reservation";
	}
	
	
}
