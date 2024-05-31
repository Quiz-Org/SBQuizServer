package com.example.sbquizserver;

import com.example.sbquizserver.models.Question;
import com.example.sbquizserver.models.Quiz;
import com.example.sbquizserver.repos.AnswerRepository;
import com.example.sbquizserver.repos.QuestionRepository;
import com.example.sbquizserver.repos.QuizRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class QuizService {

    private final QuestionRepository questionRepository;
    private final AnswerRepository answerRepository;
    private final QuizRepository quizRepository;

    @Autowired
    public QuizService(QuizRepository quizRepository, QuestionRepository questionRepository, AnswerRepository answerRepository, QuizRepository quizRepository1) {
        this.questionRepository = questionRepository;
        this.answerRepository = answerRepository;
        this.quizRepository = quizRepository1;
    }

    public ArrayList<QABundle> getQuizData(Integer quizId){

        ArrayList<QABundle> quiz = new ArrayList<>();
        ArrayList<Question> questions = new ArrayList<>(questionRepository.findAllByQuizIdEquals(quizId));

        for(Question question : questions){quiz.add(new QABundle(question,answerRepository));}

        return quiz;
    }

    public Iterable<Quiz> findAll(){return quizRepository.findAll();}

}
