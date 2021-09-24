package devpro.shop14.services;

import java.util.List;

import org.springframework.stereotype.Service;

import devpro.shop14.Entity.Role;

@Service
public class RoleService extends BaseService<Role>{

	@Override
	protected Class<Role> clazz() {
		// TODO Auto-generated method stub
		return Role.class;
	}
	
	public List<Role> getByName(String name) {
		
		String sql = "select * \r\n"
				+ "from tbl_roles as u\r\n"
				+ "where u.name = '" + name + "';";
		
		return executeNativeSql(sql);
		
	}

}
