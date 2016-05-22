package com.sild.tviewer.service;

import com.sild.tviewer.model.Company;

import java.util.List;

/**
 * @author Dmitry Korchagin.
 */
public interface CompanyService {

    public void createOrUpdate(Company company);

    public Company get(int id);

    public void delete(int id);

    public List<Company> getAll();

    public List<Company> getByName(String name);

    public List<Company> getProvidersByName(String name);

    public List<Company> getCustomersByName(String name);

}
