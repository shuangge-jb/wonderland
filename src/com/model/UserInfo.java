package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * UserInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "user_info", catalog = "mall")
public class UserInfo implements java.io.Serializable {

	// Fields
	private Integer id;
	private String password;
	private String name;
	private String sex;
	private String tel;
	private String userScore;
	private Double balance;
	private String username;
	private String email;
	private String question;
	private String answer;
	private String buyPassword;

	// Constructors

	/** default constructor */
	public UserInfo() {
	}

	/** minimal constructor */
	public UserInfo(String username) {
		this.username = username;
	}

	/** full constructor */
	public UserInfo(String password, String name, String sex, String tel,
			String userScore, Double balance, String username, String email,
			String question, String answer, String buyPassword) {
		this.password = password;
		this.name = name;
		this.sex = sex;
		this.tel = tel;
		this.userScore = userScore;
		this.balance = balance;
		this.username = username;
		this.email = email;
		this.question = question;
		this.answer = answer;
		this.buyPassword = buyPassword;
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

	@Column(name = "password", length = 50)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "name", length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "sex", length = 10)
	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Column(name = "tel", length = 50)
	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Column(name = "user_score", length = 50)
	public String getUserScore() {
		return this.userScore;
	}

	public void setUserScore(String userScore) {
		this.userScore = userScore;
	}

	@Column(name = "balance", precision = 20, scale = 0)
	public Double getBalance() {
		return this.balance;
	}

	public void setBalance(Double balance) {
		this.balance = balance;
	}

	@Column(name = "username", nullable = false, length = 50)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "email")
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "question")
	public String getQuestion() {
		return this.question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	@Column(name = "answer")
	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	@Column(name = "buy_password", length = 50)
	public String getBuyPassword() {
		return this.buyPassword;
	}

	public void setBuyPassword(String buyPassword) {
		this.buyPassword = buyPassword;
	}

}