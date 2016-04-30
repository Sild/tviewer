package com.sild.tviewer.repository.impl;

import com.sild.tviewer.model.Platform;
import com.sild.tviewer.repository.PlatformCRUDRepository;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class PlatformRepositoryImpl implements PlatformCRUDRepository {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    public void add(Platform entity) {
        getCurrentSession().save(entity);
    }

    public void update(Platform entity) {
        getCurrentSession().update(entity);

    }

    public Platform get(int id) {
        return (Platform) getCurrentSession().get(Platform.class, id);
    }

    public void delete(int id) {
        Platform entity = get(id);
        if (entity != null) {
            getCurrentSession().delete(entity);
        }
    }

    @SuppressWarnings("unchecked")
    public List<Platform> getAll() {
        return getCurrentSession().createQuery("from " + Platform.class.getName()).list();
    }

}
