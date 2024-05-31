package com.example.sbquizserver;

import com.example.sbquizserver.models.Quiz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;

@Controller
public class MainController {

    private final QuizService quizService;

    @Autowired
    public MainController(QuizService quizService) {this.quizService = quizService;}

    @GetMapping("/quiz/all")
    @ResponseBody
    public Iterable<Quiz> getAllUsers(){return quizService.findAll();}

    @GetMapping("/quiz/QA")
    @ResponseBody
    public ArrayList<QABundle> getQuizData(@RequestParam Integer quizId){ return quizService.getQuizData(quizId);}

}
