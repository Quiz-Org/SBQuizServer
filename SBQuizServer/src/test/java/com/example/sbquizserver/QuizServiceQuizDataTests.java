package com.example.sbquizserver;

import com.example.sbquizserver.models.Answer;
import com.example.sbquizserver.models.Question;
import com.example.sbquizserver.models.Quiz;
import com.example.sbquizserver.repos.AnswerRepository;
import com.example.sbquizserver.repos.QuestionRepository;
import com.example.sbquizserver.repos.QuizRepository;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.ArrayList;
import java.util.List;

@ExtendWith(MockitoExtension.class)
public class QuizServiceQuizDataTests {

    static final ArrayList<Quiz> quizzes = new ArrayList<>(List.of(
            new Quiz(0,"first test quiz","the first test quiz"),
            new Quiz(1,"second test quiz","the second test quiz"),
            new Quiz(3,"third test quiz","the third test quiz")
    ));

    static final ArrayList<Question> questions = new ArrayList<>(List.of(
            new Question(0,2,"first question"),
            new Question(1,2,"second question"),
            new Question(2,2,"third question")
    ));

    static final ArrayList<Answer> answers = new ArrayList<>(List.of(
            new Answer(0,0,"first answer",true),
            new Answer(1,0,"second answer",false),
            new Answer(2,1,"third answer",true),
            new Answer(3,1,"fourth answer",false),
            new Answer(4,2,"fifth answer",true),
            new Answer(5,2,"sixth answer",false)
    ));

    @Mock
    QuestionRepository questionRepository;

    @Mock
    AnswerRepository answerRepository;

    @Mock
    QuizRepository quizRepository;

    @InjectMocks
    QuizService quizService;

    @BeforeEach
    void setUp() {
        Mockito.when(questionRepository.findAllByQuizIdEquals(2)).thenReturn(questions);

        Mockito.when(answerRepository.findByQuestionId(0)).thenReturn(answers.subList(0,2));
        Mockito.when(answerRepository.findByQuestionId(0)).thenReturn(answers.subList(2,5));
        Mockito.when(answerRepository.findByQuestionId(0)).thenReturn(answers.subList(5,6));

    }

    @Test
    void getQuizDataTest(){
        ArrayList<QABundle> bundle = quizService.getQuizData(2);
        Assertions.assertEquals(bundle.getFirst().getQuestion(),questions.getFirst());
    }
}
