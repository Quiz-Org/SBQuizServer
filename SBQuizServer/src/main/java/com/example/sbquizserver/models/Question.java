package com.example.sbquizserver.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import org.apache.commons.lang3.builder.EqualsBuilder;

@Entity
@Table( name = "question")
public class Question {

@Id
    private Integer _id;

    private Integer quizId;

    private String questionText;

    public Integer get_id(){return this._id;}
    public Integer getQuizId(){return this.quizId;}
    public String getQuestionText() {return questionText;}

    @Override
    public boolean equals(Object obj) {

        if (obj == null) {return false;}
        if (obj == this) {return true;}
        if (obj.getClass() != getClass()) {return false;}

        Question rhs = (Question) obj;

        return new EqualsBuilder()
                .append(_id,rhs.get_id())
                .append(quizId, rhs.getQuizId())
                .append(questionText, rhs.getQuestionText())
                .isEquals();
    }
}
