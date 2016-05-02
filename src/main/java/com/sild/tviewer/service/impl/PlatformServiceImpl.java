package com.sild.tviewer.service.impl;

import com.sild.tviewer.model.Company;
import com.sild.tviewer.model.Platform;
import com.sild.tviewer.repository.PlatformCRUDRepository;
import com.sild.tviewer.service.PlatformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class PlatformServiceImpl implements PlatformService {

    @Autowired
    private PlatformCRUDRepository repository;


    public void add(Platform element) {
        repository.add(element);
    }

    public void update(Platform element) {
        repository.update(element);
    }

    public Platform get(int id) {
        return repository.get(id);
    }

    public void delete(int id) {
        repository.delete(id);
    }

    public List<Platform> getAll() {
        return repository.getAll();
    }

}