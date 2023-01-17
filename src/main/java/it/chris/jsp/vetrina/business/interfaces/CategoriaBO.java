package it.chris.jsp.vetrina.business.interfaces;

import it.chris.jsp.vetrina.model.Categoria;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface CategoriaBO {

    List<Categoria> getAllCategoria() throws DataAccessException;

    Categoria getCategoriaByID(long id) throws DataAccessException;

    Categoria getCategoriaByNome(String nome) throws DataAccessException;

    void addCategoria(Categoria categoria) throws DataAccessException;

    void deteleCategoria(long id) throws DataAccessException;

    void updateCategoria(long id, String nome, String descrizione) throws DataAccessException;
}
