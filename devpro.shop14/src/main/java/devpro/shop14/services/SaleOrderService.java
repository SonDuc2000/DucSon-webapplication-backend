package devpro.shop14.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import devpro.shop14.Entity.SaleOrder;

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
