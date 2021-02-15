package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.ReservationMapper;
import model.Reservation;

@Service
public class ReservationService {

	@Autowired
	ReservationMapper reMapper;

	//Reservation 리스트 
	public List<Reservation> ReservationList() {
		return reMapper.selectReservationAll();
	}

	public Reservation selectById(int id) {
		return reMapper.selectById(id);
	}

	//Reservation List PageUser_ID.
	public List<Reservation> SelectListPage_UserById(String userId) {
		return reMapper.selectListUserById(userId);
	}

	//Reservation List API_User ID.
	public List<Reservation> SelectListAPI_UserById(Integer apiId) {
		return reMapper.selectListAPIUserById(apiId);
	}

	public List<Reservation> SelectListDateById(String reservationDate) {
		// TODO Auto-generated method stub
		return reMapper.selectListByDate(reservationDate);
	}

	public Reservation SelectByDateName(String reservationDate, String reservationName) {
		return reMapper.selectByDateName(reservationDate, reservationName);
	}
	
	//Reservation PageUser_ID.
	public Reservation SelectPage_UserById(String userId) {
		return reMapper.selectReservationUserById(userId);
	}

	//Reservation  API_User ID.
	public Reservation SelectAPI_UserById(Integer apiId) {
		return reMapper.selectReservationAPIUserById(apiId);
	}
	//Reservation API_User 추가
	public int InsertAPI_UserReservation(Reservation reservation) {
		return reMapper.insertAPIIdReservation(reservation);
	}

	//Reservation User 추가
	public int InsertPage_UserReservation(Reservation reservation) {
		return reMapper.insertUserIdReservation(reservation);
	}

	public int UpdateAPI_User(Reservation reservation) {

		return reMapper.updateAPIIdReservation(reservation);
	}

	public int UpdatePage_User(Reservation reservation) {

		return reMapper.updateUserIdReservation(reservation);
	}

	public int DeletePage_User(int id) {

		return reMapper.deleteUserReservation(id);
	}

	//Reservation DateChecking
	public int DateChecking(String reservationDate, String reservationName){
		
		System.out.println("Service 입력받은 값 : " + reservationDate +","+ reservationName);
		
		//Reservation getDateName = reMapper.selectByDateName(reservationDate, reservationName);
		//Reservation getDate = reMapper.selectByDate(reservationDate);
		Reservation getDateName = reMapper.selectByDateName(reservationDate, reservationName);
		System.out.println("getDateName:"+getDateName);

		int getId = 0; 

		int num = 0;

		if (getDateName == null) {

			getId = 0;

			System.out.println("getId : " + getId);
			
			return 0;

		} else {

				System.out.println("예약 날짜 : "+getDateName.getReservationDate());
				System.out.println("예약 구장 : " + getDateName.getReservationName());
				System.out.println("입력받은 구장 : " + reservationName);

				getId = 1;

				if (getDateName.getReservationName().equals(reservationName)) {

					return 1;

				} else {

					num = 2;
			}
		}
		return num;
	}
}
