package com.sild.tviewer.converter;

import com.sild.tviewer.model.Tender;
import com.sild.tviewer.service.impl.TenderServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import java.lang.invoke.MethodHandles;

/**
 * @author Dmitry Korchagin.
 */
@Component
public class TenderConverter implements Converter<String, Tender> {
    private static final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    @Autowired
    private TenderServiceImpl tenderService;

    public Tender convert(String id) {
        Tender tender = tenderService.get(Integer.parseInt(id));
        logger.debug("Convert id = {} => tender = {}", id, tender.toString());
        return tender;
    }
}
