package com.example.sbquizserver.integrationTests;

import com.example.sbquizserver.repos.AnswerRepository;
import com.example.sbquizserver.repos.QuestionRepository;
import com.example.sbquizserver.repos.QuizRepository;

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

import static com.example.sbquizserver.testUtils.QUIZZES;
import static com.example.sbquizserver.testUtils.QUESTIONS;
import static com.example.sbquizserver.testUtils.ANSWERS;
import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.*;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class mainControllerIT {

    @LocalServerPort
    private Integer port;

    static MySQLContainer<?> mySQLContainer = new MySQLContainer<>("mysql:latest")
            .withDatabaseName("myquizappdb")
            .withInitScript("testContainer.sql");

    @BeforeAll
    static void beforeAll(){
        mySQLContainer.start();}

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
        given()
                .contentType(ContentType.JSON)
                .when()
                .get("/quiz/{id}", 0)
                .then()
                .statusCode(200)
                .body("question.questionText", hasItem(QUESTIONS.getFirst().getQuestionText()))
                .body("answers.answerText.flatten()",hasItems(ANSWERS.getFirst().getAnswerText(),ANSWERS.get(4).getAnswerText()));
    }

    //

}
