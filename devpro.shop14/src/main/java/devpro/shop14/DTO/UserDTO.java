package devpro.shop14.DTO;

import java.io.Serializable;
import java.util.List;

public class UserDTO implements Serializable{

	private static final long serialVersionUID = 1858377074159006319L;
	
	private String userName;
	
	private String email;
	
	List<RoleDTO> roles;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<RoleDTO> getRoles() {
		return roles;
	}

	public void setRoles(List<RoleDTO> roles) {
		this.roles = roles;
	}
	

}
