package com.example.sbquizserver;

import com.example.sbquizserver.models.Question;
import com.example.sbquizserver.models.Quiz;
import com.example.sbquizserver.repos.QuestionRepository;
import com.example.sbquizserver.repos.QuizRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class QuizService {

    private final QuestionRepository questionRepository;
    private final QuizRepository quizRepository;

    @Autowired
    public QuizService(QuizRepository quizRepository, QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
        this.quizRepository = quizRepository;
    }

    public ArrayList<Question> getQuizData(Integer quizId){
        ArrayList<Question> questions = new ArrayList<>(questionRepository.findAllByQuizIdEquals(quizId));

        if (questions.isEmpty()){return questions;}
        return questions;
    }

    public ArrayList<Quiz> findAll(){
        ArrayList<Quiz> quizzes = new ArrayList<>();
        quizRepository.findAll().forEach(quizzes::add);
        return quizzes;
    }

}
