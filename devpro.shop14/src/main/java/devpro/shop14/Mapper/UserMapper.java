package devpro.shop14.Mapper;

import java.util.stream.Collectors;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import devpro.shop14.DTO.SignUpDTO;
import devpro.shop14.DTO.UserDTO;
import devpro.shop14.Entity.User;

public class UserMapper {
	
	private static UserMapper INSTANCE;

    public static UserMapper getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new UserMapper();
        }
        
        return INSTANCE;
    }
    
    public User toEntity(SignUpDTO dto) {
    	
    	String lastName = dto.getLastName().replaceAll("\\s\\s+", " ").trim();
    	
    	String firtName = dto.getFirtName().replaceAll("\\s\\s+", " ").trim();
    	
    	String fullName = lastName + " " + firtName;
    	
    	User user = new User();
    	
    	user.setUsername(dto.getEmail());
    	user.setPassword(new BCryptPasswordEncoder(4).encode(dto.getPassWord()));
    	user.setFullName(fullName);
    	
    	return user;
    }
    
    public UserDTO toDTO(User user) {
        UserDTO dto = new UserDTO();
        dto.setUserName(user.getUsername());
        dto.setRoles(user.getRoles().stream()
                .map(role -> RoleMapper.getInstance().toDTO(role))
                .collect(Collectors.toList()));
        return dto;
    }

}
