package com.example.campusprice_springboot.config;

import io.swagger.models.auth.In;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.oas.annotations.EnableOpenApi;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;

import java.util.*;
import java.util.LinkedHashSet;

@Configuration
@EnableOpenApi
public class SwaggerConfig implements WebMvcConfigurer {

    //    访问地址：http://localhost:8081/swagger-ui/#/
    //    端口看自己本地运行时，yaml的设置端口

    /**
     * API 页面上半部分展示信息
     */
    ApiInfo apiInfo = new ApiInfo(
            "Campus Price Spring Boot Api文档",
            "Swagger 3.0 对 Campus Price 项目进行 Api UI化",
            "1.0", "www.myTeamUrl.com",
            new Contact("shAdow-XJY", "https://shadow-xjy.github.io/", "shadowplusing@outlook.com"), "Apache 2.0",
            "https://www.apache.org/licenses/LICENSE-2.0",
            new ArrayList<>()
    );

    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.OAS_30).pathMapping("/")

                // 定义是否开启swagger，false为关闭，可以通过变量控制
                .enable(true)

                // 将api的元信息设置为包含在json ResourceListing响应中。
                .apiInfo(apiInfo)

                // 选择哪些接口作为swagger的doc发布
                .select()

                .apis(RequestHandlerSelectors.any())
                .paths(PathSelectors.any())
                .build()

                // 支持的通讯协议集合
                .protocols(newHashSet("https", "http"))

                // 授权信息设置，必要的header token等认证信息
                .securitySchemes(securitySchemes())

                // 授权信息全局应用
                .securityContexts(securityContexts());
    }



    /**
     * 设置授权信息
     * @return
     */
    private List<SecurityScheme> securitySchemes() {
        ApiKey apiKey = new ApiKey("BASE_TOKEN", "token", In.HEADER.toValue());
        return Collections.singletonList(apiKey);
    }

    /**
     * 授权信息全局应用
     */
    private List<SecurityContext> securityContexts() {
        return Collections.singletonList(
                SecurityContext.builder()
                        .securityReferences(Collections.singletonList(new SecurityReference("BASE_TOKEN", new AuthorizationScope[]{new AuthorizationScope("global", "")})))
                        .build()
        );
    }

    @SafeVarargs
    private final <T> Set<T> newHashSet(T... ts) {
        if (ts.length > 0) {
            return new LinkedHashSet<>(Arrays.asList(ts));
        }
        return null;
    }



}
