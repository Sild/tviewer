package com.sild.tviewer.service.impl;

import com.sild.tviewer.model.Company;
import com.sild.tviewer.repository.CRUDRepository;
import com.sild.tviewer.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {
    @Autowired
    private CRUDRepository<Company> repository;

    public void createOrUpdate(Company company) {
        if(null == company.getId() || company.getId().equals("") ) {
            repository.add(company);
        } else {
            repository.update(company);
        }
    }

    public Company get(int id) {
        return repository.get(Company.class, id);
    }

    public void delete(int id) {
        repository.delete(Company.class, id);
    }

    public List<Company> getAll() {
        return repository.getAll(Company.class);
    }



}