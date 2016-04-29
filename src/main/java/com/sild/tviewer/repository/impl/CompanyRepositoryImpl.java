package com.sild.tviewer.repository.impl;

import com.sild.tviewer.repository.CRUDRepository;
import com.sild.tviewer.model.Company;
import com.sild.tviewer.model.Team;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CompanyRepositoryImpl implements CRUDRepository<Company> {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void add(Company entity) {
		getCurrentSession().save(entity);
	}

	public void update(Company entity) {
		getCurrentSession().update(entity);
		
	}

	public Company get(int id) {
		Company company = (Company) getCurrentSession().get(Company.class, id);
		return company;
	}

	public void delete(int id) {
		Company company = get(id);
		if (company != null) {
            getCurrentSession().delete(company);
        }
	}

	@SuppressWarnings("unchecked")
	public List<Company> getAll() {
		return getCurrentSession().createQuery("from Companies").list();
	}

}
