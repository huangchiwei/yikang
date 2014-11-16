package com.yuankang.yk.dao.base;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.QueryException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;

/**
 * 
 * <pre>
 * 基础dao接口实现类
 * </pre>
 */
@Repository("baseDao")
public class BaseDaoImpl<T> implements BaseDao<T> {
	@Resource
	private SessionFactory sessionFactory;

	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

	@Override
	public void delete(T e) throws QueryException {
		getSession().delete(e);
	}

	@SuppressWarnings("unchecked")
	@Override
	public T findById(Serializable id, Class<T> cls) throws QueryException {
		return (T)getSession().get(cls, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> findAll(Class<T> cls) throws QueryException {
		List<T> objList = getSession().createCriteria(cls)
				.addOrder(Order.asc("id")).setCacheable(true).list();
		return objList;
	}

	@Override
	public void save(T t) throws QueryException {
		this.getSession().save(t);
	}

	@Override
	public void update(T t) throws QueryException {
		this.getSession().merge(t);
	}

	@SuppressWarnings("unchecked")
	protected <E> List<E> findByPage(String hql, Integer startRow,
			Integer pageSize, Object... params) throws QueryException {
		if (!StringUtils.hasText(hql)) {
			return null;
		}
		Query query = getSession().createQuery(hql);
		if (!ObjectUtils.isEmpty(params)) {
			for (int i = 0; i < params.length; i++) {
				if (params[i] != null && !params[i].equals(""))
					query.setParameter(i, params[i]);
			}
		}
		return query.setFirstResult(startRow).setMaxResults(pageSize).list();
	}

	/**
	 * 按条件统计总条数
	 * 
	 * @param hql
	 * @param params
	 */
	protected Integer count(String hql, Object... params) throws QueryException {
		if (StringUtils.isEmpty(hql)) {
			return null;
		}
		Query query = getSession().createQuery(hql);
		if (!ObjectUtils.isEmpty(params)) {
			for (int i = 0; i < params.length; i++) {
				if (params[i] != null && !params[i].equals(""))
					query.setParameter(i, params[i]);
			}
		}
		return ((Long) query.setCacheable(true).uniqueResult()).intValue();
	}
	
	
	@SuppressWarnings("unchecked")
	protected <E> List<E> findByParam(String hql, Object... params) throws QueryException{
		if(! StringUtils.hasText(hql)){
			return null;
		}
		Query query = getSession().createQuery(hql);
		if(! ObjectUtils.isEmpty(params)){
			for(int i = 0; i < params.length; i ++){
				if(params[i] != null && ! params[i].equals("")){
					query.setParameter(i, params[i]);
				}
			}
		}		
		return query.setCacheable(true).list();
	}
	
	
	@SuppressWarnings("unchecked")
	protected <E> List<E> findByMap(String hql, final Map<String, Object> params) throws QueryException{
		if(! StringUtils.hasText(hql)){
			return null;
		}
		Query query = getSession().createQuery(hql);
		if (params != null && params.size() > 0) {
			query.setProperties(params);
		}
//		if(! ObjectUtils.isEmpty(params)){
//			for(int i = 0; i < params.length; i ++){
//				if(params[i] != null && ! params[i].equals("")){
//					query.setParameter(i, params[i]);
//				}
//			}
//		}		
		return query.list();
	}
	
	
	/**
	 * 执行HQL语句，查询出数据库中的记录数
	 * @param hql 需要执行的HQL语句
	 * @param params 需要设置的HQL参数
	 * @return 返回查询出的记录数
	 */
	public Integer isHaveCount_HQL(final String hql, final Map<String, Object> params) {
		if (StringUtils.isEmpty(hql)) {
			return null;
		}
		Query query = getSession().createQuery(hql);
		if (params != null && params.size() > 0) {
			query.setProperties(params);
		}
		return query.list().size();
	}

}
