package dao;

public class BoardObj {
	private String id;
	private String title;
	private String description;
	private String Member;
	private String filename;
	private String date;
	
	
	public BoardObj(String title, String description, String filename) {
		super();
		this.title = title;
		this.description = description;
		this.filename = filename;
	}

	public BoardObj(String id, String title, String description, String member, String filename, String date) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.Member = member;
		this.filename = filename;
		this.date = date;
	}

	public String getId() {
		return this.id;
	}
	public String getTitle() {
		return this.title;
	}


	public String getDescription() {
		return this.description;
	}


	public String getFilename() {
		return this.filename;
	}


	public String getMember() {
		return Member;
	}


	public String getDate() {
		return date;
	}
	
	
	
	
	
}
