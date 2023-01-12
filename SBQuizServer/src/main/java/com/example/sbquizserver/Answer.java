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
    private String Answer_text;
    private boolean Correct;

}
