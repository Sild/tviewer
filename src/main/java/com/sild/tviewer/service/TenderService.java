package com.sild.tviewer.service;

import com.sild.tviewer.model.Tender;

import java.util.List;

/**
 * @author Dmitry Korchagin.
 */
public interface TenderService {
    public void add(Tender element);

    public void update(Tender element);

    public Tender get(int id);

    public void delete(int id);

    public List<Tender> getAll();
}
