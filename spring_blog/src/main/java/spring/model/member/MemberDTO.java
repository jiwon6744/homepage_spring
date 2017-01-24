package spring.model.member;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {
	private String id; // -- 아이디, 중복 안됨, 레코드를 구분하는 컬럼
	private String passwd; // -- 패스워드, 영숫자 조합
	private String mname; // -- 성명, 한글 10자 저장 가능
	private String tel; // -- 전화번호
	private String email;// UNIQUE, -- 전자우편 주소, 중복 안됨
	private String zipcode; // -- 우편번호, 101-101
	private String address1; // -- 주소 1
	private String address2; // -- 주소 2
	private String job; // -- 직업
	private String mdate; // -- 가입일
	private String fname;// member.jpg', -- 회원 사진
	private MultipartFile fnameMF;// member.jpg', -- 회원 사진
	private String grade;// H', -- 일반회원: H, 정지: Y, 손님:Z
	// PRIMARY K; -- 한번 등록된 id는 중복 안됨 UNIQUE유일성 INDEX인덱스

	public MultipartFile getFnameMF() {
		return fnameMF;
	}

	public void setFnameMF(MultipartFile fnameMF) {
		this.fnameMF = fnameMF;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getMdate() {
		return mdate;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

}
