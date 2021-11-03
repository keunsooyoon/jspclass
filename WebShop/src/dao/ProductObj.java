package dao;

public class ProductObj {
	
	private String pid;
	private String pname;
	private String pdescription;
	private String pprice;
	private String pfilename;
	
	
	public ProductObj(String pid, String pname, String pdescription, String pprice, String pfilename) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pdescription = pdescription;
		this.pprice = pprice;
		this.pfilename = pfilename;
	}


	public String getPid() {
		return this.pid;
	}


	public String getPname() {
		return this.pname;
	}


	public String getPdescription() {
		return this.pdescription;
	}


	public String getPprice() {
		return this.pprice;
	}


	public String getPfilename() {
		return this.pfilename;
	}

	

}