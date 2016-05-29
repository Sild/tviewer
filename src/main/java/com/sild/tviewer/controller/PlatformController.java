package com.sild.tviewer.controller;

import com.sild.tviewer.model.Platform;
import com.sild.tviewer.service.impl.PlatformServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.lang.invoke.MethodHandles;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/platform")
public class PlatformController {
    private static final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());


    @Autowired
    private PlatformServiceImpl platformService;

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String add(@RequestHeader(value = "referer", required = false) final String referer,
                      @ModelAttribute Platform platform) {
        platformService.createOrUpdate(platform);
        return "redirect:" + referer;
    }

    @RequestMapping(value = "")
    public ModelAndView list(Model model) {
        model.addAttribute("platform", new Platform());
        ModelAndView modelAndView = new ModelAndView("platform");
        List<Platform> entityList = platformService.getAll();
        modelAndView.addObject("platformList", entityList);
        return modelAndView;
    }

    @RequestMapping(value = "/filters/id/{id}")
    public ModelAndView single(Model model, @PathVariable Integer id) {
        model.addAttribute("platform", new Platform());
        ModelAndView modelAndView = new ModelAndView("platform");
        List<Platform> entityList = new ArrayList<>();
        entityList.add(platformService.get(id));
        modelAndView.addObject("platformList", entityList);
        return modelAndView;
    }

    @RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
    public String deleteTeam(@PathVariable Integer id) {
        platformService.delete(id);
        return "redirect:/platform";
    }

}
