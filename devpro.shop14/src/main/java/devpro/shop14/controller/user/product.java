package devpro.shop14.controller.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import devpro.shop14.Entity.products;
import devpro.shop14.services.ProductService;

@Controller
public class product extends BaseController{

	@Autowired
	ProductService productService = new ProductService();
	
	@RequestMapping(value = { "/product/{id}" }, method = RequestMethod.GET)
	public String productShowById(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@PathVariable(name="id") Integer id)
			throws IOException {
		
		products products = productService.getById(id);
		
		model.addAttribute("product", products);
		
		return "user/san-pham";
	}
	
}
