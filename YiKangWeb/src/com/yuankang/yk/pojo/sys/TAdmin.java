package com.yuankang.yk.pojo.sys;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * TAdmin entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_admin", catalog = "yikang")
public class TAdmin implements java.io.Serializable {

	// Fields

	private String AId;
	private String AName;
	private String APassword;

	// Constructors

	/** default constructor */
	public TAdmin() {
	}

	/** full constructor */
	public TAdmin(String AName, String APassword) {
		this.AName = AName;
		this.APassword = APassword;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "a_id", unique = true, nullable = false, length = 32)
	public String getAId() {
		return this.AId;
	}

	public void setAId(String AId) {
		this.AId = AId;
	}

	@Column(name = "a_name", length = 32)
	public String getAName() {
		return this.AName;
	}

	public void setAName(String AName) {
		this.AName = AName;
	}

	@Column(name = "a_password", length = 41)
	public String getAPassword() {
		return this.APassword;
	}

	public void setAPassword(String APassword) {
		this.APassword = APassword;
	}

}