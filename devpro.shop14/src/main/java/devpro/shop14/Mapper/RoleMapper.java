package devpro.shop14.Mapper;

import devpro.shop14.DTO.RoleDTO;
import devpro.shop14.Entity.Role;

public class RoleMapper {
	
	private static RoleMapper INSTANCE;
	
    public static RoleMapper getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new RoleMapper();
        }
        return INSTANCE;
    }
    
    public Role toEntity(RoleDTO dto) {
    	
    	Role role = new Role();
    	
    	role.setName(dto.getName());
    	role.setDesc(dto.getDesc());
    	
    	return role;
    }
    
    public RoleDTO toDTO(Role role) {
    	
        RoleDTO dto = new RoleDTO();
        dto.setName(role.getName());
        dto.setDesc(role.getDesc());
        dto.setId(role.getId());
        
        return dto;
    }


}
