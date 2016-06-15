package com.sild.tviewer.controller;

import com.sild.tviewer.Util;
import com.sild.tviewer.model.Company;
import com.sild.tviewer.service.impl.CompanyServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.lang.invoke.MethodHandles;
import java.util.List;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {
    private static final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());


    @Autowired
    private CompanyServiceImpl companyService;

    @RequestMapping(value = "")
    public ModelAndView list(Model model, @RequestParam(required = false, value = "name") Integer page) {
        return filterList(model, "", page);
    }

    @RequestMapping(value = "/filter", method = RequestMethod.GET)
    public ModelAndView filterList(
            Model model,
            @RequestParam(value = "name") String nameFilter,
            @RequestParam(required = false, value = "name") Integer page
    ) {
        model.addAttribute("company", new Company());
        ModelAndView modelAndView = new ModelAndView("company");
        List<Company> companyList = companyService.getCustomersByName(nameFilter);
        Util.addPaginator(modelAndView, companyList, "companyList", page);
        modelAndView.addObject("module", "customer");
        modelAndView.addObject("nameFilter", nameFilter);
        return modelAndView;

    }


}
