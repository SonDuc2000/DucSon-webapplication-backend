package devpro.shop14.services;

import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import devpro.shop14.Entity.Contact;

@Service
public class ContactService extends BaseService<Contact>{

	@Override
	protected Class<Contact> clazz() {
		// TODO Auto-generated method stub
		return Contact.class;
	}
	
	@Transactional
	public Contact saveContact(Contact contact) throws IllegalStateException, IOException {
		
		return super.saveOrUpdate(contact);
	}

}
