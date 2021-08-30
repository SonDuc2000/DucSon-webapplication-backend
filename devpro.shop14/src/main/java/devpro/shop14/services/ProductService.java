package devpro.shop14.services;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.cj.util.StringUtils;

import devpro.shop14.DTO.ProductSearch;
import devpro.shop14.Entity.products;
import devpro.shop14.MVCConf.Constans;

@Service
public class ProductService extends BaseService<products> implements Constans{
	
	@Override
	protected Class<products> clazz() {
		// TODO Auto-generated method stub
		return products.class;
	}
	
	public boolean isEmptyFile(MultipartFile[] multipartFiles) {
		
		if(multipartFiles.length == 0)
			return true;
		
		if(multipartFiles.length == 1 && multipartFiles[0].getOriginalFilename().isEmpty())
			return true;
		
		return false;
		
	}
	
	public List<products> searchProduct(ProductSearch search){
		//Khoi tao cau lenh
		String sql = "SELECT * FROM tbl_products p WHERE 1=1";
		
		//Tim kiem san pham theo key
		if(!StringUtils.isNullOrEmpty(search.getKeyWord())) {
			sql += " and (p.title like '%" + search.getKeyWord() + "%'" + " or p.detail_description like '%"
					+ search.getKeyWord() + "%'" + " or p.short_description like '%"
					+ search.getKeyWord() + "%')";
		}
		
		//chi lay san pham chua xoa
		//sql += " and p.status=1";
		
		return executeNativeSql(sql);
	}
	
	@Transactional
	public products save(products newPost, MultipartFile[] customFiles) throws IllegalStateException, IOException {
		
		if(!isEmptyFile(customFiles)) {
			for (MultipartFile multipartFile : customFiles) {
				String path = IMAGES_FOLDER_ROOT + "/Avata/" + multipartFile.getOriginalFilename();
				newPost.setAvatar("/Avata/" + multipartFile.getOriginalFilename());
				multipartFile.transferTo(new File(path));
			}
		}
		
		return super.saveOrUpdate(newPost);
	}
	
	@Transactional
	public products edit(products newPost, MultipartFile[] customFiles) throws IllegalStateException, IOException {
		
		products products = super.getById(newPost.getId());
		
		if(!isEmptyFile(customFiles)) {
			for (MultipartFile multipartFile : customFiles) {
				
				//Xoa file cu
				new File(IMAGES_FOLDER_ROOT + products.getAvatar()).delete();
				//add avata moi
				String path = IMAGES_FOLDER_ROOT + "/Avata/" + multipartFile.getOriginalFilename();
				newPost.setTitle(multipartFile.getOriginalFilename());
				newPost.setAvatar("/Avata/" + multipartFile.getOriginalFilename());
				multipartFile.transferTo(new File(path));
				
			}
		}else
			newPost.setAvatar(products.getAvatar());
		
		return super.saveOrUpdate(newPost);
	}
	
	@Transactional
	public void deleteById(int productId) {
		super.deleteById(productId);
	}
}
