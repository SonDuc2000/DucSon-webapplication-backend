package devpro.shop14.controller.manager;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import devpro.shop14.DTO.Shop;
import devpro.shop14.DTO.ShopItems;
import devpro.shop14.Entity.products;
import devpro.shop14.Entity.saleOrderProduct;
import devpro.shop14.services.ProductService;
import devpro.shop14.services.SaleOrderProductService;
import devpro.shop14.services.SaleOrderService;

@Controller
public class ManagerBillController {

	@Autowired
	SaleOrderService orderService;

	@Autowired
	ProductService productService;

	@Autowired
	SaleOrderProductService orderProductService;

	@RequestMapping(value = { "/admin/manager-bill" }, method = RequestMethod.GET)
	public String managerBill(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {

		model.addAttribute("order", orderService.findAll());

		return "manager/category-bill";
	}

	@RequestMapping(value = { "/admin/manager-bill/{id}" }, method = RequestMethod.GET)
	public String viewsManagerBill(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("id") Integer code) throws IOException {

		List<saleOrderProduct> services = orderProductService.findBillByCode(code);

		products products = new products();

		Shop shop = new Shop();

		List<ShopItems> shopItems = new ArrayList<ShopItems>();

		for (saleOrderProduct items : services) {

			products = productService.getById(items.getProduct().getId());
			ShopItems item = new ShopItems();

			item = new ShopItems();
			item.setProductName(products.getTitle());
			item.setAvatar(products.getAvatar());
			item.setProductId(products.getId());
			item.setQuanlity(items.getQuality());
			item.setShortDesc(products.getShortDesc());
			item.setPriceUnit(products.getPrice().multiply(new BigDecimal(items.getQuality())));

			shopItems.add(item);
		}
		
		shop.setCartItems(shopItems);
		shop.setTotalPrice(totalBill(shopItems));

		model.addAttribute("cart", shop);

		return "manager/card";
	}

	public BigDecimal totalBill(List<ShopItems> shopItems) {

		BigDecimal total = new BigDecimal(0);

		for (ShopItems shopItems2 : shopItems) {
			total = total.add(shopItems2.getPriceUnit());
		}

		return total;

	}

}
