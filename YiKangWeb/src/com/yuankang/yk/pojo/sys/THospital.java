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
 * THospital entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_hospital", catalog = "yikang")
public class THospital implements java.io.Serializable {

	// Fields

	private String TId;
	private String TName;
	private String TAddr;
	private String TIntroduction;
	private String TPicUrl;
	private Integer isBlock;
	private Set<TRelation> TRelations = new HashSet<TRelation>(0);

	// Constructors

	/** default constructor */
	public THospital() {
	}

	/** full constructor */
	public THospital(String TName, String TAddr, String TIntroduction,
			String TPicUrl, Integer isBlock, Set<TRelation> TRelations) {
		this.TName = TName;
		this.TAddr = TAddr;
		this.TIntroduction = TIntroduction;
		this.TPicUrl = TPicUrl;
		this.isBlock = isBlock;
		this.TRelations = TRelations;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "t_id", unique = true, nullable = false, length = 32)
	public String getTId() {
		return this.TId;
	}

	public void setTId(String TId) {
		this.TId = TId;
	}

	@Column(name = "t_name", length = 128)
	public String getTName() {
		return this.TName;
	}

	public void setTName(String TName) {
		this.TName = TName;
	}

	@Column(name = "t_addr", length = 256)
	public String getTAddr() {
		return this.TAddr;
	}

	public void setTAddr(String TAddr) {
		this.TAddr = TAddr;
	}

	@Column(name = "t_introduction")
	public String getTIntroduction() {
		return this.TIntroduction;
	}

	public void setTIntroduction(String TIntroduction) {
		this.TIntroduction = TIntroduction;
	}

	@Column(name = "t_pic_url", length = 256)
	public String getTPicUrl() {
		return this.TPicUrl;
	}

	public void setTPicUrl(String TPicUrl) {
		this.TPicUrl = TPicUrl;
	}

	@Column(name = "is_block")
	public Integer getIsBlock() {
		return this.isBlock;
	}

	public void setIsBlock(Integer isBlock) {
		this.isBlock = isBlock;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "THospital")
	public Set<TRelation> getTRelations() {
		return this.TRelations;
	}

	public void setTRelations(Set<TRelation> TRelations) {
		this.TRelations = TRelations;
	}

}