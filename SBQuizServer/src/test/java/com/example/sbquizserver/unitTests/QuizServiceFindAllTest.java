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
import java.util.List;

@ExtendWith(MockitoExtension.class)
class QuizServiceFindAllTest {

    static final ArrayList<Quiz> quizzes = new ArrayList<>(List.of(
            new Quiz(0,"first test quiz","the first test quiz"),
            new Quiz(1,"second test quiz","the second test quiz"),
            new Quiz(3,"third test quiz","the third test quiz")
    ));

    @Mock
    QuizRepository quizRepository;

    @InjectMocks
    QuizService quizService;

    @BeforeEach
    void setUp() {
        Mockito.when(quizRepository.findAll()).thenReturn(quizzes);
    }

    @Test
    void findAllTest(){
        ArrayList<Quiz> quizzesReturned = quizService.findAll();
        Assertions.assertEquals(quizzesReturned,quizzes);
    }

}