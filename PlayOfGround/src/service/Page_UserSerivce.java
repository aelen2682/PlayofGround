package service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.Page_UserMapper;
import model.Page_User;

@Service
public class Page_UserSerivce {

	@Autowired
	Page_UserMapper puMapper;

	//page_user 리스트 
	public List<Page_User> Page_UserList() {
		return puMapper.selectAll();
	}

	//page_user 추가
	public int InsertPage_User(Page_User page_user) {
		return puMapper.insertPage_User(page_user);
	}

	//page_user ID 중복.
	public Page_User SelectPage_UserById(String userId) {
		return puMapper.selectOneById(userId);
	}
	
	//page_user Count
	public int SelectCountById(String userId) {
		return puMapper.selectCountById(userId);
	}
	
	//page_user Update
	public int UpdatePage_User(Page_User page_user) {
		return puMapper.updatePage_User(page_user);
	}
	
	//page_user Delete
	public int DaletePage_User(int id) {
		return puMapper.deletePage_User(id);
	}
	
	//page_user LoginChecking
	public int LoginChecking(String userId, String password){

		Page_User getUserId = puMapper.selectOneById(userId);

		System.out.println("getUserId:"+getUserId);

		int getId = 0; 
		
		int num;

		if (getUserId == null) {

			getId = 0;

			System.out.println("getId : " + getId);

		} else {

			getId = getUserId.getId();
			
			System.out.println("고유번호:"+getId);
			System.out.println("유저ID: "+getUserId.getUserId());
			System.out.println("유저 Password : " + getUserId.getPassword());
			System.out.println("입력받은 password : " + password);
		}
			
		if (getId == 0) {
			
			return 0;
		}
		if (getUserId.getPassword().equals(password)) {
			
			return 1;
			
		} else {
			
			num = 2;
		}
		return num;
	}
	
	//아이디 중복 확인
    public boolean Select_Boolean_Page_UserById(String userId) {
    	
    	boolean result = false;
    	
    	Page_User user = puMapper.selectOneById(userId);
    	
    	String user_id = user.getUserId();

    	//서버의 없을 시 : 참, 중복 아이디 있을 시 : 거짓을 판별해서 리턴함
        if (user_id.equals(null)) {
        	result = true;
        }
        
        return result;
    }
}
