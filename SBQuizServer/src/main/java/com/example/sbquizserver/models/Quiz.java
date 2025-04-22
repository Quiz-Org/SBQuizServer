package com.example.sbquizserver.models;

import jakarta.persistence.*;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.hibernate.annotations.Type;

@Entity
@Table( name = "quiz" )
public class Quiz {

    @Id
    private Integer _id;
    private String Name;
    private String Description;
    @Enumerated(EnumType.STRING)
    private QuizCategories category;

    public Quiz() {}

    public Quiz(Integer _id, String Name, String Description, QuizCategories category) {
        this._id = _id;
        this.Name = Name;
        this.Description = Description;
        this.category = category;
    }

    public Integer get_id() {return _id;}
    public String getName() {return Name;}
    public String getDescription() {return Description;}
    public QuizCategories getCategory() {return category;}

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
                .append(category, rhs.getCategory())
                .isEquals();
    }

}