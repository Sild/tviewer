package com.sild.tviewer.controller;

import com.sild.tviewer.model.Company;
import com.sild.tviewer.model.Member;
import com.sild.tviewer.service.impl.CompanyServiceImpl;
import javafx.util.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping(value = "/company")
public class CompanyController {

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
        List<Company> companyList = companyService.getByName(nameFilter);
        modelAndView.addObject("companyList", companyList);
        modelAndView.addObject("module", "company");
        modelAndView.addObject("nameFilter", nameFilter);
        return modelAndView;

    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestHeader(value = "referer", required = false) final String referer,
                         @ModelAttribute Company company) {
        companyService.createOrUpdate(company);
        return "redirect:" + referer;
    }

    @RequestMapping(value = "/update/ajax", method = RequestMethod.POST)
    public
    @ResponseBody
    List<Pair<Integer, String>> updateAjax(@ModelAttribute Company company) {
        companyService.createOrUpdate(company);
        List<Pair<Integer, String>> response = companyService.getAll().stream().map(cmp -> new Pair(cmp.getId(), cmp.getName())).collect(Collectors.toList());
        return response;
    }


    @RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
    public String deleteTeam(@PathVariable Integer id) {
        companyService.delete(id);
        return "redirect:/company";
    }

    @RequestMapping(value = "/{id}/detail", method = RequestMethod.GET)
    public ModelAndView detail(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView("company_detail");
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
