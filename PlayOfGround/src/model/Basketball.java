package model;

public class Basketball {

	private int id;
	private String basketballImg;
	private String basketballAddress;
	private String basketballName;
	private String basketballPhone;
	private int basketballPrice;
	private String basketballCoordinatesl;
	private byte basketballFloor;
	private byte basketballParking;
	private byte basketballFacility;
	private byte basketballShower;
	
	public Basketball() {}

	public Basketball(int id, String basketballImg, String basketballAddress, String basketballName,
			String basketballPhone, int basketballPrice, String basketballCoordinatesl, byte basketballFloor,
			byte basketballParking, byte basketballFacility, byte basketballShower) {
		super();
		this.id = id;
		this.basketballImg = basketballImg;
		this.basketballAddress = basketballAddress;
		this.basketballName = basketballName;
		this.basketballPhone = basketballPhone;
		this.basketballPrice = basketballPrice;
		this.basketballCoordinatesl = basketballCoordinatesl;
		this.basketballFloor = basketballFloor;
		this.basketballParking = basketballParking;
		this.basketballFacility = basketballFacility;
		this.basketballShower = basketballShower;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBasketballImg() {
		return basketballImg;
	}

	public void setBasketballImg(String basketballImg) {
		this.basketballImg = basketballImg;
	}

	public String getBasketballAddress() {
		return basketballAddress;
	}

	public void setBasketballAddress(String basketballAddress) {
		this.basketballAddress = basketballAddress;
	}

	public String getBasketballName() {
		return basketballName;
	}

	public void setBasketballName(String basketballName) {
		this.basketballName = basketballName;
	}

	public String getBasketballPhone() {
		return basketballPhone;
	}

	public void setBasketballPhone(String basketballPhone) {
		this.basketballPhone = basketballPhone;
	}

	public int getBasketballPrice() {
		return basketballPrice;
	}

	public void setBasketballPrice(int basketballPrice) {
		this.basketballPrice = basketballPrice;
	}

	public String getBasketballCoordinatesl() {
		return basketballCoordinatesl;
	}

	public void setBasketballCoordinatesl(String basketballCoordinatesl) {
		this.basketballCoordinatesl = basketballCoordinatesl;
	}

	public byte getBasketballFloor() {
		return basketballFloor;
	}

	public void setBasketballFloor(byte basketballFloor) {
		this.basketballFloor = basketballFloor;
	}

	public byte getBasketballParking() {
		return basketballParking;
	}

	public void setBasketballParking(byte basketballParking) {
		this.basketballParking = basketballParking;
	}

	public byte getBasketballFacility() {
		return basketballFacility;
	}

	public void setBasketballFacility(byte basketballFacility) {
		this.basketballFacility = basketballFacility;
	}

	public byte getBasketballShower() {
		return basketballShower;
	}

	public void setBasketballShower(byte basketballShower) {
		this.basketballShower = basketballShower;
	}

	@Override
	public String toString() {
		return "Basketball [id=" + id + ", basketballImg=" + basketballImg + ", basketballAddress=" + basketballAddress
				+ ", basketballName=" + basketballName + ", basketballPhone=" + basketballPhone + ", basketballPrice="
				+ basketballPrice + ", basketballCoordinatesl=" + basketballCoordinatesl + ", basketballFloor="
				+ basketballFloor + ", basketballParking=" + basketballParking + ", basketballFacility="
				+ basketballFacility + ", basketballShower=" + basketballShower + "]";
	}
}
