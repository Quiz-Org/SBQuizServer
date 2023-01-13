package com.example.sbquizserver.repos;
import com.example.sbquizserver.models.Question;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionRepository extends CrudRepository <Question,Integer> {

    List<Question> findAllByQuizIdEquals(Integer quizId);


}
