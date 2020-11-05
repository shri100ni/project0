package in.co.rays.test;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import in.co.rays.dto.RoleDTO;
import in.co.rays.dto.UserDTO;
import in.co.rays.exception.DuplicateRecordException;
import in.co.rays.service.RoleServiceInt;
import in.co.rays.service.UserServiceInt;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("file:src/main/webapp/WEB-INF/dispatcher-servlet.xml")
public class UserTest {
	@Autowired
	RoleServiceInt roleService;
	@Autowired
	UserServiceInt userService;
	
	@Ignore
	public void add() throws ParseException{
		UserDTO dto=new UserDTO();
		dto.setFirstName("Bhagyashri");
		dto.setLastName("Soni");
		dto.setEmailId("100ni.shri@gmail.com");
		dto.setGender("F");
		dto.setDob(new SimpleDateFormat("dd/MM/yyyy").parse("11/02/1995"));
		dto.setPassword("Shri@1234");
		dto.setConfirmPassword("Shri@1234");
		dto.setCreatedBy("root");
		dto.setMobileNo("9584848284");
		dto.setModifiedBy("root");
		dto.setCreatedDateTime(new Timestamp(System.currentTimeMillis()));
		dto.setModifiedDateTime(dto.getModifiedDateTime());
		dto.setRoleId(1);
		
		RoleDTO rdto=roleService.findById(dto.getRoleId());
		dto.setRoleName(rdto.getName());
		try {
		long pk=userService.add(dto);
		System.out.println("User Add Sucess ID="+pk);
		} catch (DuplicateRecordException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@Ignore
	public void update() throws ParseException{
		UserDTO dto=new UserDTO();
	dto.setId(1);
		dto.setFirstName("Naqeeb");
		dto.setLastName("Khan");
		dto.setEmailId("mdnkhan007@gmail.com");
		dto.setGender("M");
		dto.setDob(new SimpleDateFormat("dd/MM/yyyy").parse("05/05/1995"));
		dto.setPassword("cs12345");
		dto.setConfirmPassword("cs12345");
		dto.setCreatedBy("root");
		dto.setMobileNo("8435725286");
		dto.setModifiedBy("root");
		dto.setCreatedDateTime(new Timestamp(System.currentTimeMillis()));
		dto.setModifiedDateTime(dto.getModifiedDateTime());
		dto.setRoleId(1);
		
		RoleDTO rdto=roleService.findById(dto.getRoleId());
		dto.setRoleName(rdto.getName());
		try {
			userService.update(dto);
		
			System.out.println("User Update Success");
		} catch (DuplicateRecordException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Ignore
public void findByPk(){
UserDTO dto=userService.findByPK(1);
System.out.println("User FindBy Pk Success="+dto.getFirstName());
}
@Ignore
public void findByEmail(){
	UserDTO dto=userService.findByLogin("mdnkhan007@gmail.com");
	
	System.out.println("User Find by Login Success="+dto.getFirstName());
}
@Ignore
public void search(){
	UserDTO dto=new UserDTO();
List l=userService.search(dto);	
System.out.println("User Search Success="+l.size());
}

@Ignore
public void searchPagination(){
	UserDTO dto=new UserDTO();
	//dto.setId(1);
	//dto.setFirstName("n");
	//dto.setLastName("k");
List l=userService.search(dto,1,10);	
System.out.println("User Search Paginaion Success="+l.size());
}
@Test
public void delete(){
	userService.delete(1);
	System.out.println("User Delete success");
}
}
