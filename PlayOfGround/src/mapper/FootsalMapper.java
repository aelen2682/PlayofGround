package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Footsal;

@Mapper
public interface FootsalMapper {

	//Footsal 리스트
	@Select("select * from footsal")
	public List<Footsal> selectFootsalAll();

	//Footsal Id찾기
	@Select("select * from footsal where id = #{id}")
	public Footsal selectFootsalById(int id);

	//Footsal 추가
	@Insert("insert into footsal(id, footsal_img, footsal_address, footsal_name, footsal_phone, footsal_price, "
			+ "footsal_coordinatesl, footsal_parking, footsal_facility, footsal_shower, footsal_ball, footsal_vest, footsal_shoes)"
			+ " values (#{id}, #{footsalImg}, #{footsalAddress}, #{footsalName}, #{footsalPhone}, #{footsalPrice}, "
			+ "#{footsalCoordinatesl}, #{footsalParking}, #{footsalFacility}, #{footsalShower} ,#{footsalBall}, #{footsalVest}, #{footsalShoes})")
	public int insertFootsal(Footsal footsal);

	//Footsal 업데이트
	@Update("update footsal set footsal_img=#{footsalImg}, footsal_address=#{footsalAddress}, footsal_name=#{footsalName}, "
			+ "footsal_phone=#{footsalPhone}, footsal_price=#{footsalPrice}, footsal_coordinatesl=#{footsalCoordinatesl}, footsal_parking=#{footsalParking} , "
			+ "footsal_facility=#{footsalFacility}, footsal_shower=#{footsalShower}, footsal_ball=#{footsalBall}, footsal_vest=#{footsalVest}, footsal_shoes=#{footsalShoes}  where id=#{id}")
	public int updateFootsal(Footsal footsal);

	//Footsal 삭제
	@Delete("delete from footsal where id=#{id}")
	public int deleteFootsal(int id);
}
