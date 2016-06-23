package com.sild.tviewer.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.lang.invoke.MethodHandles;

@Controller
public class RootController {
    private static final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView showIndex() {
        logger.debug("root request");
        return new ModelAndView("module/root");
    }

}
