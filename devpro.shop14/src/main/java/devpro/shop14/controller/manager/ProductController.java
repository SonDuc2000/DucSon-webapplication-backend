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

import devpro.shop14.Entity.products;
import devpro.shop14.controller.user.BaseController;
import devpro.shop14.services.ProductService;

@Controller
public class ProductController extends BaseController{
	
	@Autowired
	ProductService productService = new ProductService();
	
	@RequestMapping(value = { "/admin/manager-product" }, method = RequestMethod.GET)
	public String product(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		List<products> products = productService.findAll();
		
		model.addAttribute("product", products);
		
		return "manager/product";
	}
	
	@RequestMapping(value = { "/admin/manager-product/remove/{id}" }, method = RequestMethod.GET)
	public String deleteProduct(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
								@PathVariable(name="id") Integer id)
			throws IOException {
		
		products products = productService.getById(id);
		
		products.setStatus(false);
		productService.saveOrUpdate(products);
		
		return "redirect:/admin/manager-product/product-remove";
	}
	
	@RequestMapping(value = { "/admin/manager-product/product-remove" }, method = RequestMethod.GET)
	public String RemoveProduct(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		List<products> products = productService.findAllRemove();
		
		model.addAttribute("product", products);
		
		return "manager/product";
	}
	
	@RequestMapping(value = { "/admin/manager-product/reset/{id}" }, method = RequestMethod.GET)
	public String resetProduct(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
								@PathVariable(name="id") Integer id)
			throws IOException {
		
		products products = productService.getById(id);
		
		products.setStatus(true);
		productService.saveOrUpdate(products);
		
		return "redirect:/admin/manager-product";
	}
	
	@RequestMapping(value = { "/admin/manager-product/delete/{id}" }, method = RequestMethod.GET)
	public String dropProduct(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
								@PathVariable(name="id") Integer id)
			throws IOException {
		
		productService.deleteById(id);
		
		return "redirect:/admin/manager-product";
	}

}
