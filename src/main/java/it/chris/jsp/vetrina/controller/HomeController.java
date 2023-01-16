package it.chris.jsp.vetrina.controller;

import it.chris.jsp.vetrina.business.interfaces.CategoriaBO;
import it.chris.jsp.vetrina.model.Categoria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    CategoriaBO categoriaBO;

    @GetMapping(path = {"/", "/index", "/home"})
    public ModelAndView home() {
        List<Categoria> categorie = categoriaBO.getAllCategoria();
        return new ModelAndView("/jsp/index.jsp", "Categorie", categorie);
    }
}
