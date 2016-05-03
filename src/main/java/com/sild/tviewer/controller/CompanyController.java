package com.sild.tviewer.controller;

import com.sild.tviewer.model.Company;
import com.sild.tviewer.service.impl.CompanyServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/company")
public class CompanyController {

    @Autowired
    private CompanyServiceImpl companyService;



    @RequestMapping(value = "")
    public ModelAndView list(Model model) {
        model.addAttribute("company", new Company());
        ModelAndView modelAndView = new ModelAndView("company");
        List<Company> companyList = companyService.getAll();
        modelAndView.addObject("companyList", companyList);
        return modelAndView;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@ModelAttribute Company company) {
        companyService.add(company);
        return "redirect:/company";
    }


    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String edit(@ModelAttribute Company company) throws IllegalArgumentException {
        Company oldCompany = companyService.get(company.getId());
        if (null == oldCompany) {
            throw new IllegalArgumentException("Company with id = " + company.getId() + " does not exist. Nothing to edit.");
        }
        companyService.update(company);
        return "redirect:/company";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String deleteTeam(@PathVariable Integer id) {
        companyService.delete(id);
        return "redirect:/company";
    }

}
