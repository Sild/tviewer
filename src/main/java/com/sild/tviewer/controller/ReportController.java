package com.sild.tviewer.controller;

import com.sild.tviewer.Util;
import com.sild.tviewer.model.Company;
import com.sild.tviewer.model.Member;
import com.sild.tviewer.service.impl.CompanyServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.lang.invoke.MethodHandles;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/report")
public class ReportController {
    private static final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());


    @Autowired
    private CompanyServiceImpl companyService;


    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ModelAndView detail(@PathVariable Integer id,
                               @RequestParam(required = true, value = "startDate") Date startDate,
                               @RequestParam(required = true, value = "endDate") Date endDate,
                               @RequestParam(required = true, value = "format") String format) {


        ModelAndView modelAndView = new ModelAndView("module/company_detail");
        Company company = companyService.get(id);
        int winCount = 0;
        for (Member member : company.getMemberSet()) {
            if (member.getWinner()) {
                winCount++;
            }
        }
        modelAndView.addObject("company", company);
        modelAndView.addObject("winCount", winCount);
        modelAndView.addObject("looseCount", company.getMemberSet().size() - winCount);
        modelAndView.addObject("totalCount", company.
                getMemberSet().size());
        if (company.getMemberSet().size() != 0) {
            modelAndView.addObject("winRate", winCount / company.getMemberSet().size() * 100);
        }
        return modelAndView;
    }

}
