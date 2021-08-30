package devpro.shop14.controller.manager;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import devpro.shop14.controller.user.BaseController;

@Controller
public class HomeController extends BaseController{
	
	@RequestMapping(value = { "/admin/home" }, method = RequestMethod.GET)
	public String home(final ModelMap model)
			throws IOException {
		return "manager/home";
	}

}
