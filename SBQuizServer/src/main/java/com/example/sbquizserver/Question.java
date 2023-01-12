package com.example.sbquizserver;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table( name = "question")
public class Question {

@Id
    private Integer _id;

    private Integer QuizId;

    private String Question_text;

    public Integer get_id(){return this._id;}

}
