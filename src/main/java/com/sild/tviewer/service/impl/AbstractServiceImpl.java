package com.sild.tviewer.service.impl;

import com.sild.tviewer.repository.CRUDRepository;
import com.sild.tviewer.service.CRUDService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

abstract public class AbstractServiceImpl<T> implements CRUDService<T> {

    @Autowired
    private CRUDRepository<T> CRUDRepository;

    public void add(T element) {
        CRUDRepository.add(element);
    }

    public void update(T element) {
        CRUDRepository.update(element);
    }

    public T get(int id) {
        return CRUDRepository.get(id);
    }

    public void delete(int id) {
        CRUDRepository.delete(id);
    }

    public List<T> getAll() {
        return CRUDRepository.getAll();
    }

}
