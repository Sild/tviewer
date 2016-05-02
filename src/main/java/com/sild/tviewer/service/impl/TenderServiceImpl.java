package com.sild.tviewer.service.impl;

import com.sild.tviewer.model.Tender;
import com.sild.tviewer.repository.TenderCRUDRepository;
import com.sild.tviewer.service.TenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TenderServiceImpl implements TenderService {

    @Autowired
    private TenderCRUDRepository repository;


    public void add(Tender element) {
        repository.add(element);
    }

    public void update(Tender element) {
        repository.update(element);
    }

    public Tender get(int id) {
        return repository.get(id);
    }

    public void delete(int id) {
        repository.delete(id);
    }

    public List<Tender> getAll() {
        return repository.getAll();
    }
}