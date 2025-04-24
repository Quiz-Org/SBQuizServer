package com.example.sbquizserver.unitTests;

import com.example.sbquizserver.QABundle;
import com.example.sbquizserver.QuizService;
import com.example.sbquizserver.models.Question;
import com.example.sbquizserver.repos.AnswerRepository;
import com.example.sbquizserver.repos.QuestionRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
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
        Mockito.when(questionRepository.findAllByQuizIdEquals(1)).thenReturn(QUESTIONS.subList(0,2));

        //Mockito.when(answerRepository.findByquestion__id(1)).thenReturn(ANSWERS.subList(0,4));
        //Mockito.when(answerRepository.findByquestion__id(2)).thenReturn(ANSWERS.subList(4,8));
    }

    @Test
    void getQuizDataTest(){
        ArrayList<Question> question = quizService.getQuizData(1);
        assertThat(question).hasSize(2);
        assertThat(question.getFirst()).isEqualTo(QUESTIONS.getFirst());
        assertThat(question.getLast()).isEqualTo(QUESTIONS.get(1));
        assertThat(question.getFirst().getAnswers()).hasSize(4).first().isEqualTo(QUESTIONS.getFirst().getAnswers().getFirst());
        assertThat(question.getLast().getAnswers()).hasSize(4).first().isEqualTo(QUESTIONS.get(1).getAnswers().getFirst());
    }

}
