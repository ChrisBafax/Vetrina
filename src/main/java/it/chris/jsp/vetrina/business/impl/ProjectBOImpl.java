package it.chris.jsp.vetrina.business.impl;

import it.chris.jsp.vetrina.business.interfaces.ProjectBO;
import it.chris.jsp.vetrina.model.Project;
import it.chris.jsp.vetrina.repository.ProjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectBOImpl implements ProjectBO {

    @Autowired
    ProjectRepository projectRepository;

    @Override
    public List<Project> getAllProject() throws DataAccessException {
        return projectRepository.findAll();
    }

    @Override
    public Project getProjectByID(long id) throws DataAccessException {
        return projectRepository.findById(id).orElseThrow(
                () -> new RuntimeException("ID."));
    }

    @Override
    public void addProject(Project project) throws DataAccessException {
        projectRepository.save(project);
    }

    @Override
    public void deteleProject(long id) throws DataAccessException {
        projectRepository.deleteById(id);
    }

    @Override
    public void updateProject(long id, String nome, String descrizione, String link) throws DataAccessException {
        Project project = getProjectByID(id);

        if (!nome.isEmpty()) {
            project.setNome(nome);
        }
        if (!descrizione.isEmpty()) {
            project.setDescrizione(descrizione);
        }
        if (!link.isEmpty()) {
            project.setDescrizione(link);
        }
        projectRepository.save(project);
    }
}
