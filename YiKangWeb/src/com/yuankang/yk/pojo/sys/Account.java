package com.yuankang.yk.pojo.sys;

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

/**
 * 类说明: 注册用户
 * @author wei
 * @date 2014年11月15日 下午11:10:36
 * @version V1.0
 */

@Entity
@Table(name = "account")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Account implements Serializable{

	private static final long serialVersionUID = 1000L;
	/** 编号 PK主键自增长 */
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(name = "AccountNo")
	private String accountNo;
	
	@Column(name = "Pwd")
	private String pwd;
	
	
	@Column(name = "Gender")
	private Integer gender;
	
	@Column(name = "Email")
	private String email;
	
	
	
	@Column(name = "Province")
	private Integer province;
	
	@Column(name = "City")
	private Integer city;
	
	@Column(name = "Area")
	private Integer area;
	
	@Column(name = "Address")
	private String address;
	
	@Column(name = "Phone")
	private String phone;
	
	@Column(name = "Tel")
	private String tel;
	
	@Column(name = "TelAreaCode")
	private String telAreaCode;
	
	@Column(name = "QQ")
	private String qq;
	
	@Column(name = "Company")
	private String company;

	

	
	@Column(name = "Introduce")
	private String introduce;
	
	@Column(name = "Status")
	private Integer status;
	
	@Column(name = "CreateDate")
	private Date createDate;
	
	@Column(name = "Turnover")
	private Float turnover;
	
	@Column(name = "NetAsset")
	private Float netAsset;
	
	@Column(name = "MailSeq")
	private String mailSeq;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "Industry", referencedColumnName = "ID")
	@ForeignKey(name = "FK_ACCOUNT_INDUSTRY")
	private Mcode industry;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getProvince() {
		return province;
	}

	public void setProvince(Integer province) {
		this.province = province;
	}

	public Integer getCity() {
		return city;
	}

	public void setCity(Integer city) {
		this.city = city;
	}

	public Integer getArea() {
		return area;
	}

	public void setArea(Integer area) {
		this.area = area;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getTelAreaCode() {
		return telAreaCode;
	}

	public void setTelAreaCode(String telAreaCode) {
		this.telAreaCode = telAreaCode;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Float getTurnover() {
		return turnover;
	}

	public void setTurnover(Float turnover) {
		this.turnover = turnover;
	}

	public Float getNetAsset() {
		return netAsset;
	}

	public void setNetAsset(Float netAsset) {
		this.netAsset = netAsset;
	}

	public String getMailSeq() {
		return mailSeq;
	}

	public void setMailSeq(String mailSeq) {
		this.mailSeq = mailSeq;
	}

	public Mcode getIndustry() {
		return industry;
	}

	public void setIndustry(Mcode industry) {
		this.industry = industry;
	}
	


	
	
}
