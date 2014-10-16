package com.yuankang.yk.service.base;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * 
 * <pre>
 * 基础service实现类
 * </pre>
 */

public class BaseSqlService 
{
	@Resource
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getQuery(String sql,Pagination page) {
		String osql=sql+" limit "+page.getStartRowNumber()+","+page.getPageSize();
		SQLQuery sq=getSession().createSQLQuery(osql);
		List<Map<String, Object>> list=sq.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();
		return list;
			}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getQuery(String sql) {
		SQLQuery sq=getSession().createSQLQuery(sql);
		List<Map<String, Object>> list=sq.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();
		return list;
		//return getSession().createSQLQuery(sql).setCacheable(true).setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();
			}
	public void initCount(String sql,Pagination page) {
		String num=getSession().createSQLQuery(sql).list().get(0).toString();
		
		int rowCount=Integer.parseInt(num);
		 page.setTotalRowCount(rowCount);
		 page.init();
		//return getSession().createSQLQuery(sql).setCacheable(true).;
			}

	public void up_del(String sql) {
		getSession().createSQLQuery(sql).executeUpdate();
			}
	
}
