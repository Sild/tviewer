package com.sild.tviewer.service.impl;

import com.sild.tviewer.model.Company;
import com.sild.tviewer.repository.CompanyCRUDRepository;
import com.sild.tviewer.service.CompanyCRUDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyCRUDService {
    @Autowired
    private CompanyCRUDRepository repository;

    public void add(Company element) {
        repository.add(element);
    }

    public void update(Company element) {
        repository.update(element);
    }

    public Company get(int id) {
        return repository.get(id);
    }

    public void delete(int id) {
        repository.delete(id);
    }

    public List<Company> getAll() {
        return repository.getAll();
    }
}