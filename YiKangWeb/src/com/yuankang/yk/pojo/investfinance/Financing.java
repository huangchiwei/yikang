package com.yuankang.yk.pojo.investfinance;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.ForeignKey;

import com.yuankang.yk.pojo.sys.Account;
import com.yuankang.yk.pojo.sys.Mcode;
import com.yuankang.yk.pojo.sys.Region;

/**
 * 类说明:融资
 * @author wei
 * @date 2014年11月15日 下午11:10:36
 * @version V1.0
 */
@Entity
@Table(name = "financing")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Financing implements Serializable{

	private static final long serialVersionUID = 1000L;
	/** 编号 PK主键自增长 */
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(name="Title")
	private String title;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "Province", referencedColumnName = "REGION_ID")
	@ForeignKey(name = "FK_FINANCING_PROVINCE")
	private Region province;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "City", referencedColumnName = "REGION_ID")
	@ForeignKey(name = "FK_FINANCING_CITY")
	private Region city;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "Area", referencedColumnName = "REGION_ID")
	@ForeignKey(name = "FK_FINANCING_AREA")
	private Region area;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "Industry", referencedColumnName = "ID")
	@ForeignKey(name = "FK_FINANCING_INDUSTRY")
	private Mcode industry;
	
	@Column(name="Amount")
	private Integer amount;
	
	@Column(name="Overview")
	private String overview;

	@Column(name="IsSelf")
	private Integer isSelf;
	
	@Column(name="Status")
	private Integer status = 0;
	
	@Column(name="isTop")
	private Integer isTop = 0;
	
	@Column(name="CreateDate")
	private Date createDate;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "AccountId", referencedColumnName = "ID")
	@ForeignKey(name = "FK_FINANCING_ACCOUNTID")
	private Account account;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Region getProvince() {
		return province;
	}

	public void setProvince(Region province) {
		this.province = province;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getOverview() {
		return overview;
	}

	public void setOverview(String overview) {
		this.overview = overview;
	}

	public Region getCity() {
		return city;
	}

	public void setCity(Region city) {
		this.city = city;
	}

	public Region getArea() {
		return area;
	}

	public void setArea(Region area) {
		this.area = area;
	}

	public Integer getIsSelf() {
		return isSelf;
	}

	public void setIsSelf(Integer isSelf) {
		this.isSelf = isSelf;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Mcode getIndustry() {
		return industry;
	}

	public void setIndustry(Mcode industry) {
		this.industry = industry;
	}

	public Integer getIsTop() {
		return isTop;
	}

	public void setIsTop(Integer isTop) {
		this.isTop = isTop;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
}
