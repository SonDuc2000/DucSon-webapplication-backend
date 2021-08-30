package devpro.shop14.services;

import java.util.List;

import org.springframework.stereotype.Service;

import devpro.shop14.DTO.CustomerShop;
import devpro.shop14.Entity.saleOrderProduct;

@Service
public class SaleOrderProductService extends BaseService<saleOrderProduct>{

	@Override
	protected Class<saleOrderProduct> clazz() {
		// TODO Auto-generated method stub
		return saleOrderProduct.class;
	}
	
	public List<saleOrderProduct> fillBillByCode(String code){
		
		String sql = "SELECT \r\n"
				+ "	sale_p.saleorder_id,\r\n"
				+ "    sale_p.product_id\r\n"
				+ "FROM tbl_saleorder AS sale\r\n"
				+ "LEFT JOIN tbl_saleorder_products AS sale_p \r\n"
				+ "	ON sale.id = sale_p.saleorder_id\r\n"
				+ "WHERE sale.code = '" + code + "'";
		
		return executeNativeSql(sql);
		
	}
	
	public boolean isEmptyBill(List<saleOrderProduct> list) {
		if(list.size() <= 0) {
			return false;
		}
		return true;
	}

}
