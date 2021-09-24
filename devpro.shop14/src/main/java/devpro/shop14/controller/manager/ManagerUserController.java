package devpro.shop14.controller.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import devpro.shop14.Entity.User;
import devpro.shop14.Entity.products;
import devpro.shop14.services.UserService;

@Controller
public class ManagerUserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = { "/admin/manager-user" }, method = RequestMethod.GET)
	public String user(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		List<User> list = userService.findAll();
		
		model.addAttribute("users", list);
		
		return "manager/categories-user";
	}
	
	@RequestMapping(value = { "/admin/manager-user/remove/{id}" }, method = RequestMethod.GET)
	public String userRemove(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@PathVariable(name="id") Integer id)
			throws IOException {
		
		User user = userService.getById(id);
		
		user.setStatus(false);
		
		userService.saveOrUpdate(user);
		
		return "manager/categories-user";
	}
	
	@RequestMapping(value = { "/admin/manager-user/reset/{id}" }, method = RequestMethod.GET)
	public String userReset(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@PathVariable(name="id") Integer id)
			throws IOException {
		
		User user = userService.getById(id);
		
		user.setStatus(true);
		
		userService.saveOrUpdate(user);
		
		return "manager/categories-user";
	}
	
	@RequestMapping(value = { "/admin/manager-user/user-remove" }, method = RequestMethod.GET)
	public String RemoveUser(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		List<User> users = userService.findAllRemove();
		
		model.addAttribute("users", users);
		
		return "manager/categories-user";
	}

}
