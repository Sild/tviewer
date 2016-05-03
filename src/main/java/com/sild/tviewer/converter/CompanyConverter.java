package com.sild.tviewer.converter;

import com.sild.tviewer.model.Company;
import com.sild.tviewer.service.impl.CompanyServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

/**
 * @author Dmitry Korchagin.
 */
@Component
public class CompanyConverter implements Converter<String, Company> {

    @Autowired
    private CompanyServiceImpl companyService;

    public Company convert(String id) {
        return companyService.get(Integer.parseInt(id));
//        return companyService.get(Integer.parseInt((String)id));
    }
}
