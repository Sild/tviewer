package com.sild.tviewer.service;

import com.sild.tviewer.model.Platform;

import java.util.List;

/**
 * @author Dmitry Korchagin.
 */
public interface PlatformService {

    public void createOrUpdate(Platform element);

    public Platform get(int id);

    public void delete(int id);

    public List<Platform> getAll();



}
