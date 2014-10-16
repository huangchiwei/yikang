package com.yuankang.yk.publics.tools;

import java.sql.Types;

import org.hibernate.Hibernate;
import org.hibernate.dialect.MySQL5Dialect;

public class CustomDialect extends MySQL5Dialect {
public CustomDialect() {
super();
registerHibernateType(Types.LONGVARCHAR, Hibernate.TEXT.getName());
registerHibernateType(-1, Hibernate.STRING.getName());
registerHibernateType(-4, Hibernate.STRING.getName());
}
}