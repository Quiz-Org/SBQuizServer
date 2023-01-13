package com.example.sbquizserver;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

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
}
