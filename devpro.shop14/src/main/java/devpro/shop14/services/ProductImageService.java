package devpro.shop14.services;

import org.springframework.stereotype.Service;

import devpro.shop14.Entity.productImages;

@Service
public class ProductImageService extends BaseService<productImages>{
	
	@Override
	protected Class<productImages> clazz() {
		// TODO Auto-generated method stub
		return productImages.class;
	}

}
