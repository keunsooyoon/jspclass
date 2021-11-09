package dao;

public class ShippingObj {
	
	
	private String cid; 
	private String pname;
	private String pprice;
	private String ppricetotal;
	private String paccount;
	private String paddress;
	private String pdate;
	private String pstatus;
	
	
	public ShippingObj(String cid, String pname, String pprice, String ppricetotal, String paccount, String paddress,
			String pdate, String pstatus) {
		super();
		this.cid = cid;
		this.pname = pname;
		this.pprice = pprice;
		this.ppricetotal = ppricetotal;
		this.paccount = paccount;
		this.paddress = paddress;
		this.pdate = pdate;
		this.pstatus = pstatus;
	}


	public String getCid() {
		return this.cid;
	}


	public String getPname() {
		return this.pname;
	}


	public String getPprice() {
		return this.pprice;
	}


	public String getPpricetotal() {
		return this.ppricetotal;
	}


	public String getPaccount() {
		return this.paccount;
	}


	public String getPaddress() {
		return this.paddress;
	}


	public String getPdate() {
		return this.pdate;
	}


	public String getPstatus() {
		return this.pstatus;
	}

	
	
	
	

}
