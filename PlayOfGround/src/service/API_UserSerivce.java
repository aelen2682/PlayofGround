package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.API_UserMapper;
import model.API_User;
import model.Page_User;

@Service
public class API_UserSerivce {

	@Autowired
	API_UserMapper ApiUserMapper;

	//API_User 리스트 
	public List<API_User> API_UserList() {
		return ApiUserMapper.selectAll();
	}

	//API_User ID.
	public API_User SelectAPI_UserById(Integer apiId) {
		return ApiUserMapper.selectOneById(apiId);
	}

	//API_User Count
	public int SelectCountById(Integer apiId) {
		return ApiUserMapper.selectCountById(apiId);
	}

	//API_User 추가
	public int InsertAPI_User(API_User apiId) {
		return ApiUserMapper.insertAPI_User(apiId);
	}

	//API_User 아이디 중복 확인
	public boolean Select_Boolean_Page_UserById(Integer apiId) {

		boolean result = false;

		API_User user = ApiUserMapper.selectOneById(apiId);

		//서버의 없을 시 : 참, 중복 아이디 있을 시 : 거짓을 판별해서 리턴함
		if (user.equals(null)) {
			result = true;
		}

		return result;
	}
	
	public int UpdateAPI_User(API_User api_user) {
		
		return ApiUserMapper.updateAPI_User(api_user);
	}
	
	public int DeleteAPI_User(Integer apiId) {
		
		return ApiUserMapper.deleteAPI_User(apiId);
	}
	
}