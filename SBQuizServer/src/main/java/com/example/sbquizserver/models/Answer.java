package com.example.sbquizserver.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import org.apache.commons.lang3.builder.EqualsBuilder;

@Entity
@Table(name = "answer")
public class Answer {

    @Id
    private Integer _id;
    private Integer questionId;
    private String AnswerText;
    private boolean Correct;

    public Integer get_id() {return _id;}
    public Integer getQuestionId() {return questionId;}
    public String getAnswerText() {return AnswerText;}
    public boolean isCorrect() {return Correct;}

    @Override
    public boolean equals(Object obj){

        if (obj == null) { return false; }
        if (obj == this) { return true; }
        if (obj.getClass() != getClass()) {return false;}

        Answer rhs = (Answer) obj;
        return new EqualsBuilder()
                .append(_id, rhs.get_id())
                .append(questionId, rhs.getQuestionId())
                .append(AnswerText, rhs.getAnswerText())
                .append(Correct, this.isCorrect())
                .isEquals();
    }

}
