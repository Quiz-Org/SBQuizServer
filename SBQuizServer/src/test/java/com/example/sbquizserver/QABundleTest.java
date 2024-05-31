package com.example.sbquizserver;

import com.example.sbquizserver.models.Answer;
import com.example.sbquizserver.models.Question;
import com.example.sbquizserver.repos.AnswerRepository;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.ArrayList;
import java.util.List;

@ExtendWith(MockitoExtension.class)
class QABundleTest {

    static final ArrayList<Answer> answers = new ArrayList<>(List.of(
            new Answer(0,0,"first answer",true),
            new Answer(1,0,"second answer",false),
            new Answer(2,0,"third answer",false),
            new Answer(3,0,"fourth answer",false)
    ));

    @Mock
    AnswerRepository answerRepository;

    @BeforeEach
    void setUp(){
        Mockito.when(answerRepository.findByQuestionId(0)).thenReturn(answers);
    }

    @Test
    void getAnswers() {
        Question question = new Question(0,2,"question text");
        QABundle bundle = new QABundle(question,answerRepository);
        Assertions.assertEquals(bundle.getAnswers(),answers);
    }
}