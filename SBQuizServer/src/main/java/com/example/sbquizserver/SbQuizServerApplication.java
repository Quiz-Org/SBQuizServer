package com.example.sbquizserver;

import jakarta.persistence.EntityManagerFactory;
import org.springframework.beans.factory.config.BeanFactoryPostProcessor;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.jdbc.DatabaseDriver;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.support.DatabaseStartupValidator;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.stream.Stream;

@SpringBootApplication
public class SbQuizServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(SbQuizServerApplication.class, args);
    }

    @Bean
    public DatabaseStartupValidator databaseStartupValidator(DataSource dataSource) throws SQLException {
        var dsv = new DatabaseStartupValidator();
        dsv.setDataSource(dataSource);
        dataSource.getConnection().isValid(5);
        return dsv;
    }
    @Bean
    public static BeanFactoryPostProcessor dependsOnPostProcessor() {
        return bf -> {
            // Let beans that need the database depend on the DatabaseStartupValidator
            // like the JPA EntityManagerFactory or Flyway
            String[] jpa = bf.getBeanNamesForType(EntityManagerFactory.class);
            Stream.of(jpa)
                    .map(bf::getBeanDefinition)
                    .forEach(it -> it.setDependsOn("databaseStartupValidator"));
        };
    }

}
