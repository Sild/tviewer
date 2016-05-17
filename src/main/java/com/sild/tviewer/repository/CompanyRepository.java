package com.sild.tviewer.repository;

import com.sild.tviewer.model.Company;

import java.util.List;

public interface CompanyRepository {

    public void add(Company company);

    public void update(Company company);

    public Company get(int id);

    public void delete(int id);

    public List<Company> getAll();

    public List<Company> getByName(String name);

    public List<Company> getProvidersByName(String name);

    public List<Company> getCustomersByName(String name);

}
