package com;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

import java.io.IOException;

@SpringBootApplication
@MapperScan(basePackages = {"com.dao"})
public class SpringbootSchemaApplication extends SpringBootServletInitializer{

	public static void main(String[] args) {
		SpringApplication.run(SpringbootSchemaApplication.class, args);
		try {
			Runtime.getRuntime().exec("cmd /c start http://localhost:8080/vuejianshenfang/front/dist/index.html");
			Runtime.getRuntime().exec("cmd /c start http://localhost:8080/vuejianshenfang/admin/dist/index.html");
		} catch (IOException e) {
			e.printStackTrace();

		}
	}
	
	@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder applicationBuilder) {
        return applicationBuilder.sources(SpringbootSchemaApplication.class);
    }
}
