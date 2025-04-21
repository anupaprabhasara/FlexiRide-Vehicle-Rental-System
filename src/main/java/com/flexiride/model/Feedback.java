package com.flexiride.model;

public class Feedback {
	private int feedbackId;
    private int bookingId;
    private int userId;
    private int rating;
    private String comments;
    private String feedbackDate;
    
    // From feedbacks_view
    private String userName;

	public int getFeedbackId() {
		return feedbackId;
	}
	public int getBookingId() {
		return bookingId;
	}
	public int getUserId() {
		return userId;
	}
	public int getRating() {
		return rating;
	}
	public String getComments() {
		return comments;
	}
	public String getFeedbackDate() {
		return feedbackDate;
	}
	public String getUserName() {
		return userName;
	}
	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}
	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public void setFeedbackDate(String feedbackDate) {
		this.feedbackDate = feedbackDate;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
}