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
import model.Footsal;
import service.FootsalService;

@Controller
@RequestMapping("/footsal")
public class FootsalController {

	@Autowired
	FootsalService footsalService;

	@GetMapping("/Form")
	public String FootsalForm() {

		return "footsalForm";
	}

	@GetMapping("/list")
	public String FootsalList(Model m, Footsal footsal) {
		List<Footsal> footsalList = footsalService.FootsalList();
		System.out.println("list값 : " + footsalList);
		m.addAttribute("footsalList", footsalList);
		return "footsalList";
	}

	@PostMapping("/insert")
	public String Footsalnsert(Footsal footsal, MultipartFile[] file) {
		System.out.println("입력받은 값 : " + footsal);

		for (int i = 0; i < file.length; i++) {

			String path = "C:\\Users\\박돌맹\\git\\WebProject\\Project\\WebContent\\footsal_img";

			if (!file[i].isEmpty()) {

				File f = new File(path, file[i].getOriginalFilename());
				System.out.println("f : " + f);
				try {
					f.mkdirs();
					file[i].transferTo(f);
					footsal.setFootsalImg(file[i].getOriginalFilename());
				} catch (Exception e) {

					e.printStackTrace();
				}
			}
		}
		footsalService.InsertFootsal(footsal);
		System.out.println(footsal);
		return "redirect:list";
	}	

	//Footsal 상세페이지
	@GetMapping("/detail")
	public String FootsalDetail(int id, Model m) {
		Footsal footsal = footsalService.SelectFootsalById(id);
		m.addAttribute("footsal", footsal);
		return "footsalDetail";
	}

	@GetMapping("/updateForm")
	public String FootsalUpdateForm(int id, Model m) {
		Footsal footsal = footsalService.SelectFootsalById(id);
		System.out.println("수정전 : " + footsal);
		m.addAttribute("footsal", footsal);
		return "footsalUpdate";
	}

	//Footsal 상세페이지 수정
	@PostMapping("/update")
	public String FootsalUpdate(Footsal footsal, Model m, MultipartFile[] file) {

		for (int i = 0; i < file.length; i++) {

			String path = "C:\\Users\\박돌맹\\git\\WebProject\\Project\\WebContent\\footsal_img";

			if (!file[i].isEmpty()) {

				File f = new File(path, file[i].getOriginalFilename());
				System.out.println("f : " + f);
				try {
					f.mkdirs();
					file[i].transferTo(f);
					footsal.setFootsalImg(file[i].getOriginalFilename());
				} catch (Exception e) {

					e.printStackTrace();
				}
			}
			footsalService.UpdateFootsal(footsal);
			System.out.println("수정 값:"+footsal);
		}
		return "redirect:list";
	}

	//Footsal 삭제
	@GetMapping("/delete")
	public String FootsalDelete(int id) {
		footsalService.DeleteFootsal(id);
		return "redirect:list";
	}
	
	//에약 기능
	@GetMapping("/reservation")
	public String FootsalReservationUpdateForm(int id, Model m) {
		Footsal footsal = footsalService.SelectFootsalById(id);
		System.out.println("예약구장 정보 : " + footsal);
		m.addAttribute("footsal", footsal);
		return "reservation";
	}
}