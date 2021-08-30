package devpro.shop14.services;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import devpro.shop14.DTO.CustomerShop;
import devpro.shop14.Entity.SaleOrder;
import devpro.shop14.Entity.saleOrderProduct;

@Service
public class SaleOrderService extends BaseService<SaleOrder>{
	
	@Autowired 
	ProductService service;
	
	@Override
	protected Class<SaleOrder> clazz() {
		// TODO Auto-generated method stub
		return SaleOrder.class;
	}

}
