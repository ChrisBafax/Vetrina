package it.chris.jsp.vetrina.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.LinkedList;
import java.util.List;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "categoria")
public class Categoria extends BaseEntity {

    @OneToMany(cascade = {
            CascadeType.MERGE,
            CascadeType.REFRESH,
            CascadeType.DETACH,
            CascadeType.PERSIST
    }, fetch = FetchType.LAZY)
    @JsonIgnore
    private List<Skill> skills = new LinkedList<>();
}
