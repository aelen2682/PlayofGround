package model;

public class Footsal {

	private int id;
	private String footsalImg;
	private String footsalAddress;
	private String footsalName;
	private String footsalPhone;
	private int footsalPrice;
	private String footsalCoordinatesl;
	private byte footsalParking;
	private byte footsalFacility;
	private byte footsalShower;
	private byte footsalBall;
	private byte footsalVest;
	private byte footsalShoes;
	
	public Footsal() {}

	public Footsal(int id, String footsalImg, String footsalAddress, String footsalName, String footsalPhone,
			int footsalPrice, String footsalCoordinatesl, byte footsalParking, byte footsalFacility, byte footsalShower,
			byte footsalBall, byte footsalVest, byte footsalShoes) {
		super();
		this.id = id;
		this.footsalImg = footsalImg;
		this.footsalAddress = footsalAddress;
		this.footsalName = footsalName;
		this.footsalPhone = footsalPhone;
		this.footsalPrice = footsalPrice;
		this.footsalCoordinatesl = footsalCoordinatesl;
		this.footsalParking = footsalParking;
		this.footsalFacility = footsalFacility;
		this.footsalShower = footsalShower;
		this.footsalBall = footsalBall;
		this.footsalVest = footsalVest;
		this.footsalShoes = footsalShoes;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFootsalImg() {
		return footsalImg;
	}

	public void setFootsalImg(String footsalImg) {
		this.footsalImg = footsalImg;
	}

	public String getFootsalAddress() {
		return footsalAddress;
	}

	public void setFootsalAddress(String footsalAddress) {
		this.footsalAddress = footsalAddress;
	}

	public String getFootsalName() {
		return footsalName;
	}

	public void setFootsalName(String footsalName) {
		this.footsalName = footsalName;
	}

	public String getFootsalPhone() {
		return footsalPhone;
	}

	public void setFootsalPhone(String footsalPhone) {
		this.footsalPhone = footsalPhone;
	}

	public int getFootsalPrice() {
		return footsalPrice;
	}

	public void setFootsalPrice(int footsalPrice) {
		this.footsalPrice = footsalPrice;
	}

	public String getFootsalCoordinatesl() {
		return footsalCoordinatesl;
	}

	public void setFootsalCoordinatesl(String footsalCoordinatesl) {
		this.footsalCoordinatesl = footsalCoordinatesl;
	}

	public byte getFootsalParking() {
		return footsalParking;
	}

	public void setFootsalParking(byte footsalParking) {
		this.footsalParking = footsalParking;
	}

	public byte getFootsalFacility() {
		return footsalFacility;
	}

	public void setFootsalFacility(byte footsalFacility) {
		this.footsalFacility = footsalFacility;
	}

	public byte getFootsalShower() {
		return footsalShower;
	}

	public void setFootsalShower(byte footsalShower) {
		this.footsalShower = footsalShower;
	}

	public byte getFootsalBall() {
		return footsalBall;
	}

	public void setFootsalBall(byte footsalBall) {
		this.footsalBall = footsalBall;
	}

	public byte getFootsalVest() {
		return footsalVest;
	}

	public void setFootsalVest(byte footsalVest) {
		this.footsalVest = footsalVest;
	}

	public byte getFootsalShoes() {
		return footsalShoes;
	}

	public void setFootsalShoes(byte footsalShoes) {
		this.footsalShoes = footsalShoes;
	}

	@Override
	public String toString() {
		return "Footsal [id=" + id + ", footsalImg=" + footsalImg + ", footsalAddress=" + footsalAddress
				+ ", footsalName=" + footsalName + ", footsalPhone=" + footsalPhone + ", footsalPrice=" + footsalPrice
				+ ", footsalCoordinatesl=" + footsalCoordinatesl + ", footsalParking=" + footsalParking
				+ ", footsalFacility=" + footsalFacility + ", footsalShower=" + footsalShower + ", footsalBall="
				+ footsalBall + ", footsalVest=" + footsalVest + ", footsalShoes=" + footsalShoes + "]";
	}
}