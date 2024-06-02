package com.example.sbquizserver.integrationTests;

import com.example.sbquizserver.models.Answer;
import com.example.sbquizserver.models.Question;
import com.example.sbquizserver.models.Quiz;
import com.example.sbquizserver.repos.AnswerRepository;
import com.example.sbquizserver.repos.QuestionRepository;
import com.example.sbquizserver.repos.QuizRepository;

import static com.example.sbquizserver.testUtils.QUIZZES;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.testcontainers.containers.MySQLContainer;

import java.util.ArrayList;
import java.util.List;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.hasItems;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class mainControllerIntegrationTests {

    @LocalServerPort
    private Integer port;

    static MySQLContainer<?> mySQLContainer = new MySQLContainer<>("mysql:latest")
            .withDatabaseName("myquizappdb")
            .withInitScript("testContainer.sql");

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

    @BeforeAll
    static void beforeAll(){mySQLContainer.start();}

    @AfterAll
    static void afterAll(){mySQLContainer.stop();}

    @DynamicPropertySource
    static void dynamicProperties(DynamicPropertyRegistry registry) {
        registry.add("spring.datasource.url", mySQLContainer::getJdbcUrl);
        registry.add("spring.datasource.username", mySQLContainer::getUsername);
        registry.add("spring.datasource.password", mySQLContainer::getPassword);
    }

    @Autowired
    AnswerRepository answerRepository;

    @Autowired
    QuestionRepository questionRepository;

    @Autowired
    QuizRepository quizRepository;

    @BeforeEach
    void setUp() {RestAssured.baseURI = "http://localhost:" + port;}

    @Test
    void getAllTest(){
        given()
                .contentType(ContentType.JSON)
                .when()
                .get("/quiz/all")
                .then()
                .statusCode(200)
                .body("name",hasItems(QUIZZES.getFirst().getName(),QUIZZES.getLast().getName()));
    }

    @Test
    void getSingleQuizTest(){
        Quiz quiz = QUIZZES.getFirst();
        given()
                .contentType(ContentType.JSON)
                .when()
                .get("/quiz/QA?={id}", quiz.get_id())
                .then()
                .statusCode(200)
                .body("name", equalTo(quiz.getName()))
                .body("answerText",hasItems("1 0r 0","Anything from one to 10"));
    }

}
