package com.sild.tviewer.controller;

import com.sild.tviewer.model.*;
import com.sild.tviewer.service.CompanyService;
import com.sild.tviewer.service.PlatformService;
import com.sild.tviewer.service.TenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/tender")
public class TenderController {

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
        tenderService.createOrUpdate(tender);
        return "redirect:" + referer;
    }

    @RequestMapping(value = "")
    public ModelAndView list(Model model) {

        return filterList(model, "");
    }

    @RequestMapping(value = "/filter", method = RequestMethod.GET)
    public ModelAndView filterList(Model model, @RequestParam(value = "number") String numberFilter) {
        model.addAttribute("tender", new Tender());
        ModelAndView modelAndView = new ModelAndView("tender");
        List<Tender> tenderList = tenderService.getByNumber(numberFilter);
        List<Company> companyList = companyService.getAll();
        List<Platform> platformList = platformService.getAll();

        modelAndView.addObject("tenderList", tenderList);
        modelAndView.addObject("companyList", companyList);
        modelAndView.addObject("platformList", platformList);
        modelAndView.addObject("TenderState", TenderState.values());
        modelAndView.addObject("numberFilter", numberFilter);
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
        ModelAndView modelAndView = new ModelAndView("tender_detail");
        Tender tender = tenderService.get(id);
        List<Company> companyList = companyService.getAll();

        modelAndView.addObject("tender", tender);
        modelAndView.addObject("companyList", companyList);
        return modelAndView;
    }


}
