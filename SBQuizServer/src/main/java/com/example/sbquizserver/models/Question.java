package com.example.sbquizserver.models;

import com.example.sbquizserver.repos.AnswerRepository;
import jakarta.persistence.*;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table( name = "question")
public class Question {

    @Id
    private Integer _id;
    private Integer quizId;
    private String questionText;
    @OneToMany(mappedBy = "question", fetch = FetchType.LAZY)
    private List<Answer> answers = new ArrayList<>();

    public Question() {}

    public Question(Integer _id, Integer quizId, String questionText, List<Answer> answers) {
        this._id = _id;
        this.quizId = quizId;
        this.questionText = questionText;
        this.answers = answers;
    }

    public Integer get_id(){return this._id;}
    public Integer getQuizId(){return this.quizId;}
    public String getQuestionText() {return questionText;}
    public List<Answer> getAnswers(){return answers;}

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
