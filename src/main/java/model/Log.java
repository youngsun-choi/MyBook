package model;

public class Log { 
	private int id;
	private String email;
	private String userName;
	private String myBookTitle;
	private String interestBookTitle;
	private String m_star;
	private String m_content;
	private String isupdate;
	private String logregistdate;
	
	private int start;
    private int last;
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getMyBookTitle() {
		return myBookTitle;
	}
	public void setMyBookTitle(String myBookTitle) {
		this.myBookTitle = myBookTitle;
	}
	public String getInterestBookTitle() {
		return interestBookTitle;
	}
	public void setInterestBookTitle(String interestBookTitle) {
		this.interestBookTitle = interestBookTitle;
	}
	public String getM_star() {
		return m_star;
	}
	public void setM_star(String m_star) {
		this.m_star = m_star;
	}
	public String getM_content() {
		return m_content;
	}
	public void setM_content(String m_content) {
		this.m_content = m_content;
	}
	public String getIsupdate() {
		return isupdate;
	}
	public void setIsupdate(String isupdate) {
		this.isupdate = isupdate;
	}
	public String getLogregistdate() {
		return logregistdate;
	}
	public void setLogregistdate(String logregistdate) {
		this.logregistdate = logregistdate;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	@Override
	public String toString() {
		return "Log [id=" + id + ", email=" + email + ", userName=" + userName + ", myBookTitle=" + myBookTitle
				+ ", interestBookTitle=" + interestBookTitle + ", m_star=" + m_star + ", m_content=" + m_content
				+ ", isupdate=" + isupdate + ", logregistdate=" + logregistdate + ", start=" + start + ", last=" + last
				+ "]";
	}
}
