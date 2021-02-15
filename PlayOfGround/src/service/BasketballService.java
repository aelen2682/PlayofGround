package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.BasketballMapper;
import model.Basketball;
import model.Reservation;

@Service
public class BasketballService {

	@Autowired
	BasketballMapper basketballMapper;

	//Basketball 리스트 
	public List<Basketball> BasketballList() {
		return basketballMapper.selectBasketballAll();
	}

	//Basketball ById
	public Basketball SelectBasketballById(int id) {
		return basketballMapper.selectBasketballById(id);
	}

	//Basketball 추가
	public int InsertBasketball(Basketball basketball) {
		return basketballMapper.insertBasketball(basketball);
	}

	//Basketball Update
	public int UpdateBasketball(Basketball basketball) {
		return basketballMapper.updateBasketball(basketball);
	}

	//Basketball Delete
	public int DeleteBasketball(int id) {
		return basketballMapper.deleteBasketball(id);
	}
}