package devpro.shop14.services;

import org.springframework.stereotype.Service;

import devpro.shop14.Entity.Category;

@Service
public class CategoryService extends BaseService<Category> {

	@Override
	protected Class<Category> clazz() {
		return Category.class;
	}
	
	
}