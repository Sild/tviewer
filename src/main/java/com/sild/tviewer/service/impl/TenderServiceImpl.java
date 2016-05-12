package com.sild.tviewer.service.impl;

import com.sild.tviewer.model.Tender;
import com.sild.tviewer.repository.CRUDRepository;
import com.sild.tviewer.service.TenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TenderServiceImpl implements TenderService {

    @Autowired
    private CRUDRepository<Tender> repository;

    public void createOrUpdate(Tender element) {
        if(null == element.getId() || element.getId().equals("")) {
            repository.add(element);
        } else {
            repository.update(element);
        }
    }

    public Tender get(int id) {
        return repository.get(Tender.class, id);
    }

    public void delete(int id) {
        repository.delete(Tender.class, id);
    }

    public List<Tender> getAll() {
        return repository.getAll(Tender.class);
    }
}