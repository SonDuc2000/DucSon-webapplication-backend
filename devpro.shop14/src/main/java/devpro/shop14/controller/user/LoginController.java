package devpro.shop14.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import devpro.shop14.DTO.SignUpDTO;
import devpro.shop14.Entity.Role;
import devpro.shop14.Entity.User;
import devpro.shop14.Mapper.UserMapper;
import devpro.shop14.services.RoleService;
import devpro.shop14.services.UserService;

@Controller
public class LoginController extends BaseController{
	
	@Autowired
	UserService userService;
	
	@Autowired
	RoleService roleService;
	
	@RequestMapping(value = { "/manager-log-in" }, method = RequestMethod.GET)
	public String logInAdmin(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		return "user/login-admin";
	}
	
	@RequestMapping(value = { "/404" }, method = RequestMethod.GET)
	public String page404(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		return "404";
	}
	
	@RequestMapping(value = { "/sign-up" }, method = RequestMethod.GET)
	public String signUp(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		return "register";
	}
	
	public void authWithHttpServletRequest(HttpServletRequest request, String username, String password) {
	    try {
	        request.login(username, password);
	    } catch (ServletException e) {
	        e.printStackTrace();
	    }
	}
	
	
	@RequestMapping(value = { "/perform-signUp" }, method = RequestMethod.POST)
	public String performSignUp(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		SignUpDTO dto = new SignUpDTO();
		
		Role roles = new Role();
		
		User user = new User();
		
		UserMapper userMapper = new UserMapper();
		
		roles = roleService.getById(12);
		
		dto.setFirtName(request.getParameter("firstName"));
		dto.setEmail(request.getParameter("email"));
		dto.setLastName(request.getParameter("lastName"));
		dto.setPassWord(request.getParameter("passWord"));
		dto.setConfirmPass(request.getParameter("confirmPass"));
		
		boolean check = false;
		
		if(userService.loadUserByUsername(request.getParameter("email")) != null) {
			check = true;
			model.addAttribute("signUpped", check);
			return "register";
		} 
		
		user = userMapper.toEntity(dto);
		
		user.addRole(roles);
		
		//Tạo tài khoản mới
		userService.saveOrUpdate(user);
		
		//Tự động đăng nhập sau khi tạo thành công
		try {
			request.login(dto.getEmail(), dto.getPassWord());
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/home";
	}
	
}
