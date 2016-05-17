package com.sild.tviewer.service.impl;

import com.sild.tviewer.model.Company;
import com.sild.tviewer.repository.CompanyRepository;
import com.sild.tviewer.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyRepository repository;

    public void createOrUpdate(Company company) {
        if (null == company.getId() || company.getId().equals("")) {
            repository.add(company);
        } else {
            repository.update(company);
        }
    }

    public Company get(int id) {
        return repository.get(id);
    }

    public void delete(int id) {
        repository.delete(id);
    }

    public List<Company> getByName(String name) {
        return repository.getByName(name);
    }

    public List<Company> getAll() {
        return repository.getAll();
    }

    public List<Company> getProvidersByName(String name) {
        return repository.getProvidersByName(name);
    }

    public List<Company> getCustomersByName(String name) {
        return repository.getCustomersByName(name);
    }


}