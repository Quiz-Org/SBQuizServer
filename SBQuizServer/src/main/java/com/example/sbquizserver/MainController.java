package com.example.sbquizserver;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;

@Controller
public class MainController {

    @Autowired
    private QuizRepository quizRepository;
    @Autowired
    private QuestionRepository questionRepository;
    @Autowired
    private AnswerRepository answerRepository;

    @GetMapping("/quiz/all")
    public @ResponseBody Iterable<Quiz> getAllUsers(){return quizRepository.findAll();}

    @GetMapping("/quiz/QA")
    @ResponseBody
    public ArrayList<QABundle> getQuizData(@RequestParam
                                    Integer quizId){
        ArrayList<QABundle> response = new ArrayList<>();
        ArrayList<Question> questions = new ArrayList<>(questionRepository.findAllByQuizIdEquals(quizId));
        for(Question question : questions){
            response.add(new QABundle(question,answerRepository));}
        return response;

    }


}
