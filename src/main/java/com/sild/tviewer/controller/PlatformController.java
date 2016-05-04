package com.sild.tviewer.controller;

import com.sild.tviewer.model.Platform;
import com.sild.tviewer.service.impl.PlatformServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/platform")
public class PlatformController {

    @Autowired
    private PlatformServiceImpl platformService;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@ModelAttribute Platform entity) {
        platformService.add(entity);
        return "redirect:/platform";
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




    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String edit(@ModelAttribute Platform entity) throws IllegalArgumentException {
        Platform oldEntity = platformService.get(entity.getId());
        if (null == oldEntity) {
            throw new IllegalArgumentException("Platform with id = " + entity.getId() + " does not exist. Nothing to edit.");
        }
        platformService.update(entity);
        return "redirect:/platform";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String deleteTeam(@PathVariable Integer id) {
        platformService.delete(id);
        return "redirect:/platform";
    }

}
