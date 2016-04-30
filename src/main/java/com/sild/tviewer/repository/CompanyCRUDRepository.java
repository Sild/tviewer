package com.sild.tviewer.repository;

import com.sild.tviewer.model.Company;

import java.util.List;

public interface CompanyCRUDRepository {

    public void add(Company element);

    public void update(Company element);

    public Company get(int id);

    public void delete(int id);

    public List<Company> getAll();

}
