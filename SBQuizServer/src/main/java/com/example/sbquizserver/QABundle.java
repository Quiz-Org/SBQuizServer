package com.example.sbquizserver;

import com.example.sbquizserver.models.Answer;
import com.example.sbquizserver.models.Question;
import com.example.sbquizserver.repos.AnswerRepository;

import java.util.List;

@SuppressWarnings("unused")
public class QABundle {

    private final Question question;
    private final List<Answer> answers;

    public QABundle(Question question, AnswerRepository answerRepository){

        this.question = question;
        this.answers = answerRepository.findByQuestionId(question.get_id());

    }

    public Question getQuestion() {return question;}
    public List<Answer> getAnswers() {return answers;}

}