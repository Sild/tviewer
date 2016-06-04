package com.sild.tviewer.service.impl;

import com.sild.tviewer.model.Tender;
import com.sild.tviewer.model.TenderState;
import com.sild.tviewer.model.filter.TenderFilter;
import com.sild.tviewer.repository.TenderRepository;
import com.sild.tviewer.service.TenderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.invoke.MethodHandles;
import java.util.List;
import java.util.Set;

@Service
public class TenderServiceImpl implements TenderService {
    private static final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());


    @Autowired
    private TenderRepository repository;

    public void createOrUpdate(Tender element) {
        logger.debug("createOrUpdate tender: {}", element);
        if (null == element.getId() || element.getId().equals("")) {
            logger.debug("create new tender");
            repository.add(element);
        } else {
            logger.info("update existing tender");
            repository.update(element);
        }
    }

    public Tender get(int id) {
        return repository.get(id);
    }

    public List<Tender> get(TenderFilter filter) {
        return repository.get(filter);
    }

    public void delete(int id) {
        repository.delete(id);
    }

    public List<Tender> getAll() {
        return repository.getAll();
    }

}