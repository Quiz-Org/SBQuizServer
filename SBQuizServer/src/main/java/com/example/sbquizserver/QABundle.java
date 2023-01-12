package com.example.sbquizserver;


import org.aspectj.weaver.patterns.TypePatternQuestions;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class QABundle {
    @Autowired
    AnswerRepository answerRepository;
    private Question question;
    private List<Answer> answers;

    public QABundle(Question question){

        this.question = question;

        this.answers = answerRepository.findByQuestionId(question.get_id());

    }


}
