package com.sild.tviewer.repository.impl;

import com.sild.tviewer.model.Color;
import com.sild.tviewer.model.Company;
import com.sild.tviewer.repository.CRUDRepository;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ColorRepositoryImpl implements CRUDRepository<Color> {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void add(Color entity) {
		getCurrentSession().save(entity);
	}

	public void update(Color entity) {
		getCurrentSession().update(entity);
		
	}

	public Color get(int id) {
		Color company = (Color) getCurrentSession().get(Color.class, id);
		return company;
	}

	public void delete(int id) {
		Color entity = get(id);
		if (entity != null) {
            getCurrentSession().delete(entity);
        }
	}

	@SuppressWarnings("unchecked")
	public List<Color> getAll() {
		return getCurrentSession().createQuery("from Companies").list();
	}

}
