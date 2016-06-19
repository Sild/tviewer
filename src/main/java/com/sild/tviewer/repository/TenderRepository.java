package com.sild.tviewer.repository;

import com.sild.tviewer.model.Tender;
import com.sild.tviewer.model.filter.TenderFilter;

import java.util.List;

public interface TenderRepository {

    public void add(Tender tender);

    public void update(Tender tender);

    public Tender get(int id);

    public void delete(int id);

    public List<Tender> getAll();

    public List<Tender> get(TenderFilter filter);

}
