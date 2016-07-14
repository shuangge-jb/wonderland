package com.model;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * OrderInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "order_info", catalog = "mall")
public class OrderInfo implements java.io.Serializable {

	// Fields

	private Integer id;
	private Address address;
	private Integer userId;
	private Timestamp pubTime;
	private Date sendTime;
	private Date getTime;
	private String sendAddress;
	private Integer status;
	private Set<BookNum> bookNums = new HashSet<BookNum>(0);

	// Constructors

	/** default constructor */
	public OrderInfo() {
	}

	/** full constructor */
	public OrderInfo(Address address, Integer userId, Timestamp pubTime,
			Date sendTime, Date getTime, String sendAddress, Integer status,
			Set<BookNum> bookNums) {
		this.address = address;
		this.userId = userId;
		this.pubTime = pubTime;
		this.sendTime = sendTime;
		this.getTime = getTime;
		this.sendAddress = sendAddress;
		this.status = status;
		this.bookNums = bookNums;
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
	@JoinColumn(name = "get_address")
	public Address getAddress() {
		return this.address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	@Column(name = "user_id")
	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Column(name = "pub_time", length = 19)
	public Timestamp getPubTime() {
		return this.pubTime;
	}

	public void setPubTime(Timestamp pubTime) {
		this.pubTime = pubTime;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "send_time", length = 10)
	public Date getSendTime() {
		return this.sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "get_time", length = 10)
	public Date getGetTime() {
		return this.getTime;
	}

	public void setGetTime(Date getTime) {
		this.getTime = getTime;
	}

	@Column(name = "send_address")
	public String getSendAddress() {
		return this.sendAddress;
	}

	public void setSendAddress(String sendAddress) {
		this.sendAddress = sendAddress;
	}

	@Column(name = "status")
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@OneToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER, mappedBy = "orderInfo")
	@JsonIgnore
	public Set<BookNum> getBookNums() {
		return this.bookNums;
	}

	public void setBookNums(Set<BookNum> bookNums) {
		this.bookNums = bookNums;
	}

}