package adm.vo;


//자유 게시판 VO
public class FboardVO {
	private int fboard_code;
	private String fboard_title;
	private String fboard_content;
	private String fboard_date;
	private int fboard_cnt;
	private String mem_id;
	private String file_name;
	private int rnum;
	
	
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getFboard_code() {
		return fboard_code;
	}
	public void setFboard_code(int fboard_code) {
		this.fboard_code = fboard_code;
	}
	public String getFboard_title() {
		return fboard_title;
	}
	public void setFboard_title(String fboard_title) {
		this.fboard_title = fboard_title;
	}
	public String getFboard_content() {
		return fboard_content;
	}
	public void setFboard_content(String fboard_content) {
		this.fboard_content = fboard_content;
	}
	public String getFboard_date() {
		return fboard_date;
	}
	public void setFboard_date(String fboard_date) {
		this.fboard_date = fboard_date;
	}
	public int getFboard_cnt() {
		return fboard_cnt;
	}
	public void setFboard_cnt(int fboard_cnt) {
		this.fboard_cnt = fboard_cnt;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	
	

}
