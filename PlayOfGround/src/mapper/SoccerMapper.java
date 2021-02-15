package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Soccer;

@Mapper
public interface SoccerMapper {

	//Soccer 리스트
	@Select("select * from soccer")
	public List<Soccer> selectSoccerAll();

	//Soccer Id찾기
	@Select("select * from soccer where id = #{id}")
	public Soccer selectSoccerById(int id);
	
	//Soccer 추가
	@Insert("insert into soccer(id, soccer_img, soccer_address, soccer_name, soccer_phone, soccer_standard, "
			+ "soccer_price, soccer_coordinatesl, soccer_grass, soccer_lighting, soccer_parking, soccer_shower)"
			+ " values (#{id}, #{soccerImg}, #{soccerAddress}, #{soccerName}, #{soccerPhone}, #{soccerStandard}, "
			+ "#{soccerPrice}, #{soccerCoordinatesl}, #{soccerGrass}, #{soccerLighting} ,#{soccerParking}, #{soccerShower})")
	public int insertSoccer(Soccer soccer);

	//Soccer 업데이트
	@Update("update soccer set soccer_img=#{soccerImg}, soccer_address=#{soccerAddress}, soccer_name=#{soccerName}, "
			+ "soccer_phone=#{soccerPhone}, soccer_standard=#{soccerStandard}, soccer_price=#{soccerPrice}, soccer_coordinatesl=#{soccerCoordinatesl}, "
			+ "soccer_grass=#{soccerGrass}, soccer_lighting=#{soccerLighting}, soccer_parking=#{soccerParking}, soccer_shower=#{soccerShower} where id=#{id}")
	public int updateSoccer(Soccer soccer);

	//Soccer 삭제
	@Delete("delete from soccer where id=#{id}")
	public int deleteSoccer(int id);

}