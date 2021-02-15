package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import model.API_User;
import model.KakaoProfile;
import model.OAuthToken;
import service.API_UserSerivce;

@Controller
public class APIController {

	@Autowired
	API_UserSerivce apiserivce;
	
	@PostMapping("api_join")
	public String api_join(API_User api_user) {
		System.out.println("폼입력받은 정보: "+api_user);
		apiserivce.InsertAPI_User(api_user);
		System.out.println("가입된 user : " + api_user);
		return "API_User_Result";
	}
	
	@SuppressWarnings("unused")
	@GetMapping("/auth/kakao/callback")
	public String kakaoCallback(Model m, String code, HttpSession session) {

		//POST방식으로 key=value 데이터를 요청
		//Retrofit2
		//OkHttp
		//RestTemplate 등등 가능함.

		RestTemplate rt = new RestTemplate();

		//HttpHeaers 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		//HttpBody 오브젝트 생성.
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "de4d29672e935f64ea8e839daf222c18");
		params.add("redirect_uri", "http://localhost:8090/auth/kakao/callback");
		params.add("code", code);

		//HttpHeaers와 HttpBody를 하나의 오브젝트에 담기.
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = 
				new HttpEntity<MultiValueMap<String,String>>(params, headers);

		//Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음.
		ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				kakaoTokenRequest,
				String.class
				);

		//Gson, Json Simple, ObjectMapper
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;

		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		System.out.println(oauthToken.getAccess_token());

		RestTemplate rt2 = new RestTemplate();

		//HttpHeaers 오브젝트 생성
		HttpHeaders headers2 = new HttpHeaders();

		headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		//HttpHeaers와 HttpBody를 하나의 오브젝트에 담기.
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest = 
				new HttpEntity<>(headers2);

		//Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음.
		ResponseEntity<String> response2 = rt2.exchange(
				"https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST,
				kakaoProfileRequest,
				String.class
				);

		//Gson, Json Simple, ObjectMapper
		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile kakaoProfile = null;

		try {
			kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		System.out.println("카카오 아이디 (번호) :"+kakaoProfile.getId());
		System.out.println("카카오 닉네임 : " +kakaoProfile.getProperties().nickname);
		System.out.println("카카오 연령대 : "+kakaoProfile.getKakaoAccount().getAgeRange());
		
		
		int apiId = kakaoProfile.getId();
		
		int CountId = apiserivce.SelectCountById(apiId);
		
		if (CountId == 0) {
			session.setAttribute("apiId", apiId);
			System.out.println("null apiId:"+ apiId);
			System.out.println("countId : " + CountId);
			
			return "API_User";
			
		} else {
			System.out.println("로그인 성공!");
			
			API_User api_user = apiserivce.SelectAPI_UserById(apiId);
			session.setAttribute("apiId", apiId);
			session.setAttribute("apiname", api_user.getName());
			session.setAttribute("apiphone", api_user.getPhone());
			session.setAttribute("apibirthDate", api_user.getBirthDate());
			session.setAttribute("manager", api_user.getManager());
			System.out.println(apiId);
			return "index";
		}
		
	}
	
}