package com.example.sbquizserver;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface AnswerRepository extends CrudRepository <Answer,Integer> {

    List<Answer> findByQuestionId(Integer quiz_id);

}
