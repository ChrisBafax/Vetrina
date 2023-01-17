package it.chris.jsp.vetrina.controller;

import it.chris.jsp.vetrina.business.interfaces.ProjectBO;
import it.chris.jsp.vetrina.model.Project;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    @GetMapping(path = {"/project/view"})
    public ModelAndView viewProject() {
        List<Project> projects = projectBO.getAllProject();
        return new ModelAndView("/jsp/viewProject.jsp", "Projects", projects);
    }

    @PostMapping(path = {"/project/view"})
    public ModelAndView viewProject2() {
        List<Project> projects = projectBO.getAllProject();
        return new ModelAndView("/jsp/viewProject.jsp", "Projects", projects);
    }

    @GetMapping("/project/create")
    public ModelAndView createProjectPage() {
        return new ModelAndView("/jsp/createProject.jsp");
    }

    @PostMapping("/project/create")
    public ModelAndView createProject(@RequestParam String nome, @RequestParam String descrizione, @RequestParam String link) {
        Project project = new Project();
        project.setNome(nome);
        project.setDescrizione(descrizione);
        project.setLink(link);
        projectBO.addProject(project);
        return new ModelAndView("/jsp/createProject.jsp", "operation", true);
    }

    @PostMapping("/project/delete")
    public ModelAndView deleteProject(@RequestParam String id) {
        if (!id.isEmpty()) {
            try {
                long idL = Long.parseLong(id);
                projectBO.deteleProject(idL);
                return new ModelAndView("/project/view", "delete", true);
            } catch (DataAccessException e) {
                return new ModelAndView("/project/view", "delete", false);
            }
        } else {
            return new ModelAndView("/project/view", "delete", false);
        }
    }

    @PostMapping("/project/update/page")
    public ModelAndView updateProjectPage(@RequestParam long id) {
        return new ModelAndView("/jsp/updateProject.jsp", "id", id);
    }

    @PostMapping("/project/update")
    public ModelAndView updateProject(@RequestParam String id, @RequestParam String nome, @RequestParam String descrizione, @RequestParam String link) {
        long idL = Long.parseLong(id);
        projectBO.updateProject(idL, nome, descrizione, link);
        return new ModelAndView("/project/view", "id", idL);
    }

}
