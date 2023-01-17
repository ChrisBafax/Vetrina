package it.chris.jsp.vetrina.business.interfaces;

import it.chris.jsp.vetrina.model.Categoria;
import it.chris.jsp.vetrina.model.Skill;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface SkillBO {

    List<Skill> getAllSkill() throws DataAccessException;

    Skill getSkillByID(long id) throws DataAccessException;

    void addSkill(Skill skill) throws DataAccessException;

    void deteleSkill(long id) throws DataAccessException;

    void updateSkill(long id, String nome, String descrizione, Categoria categoria) throws DataAccessException;
}
