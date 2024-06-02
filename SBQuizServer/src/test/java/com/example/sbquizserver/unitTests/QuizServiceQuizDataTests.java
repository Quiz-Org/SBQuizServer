package com.example.sbquizserver.unitTests;

import com.example.sbquizserver.QABundle;
import com.example.sbquizserver.QuizService;
import com.example.sbquizserver.models.Answer;
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

import static org.assertj.core.api.Assertions.assertThat;

import java.util.ArrayList;
import java.util.List;

@ExtendWith(MockitoExtension.class)
public class QuizServiceQuizDataTests {

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

    @InjectMocks
    QuizService quizService;

    @BeforeEach
    void setUp() {
        Mockito.when(questionRepository.findAllByQuizIdEquals(2)).thenReturn(questions);

        Mockito.when(answerRepository.findByQuestionId(0)).thenReturn(answers.subList(0,2));
        Mockito.when(answerRepository.findByQuestionId(1)).thenReturn(answers.subList(2,4));
        Mockito.when(answerRepository.findByQuestionId(2)).thenReturn(answers.subList(4,6));

    }

    @Test
    void getQuizDataTest(){
        ArrayList<QABundle> bundle = quizService.getQuizData(2);
        assertThat(bundle).hasSize(3);
        assertThat(bundle.getFirst().getQuestion()).isEqualTo(questions.getFirst());
        assertThat(bundle.getLast().getQuestion()).isEqualTo(questions.getLast());
        assertThat(bundle.getFirst().getAnswers()).hasSize(2).first().isEqualTo(answers.getFirst());
        assertThat(bundle.getLast().getAnswers()).hasSize(2).first().isEqualTo(answers.get(4));

    }
}
