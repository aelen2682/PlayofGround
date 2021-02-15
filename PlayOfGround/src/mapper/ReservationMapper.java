package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.junit.runners.Parameterized.Parameters;

import model.Reservation;

@Mapper
public interface ReservationMapper {

	//Reservation 리스트
	@Select("select * from reservation")
	public List<Reservation> selectReservationAll();

	//Reservation 예약날짜 중복 체크
	@Select("select * from reservation where reservation_date=#{reservationDate} and reservation_name=#{reservationName}")
	public Reservation selectByDateName(@Param("reservationDate") String reservationDate, @Param("reservationName") String reservationName);

	//Reservation lsit 예약날짜 중복 체크
	@Select("select * from reservation where reservation_date=#{reservationDate}")
	public List<Reservation> selectListByDate(String reservationDate);

	//Reservation 예약구장 중복 체크
	@Select("select * from reservation where reservation_name=#{reservationName}")
	public Reservation selectByName(String reservationName);

	@Select("select * from reservation where id = #{id}")
	public Reservation selectById(int id);

	//Reservation List user_Id찾기
	@Select("select id, reservation_name, reservation_address, reservation_date, user_id, name, phone "
			+ "from reservation where user_id = #{userId}")
	public List<Reservation> selectListUserById(String userId);

	//Reservation List api_Id찾기
	@Select("select id, reservation_name, reservation_address, reservation_date, api_id, name, phone " 
			+ "from reservation where api_id = #{apiId}")
	public List<Reservation> selectListAPIUserById(Integer apiId);

	//Reservation user_Id찾기
	@Select("select id, reservation_name, reservation_address, reservation_date, user_id, name, phone "
			+ "from reservation where user_id = #{userId}")
	public Reservation selectReservationUserById(String userId);

	//Reservation api_Id찾기
	@Select("select id, reservation_name, reservation_address, reservation_date, api_id, name, phone " 
			+ "from reservation where api_id = #{apiId}")
	public Reservation selectReservationAPIUserById(Integer apiId);

	//userId Reservation 추가
	@Insert("insert into reservation(reservation_name, reservation_address, reservation_date, "
			+ "user_id, name, phone) values (#{reservationName},#{reservationAddress},#{reservationDate},"
			+ "#{userId},#{name},#{phone})")
	public int insertUserIdReservation(Reservation reservation);

	//API Id Reservation 추가
	@Insert("insert into reservation(reservation_name, reservation_address, reservation_date, "
			+ "api_id, name, phone) values (#{reservationName},#{reservationAddress},#{reservationDate}, "
			+ "#{apiId},#{name},#{phone})")
	public int insertAPIIdReservation(Reservation reservation);

	//UserId Reservation 업데이트
	@Update("update reservation set reservation_name=#{reservationName}, reservation_address=#{reservationAddress}, "
			+ "reservation_date=#{reservationDate}, user_id=#{userId}, name=#{name}, phone=#{phone} where id=#{id}")
	public int updateUserIdReservation(Reservation reservation);

	//API Id Reservation 업데이트
	@Update("update reservation set reservation_name=#{reservationName}, reservation_address=#{reservationAddress}, "
			+ "reservation_date=#{reservationDate}, api_id=#{apiId}, name=#{name}, phone=#{phone} where id=#{id}")
	public int updateAPIIdReservation(Reservation reservation);

	//삭제
	@Delete("delete from reservation where id=#{id}")
	public int deleteUserReservation(int id);

}