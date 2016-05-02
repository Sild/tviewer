package com.sild.tviewer.repository;

import com.sild.tviewer.model.Tender;

import java.util.List;

public interface TenderCRUDRepository {

    public void add(Tender element);

    public void update(Tender element);

    public Tender get(int id);

    public void delete(int id);

    public List<Tender> getAll();

}
