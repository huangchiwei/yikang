package com.yuankang.yk.pojo.sys;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * NewsCategory entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "news_category", catalog = "yikang")
public class NewsCategory implements java.io.Serializable {

	// Fields

	private Integer id;
	private String categoryName;
	private Integer orderNo;

	// Constructors

	/** default constructor */
	public NewsCategory() {
	}

	/** full constructor */
	public NewsCategory(String categoryName, Integer orderNo) {
		this.categoryName = categoryName;
		this.orderNo = orderNo;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "CategoryName")
	public String getCategoryName() {
		return this.categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Column(name = "OrderNo")
	public Integer getOrderNo() {
		return this.orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

}