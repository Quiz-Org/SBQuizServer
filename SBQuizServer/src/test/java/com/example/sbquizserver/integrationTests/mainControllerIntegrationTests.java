package com.example.sbquizserver.integrationTests;

import com.example.sbquizserver.models.Quiz;
import com.example.sbquizserver.repos.AnswerRepository;
import com.example.sbquizserver.repos.QuestionRepository;
import com.example.sbquizserver.repos.QuizRepository;

import io.restassured.response.Response;
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
import org.testcontainers.shaded.com.fasterxml.jackson.databind.ObjectMapper;

import java.util.ArrayList;
import java.util.List;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.hasItem;
import static org.hamcrest.Matchers.hasItems;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class mainControllerIntegrationTests {

    @LocalServerPort
    private Integer port;

    static MySQLContainer<?> mySQLContainer = new MySQLContainer<>("mysql:latest")
            .withDatabaseName("myquizappdb")
            .withInitScript("testContainer.sql");

    static final ArrayList<Quiz> quizzes = new ArrayList<>(List.of(
            new Quiz(0, "History", "A short quiz on general history."),
            new Quiz(1, "Bits and Bytes", "A short quiz about basic data quantities")
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
                .body("name",hasItems(quizzes.getFirst().getName(),quizzes.getLast().getName()));

        //List<Quiz> quizzes = response.getBody().as(Quiz.class);

        System.out.println();
    }

}
