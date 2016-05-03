package com.sild.tviewer.service;

import com.sild.tviewer.model.Company;

import java.util.List;

/**
 * @author Dmitry Korchagin.
 */
public interface CompanyService {
    public void add(Company element);

    public void update(Company element);

    public Company get(int id);

    public void delete(int id);

    public List<Company> getAll();

}
