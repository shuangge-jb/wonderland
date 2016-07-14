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
 * BookInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "book_info", catalog = "mall")
public class BookInfo implements java.io.Serializable {

	// Fields

	private Integer id;
	private String bookName;
	private Double bookPrice;
	private Integer bookNumber;
	private String bookRewardScore;
	private String bookSecondType;
	private String bookFirstType;
	private String bookUrl;
	private String author;
	private String introduce;
	private Set<BookNum> bookNums = new HashSet<BookNum>(0);

	// Constructors

	/** default constructor */
	public BookInfo() {
	}

	/** full constructor */
	public BookInfo(String bookName, Double bookPrice, Integer bookNumber,
			String bookRewardScore, String bookSecondType,
			String bookFirstType, String bookUrl, String author,
			String introduce, Set<BookNum> bookNums) {
		this.bookName = bookName;
		this.bookPrice = bookPrice;
		this.bookNumber = bookNumber;
		this.bookRewardScore = bookRewardScore;
		this.bookSecondType = bookSecondType;
		this.bookFirstType = bookFirstType;
		this.bookUrl = bookUrl;
		this.author = author;
		this.introduce = introduce;
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

	@Column(name = "book_name", length = 50)
	public String getBookName() {
		return this.bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	@Column(name = "book_price", precision = 50, scale = 0)
	public Double getBookPrice() {
		return this.bookPrice;
	}

	public void setBookPrice(Double bookPrice) {
		this.bookPrice = bookPrice;
	}

	@Column(name = "book_number")
	public Integer getBookNumber() {
		return this.bookNumber;
	}

	public void setBookNumber(Integer bookNumber) {
		this.bookNumber = bookNumber;
	}

	@Column(name = "book_reward_score", length = 50)
	public String getBookRewardScore() {
		return this.bookRewardScore;
	}

	public void setBookRewardScore(String bookRewardScore) {
		this.bookRewardScore = bookRewardScore;
	}

	@Column(name = "book_second_type", length = 20)
	public String getBookSecondType() {
		return this.bookSecondType;
	}

	public void setBookSecondType(String bookSecondType) {
		this.bookSecondType = bookSecondType;
	}

	@Column(name = "book_first_type", length = 20)
	public String getBookFirstType() {
		return this.bookFirstType;
	}

	public void setBookFirstType(String bookFirstType) {
		this.bookFirstType = bookFirstType;
	}

	@Column(name = "book_url")
	public String getBookUrl() {
		return this.bookUrl;
	}

	public void setBookUrl(String bookUrl) {
		this.bookUrl = bookUrl;
	}

	@Column(name = "author", length = 50)
	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@Column(name = "introduce", length = 65535)
	public String getIntroduce() {
		return this.introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	@OneToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER, mappedBy = "bookInfo")
	@JsonIgnore
	public Set<BookNum> getBookNums() {
		return this.bookNums;
	}

	public void setBookNums(Set<BookNum> bookNums) {
		this.bookNums = bookNums;
	}

}