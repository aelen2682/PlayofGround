package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.API_User;
import model.Page_User;

@Mapper
public interface API_UserMapper {

	//api_user 리스트
	@Select("select * from api_user")
	public List<API_User> selectAll();

	//api_user 아이디 카운트
	@Select("select count(*) from api_user where api_id=#{apiId}")
	public int selectCountById(int apiId);

	//api_user 아이디 찾기
	@Select("select * from api_user where api_id=#{apiId}")
	public API_User selectOneById(int apiId);

	//api_user 추가
	@Insert("insert into api_user(id, company, api_id, name, gender, phone, birth_date) "
			+ "values(#{id}, #{company}, #{apiId}, #{name}, #{gender}, #{phone}, #{birthDate})")
	public int insertAPI_User(API_User api_user);

	//page_user 업데이트
	@Update("update api_user set company=#{company}, name=#{name}, phone=#{phone}, birth_date=#{birthDate} "
			+ "where api_id=#{apiId}")
	public int updateAPI_User(API_User api_user);
	
	//api_user 삭제
	@Delete("delete from api_user where api_id=#{apiId}")
	public Integer deleteAPI_User(Integer apiId);


}
