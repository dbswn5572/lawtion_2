package lawtion.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class IntroduceVO {

	int rno,no,trial,win,lose;
	String id,name,dname,part,carrer,business,rbusiness;
	CommonsMultipartFile fileBusiness;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBusiness() {
		return business;
	}
	public void setBusiness(String business) {
		this.business = business;
	}
	public String getRbusiness() {
		return rbusiness;
	}
	public void setRbusiness(String rbusiness) {
		this.rbusiness = rbusiness;
	}
	public CommonsMultipartFile getFileBusiness() {
		return fileBusiness;
	}
	public void setFileBusiness(CommonsMultipartFile fileBusiness) {
		this.fileBusiness = fileBusiness;
	}
	public String getCarrer() {
		return carrer;
	}
	public void setCarrer(String carrer) {
		this.carrer = carrer;
	}
	public int getTrial() {
		return trial;
	}
	public void setTrial(int trial) {
		this.trial = trial;
	}
	public int getWin() {
		return win;
	}
	public void setWin(int win) {
		this.win = win;
	}
	public int getLose() {
		return lose;
	}
	public void setLose(int lose) {
		this.lose = lose;
	}

	
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	
	
}
