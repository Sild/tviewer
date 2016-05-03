package com.sild.tviewer.repository;

import java.util.List;

public interface CRUDRepository<T> {

    public void add(T element);

    public void update(T element);

    public T get(Class clazz, int id);

    public void delete(Class clazz, int id);

    public List<T> getAll(Class clazz);

}
