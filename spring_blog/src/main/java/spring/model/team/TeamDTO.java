package spring.model.team;

import org.springframework.web.multipart.MultipartFile;

public class TeamDTO {
	private int teamno;
	private String name;
	private String gender;
	private String phone;
	private String zipcode;
	private String address1;
	private String address2;
	/*
	 * createForm에서 입력받은 데이터를 받는다.
	 * 
	 */
	private String[] skill;

	/*
	 * DB 에서 select한 결과를 저장하는 역할. 
	 * DB 에 skill배열을 문자열로 변환하여 저장.(insert, update)
	 */
	private String skillstr;
	private String hobby;
	private String filename;
	private MultipartFile fileMF;

	public MultipartFile getFileMF() {
		return fileMF;
	}

	public void setFileMF(MultipartFile fileMF) {
		this.fileMF = fileMF;
	}

	public int getTeamno() {
		return teamno;
	}

	public void setTeamno(int teamno) {
		this.teamno = teamno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public String[] getSkill() {
		return skill;
	}

	public void setSkill(String[] skill) {
		this.skill = skill;
	}
	/*
	 * 1.DB에 insert,update할 때 호출
	 * 2.DB에서 select한 결과를 JSP페이지에 출력할 때
	 * 
	 */

	public String getSkillstr() {
		if (skill != null) { //1번의 처리를 위한 코드.
			String skillstr = "";
			for (int i = 0; i < skill.length; i++) {
				skillstr += skill[i];
				if (i < skill.length - 1) {
					skillstr += ", ";
				}
			}
			this.skillstr = skillstr;
		}
		return skillstr;
	}

	public void setSkillstr(String skillstr) {
		this.skillstr = skillstr;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

}
