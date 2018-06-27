package lawtion.vo;

public class joinNormalVO {
   String id,password,name,birth,phone,email,jdate,phone1,phone2,phone3;

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
	  phone=phone1+phone2+phone3;
      return phone;
   }	

   public void setPhone(String phone) {
      this.phone=phone;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }
   
   

}