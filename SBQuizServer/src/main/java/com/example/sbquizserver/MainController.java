package com.example.sbquizserver;

import com.example.sbquizserver.models.Quiz;

import org.springframework.beans.factory.annotation.Autowired;

import static org.springframework.http.HttpStatus.NOT_FOUND;
import static org.springframework.http.HttpStatus.OK;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;



@Controller
public class MainController {

    private final QuizService quizService;

    @Autowired
    public MainController(QuizService quizService) {this.quizService = quizService;}

    @GetMapping("/quiz/all")
    @ResponseBody
    public ResponseEntity<ArrayList<Quiz>> getAllQuizzes(){
        return ResponseEntity.status(OK).body(quizService.findAll());
    }

    @GetMapping("/quiz/{quizId}")
    @ResponseBody
    public ResponseEntity<ArrayList<QABundle>> getQuizData(@PathVariable Integer quizId){
        ArrayList<QABundle> quizData = quizService.getQuizData(quizId);
        if (quizData.isEmpty()){return ResponseEntity.status(NOT_FOUND).body(quizData);}
        return ResponseEntity.status(OK).body(quizData);}
}
