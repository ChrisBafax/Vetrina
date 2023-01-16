package it.chris.jsp.vetrina.business.interfaces;

import it.chris.jsp.vetrina.model.Project;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface ProjectBO {

    List<Project> getAllProject() throws DataAccessException;


    Project getProjectByID(long id) throws DataAccessException;

    void addProject(Project project) throws DataAccessException;

    void deteleProject(long id) throws DataAccessException;

    void updateProject(long id, String nome, String descrizione, String link) throws DataAccessException;
}
