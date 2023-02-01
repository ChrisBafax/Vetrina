package it.chris.jsp.vetrina.controller;

import it.chris.jsp.vetrina.business.interfaces.CategoriaBO;
import it.chris.jsp.vetrina.model.Categoria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class CategoriaController {

    @Autowired
    CategoriaBO categoriaBO;

    @GetMapping("/categoria/view")
    public ModelAndView viewCategoria() {
        List<Categoria> categorie = categoriaBO.getAllCategoria();
        return new ModelAndView("/jsp/viewCategoria.jsp", "Categorie", categorie);
    }

    @PostMapping("/categoria/view")
    public ModelAndView viewCategoria2() {
        List<Categoria> categorie = categoriaBO.getAllCategoria();
        return new ModelAndView("/jsp/viewCategoria.jsp", "Categorie", categorie);
    }


    @GetMapping("/categoria/create")
    public ModelAndView createCategoriaPage() {
        return new ModelAndView("/jsp/createCategoria.jsp");
    }

    @PostMapping("/categoria/create")
    public ModelAndView createCategoria(@RequestParam String nome, @RequestParam String descrizione) {
        Categoria categoria = new Categoria();
        categoria.setNome(nome);
        categoria.setDescrizione(descrizione);
        categoriaBO.addCategoria(categoria);
        return new ModelAndView("/jsp/createCategoria.jsp", "operation", true);
    }

    @PostMapping("/categoria/delete")
    public ModelAndView deleteCategoria(@RequestParam String id) {
        if (!id.isEmpty()) {
            try {
                long idL = Long.parseLong(id);
                categoriaBO.deteleCategoria(idL);
                return new ModelAndView("/categoria/view", "delete", true);
            } catch (DataAccessException e) {
                return new ModelAndView("/categoria/view", "delete", false);
            }
        } else {
            return new ModelAndView("/categoria/view", "delete", false);
        }
    }

    @PostMapping("/categoria/update/page")
    public ModelAndView updateCategoriaPage(@RequestParam long id) {
        ModelAndView modelAndView = new ModelAndView("/jsp/updateCategoria.jsp", "id", id);
        Categoria categoria = categoriaBO.getCategoriaByID(id);
        modelAndView.addObject("Categoria", categoria);
        return modelAndView;
    }

    @PostMapping("/categoria/update")
    public ModelAndView updateCategoria(@RequestParam String id, @RequestParam String nome, @RequestParam String descrizione) {
        long idL = Long.parseLong(id);
        categoriaBO.updateCategoria(idL, nome, descrizione);
        return new ModelAndView("/categoria/view", "id", idL);
    }
}