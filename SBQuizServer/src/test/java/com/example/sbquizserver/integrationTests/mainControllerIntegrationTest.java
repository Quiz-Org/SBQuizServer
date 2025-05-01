package com.example.sbquizserver.integrationTests;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.testcontainers.containers.MySQLContainer;

import static com.example.sbquizserver.testUtils.QUIZZES;
import static com.example.sbquizserver.testUtils.QUESTIONS;
import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.*;

@SuppressWarnings("NewClassNamingConvention")
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class mainControllerIntegrationTest {

    @LocalServerPort
    private Integer port;

    @SuppressWarnings("resource")
    static MySQLContainer<?> mySQLContainer = new MySQLContainer<>("mysql:8.4.0")
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

    @BeforeEach
    void setUp() {RestAssured.baseURI = "http://localhost:" + port;}
//
//    @Test
//    void getAllTest(){
//        given()
//                .contentType(ContentType.JSON)
//                .when()
//                .get("/quiz/all")
//                .then()
//                .statusCode(200)
//                .body("name",hasItems(QUIZZES.getFirst().getName(),QUIZZES.getLast().getName()));
//    }

    @Test
    void getSingleQuizTest(){
        given()
                .contentType(ContentType.JSON)
                .when()
                .get("/quiz/{id}", 1)
                .then()
                .statusCode(200)
                .body("questionText", hasItem(QUESTIONS.getFirst().getQuestionText()))
                .body("answers.answerText.flatten()",hasItems(QUESTIONS.getFirst().getAnswers().getFirst().getAnswerText(),QUESTIONS.getFirst().getAnswers().get(3).getAnswerText()));
    }

    @Test
    void quizNotFound(){
        given()
                .contentType(ContentType.JSON)
                .when()
                .get("/quiz/{id}", 50)
                .then()
                .statusCode(404)
                .body("A",empty());
    }
}
