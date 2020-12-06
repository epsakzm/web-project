package board;

public class Board {
	
	private int boardId;
	private String boardTitle;
	private String userID;
	private String createdDate;
	private String boardContent;
	private int isAvailable;
	private int views;
	
	public int getBoardID() {
		return boardId;
	}
	public void setBoardID(int boardID) {
		this.boardId = boardID;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String boardDate) {
		this.createdDate = boardDate;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getIsAvailable() {
		return isAvailable;
	}
	public void setIsAvailable(int isAvailable) {
		this.isAvailable = isAvailable;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
}
