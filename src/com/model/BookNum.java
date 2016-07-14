package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * BookNum entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "book_num", catalog = "mall")
public class BookNum implements java.io.Serializable {

	// Fields

	private Integer id;
	private OrderInfo orderInfo;
	private BookInfo bookInfo;
	private Integer bookNum;

	// Constructors

	/** default constructor */
	public BookNum() {
	}

	/** full constructor */
	public BookNum(OrderInfo orderInfo, BookInfo bookInfo, Integer bookNum) {
		this.orderInfo = orderInfo;
		this.bookInfo = bookInfo;
		this.bookNum = bookNum;
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

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "order_id", nullable = false)
	public OrderInfo getOrderInfo() {
		return this.orderInfo;
	}

	public void setOrderInfo(OrderInfo orderInfo) {
		this.orderInfo = orderInfo;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "book_id", nullable = false)
	public BookInfo getBookInfo() {
		return this.bookInfo;
	}

	public void setBookInfo(BookInfo bookInfo) {
		this.bookInfo = bookInfo;
	}

	@Column(name = "book_num", nullable = false)
	public Integer getBookNum() {
		return this.bookNum;
	}

	public void setBookNum(Integer bookNum) {
		this.bookNum = bookNum;
	}

}