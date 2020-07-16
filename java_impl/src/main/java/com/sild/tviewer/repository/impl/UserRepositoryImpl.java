package com.sild.tviewer.repository.impl;

import com.sild.tviewer.model.Company;
import com.sild.tviewer.model.Member;
import com.sild.tviewer.model.Tender;
import com.sild.tviewer.model.User;
import com.sild.tviewer.model.filter.TenderFilter;
import com.sild.tviewer.repository.TenderRepository;
import com.sild.tviewer.repository.UserRepository;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
@SuppressWarnings("unchecked")
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private SessionFactory sessionFactory;

    protected Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    public User get(String email) {

        String hql = "FROM " + User.class.getName() +
                " u WHERE u.email = :email AND u.deleted <> 1";
        return (User) getCurrentSession().createQuery(hql).setString("email", email).uniqueResult();
    }

}
