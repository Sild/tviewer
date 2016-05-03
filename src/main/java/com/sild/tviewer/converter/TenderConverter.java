package com.sild.tviewer.converter;

import com.sild.tviewer.model.Tender;
import com.sild.tviewer.service.impl.TenderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

/**
 * @author Dmitry Korchagin.
 */
@Component
public class TenderConverter implements Converter<String, Tender> {

    @Autowired
    private TenderServiceImpl tenderService;

    public Tender convert(String id) {
        return tenderService.get(Integer.parseInt(id));
    }
}
