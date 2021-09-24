package devpro.shop14.controller.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import devpro.shop14.DTO.ProductSearch;
import devpro.shop14.Entity.Category;
import devpro.shop14.Entity.User;
import devpro.shop14.Entity.products;
import devpro.shop14.MVCConf.Constans;
import devpro.shop14.controller.user.BaseController;
import devpro.shop14.services.CategoryService;
import devpro.shop14.services.ProductService;
import devpro.shop14.services.UserService;

@Controller
public class PostController extends BaseController implements Constans{
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = { "/admin/new-post" }, method = RequestMethod.GET)
	public String home(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		products post = new products();
		List<Category> categories = categoryService.findAll();
		model.addAttribute("new-post", post);
		model.addAttribute("categories", categories);
		return "manager/post";
	}
	
	@RequestMapping(value = { "/admin/new-post" }, method = RequestMethod.POST)
	public String saveContact(final ModelMap model, 
			final HttpServletRequest request, 
			final HttpServletResponse response,
			@ModelAttribute("new-post") products newPost,
			@RequestParam("customFile") MultipartFile[] customFiles)
			throws IOException {
		
		if(newPost.getId() == null || newPost.getId() <= 0)
			productService.save(newPost, customFiles);
		else
			productService.edit(newPost, customFiles);
		return "redirect:manager-product";
	}
	
	@RequestMapping(value = {"admin/product"}, method = RequestMethod.GET)
	public String searchProduct(final ModelMap model, 
			final HttpServletRequest request, 
			final HttpServletResponse response) throws IOException {
		
		String keyWord  = request.getParameter("keyword");
		
		ProductSearch productSearch = new ProductSearch();
		productSearch.setKeyWord(keyWord);
		
		return "manager/product";
		
	}
	
	@RequestMapping(value = { "/admin/edit-product/{productId}" }, method = RequestMethod.GET)
	public String editProduct(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@PathVariable("productId") int productId)
			throws IOException {
		
		products products = productService.getById(productId);
		
		List<Category> categories = categoryService.findAll();
		
		model.addAttribute("categories", categories);
		
		model.addAttribute("new-post", products);
		
		return "manager/post";
	}
	
	@RequestMapping(value = { "/admin/edit-category/{categoryId}" }, method = RequestMethod.GET)
	public String editCategory(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@PathVariable("categoryId") int categoryId)
			throws IOException {
		
		Category category = categoryService.getById(categoryId);
		
		List<Category> categories = categoryService.findAll();
		
		model.addAttribute("categories", categories);
		
		model.addAttribute("new-post", category);
		
		return "manager/post";
	}
	
	@RequestMapping(value = { "/admin/edit-user/{userId}" }, method = RequestMethod.GET)
	public String editUser(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@PathVariable("userId") int userId)
			throws IOException {
		
		User user = userService.getById(userId);
		
		model.addAttribute("new-post", user);
		
		return "manager/post";
	}
}
