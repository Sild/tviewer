package com.sild.tviewer.service;

import com.sild.tviewer.model.Tender;

import java.util.List;

/**
 * @author Dmitry Korchagin.
 */
public interface TenderService {
    public void createOrUpdate(Tender element);

    public Tender get(int id);

    public void delete(int id);

    public List<Tender> getAll();

    public List<Tender> getByFilters(String number, String state, String memberName);

}
