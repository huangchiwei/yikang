package com.yuankang.yk.pojo.sys;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 码表实体
 * 
 * @author wei
 */
@Entity
@Table(name = "mcode")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Mcode implements Serializable {

	private static final long serialVersionUID = 1000L;
	/** 编号 PK主键自增长 */
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	/**
	 * 码类型
	 */
	@Column(name="McType",nullable = false, length=100)
	private String mcType;
	/**
	 * 码名
	 */
	@Column(name="McName",nullable = false, length=100)
	private String mcName;
	/**
	 * 码值
	 */
	@Column(name="McValue",nullable = false, length=100)
	private String mcValue;

	/**
	 * 码排序
	 */
	@Column(name="OrderNum",nullable = true, length=50)
	private Integer orderNum;
	
	public Mcode(){}
	
	public Mcode(Long id){
		this.id = id;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getMcType() {
		return mcType;
	}

	public void setMcType(String mcType) {
		this.mcType = mcType;
	}

	public String getMcName() {
		return mcName;
	}

	public void setMcName(String mcName) {
		this.mcName = mcName;
	}

	public String getMcValue() {
		return mcValue;
	}

	public void setMcValue(String mcValue) {
		this.mcValue = mcValue;
	}

	public Integer getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}

	
}

