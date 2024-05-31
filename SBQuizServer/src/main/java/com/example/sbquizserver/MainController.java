package com.example.sbquizserver;

import com.example.sbquizserver.models.Question;
import com.example.sbquizserver.models.Quiz;
import com.example.sbquizserver.repos.AnswerRepository;
import com.example.sbquizserver.repos.QuestionRepository;
import com.example.sbquizserver.repos.QuizRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;

@Controller
public class MainController {

    private final QuizRepository quizRepository;
    private final QuestionRepository questionRepository;
    private final AnswerRepository answerRepository;

    @Autowired
    public MainController(QuizRepository quizRepository, QuestionRepository questionRepository, AnswerRepository answerRepository) {
        this.quizRepository = quizRepository;
        this.questionRepository = questionRepository;
        this.answerRepository = answerRepository;
    }

    @GetMapping("/quiz/all")
    @ResponseBody
    public Iterable<Quiz> getAllUsers(){return quizRepository.findAll();}

    @GetMapping("/quiz/QA")
    @ResponseBody
    public ArrayList<QABundle> getQuizData(@RequestParam Integer quizId){

        ArrayList<QABundle> response = new ArrayList<>();
        ArrayList<Question> questions = new ArrayList<>(questionRepository.findAllByQuizIdEquals(quizId));

        for(Question question : questions){response.add(new QABundle(question,answerRepository));}

        return response;

    }


}
