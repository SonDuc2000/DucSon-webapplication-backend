package devpro.shop14.DTO;

import java.io.Serializable;
import java.util.List;

public class SignUpDTO implements Serializable{
	
	private static final long serialVersionUID = -303555954929758069L;

	private String firtName;
	
	private String lastName;
	
	private String email;
	
	private String passWord;
	
	private String confirmPass;
	
	private List<Integer> rolesId;

	public String getFirtName() {
		return firtName;
	}

	public void setFirtName(String firtName) {
		this.firtName = firtName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getConfirmPass() {
		return confirmPass;
	}

	public void setConfirmPass(String confirmPass) {
		this.confirmPass = confirmPass;
	}

	public List<Integer> getRolesId() {
		return rolesId;
	}

	public void setRolesId(List<Integer> rolesId) {
		this.rolesId = rolesId;
	}
	
}
