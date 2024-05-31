package com.example.sbquizserver.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import org.apache.commons.lang3.builder.EqualsBuilder;

@Entity
@Table( name = "quiz" )
public class Quiz {

    @Id
    private Integer _id;
    private String Name;
    private String Description;

    public Integer get_id() {return _id;}
    public String getName() {return Name;}
    public String getDescription() {return Description;}

    @Override
    public boolean equals(Object obj) {

        if (obj == null) {return false;}
        if (obj == this) {return true;}
        if (obj.getClass() != getClass()) {return false;}

        Quiz rhs = (Quiz) obj;

        return new EqualsBuilder()
                .append(_id,rhs.get_id())
                .append(Name, rhs.getName())
                .append(Description, rhs.getDescription())
                .isEquals();
    }
}