package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.SoccerMapper;
import model.Soccer;

@Service
public class SoccerService {

	@Autowired
	SoccerMapper soccerMapper;

	//Soccer 리스트 
	public List<Soccer> SoccerList() {
		return soccerMapper.selectSoccerAll();
	}

	//Soccer ById
	public Soccer SelectSoccerById(int id) {
		return soccerMapper.selectSoccerById(id);
	}
	
	//Soccer 추가
	public int InsertSoccer(Soccer soccer) {
		return soccerMapper.insertSoccer(soccer);
	}

	//Soccer Update
	public int UpdateSoccer(Soccer soccer) {
		return soccerMapper.updateSoccer(soccer);
	}

	//Soccer Delete
	public int DeleteSoccer(int id) {
		return soccerMapper.deleteSoccer(id);
	}
}
