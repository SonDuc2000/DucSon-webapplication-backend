package devpro.shop14.controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import devpro.shop14.DTO.OrderDTO;
import devpro.shop14.DTO.Shop;
import devpro.shop14.DTO.ShopItems;
import devpro.shop14.Entity.SaleOrder;
import devpro.shop14.Entity.products;
import devpro.shop14.Entity.saleOrderProduct;
import devpro.shop14.services.CategoryService;
import devpro.shop14.services.ProductService;
import devpro.shop14.services.SaleOrderProductService;
import devpro.shop14.services.SaleOrderService;

@Controller
public class CartController extends BaseController{

	@Autowired
	ProductService productService = new ProductService();

	@Autowired
	SaleOrderService orderService = new SaleOrderService();

	@Autowired
	SaleOrderProductService saleOrderProductService;

	@Autowired
	CategoryService categoryService;

	@RequestMapping(value = { "/view/card" }, method = RequestMethod.GET)
	public String viewCard(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		return "user/card";
	}

	@RequestMapping(value = { "/view/access" }, method = RequestMethod.POST)
	public String buyCard(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		String customerName = request.getParameter("customerName");
		String customerEmail = request.getParameter("customerEmail");
		String customerAddr = request.getParameter("customerAddr");

		OrderDTO orderDTO = new OrderDTO();
		orderDTO.setCustomerName(customerName);
		orderDTO.setCustomerAddr(customerAddr);
		orderDTO.setCustomerEmail(customerEmail);

		// Tao hoa don
		SaleOrder saleOrder = new SaleOrder();
		saleOrder.setCode(String.valueOf(System.currentTimeMillis()));
		saleOrder.setCustomerName(customerName);
		saleOrder.setCustomerEmail(customerEmail);
		saleOrder.setCustomerAddr(customerAddr);

		HttpSession session = request.getSession();

		Shop shop = (Shop) session.getAttribute("cart");
		for (ShopItems items : shop.getCartItems()) {
			saleOrderProduct orderProduct = new saleOrderProduct();
			orderProduct.setProduct(productService.getById(items.getProductId()));
			orderProduct.setQuality(items.getQuanlity());
			saleOrder.addSaleOrderProducts(orderProduct);
		}
		model.addAttribute("order", orderDTO);
		
		orderService.saveOrUpdate(saleOrder);
		
		model.addAttribute("saleOrder", shop.getCartItems());

		session.setAttribute("cart", null);

		return "user/card";
	}

	@RequestMapping(value = { "/cart/add" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCart(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody ShopItems newItem) {

		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Shop cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Shop) session.getAttribute("cart");
		} else {
			cart = new Shop();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<ShopItems> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		boolean isExists = false;
		for (ShopItems item : cartItems) {
			if (item.getProductId() == newItem.getProductId()) {
				isExists = true;
				item.setQuanlity(item.getQuanlity() + newItem.getQuanlity());
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng
		if (!isExists) {
			products productInDb = productService.getById(newItem.getProductId());

			newItem.setProductName(productInDb.getTitle());
			newItem.setAvatar(productInDb.getAvatar());
			newItem.setShortDesc(productInDb.getDetails());
			newItem.setPriceUnit(productInDb.getPrice());

			cart.getCartItems().add(newItem);
		}

		// trả kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));

		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}

	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Shop cart = (Shop) httpSession.getAttribute("cart");
		List<ShopItems> cartItems = cart.getCartItems();

		int total = 0;
		for (ShopItems item : cartItems) {
			total += item.getQuanlity();
		}

		return total;
	}

	@RequestMapping(value = { "/cart/check_bill" })
	private String checkCart(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		return "user/card";
	}

}
