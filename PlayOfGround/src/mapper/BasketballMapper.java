package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Basketball;
import model.Reservation;

@Mapper
public interface BasketballMapper {

	//Basketball 리스트
	@Select("select * from basketball")
	public List<Basketball> selectBasketballAll();

	//Basketball Id찾기
	@Select("select * from basketball where id = #{id}")
	public Basketball selectBasketballById(int id);
	
	//Basketball 추가
	@Insert("insert into basketball(id, basketball_img, basketball_address, basketball_name, basketball_phone, "
			+ "basketball_price, basketball_coordinatesl, basketball_floor, basketball_parking, basketball_facility, basketball_shower)"
			+ " values (#{id}, #{basketballImg}, #{basketballAddress}, #{basketballName}, #{basketballPhone}, #{basketballPrice}, "
			+ "#{basketballCoordinatesl}, #{basketballFloor}, #{basketballParking}, #{basketballFacility}, #{basketballShower})")
	public int insertBasketball(Basketball basketball);

	//Basketball 업데이트
	@Update("update basketball set basketball_img=#{basketballImg}, basketball_address=#{basketballAddress}, basketball_name=#{basketballName}, "
			+ "basketball_phone=#{basketballPhone}, basketball_price=#{basketballPrice}, basketball_coordinatesl=#{basketballCoordinatesl}, basketball_floor=#{basketballFloor} , "
			+ "basketball_parking=#{basketballParking}, basketball_facility=#{basketballFacility}, basketball_shower=#{basketballShower} where id=#{id}")
	public int updateBasketball(Basketball basketball);

	//Basketball 삭제
	@Delete("delete from basketball where id=#{id}")
	public int deleteBasketball(int id);
}
