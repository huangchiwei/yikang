package com.yuankang.yk.pojo.medicalguide;

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
public class Relation implements java.io.Serializable {

	// Fields

	private String id;
	private ExpertInfo expertInfo;
	private Hospital hospital;
	private SpecialInfo specialInfo;


	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "r_id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "e_id")
	public ExpertInfo getExpertInfo() {
		return this.expertInfo;
	}

	public void setExpertInfo(ExpertInfo expertInfo) {
		this.expertInfo = expertInfo;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "t_id")
	public Hospital getHospital() {
		return this.hospital;
	}

	public void setHospital(Hospital hospital) {
		this.hospital = hospital;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "s_id")
	public SpecialInfo getSpecialInfo() {
		return this.specialInfo;
	}

	public void setSpecialInfo(SpecialInfo specialInfo) {
		this.specialInfo = specialInfo;
	}

}