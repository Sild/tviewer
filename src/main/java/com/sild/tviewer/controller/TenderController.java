package com.sild.tviewer.controller;

import com.sild.tviewer.model.Company;
import com.sild.tviewer.model.Platform;
import com.sild.tviewer.model.Tender;
import com.sild.tviewer.service.CompanyService;
import com.sild.tviewer.service.PlatformService;
import com.sild.tviewer.service.TenderService;
import com.sild.tviewer.service.impl.CompanyServiceImpl;
import com.sild.tviewer.service.impl.PlatformServiceImpl;
import com.sild.tviewer.service.impl.TenderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/tender")
public class TenderController {

    @Autowired
    private TenderService tenderService;

    @Autowired
    private CompanyService companyService;

    @Autowired
    private PlatformService platformService;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@ModelAttribute Tender entity) {

//        Company company = companyService.get(owner);
//        entity.setOwner(company);
        System.out.println(entity.toString());
        tenderService.add(entity);
        return "redirect:/tender";
    }

    @RequestMapping(value = "")
    public ModelAndView list(Model model) {
        model.addAttribute("tender", new Tender());
        ModelAndView modelAndView = new ModelAndView("tender");
        List<Tender> tenderList = tenderService.getAll();

        List<Company> companyList = companyService.getAll();
        List<Platform> platformList = platformService.getAll();
        String[] tenderStates = {"open", "canceled", "closed"};


        modelAndView.addObject("tenderList", tenderList);
        modelAndView.addObject("companyList", companyList);
        modelAndView.addObject("platformList", platformList);
        modelAndView.addObject("tenderStates", tenderStates);
        return modelAndView;
    }


    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String edit(@ModelAttribute Tender entity) throws IllegalArgumentException {
        Tender oldEntity = tenderService.get(entity.getId());
        if (null == oldEntity) {
            throw new IllegalArgumentException("Platform with id = " + entity.getId() + " does not exist. Nothing to edit.");
        }
        tenderService.update(entity);
        return "redirect:/tender";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String deleteTeam(@PathVariable Integer id) {
        tenderService.delete(id);
        return "redirect:/tender";
    }

}
