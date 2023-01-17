package it.chris.jsp.vetrina.repository;

import it.chris.jsp.vetrina.model.Skill;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SkillRepository extends JpaRepository<Skill, Long> {

    List<Skill> findAllByOrderByCategoria();

}
