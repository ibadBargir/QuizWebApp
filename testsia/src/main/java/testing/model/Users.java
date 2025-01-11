package testing.model;

public class Users{
private int id;
private String fname;
private String pswd;
private String email;
private long pnumber;
private String anumber;



public Users() {
	super();
	// TODO Auto-generated constructor stub
}


public Users(int id, String anumber, String fname, String email, long pnumber, String pswd) {
	super();
	this.id = id;
	this.anumber = anumber;
	this.fname = fname;
	this.email = email;
	this.pnumber = pnumber;
	this.pswd = pswd;
}


public int getId() {
	return id;
}


public void setId(int id) {
	this.id = id;
}


public String getFname() {
	return fname;
}


public void setFname(String fname) {
	this.fname = fname;
}


public String getPswd() {
	return pswd;
}


public void setPswd(String pswd) {
	this.pswd = pswd;
}


public String getEmail() {
	return email;
}


public void setEmail(String email) {
	this.email = email;
}


public long getPnumber() {
	return pnumber;
}


public void setPnumber(long pnumber) {
	this.pnumber = pnumber;
}


public String getAnumber() {
	return anumber;
}


public void setAnumber(String anumber) {
	this.anumber = anumber;
}


@Override
public String toString() {
	return "Users [id=" + id + ", fname=" + fname + ", pswd=" + pswd + ", email=" + email + ", pnumber=" + pnumber
			+ ", anumber=" + anumber + "]";
}




    
    
    
}