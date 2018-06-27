package lawtion.vo;

import java.util.ArrayList;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class joinLayerVO {
   String id,password,name,birth,phone,email;
   String jdate,phone1,phone2,phone3;
   String business,license,rbusiness,rlicense,code;
   CommonsMultipartFile fileBusiness;
   CommonsMultipartFile fileLicense;

   
  

public String getCode() {
	return code;
}

public void setCode(String code) {
	this.code = code;
}



public CommonsMultipartFile getFileBusiness() {
      return fileBusiness;
   }

   public void setFileBusiness(CommonsMultipartFile fileBusiness) {
      this.fileBusiness = fileBusiness;
      System.out.println(this.fileBusiness.getOriginalFilename());
   }

   public CommonsMultipartFile getFileLicense() {
      return fileLicense;
   }

   public void setFileLicense(CommonsMultipartFile fileLicense) {
      this.fileLicense = fileLicense;
      System.out.println(this.fileLicense.getOriginalFilename());
   }
   
   public String getRbusiness() {
      return rbusiness;
   }

   public void setRbusiness(String rbusiness) {
      this.rbusiness = rbusiness;
   }

   public String getRlicense() {
      return rlicense;
   }

   public void setRlicense(String rlicense) {
      this.rlicense = rlicense;
   }

   public String getPhone1() {
      return phone1;
   }

   public void setPhone1(String phone1) {
      this.phone1 = phone1;
   }

   public String getPhone2() {
      return phone2;
   }

   public void setPhone2(String phone2) {
      this.phone2 = phone2;
   }

   public String getPhone3() {
      return phone3;
   }

   public void setPhone3(String phone3) {
      this.phone3 = phone3;
   }

   public String getJdate() {
      return jdate;
   }

   public void setJdate(String jdate) {
      this.jdate = jdate;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getPassword() {
      return password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getBirth() {
      return birth;
   }

   public void setBirth(String birth) {
      this.birth = birth;
   }

   public String getPhone() {
	   phone= phone1+phone2+phone3;
      return phone;
   }

   public void setPhone(String phone) {
      this.phone = phone;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getBusiness() {
      return business;
   }

   public void setBusiness(String business) {
      this.business = business;
   }

   public String getLicense() {
      return license;
   }

   public void setLicense(String license) {
      this.license = license;
   }

}