package com.sild.tviewer.converter;

import com.sild.tviewer.model.Company;
import com.sild.tviewer.service.impl.CompanyServiceImpl;
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
public class CompanyConverter implements Converter<String, Company> {
    private static final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    @Autowired
    private CompanyServiceImpl companyService;

    public Company convert(String id) {
        Company company = companyService.get(Integer.parseInt(id));
        logger.debug("Convert id = {} => company = {}", id, company.toString());

        return company;
    }
}
