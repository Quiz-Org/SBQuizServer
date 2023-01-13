package com.example.sbquizserver.repos;
import com.example.sbquizserver.models.Answer;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AnswerRepository extends CrudRepository <Answer,Integer> {

    List<Answer> findByQuestionId(Integer quiz_id);

}
