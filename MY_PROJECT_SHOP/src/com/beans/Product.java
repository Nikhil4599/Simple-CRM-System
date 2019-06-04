package com.beans;

public class Product {
	private int id;
	private String pname;
	private String pprice;
	private String pdesc;
	private String pcat_id;
	private String fid;
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPprice() {
		return pprice;
	}
	public void setPprice(String pprice) {
		this.pprice = pprice;
	}
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	public String getPcat_id() {
		return pcat_id;
	}
	public void setPcat_id(String pcat_id) {
		this.pcat_id = pcat_id;
	}
	public Product(int id, String pname, String pprice, String pdesc, String pcat_id, String fid) {
		super();
		this.id = id;
		this.pname = pname;
		this.pprice = pprice;
		this.pdesc = pdesc;
		this.pcat_id = pcat_id;
		this.fid = fid;
	}
	public Product() {
		
	}
}
