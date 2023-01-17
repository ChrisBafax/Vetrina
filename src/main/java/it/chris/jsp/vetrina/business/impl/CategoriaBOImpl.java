package it.chris.jsp.vetrina.business.impl;

import it.chris.jsp.vetrina.business.interfaces.CategoriaBO;
import it.chris.jsp.vetrina.model.Categoria;
import it.chris.jsp.vetrina.repository.CategoriaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoriaBOImpl implements CategoriaBO {

    @Autowired
    CategoriaRepository categoriaRepository;

    @Override
    public List<Categoria> getAllCategoria() throws DataAccessException {
        return categoriaRepository.findAll();
    }

    @Override
    public Categoria getCategoriaByID(long id) throws DataAccessException {
        return categoriaRepository.findById(id).orElseThrow(
                () -> new RuntimeException("ID."));
    }

    @Override
    public Categoria getCategoriaByNome(String nome) throws DataAccessException {
        return categoriaRepository.findByNome(nome);
    }

    @Override
    public void addCategoria(Categoria categoria) throws DataAccessException {
        categoriaRepository.save(categoria);
    }

    @Override
    public void deteleCategoria(long id) throws DataAccessException {
        categoriaRepository.deleteById(id);
    }

    @Override
    public void updateCategoria(long id, String nome, String descrizione) throws DataAccessException {
        Categoria categoria = getCategoriaByID(id);

        if (!nome.isEmpty()) {
            categoria.setNome(nome);
        }
        // Check if the description has been updated or not
        if (!descrizione.isEmpty()) {
            categoria.setDescrizione(descrizione);
        }
        categoriaRepository.save(categoria);
    }
}
