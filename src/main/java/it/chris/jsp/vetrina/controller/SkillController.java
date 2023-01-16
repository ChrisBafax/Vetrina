package it.chris.jsp.vetrina.controller;

import it.chris.jsp.vetrina.business.interfaces.SkillBO;
import it.chris.jsp.vetrina.model.Skill;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class SkillController {

    @Autowired
    SkillBO skillBO;

    @GetMapping(path = {"/skill", "skills"})
    public ModelAndView home() {
        List<Skill> skills = skillBO.getAllSkill();
        ModelAndView obj = new ModelAndView("/jsp/skill.jsp", "Skills", skills);
        return obj;
    }
}
