package com.model;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
/**
 * ReviewInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "review_info", catalog = "mall")
public class ReviewInfo implements java.io.Serializable {

	// Fields
	private Integer id;
	private Integer userId;
	private Integer bookId;
	private String reviewContent;
	private Timestamp pubTime;
	// Constructors

	/** default constructor */
	public ReviewInfo() {
	}

	/** full constructor */
	public ReviewInfo(Integer userId, Integer bookId, String reviewContent,
			Timestamp pubTime) {
		this.userId = userId;
		this.bookId = bookId;
		this.reviewContent = reviewContent;
		this.pubTime = pubTime;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "user_id")
	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Column(name = "book_id")
	public Integer getBookId() {
		return this.bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	@Column(name = "review_content")
	public String getReviewContent() {
		return this.reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	@Column(name = "pub_time", length = 19)
	public Timestamp getPubTime() {
		return this.pubTime;
	}

	public void setPubTime(Timestamp pubTime) {
		this.pubTime = pubTime;
	}

}