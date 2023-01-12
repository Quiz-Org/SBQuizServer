package com.example.sbquizserver;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

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
}
