package devpro.shop14.controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import devpro.shop14.DTO.SimpleContact;
import devpro.shop14.Entity.Contact;
import devpro.shop14.services.ContactService;

@Controller
public class ContactController extends BaseController{
	
	@Autowired
	ContactService contactService;
	
	private SimpleContact getCleanSimpleContact() {
		SimpleContact contact = new SimpleContact();
		contact.setInputEmail("example@gmail.com");
		contact.setInputName("Nguyen Van A");
		return contact;
	}
	
	@RequestMapping(value = { "/contact" }, method = RequestMethod.GET)
	public String contact(final ModelMap model, 
			final HttpServletRequest request, 
			final HttpServletResponse response)
			throws IOException {
		SimpleContact contact = new SimpleContact();
		model.addAttribute("contact", contact);
		return "user/lien-he";
	}
	
	@RequestMapping(value = { "/contact-ajax" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> contactAjax(final Model model , 
						final HttpServletRequest request, 
						final HttpServletResponse response, 
						final @RequestBody SimpleContact contact) {
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		Contact contact2 = new Contact();
		contact2.setFirstName(contact.getInputName());
		contact2.setEmail(contact.getInputEmail());
		contact2.setMessage(contact.getInputBody());
		contact2.setRequestType(contact.getInputTitle());
		contactService.saveOrUpdate(contact2);
		// 200 <-> thanh cong
		// 500 <-> khong thanh cong
		jsonResult.put("code", 200);
		jsonResult.put("message", contact);
		return ResponseEntity.ok(jsonResult);
	}
}

