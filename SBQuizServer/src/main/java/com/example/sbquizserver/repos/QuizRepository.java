package com.example.sbquizserver.repos;

import com.example.sbquizserver.models.Quiz;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QuizRepository extends CrudRepository <Quiz,Integer> {}
