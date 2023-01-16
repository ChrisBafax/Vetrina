package it.chris.jsp.vetrina.controller;

import it.chris.jsp.vetrina.business.interfaces.ProjectBO;
import it.chris.jsp.vetrina.model.Project;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ProjectController {

    @Autowired
    ProjectBO projectBO;

    @GetMapping(path = {"/project", "projects", "/progetti"})
    public ModelAndView home() {
        List<Project> projects = projectBO.getAllProject();
        return new ModelAndView("/jsp/project.jsp", "Projects", projects);
    }


}
