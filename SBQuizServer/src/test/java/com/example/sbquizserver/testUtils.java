package com.example.sbquizserver;

import com.example.sbquizserver.models.Quiz;

import java.util.ArrayList;
import java.util.List;

public class testUtils {


    public static final ArrayList<Quiz> QUIZZES = new ArrayList<>(List.of(
            new Quiz(0, "History", "A short quiz on general history."),
            new Quiz(1, "Bits and Bytes", "A short quiz about basic data quantities")
    ));
}
