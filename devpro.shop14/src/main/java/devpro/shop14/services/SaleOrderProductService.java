package devpro.shop14.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import devpro.shop14.Entity.saleOrderProduct;

@Service
public class SaleOrderProductService extends BaseService<saleOrderProduct>{
	
	@Autowired
	SaleOrderService orderService;

	@Override
	protected Class<saleOrderProduct> clazz() {
		// TODO Auto-generated method stub
		return saleOrderProduct.class;
	}
	
	public boolean isEmptyBill(List<saleOrderProduct> list) {
		if(list.size() <= 0) {
			return false;
		}
		return true;
	}
	
	public List<saleOrderProduct> findBillByCode(int code){
		
		String sql = "select *\r\n"
				+ "from tbl_saleorder_products as p\r\n"
				+ "where p.saleorder_id = '" + code + "';";
		List<saleOrderProduct> saleOrderProducts = executeNativeSql(sql);
		return saleOrderProducts;
	}

}
