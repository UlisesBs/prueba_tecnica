package com.example.monedaapp.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springdoc.core.customizers.OpenApiCustomiser;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OpenApiConfig {

    private final ObjectMapper objectMapper;

    public OpenApiConfig(ObjectMapper objectMapper) {
        this.objectMapper = objectMapper;
    }

    @Bean
    public OpenApiCustomiser openApiCustomiser() {
        return openApi -> openApi.getPaths().values().stream()
                .flatMap(pathItem -> pathItem.readOperations().stream())
                .forEach(operation -> operation.getResponses().values().forEach(response -> {
                    if (response.getContent() != null && response.getContent().containsKey("application/json")) {
                        response.getContent().get("application/json").setExample(
                                objectMapper.createObjectNode()
                                        .put("id", 1)
                                        .put("nombre", "Ejemplo Moneda")
                                        .put("codigo", "ABC")
                                        .put("pais", "Ejemplo País")
                        );
                    }
                }));
    }
}
