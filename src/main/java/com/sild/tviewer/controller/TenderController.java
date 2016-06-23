package com.sild.tviewer.controller;

import com.sild.tviewer.Util;
import com.sild.tviewer.model.*;
import com.sild.tviewer.model.filter.TenderFilter;
import com.sild.tviewer.service.CompanyService;
import com.sild.tviewer.service.PlatformService;
import com.sild.tviewer.service.TenderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.lang.invoke.MethodHandles;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/tender")
public class TenderController {
    private static final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());


    @Autowired
    private TenderService tenderService;

    @Autowired
    private CompanyService companyService;

    @Autowired
    private PlatformService platformService;

    @InitBinder
    public void DateBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }


    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String add(@RequestHeader(value = "referer", required = false) final String referer,
                      @ModelAttribute Tender tender) {
        logger.debug("create or update service call");
        tenderService.createOrUpdate(tender);
        return "redirect:" + referer;
    }

    @RequestMapping(value = "")
    public ModelAndView list(
            Model model,
            @RequestParam(required = false, value = "page") Integer page
    ) {
        return filterList(model, new TenderFilter(), page);
    }

    @RequestMapping(value = "/filter", method = RequestMethod.GET)
    public ModelAndView filterList(
            Model model,
            @ModelAttribute TenderFilter tenderFilter,
            @RequestParam(required = false, value = "page") Integer page
    ) {
        logger.info("apply filter: {}", tenderFilter);
        model.addAttribute("tender", new Tender());
        model.addAttribute("company", new Company());
        model.addAttribute("tender_filter", new TenderFilter());
        ModelAndView modelAndView = new ModelAndView("module/tender");
        Util.addPaginator(modelAndView, tenderService.get(tenderFilter), "tenderList", page);
        modelAndView.addObject("companyList", companyService.getAll());
        modelAndView.addObject("platformList", platformService.getAll());
        modelAndView.addObject("TenderState", Tender.TenderState.values());
        modelAndView.addObject("CurrencyType", Tender.CurrencyType.values());
        modelAndView.addObject("TenderFilter", tenderFilter);
        return modelAndView;

    }


    @RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
    public String deleteTeam(@PathVariable Integer id) {
        tenderService.delete(id);
        return "redirect:/tender";
    }

    @RequestMapping(value = "/{id}/detail", method = RequestMethod.GET)
    public ModelAndView tenderDetail(Model model, @PathVariable Integer id) {
        model.addAttribute("member", new Member());
        model.addAttribute("company", new Company());
        ModelAndView modelAndView = new ModelAndView("module/tender_detail");
        Tender tender = tenderService.get(id);
        List<Company> companyList = companyService.getAll();

        modelAndView.addObject("tender", tender);
        modelAndView.addObject("companyList", companyList);
        return modelAndView;
    }


}
