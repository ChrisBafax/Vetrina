package it.chris.jsp.vetrina.repository;

import it.chris.jsp.vetrina.model.Categoria;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoriaRepository extends JpaRepository<Categoria, Long> {

}
