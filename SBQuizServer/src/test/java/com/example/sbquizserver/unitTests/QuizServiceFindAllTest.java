package com.example.sbquizserver.unitTests;

import com.example.sbquizserver.QuizService;
import com.example.sbquizserver.models.Quiz;
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

import static com.example.sbquizserver.testUtils.QUIZZES;

@ExtendWith(MockitoExtension.class)
class QuizServiceFindAllTest {

    @Mock
    QuizRepository quizRepository;

    @InjectMocks
    QuizService quizService;

    @BeforeEach
    void setUp() {
        Mockito.when(quizRepository.findAll()).thenReturn(QUIZZES);
    }

    @Test
    void findAllTest(){
        ArrayList<Quiz> quizzesReturned = quizService.findAll();
        Assertions.assertEquals(quizzesReturned,QUIZZES);
    }

}