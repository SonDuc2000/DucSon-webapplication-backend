package devpro.shop14.controller.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import devpro.shop14.DTO.ProductSearch;
import devpro.shop14.Entity.products;
import devpro.shop14.services.ProductService;

@Controller
public class CategoriesController extends BaseController{
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = { "/categories" }, method = RequestMethod.GET)
	public String openCategory(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		List<products> products = productService.findAll();
		
		model.addAttribute("product", products);
		
		return "user/category";
	}
	
	@RequestMapping(value = { "/search" }, method = RequestMethod.GET)
	public String searchCategory(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		ProductSearch search = new ProductSearch();
		String keyWord = request.getParameter("keysearch");
		search.setPage(getCurrentPage(request));
		search.setKeyWord(keyWord);
		List<products> products = productService.searchProduct(search);
		model.addAttribute("product", products);
		
		return "user/category";
	}

}
