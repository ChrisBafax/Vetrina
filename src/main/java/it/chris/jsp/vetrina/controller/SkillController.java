package it.chris.jsp.vetrina.controller;

import it.chris.jsp.vetrina.business.interfaces.CategoriaBO;
import it.chris.jsp.vetrina.business.interfaces.SkillBO;
import it.chris.jsp.vetrina.model.Categoria;
import it.chris.jsp.vetrina.model.Skill;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class SkillController {

    @Autowired
    SkillBO skillBO;

    @Autowired
    CategoriaBO categoriaBO;

    @GetMapping(path = {"/skill", "skills"})
    public ModelAndView home() {
        List<Skill> skills = skillBO.getAllSkill();
        return new ModelAndView("/jsp/skill.jsp", "Skills", skills);
    }

    @GetMapping(path = {"/skill/view"})
    public ModelAndView viewSkill() {
        List<Skill> skills = skillBO.getAllSkill();
        return new ModelAndView("/jsp/viewSkill.jsp", "Skills", skills);
    }

    @PostMapping(path = {"/skill/view"})
    public ModelAndView viewSkill2() {
        List<Skill> skills = skillBO.getAllSkill();
        return new ModelAndView("/jsp/viewSkill.jsp", "Skills", skills);
    }

    @GetMapping("/skill/create")
    public ModelAndView createSkillPage() {
        List<Categoria> categorie = categoriaBO.getAllCategoria();
        return new ModelAndView("/jsp/createSkill.jsp", "Categorie", categorie);
    }

    @PostMapping("/skill/create")
    public ModelAndView createSkill(@RequestParam String nome, @RequestParam String descrizione, @RequestParam String idCat) {
        Categoria categoria = categoriaBO.getCategoriaByNome(idCat);

        Skill skill = new Skill();
        skill.setNome(nome);
        skill.setDescrizione(descrizione);
        skill.setCategoria(categoria);
        skillBO.addSkill(skill);
        return new ModelAndView("/jsp/createProject.jsp", "operation", true);
    }

    @PostMapping("/skill/delete")
    public ModelAndView deleteSkill(@RequestParam String id) {
        if (!id.isEmpty()) {
            try {
                long idL = Long.parseLong(id);
                skillBO.deteleSkill(idL);
                return new ModelAndView("/skill/view", "delete", true);
            } catch (DataAccessException e) {
                return new ModelAndView("/skill/view", "delete", false);
            }
        } else {
            return new ModelAndView("/skill/view", "delete", false);
        }
    }

    @PostMapping("/skill/update/page")
    public ModelAndView updateSkillPage(@RequestParam long id) {
        ModelAndView modelAndView = new ModelAndView("/jsp/updateSkill.jsp", "id", id);
        List<Categoria> categorie = categoriaBO.getAllCategoria();
        modelAndView.addObject("Categorie", categorie);
        Skill skill = skillBO.getSkillByID(id);
        modelAndView.addObject("Skill", skill);
        Categoria categoriaSkill = skill.getCategoria();
        modelAndView.addObject("Categoria", categoriaSkill);
        return modelAndView;
    }

    @PostMapping("/skill/update")
    public ModelAndView updateSkill(@RequestParam String id, @RequestParam String nome, @RequestParam String descrizione, @RequestParam String idCat) {
        long idL = Long.parseLong(id);
        Categoria categoria = categoriaBO.getCategoriaByNome(idCat);
        skillBO.updateSkill(idL, nome, descrizione, categoria);
        return new ModelAndView("/skill/view", "id", idL);
    }
}