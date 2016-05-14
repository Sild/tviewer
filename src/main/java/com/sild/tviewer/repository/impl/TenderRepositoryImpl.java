package com.sild.tviewer.repository.impl;

import com.sild.tviewer.model.Tender;
import com.sild.tviewer.repository.TenderRepository;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class TenderRepositoryImpl implements TenderRepository {

    @Autowired
    private SessionFactory sessionFactory;

    protected Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    public void add(Tender tender) {
        getCurrentSession().save(tender);
    }

    public void update(Tender tender) {
        getCurrentSession().update(tender);
    }

    public Tender get(int id) {
        return (Tender) getCurrentSession().get(Tender.class, id);
    }

    public void delete(int id) {
        Tender tender = get(id);
        if (tender != null) {
            getCurrentSession().delete(tender);
        }
    }

    @SuppressWarnings("unchecked")
    public List<Tender> getAll() {
        String hql = "FROM " + Tender.class.getName() + " t ORDER BY t.number";
        return getCurrentSession().createQuery(hql).list();
    }

}
