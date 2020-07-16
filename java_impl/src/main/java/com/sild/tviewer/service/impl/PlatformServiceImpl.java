package com.sild.tviewer.service.impl;

import com.sild.tviewer.model.Platform;
import com.sild.tviewer.repository.CRUDRepository;
import com.sild.tviewer.service.PlatformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlatformServiceImpl implements PlatformService {

    @Autowired
    private CRUDRepository<Platform> repository;


    public void createOrUpdate(Platform element) {
        if (null == element.getId() || element.getId().equals("")) {
            repository.add(element);
        } else {
            repository.update(element);
        }
    }

    public Platform get(int id) {
        return repository.get(Platform.class, id);
    }

    public void delete(int id) {
        repository.delete(Platform.class, id);
    }

    public List<Platform> getAll() {
        return repository.getAll(Platform.class);
    }
}