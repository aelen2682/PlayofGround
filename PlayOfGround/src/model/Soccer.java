package model;

public class Soccer {

	private int id;
	private String soccerImg;
	private String soccerAddress;
	private String soccerName;
	private String soccerPhone;
	private String soccerStandard;
	private int soccerPrice;
	private String soccerCoordinatesl;
	private byte soccerGrass;
	private byte soccerLighting;
	private byte soccerParking;
	private byte soccerShower;
	
	public Soccer() {}

	public Soccer(int id, String soccerImg, String soccerAddress, String soccerName, String soccerPhone,
			String soccerStandard, int soccerPrice, String soccerCoordinatesl, byte soccerGrass, byte soccerLighting,
			byte soccerParking, byte soccerShower) {
		super();
		this.id = id;
		this.soccerImg = soccerImg;
		this.soccerAddress = soccerAddress;
		this.soccerName = soccerName;
		this.soccerPhone = soccerPhone;
		this.soccerStandard = soccerStandard;
		this.soccerPrice = soccerPrice;
		this.soccerCoordinatesl = soccerCoordinatesl;
		this.soccerGrass = soccerGrass;
		this.soccerLighting = soccerLighting;
		this.soccerParking = soccerParking;
		this.soccerShower = soccerShower;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSoccerImg() {
		return soccerImg;
	}

	public void setSoccerImg(String soccerImg) {
		this.soccerImg = soccerImg;
	}

	public String getSoccerAddress() {
		return soccerAddress;
	}

	public void setSoccerAddress(String soccerAddress) {
		this.soccerAddress = soccerAddress;
	}

	public String getSoccerName() {
		return soccerName;
	}

	public void setSoccerName(String soccerName) {
		this.soccerName = soccerName;
	}

	public String getSoccerPhone() {
		return soccerPhone;
	}

	public void setSoccerPhone(String soccerPhone) {
		this.soccerPhone = soccerPhone;
	}

	public String getSoccerStandard() {
		return soccerStandard;
	}

	public void setSoccerStandard(String soccerStandard) {
		this.soccerStandard = soccerStandard;
	}

	public int getSoccerPrice() {
		return soccerPrice;
	}

	public void setSoccerPrice(int soccerPrice) {
		this.soccerPrice = soccerPrice;
	}

	public String getSoccerCoordinatesl() {
		return soccerCoordinatesl;
	}

	public void setSoccerCoordinatesl(String soccerCoordinatesl) {
		this.soccerCoordinatesl = soccerCoordinatesl;
	}

	public byte getSoccerGrass() {
		return soccerGrass;
	}

	public void setSoccerGrass(byte soccerGrass) {
		this.soccerGrass = soccerGrass;
	}

	public byte getSoccerLighting() {
		return soccerLighting;
	}

	public void setSoccerLighting(byte soccerLighting) {
		this.soccerLighting = soccerLighting;
	}

	public byte getSoccerParking() {
		return soccerParking;
	}

	public void setSoccerParking(byte soccerParking) {
		this.soccerParking = soccerParking;
	}

	public byte getSoccerShower() {
		return soccerShower;
	}

	public void setSoccerShower(byte soccerShower) {
		this.soccerShower = soccerShower;
	}

	@Override
	public String toString() {
		return "Soccer [id=" + id + ", soccerImg=" + soccerImg + ", soccerAddress=" + soccerAddress + ", soccerName="
				+ soccerName + ", soccerPhone=" + soccerPhone + ", soccerStandard=" + soccerStandard + ", soccerPrice="
				+ soccerPrice + ", soccerCoordinatesl=" + soccerCoordinatesl + ", soccerGrass=" + soccerGrass
				+ ", soccerLighting=" + soccerLighting + ", soccerParking=" + soccerParking + ", soccerShower="
				+ soccerShower + "]";
	}
}
