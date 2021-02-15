package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Reservation;
import service.ReservationService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	ReservationService reService;

	@GetMapping("/list")
	public String ReservationList(Model m, Reservation reservation, HttpSession session) {

		String userId = (String)session.getAttribute("userId");
		Integer apiId = (Integer)session.getAttribute("apiId");
		System.out.println("userId : "+userId +", apiId : "+ apiId );
		if (apiId != null) {
			List<Reservation> ReservationList = reService.SelectListAPI_UserById(apiId);
			session.setAttribute("ReservationList", ReservationList);
			System.out.println("apiUserList : "+ ReservationList);
		} else {
			System.out.println("else문 실행!");
			List<Reservation> ReservationList = reService.SelectListPage_UserById(userId);
			session.setAttribute("ReservationList", ReservationList);
			System.out.println("UserList : "+ ReservationList);
		}

		return "reservationList";
	}

	@PostMapping("/insert")
	@ResponseBody
	public int ReservationInsert(Model m, Reservation reservation) {

		String reservationDate = reservation.getReservationDate();
		String reservationName = reservation.getReservationName();
		System.out.println(reservation);
		System.out.println("입력받은 값 : " + reservationDate +","+ reservationName);

		int num = 0;

		num = reService.DateChecking(reservationDate, reservationName);	

		System.out.println("num :"+ num);

		if (num == 0) {
			String userId = reservation.getUserId();
			Integer apiId = reservation.getApiId();
			System.out.println("userId: " + userId +", apiId: " + apiId);
			if (userId != null) {

				reService.InsertPage_UserReservation(reservation);
				System.out.println("userId로 예약완료!");
			} else {

				reService.InsertAPI_UserReservation(reservation);
				System.out.println("apiId로 예약완료!");
			}

		} else if (num == 1) {

			System.out.println("예약이 이미 되어 있습니다.");

		} else {

			System.out.println("예약 날짜의 예약 가능합니다.");
		}

		return num;
	}

	@GetMapping("/updateForm")
	public String updateForm(int id, Model m) {
		Reservation reservation = reService.selectById(id);
		m.addAttribute("reservation", reservation);
		return "reservationUpdate";
	}


	@PostMapping("/update")
	public String ReservationUpdate(Reservation reservation) {

		System.out.println("입력받은 값 : " + reservation);

		String userId = reservation.getUserId();
		Integer apiId = reservation.getApiId();
		System.out.println("Cont userId: " + userId +", apiId: " + apiId);
		if (userId != null) {

			reService.UpdatePage_User(reservation);
			System.out.println("userId로 수정완료!");
		} else {

			reService.UpdateAPI_User(reservation);
			System.out.println("apiId로 수정완료!");
		}

		return "redirect:list";
	}

	@GetMapping("/delete")
	public String RsDelete(int id) {
		reService.DeletePage_User(id);
		return "redirect:list";
	}
}	
