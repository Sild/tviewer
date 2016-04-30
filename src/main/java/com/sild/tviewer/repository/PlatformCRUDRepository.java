package com.sild.tviewer.repository;

import com.sild.tviewer.model.Platform;

import java.util.List;

public interface PlatformCRUDRepository {

    public void add(Platform element);

    public void update(Platform element);

    public Platform get(int id);

    public void delete(int id);

    public List<Platform> getAll();

}
