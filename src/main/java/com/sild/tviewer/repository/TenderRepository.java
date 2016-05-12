package com.sild.tviewer.repository;

import com.sild.tviewer.model.Company;
import com.sild.tviewer.model.Tender;

import java.util.List;

public interface TenderRepository {

    public void add(Tender tender);

    public void update(Tender tender);

    public Tender get(int id);

    public void delete(int id);

    public List<Tender> getAll();

}
