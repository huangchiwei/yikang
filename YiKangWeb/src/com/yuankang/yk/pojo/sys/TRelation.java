package com.yuankang.yk.pojo.sys;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * TRelation entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_relation", catalog = "yikang")
public class TRelation implements java.io.Serializable {

	// Fields

	private String RId;
	private TExpertInfo TExpertInfo;
	private THospital THospital;
	private TSpecialInfo TSpecialInfo;

	// Constructors

	/** default constructor */
	public TRelation() {
	}

	/** full constructor */
	public TRelation(TExpertInfo TExpertInfo, THospital THospital,
			TSpecialInfo TSpecialInfo) {
		this.TExpertInfo = TExpertInfo;
		this.THospital = THospital;
		this.TSpecialInfo = TSpecialInfo;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "r_id", unique = true, nullable = false, length = 32)
	public String getRId() {
		return this.RId;
	}

	public void setRId(String RId) {
		this.RId = RId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "e_id")
	public TExpertInfo getTExpertInfo() {
		return this.TExpertInfo;
	}

	public void setTExpertInfo(TExpertInfo TExpertInfo) {
		this.TExpertInfo = TExpertInfo;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "t_id")
	public THospital getTHospital() {
		return this.THospital;
	}

	public void setTHospital(THospital THospital) {
		this.THospital = THospital;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "s_id")
	public TSpecialInfo getTSpecialInfo() {
		return this.TSpecialInfo;
	}

	public void setTSpecialInfo(TSpecialInfo TSpecialInfo) {
		this.TSpecialInfo = TSpecialInfo;
	}

}