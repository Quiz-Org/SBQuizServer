package com.example.sbquizserver.unitTests;

import com.example.sbquizserver.QABundle;
import com.example.sbquizserver.QuizService;
import com.example.sbquizserver.repos.AnswerRepository;
import com.example.sbquizserver.repos.QuestionRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.ArrayList;

import static org.assertj.core.api.Assertions.assertThat;

@ExtendWith(MockitoExtension.class)
public class QuizServiceNotFoundTest {

    @Mock
    @SuppressWarnings("unused")
    QuestionRepository questionRepository;

    @Mock
    @SuppressWarnings("unused")
    AnswerRepository answerRepository;

    @InjectMocks
    QuizService quizService;

    @Test
    void noQuizFoundTest(){
        ArrayList<QABundle> bundle = quizService.getQuizData(50);
        assertThat(bundle).hasSize(0);
    }

}
