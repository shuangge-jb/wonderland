package com.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * Address entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "address", catalog = "mall")
public class Address implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private String getPerson;
	private String getAddress;
	private String tel;
	private Integer postcode;
	private Set<OrderInfo> orderInfos = new HashSet<OrderInfo>(0);

	// Constructors

	/** default constructor */
	public Address() {
	}

	/** full constructor */
	public Address(Integer userId, String getPerson, String getAddress,
			String tel, Integer postcode, Set<OrderInfo> orderInfos) {
		this.userId = userId;
		this.getPerson = getPerson;
		this.getAddress = getAddress;
		this.tel = tel;
		this.postcode = postcode;
		this.orderInfos = orderInfos;
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

	@Column(name = "get_person", length = 50)
	public String getGetPerson() {
		return this.getPerson;
	}

	public void setGetPerson(String getPerson) {
		this.getPerson = getPerson;
	}

	@Column(name = "get_address")
	public String getGetAddress() {
		return this.getAddress;
	}

	public void setGetAddress(String getAddress) {
		this.getAddress = getAddress;
	}

	@Column(name = "tel")
	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Column(name = "postcode")
	public Integer getPostcode() {
		return this.postcode;
	}

	public void setPostcode(Integer postcode) {
		this.postcode = postcode;
	}

	@OneToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER, mappedBy = "address")
	@JsonIgnore
	public Set<OrderInfo> getOrderInfos() {
		return this.orderInfos;
	}

	public void setOrderInfos(Set<OrderInfo> orderInfos) {
		this.orderInfos = orderInfos;
	}

}