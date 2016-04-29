package com.sild.tviewer.controller;

import com.sild.tviewer.model.Color;
import com.sild.tviewer.service.impl.ColorServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value="/color")
public class ColorController {
	
	@Autowired
	private ColorServiceImpl colorService;
	
	@RequestMapping(value="")
	public ModelAndView listOfTeams() {
		ModelAndView modelAndView = new ModelAndView("company");
		
		List<Color> colorList = colorService.getAll();

		modelAndView.addObject("colorList", colorList);
		
		return modelAndView;
	}
	
}
