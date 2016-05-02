package com.sild.tviewer.repository.impl;

import com.sild.tviewer.model.Tender;
import com.sild.tviewer.repository.TenderCRUDRepository;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class TenderRepositoryImpl implements TenderCRUDRepository {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    public void add(Tender entity) {
        getCurrentSession().save(entity);
    }

    public void update(Tender entity) {
        getCurrentSession().update(entity);
    }

    public Tender get(int id) {
        return (Tender) getCurrentSession().get(Tender.class, id);
    }

    public void delete(int id) {
        Tender entity = get(id);
        if (entity != null) {
            getCurrentSession().delete(entity);
        }
    }

    @SuppressWarnings("unchecked")
    public List<Tender> getAll() {
        return getCurrentSession().createQuery("from " + Tender.class.getName()).list();
    }

}
