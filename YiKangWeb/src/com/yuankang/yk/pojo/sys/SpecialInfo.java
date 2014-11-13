package com.yuankang.yk.pojo.sys;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * TSpecialInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_special_info", catalog = "yikang")
public class SpecialInfo implements java.io.Serializable {

	// Fields

	private String SId;
	private String SName;
	private String SIntroduction;
	private Integer isBlock;
	private Set<TRelation> TRelations = new HashSet<TRelation>(0);

	// Constructors

	/** default constructor */
	public SpecialInfo() {
	}

	/** full constructor */
	public SpecialInfo(String SName, String SIntroduction, Integer isBlock,
			Set<TRelation> TRelations) {
		this.SName = SName;
		this.SIntroduction = SIntroduction;
		this.isBlock = isBlock;
		this.TRelations = TRelations;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "s_id", unique = true, nullable = false, length = 32)
	public String getSId() {
		return this.SId;
	}

	public void setSId(String SId) {
		this.SId = SId;
	}

	@Column(name = "s_name", length = 128)
	public String getSName() {
		return this.SName;
	}

	public void setSName(String SName) {
		this.SName = SName;
	}

	@Column(name = "s_introduction")
	public String getSIntroduction() {
		return this.SIntroduction;
	}

	public void setSIntroduction(String SIntroduction) {
		this.SIntroduction = SIntroduction;
	}

	@Column(name = "is_block")
	public Integer getIsBlock() {
		return this.isBlock;
	}

	public void setIsBlock(Integer isBlock) {
		this.isBlock = isBlock;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "TSpecialInfo")
	public Set<TRelation> getTRelations() {
		return this.TRelations;
	}

	public void setTRelations(Set<TRelation> TRelations) {
		this.TRelations = TRelations;
	}

}