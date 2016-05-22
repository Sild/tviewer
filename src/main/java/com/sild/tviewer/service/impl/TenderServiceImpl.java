package com.sild.tviewer.service.impl;

import com.sild.tviewer.model.Tender;
import com.sild.tviewer.model.TenderState;
import com.sild.tviewer.repository.TenderRepository;
import com.sild.tviewer.service.TenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TenderServiceImpl implements TenderService {

    @Autowired
    private TenderRepository repository;

    public void createOrUpdate(Tender element) {
        if (null == element.getId() || element.getId().equals("")) {
            repository.add(element);
        } else {
            repository.update(element);
        }
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

    public List<Tender> getByFilters(String number, String state, String memberName) {
        TenderState tenderState;
        if(state.equals("")) {
            tenderState = null;
        } else {
            tenderState = TenderState.valueOf(state);
        }

        return repository.getByFilters(number, tenderState, memberName);
    }
}