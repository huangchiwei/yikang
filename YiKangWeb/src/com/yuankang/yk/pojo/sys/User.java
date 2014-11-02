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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.ForeignKey;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 用户实体
 * 
 * @author wei
 */
@Entity
@Table(name = "sys_user")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class User implements Serializable {

	private static final long serialVersionUID = 5255700280894830085L;

	/** 编号 PK主键自增长 */
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * 登陆名称
	 */
	@Column(name = "LoginName", nullable = false, length = 200)
	private String loginName;
	/**
	 * 密码(不允许空值)
	 */
	@Column(name = "Pwd", nullable = false, length = 200)
	private String password;
	/**
	 * 真实姓名（或昵称，依系统而定）
	 */
	@Column(name = "UserName", nullable = false, length = 200)
	private String userName;
	/**
	 * 用户状态（0：禁用；1：启用（默认）; 2:删除）
	 */
	@Column(name = "Status", nullable = true, columnDefinition = "INTEGER default 1")
	private Integer status = 1;

	/**
	 * 性别,1：男性；0：女性
	 */
	@Column(name = "Gender", nullable = true, columnDefinition = "INTEGER DEFAULT 1")
	private Integer gender;

	@Column(name = "Mobile")
	private String mobile; // 手机号码

	@Column(name = "Email")
	private String email; // 用户电邮

	@Column(name = "Address")
	private String address;
	
	@Column(name = "AddTime", nullable = true)
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:SS")
	private Date addTime; // 用户添加时间

	@Column(name = "UpdateTime", nullable = true)
	@Temporal(TemporalType.DATE)
	private Date updateTime; // 用户修改时间

	@Column(name = "SuperManager", nullable = true, columnDefinition = "INTEGER default 0")
	private Integer superManager = 0; // 是否超级管理员，默认为0

	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "Creater", nullable = true, referencedColumnName = "ID")
	@ForeignKey(name = "FK_USER_CREATER")
	private User creater; // 创建人
	
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "Updater", nullable = true, referencedColumnName = "ID")
	@ForeignKey(name = "FK_USER_UPDATER")
	private User updater; // 修改人
	
	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getSuperManager() {
		return superManager;
	}

	public void setSuperManager(Integer superManager) {
		this.superManager = superManager;
	}

	public User getCreater() {
		return creater;
	}

	public void setCreater(User creater) {
		this.creater = creater;
	}

	public User getUpdater() {
		return updater;
	}

	public void setUpdater(User updater) {
		this.updater = updater;
	}


	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	
}