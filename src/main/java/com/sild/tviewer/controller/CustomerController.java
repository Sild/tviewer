package com.sild.tviewer.controller;

import com.sild.tviewer.model.Company;
import com.sild.tviewer.service.impl.CompanyServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {

    @Autowired
    private CompanyServiceImpl companyService;

    @RequestMapping(value = "")
    public ModelAndView list(Model model) {
        return filterList(model, "");
    }

    @RequestMapping(value = "/filter", method = RequestMethod.GET)
    public ModelAndView filterList(Model model, @RequestParam(value = "name") String nameFilter) {
        model.addAttribute("company", new Company());
        ModelAndView modelAndView = new ModelAndView("company");
        List<Company> companyList = companyService.getCustomersByName(nameFilter);
        modelAndView.addObject("companyList", companyList);
        modelAndView.addObject("module", "customer");
        modelAndView.addObject("nameFilter", nameFilter);
        return modelAndView;

    }


}
