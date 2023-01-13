package com.example.sbquizserver.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

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
}
