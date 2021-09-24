package devpro.shop14.controller.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import devpro.shop14.Entity.Contact;
import devpro.shop14.services.ContactService;

@Controller
public class ContactManagerController {
	
	@Autowired
	ContactService contactService;
	
	@RequestMapping(value = { "/admin/manager-contact/contact" }, method = RequestMethod.GET)
	public String RemoveProduct(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		List<Contact> contacts = contactService.findAll();
		
		model.addAttribute("contacts", contacts);
		
		return "manager/contact";
	}
	
	@RequestMapping(value = { "/admin/manager-contact/contact/{id}" }, method = RequestMethod.GET)
	public String Contact(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@PathVariable("contactId") int contactId)
			throws IOException {
		
		Contact contact = contactService.getById(contactId);
		
		model.addAttribute("contacts", contact);
		
		return "user/lien-he";
	}

}
