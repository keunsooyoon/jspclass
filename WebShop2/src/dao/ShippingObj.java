package dao;

public class ShippingObj {
	
	
	private String cid; 
	private String pname;
	private String pprice;
	private String ppricetotal;
	private String paccount;
	private String pstatus;
	private String pdate;
	
	
	public ShippingObj(String cid, String pname, String pprice, String ppricetotal, String paccount, String pstatus,
			String pdate) {
		super();
		this.cid = cid;
		this.pname = pname;
		this.pprice = pprice;
		this.ppricetotal = ppricetotal;
		this.paccount = paccount;
		this.pstatus = pstatus;
		this.pdate = pdate;
	}


	public String getCid() {
		return cid;
	}


	public String getPname() {
		return pname;
	}


	public String getPprice() {
		return pprice;
	}


	public String getPpricetotal() {
		return ppricetotal;
	}


	public String getPaccount() {
		return paccount;
	}


	public String getPstatus() {
		return pstatus;
	}


	public String getPdate() {
		return pdate;
	}
	
	
	

}
