package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.FootsalMapper;
import model.Footsal;

@Service
public class FootsalService {

	@Autowired
	FootsalMapper footsalMapper;

	//Footsal 리스트 
	public List<Footsal> FootsalList() {
		return footsalMapper.selectFootsalAll();
	}

	//Footsal ById
	public Footsal SelectFootsalById(int id) {
		return footsalMapper.selectFootsalById(id);
	}
	
	//Footsal 추가
	public int InsertFootsal(Footsal footsal) {
		return footsalMapper.insertFootsal(footsal);
	}

	//Footsal Update
	public int UpdateFootsal(Footsal footsal) {
		return footsalMapper.updateFootsal(footsal);
	}

	//Footsal Delete
	public int DeleteFootsal(int id) {
		return footsalMapper.deleteFootsal(id);
	}
}