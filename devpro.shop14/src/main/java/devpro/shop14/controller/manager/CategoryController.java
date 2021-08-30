package devpro.shop14.controller.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import devpro.shop14.Entity.Category;
import devpro.shop14.controller.user.BaseController;
import devpro.shop14.services.CategoryService;

@Controller
public class CategoryController extends BaseController{
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value = { "/admin/manager-category" }, method = RequestMethod.GET)
	public String home(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		List<Category> category = categoryService.findAll();
		
		model.addAttribute("category", category);
		
		return "manager/categories";
	}
}
