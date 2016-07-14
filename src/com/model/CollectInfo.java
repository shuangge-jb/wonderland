package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * CollectInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "collect_info", catalog = "mall")
public class CollectInfo implements java.io.Serializable {

	// Fields
	private Integer id;
	private Integer bookId;
	private Integer userId;
	// Constructors

	/** default constructor */
	public CollectInfo() {
	}

	/** full constructor */
	public CollectInfo(Integer bookId, Integer userId) {
		this.bookId = bookId;
		this.userId = userId;
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

	@Column(name = "book_id")
	public Integer getBookId() {
		return this.bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}
	@Column(name = "user_id")
	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}