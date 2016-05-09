package com.sild.tviewer.controller;

import com.sild.tviewer.model.Member;
import com.sild.tviewer.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @InitBinder
    public void DateBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@ModelAttribute Member entity) {
        memberService.add(entity);
        return "redirect:/tender/" + entity.getTender().getId() + "/detail";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String edit(@ModelAttribute Member entity) {
        Member oldEntity = memberService.get(entity.getId());
        if (null == oldEntity) {
            throw new IllegalArgumentException("Member with id = " + entity.getId() + " does not exist. Nothing to edit.");
        }
        memberService.update(entity);
        return "redirect:/tender/" + entity.getTender().getId() + "/detail";
    }

    @RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
    public String delete(@PathVariable Integer id) {
        Member memberToDelete = memberService.get(id);
        if (null == memberToDelete) {
            throw new IllegalArgumentException("Member with id = " + id + " does not exist. Nothing to delete.");
        }
        Integer tenderId = memberToDelete.getTender().getId();
        memberService.delete(id);
        return "redirect:/tender/" + tenderId + "/detail";
    }

}
