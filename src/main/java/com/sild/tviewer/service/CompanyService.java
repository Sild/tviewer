package com.sild.tviewer.service;

import com.sild.tviewer.model.Company;

import java.util.List;
import java.util.Map;

/**
 * @author Dmitry Korchagin.
 */
public interface CompanyService {
    public void add(Company element);

    public void update(Company element);

    public Company get(int id);

    public void delete(int id);

    public List<Company> getAll();

    public Map<Integer, String> toMap(List<Company> companyList);
}
