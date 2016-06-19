package com.sild.tviewer.repository.impl;

import com.sild.tviewer.model.Member;
import com.sild.tviewer.model.Tender;
import com.sild.tviewer.model.filter.TenderFilter;
import com.sild.tviewer.repository.TenderRepository;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
@SuppressWarnings("unchecked")
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
        return getCurrentSession().get(Tender.class, id);
    }

    public void delete(int id) {
        Tender tender = get(id);
        if (tender != null) {
            getCurrentSession().delete(tender);
        }
    }

    public List<Tender> getAll() {
        String hql = "FROM " + Tender.class.getName() + " t ORDER BY t.number";
        return getCurrentSession().createQuery(hql).list();
    }

    public List<Tender> get(TenderFilter filter) {
        StringBuilder hql = new StringBuilder();
        if (filter.getMember().equals("")) {
            hql.append("SELECT DISTINCT t FROM ")
                    .append(Tender.class.getName())
                    .append(" t WHERE ")
                    .append("t.state like :state ")
                    .append("AND t.number like :number ")
                    .append("AND t.owner.name like :ownerName ")
                    .append((filter.getLiked() ? "AND t.liked = true " : ""))
                    .append("ORDER BY t.addTime DESC");
            return getCurrentSession().createQuery(hql.toString())
                    .setString("ownerName", "%" + filter.getOwner() + "%")
                    .setString("number", "%" + filter.getNumber() + "%")
                    .setString("state", "%" + (filter.getState() == null ? "" : filter.getState()) + "%")
                    .list();

        } else {
            hql.append("SELECT DISTINCT m.tender FROM ")
                    .append(Member.class.getName())
                    .append(" m WHERE ")
                    .append("m.company.name like :memberName  ")
                    .append("AND m.tender.state like :state ")
                    .append("AND m.tender.number like :number ")
                    .append("AND m.tender.owner.name like :ownerName ")
                    .append((filter.getLiked() ? "AND m.tender.liked = true " : ""))
                    .append("AND (m.tender.deleted <> 1) ")
                    .append("ORDER BY m.tender.addTime DESC");
            return getCurrentSession().createQuery(hql.toString())
                    .setString("memberName", "%" + filter.getMember() + "%")
                    .setString("ownerName", "%" + filter.getOwner() + "%")
                    .setString("number", "%" + filter.getOwner() + "%")
                    .setString("state", "%" + (filter.getState() == null ? "" : filter.getState()) + "%")
                    .list();
        }
    }
}
