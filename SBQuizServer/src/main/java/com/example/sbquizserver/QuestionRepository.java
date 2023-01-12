package com.example.sbquizserver;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface QuestionRepository extends CrudRepository <Question,Integer> {

    List<Question> findByQuizId(Integer Quiz_id);

}
