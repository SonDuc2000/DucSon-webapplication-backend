package devpro.shop14.services;

import java.util.List;

import org.springframework.stereotype.Service;

import devpro.shop14.Entity.User;

@Service
public class UserService extends BaseService<User>{

	@Override
	protected Class<User> clazz() {
		// TODO Auto-generated method stub
		return User.class;
	}
	
	public User loadUserByUsername(String userName) {
		String sql = "select * from tbl_users u where u.username = '" + userName + "' and u.status = 1;";
		List<User> users = executeNativeSql(sql);
		if(users == null || users.size() <= 0) 
			return null;
		else
			return users.get(0);
	}

}
