package com.sild.tviewer.repository.impl;

import com.sild.tviewer.repository.CRUDRepository;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class CRUDRepositoryImpl<T> implements CRUDRepository<T> {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    public void add(T entity) {
        getCurrentSession().save(entity);
    }

    public void update(T entity) {
        getCurrentSession().update(entity);
    }

    public T get(Class clazz, int id) {
        return (T) getCurrentSession().get(clazz, id);
    }

    public void delete(Class clazz, int id) {
        T entity = get(clazz, id);
        if (entity != null) {
            getCurrentSession().delete(entity);
        }
    }

    @SuppressWarnings("unchecked")
    public List<T> getAll(Class clazz) {
        return getCurrentSession().createQuery("from " + clazz.getName()).list();
    }

}
