package com.example.sbquizserver.models;

import jakarta.persistence.*;

import org.apache.commons.lang3.builder.EqualsBuilder;

import java.util.ArrayList;

@Entity
@Table(name = "answer")
public class Answer {

    @Id
    private Integer _id;
    private String AnswerText;
    private boolean Correct;
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "question_id")
    private Question question;

    public Answer() {}

    public Answer(Integer _id, Integer questionId, String AnswerText, boolean Correct) {
        this._id = _id;
        this.AnswerText = AnswerText;
        this.Correct = Correct;
    }

    public Integer get_id() {return _id;}
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
                .append(AnswerText, rhs.getAnswerText())
                .append(Correct, this.isCorrect())
                .isEquals();
    }

}
