package com.sild.tviewer.service;

import java.util.List;

/**
 * @author Dmitry Korchagin.
 */
public interface CRUDService<T> {
    public void add(T element);

    public void update(T element);

    public T get(int id);

    public void delete(int id);

    public List<T> getAll();
}
