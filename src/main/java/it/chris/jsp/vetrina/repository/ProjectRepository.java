package it.chris.jsp.vetrina.repository;

import it.chris.jsp.vetrina.model.Project;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProjectRepository extends JpaRepository<Project, Long> {

}
