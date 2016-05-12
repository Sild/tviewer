package com.sild.tviewer.repository.impl;

import com.sild.tviewer.model.Company;
import com.sild.tviewer.repository.CRUDRepository;
import com.sild.tviewer.repository.CompanyRepository;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class CompanyRepositoryImpl implements CompanyRepository {

    @Autowired
    private SessionFactory sessionFactory;

    protected Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    public void add(Company company) {
        getCurrentSession().save(company);
    }

    public void update(Company company) {
        getCurrentSession().update(company);
    }

    public Company get(int id) {
        return (Company) getCurrentSession().get(Company.class, id);
    }

    public void delete(int id) {
        Company company = get(id);
        if (company != null) {
            getCurrentSession().delete(company);
        }
    }

    @SuppressWarnings("unchecked")
    public List<Company> getAll() {
        String hql = "FROM " + Company.class.getName() + " c ORDER BY c.name";
        return getCurrentSession().createQuery(hql).list();
    }

}
