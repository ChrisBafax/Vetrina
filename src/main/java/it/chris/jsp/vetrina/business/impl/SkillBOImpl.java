package it.chris.jsp.vetrina.business.impl;

import it.chris.jsp.vetrina.business.interfaces.SkillBO;
import it.chris.jsp.vetrina.model.Categoria;
import it.chris.jsp.vetrina.model.Skill;
import it.chris.jsp.vetrina.repository.SkillRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SkillBOImpl implements SkillBO {

    @Autowired
    SkillRepository skillRepository;

    @Override
    public List<Skill> getAllSkill() throws DataAccessException {
        return skillRepository.findAllByOrderByCategoria();
    }

    @Override
    public Skill getSkillByID(long id) throws DataAccessException {
        return skillRepository.findById(id).orElseThrow(
                () -> new RuntimeException("ID."));
    }

    @Override
    public void addSkill(Skill skill) throws DataAccessException {
        skillRepository.save(skill);
    }

    @Override
    public void deteleSkill(long id) throws DataAccessException {
        skillRepository.deleteById(id);
    }

    @Override
    public void updateSkill(long id, String nome, String descrizione, Categoria categoria) throws DataAccessException {
        Skill skill = getSkillByID(id);

        if (!nome.isEmpty()) {
            skill.setNome(nome);
        }
        // Check if the description has been updated or not
        if (!descrizione.isEmpty()) {
            skill.setDescrizione(descrizione);
        }

        skill.setCategoria(categoria);
        skillRepository.save(skill);
    }
}
