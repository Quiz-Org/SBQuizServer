package com.example.sbquizserver.unitTests;

import com.example.sbquizserver.QABundle;
import com.example.sbquizserver.QuizService;
import com.example.sbquizserver.repos.AnswerRepository;
import com.example.sbquizserver.repos.QuestionRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import static com.example.sbquizserver.testUtils.ANSWERS;
import static com.example.sbquizserver.testUtils.QUESTIONS;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.ArrayList;

@ExtendWith(MockitoExtension.class)
public class QuizServiceQuizDataTests {

    @Mock
    QuestionRepository questionRepository;

    @Mock
    AnswerRepository answerRepository;

    @InjectMocks
    QuizService quizService;

    @BeforeEach
    void setUp() {
        Mockito.when(questionRepository.findAllByQuizIdEquals(0)).thenReturn(QUESTIONS.subList(0,2));

        Mockito.when(answerRepository.findByQuestionId(0)).thenReturn(ANSWERS.subList(0,4));
        Mockito.when(answerRepository.findByQuestionId(1)).thenReturn(ANSWERS.subList(4,8));

    }

    @Test
    void getQuizDataTest(){
        ArrayList<QABundle> bundle = quizService.getQuizData(0);
        assertThat(bundle).hasSize(2);
        assertThat(bundle.getFirst().getQuestion()).isEqualTo(QUESTIONS.getFirst());
        assertThat(bundle.getLast().getQuestion()).isEqualTo(QUESTIONS.get(1));
        assertThat(bundle.getFirst().getAnswers()).hasSize(4).first().isEqualTo(ANSWERS.getFirst());
        assertThat(bundle.getLast().getAnswers()).hasSize(4).first().isEqualTo(ANSWERS.get(4));

    }
}
