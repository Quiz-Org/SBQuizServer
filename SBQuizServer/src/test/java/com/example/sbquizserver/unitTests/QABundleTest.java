package com.example.sbquizserver.unitTests;

import com.example.sbquizserver.QABundle;
import com.example.sbquizserver.models.Question;
import com.example.sbquizserver.repos.AnswerRepository;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import static com.example.sbquizserver.testUtils.ANSWERS;
import static com.example.sbquizserver.testUtils.QUESTIONS;

@ExtendWith(MockitoExtension.class)
class QABundleTest {

    @Mock
    AnswerRepository answerRepository;

    @BeforeEach
    void setUp(){
        Mockito.when(answerRepository.findByQuestionId(1)).thenReturn(ANSWERS.subList(0,4));
    }

    @Test
    void getAnswers() {
        Question question = QUESTIONS.getFirst();
        QABundle bundle = new QABundle(question,answerRepository);
        Assertions.assertEquals(bundle.getAnswers(),ANSWERS.subList(0,4));
    }
}