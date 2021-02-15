package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Page_User;

@Mapper
public interface Page_UserMapper {
	
	//page_user 리스트
	@Select("select * from page_user")
	public List<Page_User> selectAll();
	
	//page_user 아이디 카운트
	@Select("select count(*) from page_user where user_id=#{userId}")
	public int selectCountById(String userId);
	
	//page_user Page_User 아이디 찾기
	@Select("select * from page_user where user_id=#{userId}")
	public Page_User selectOneById(String userId);
	
	//page_user 비밀번호 찾기
	@Select("select * from page_user where password=#{password}")
	public Page_User selectOneByPassword(String password);

	//page_user 추가
	@Insert("insert into page_user(user_id, password, name, gender, phone, birth_date) values(#{userId}, #{password}, #{name}, "
			+ "#{gender}, #{phone}, #{birthDate})")
	public int insertPage_User(Page_User page_user);
	
	//page_user phone 업데이트
	@Update("update page_user set user_id=#{userId}, password=#{password}, name=#{name}, "
			+ "phone=#{phone}, birth_date=#{birthDate} where user_id=#{userId}")
	public int updatePage_User(Page_User page_user);
	
	//page_user 삭제
	@Delete("delete from page_user where id=#{id}")
	public int deletePage_User(int id);

}
