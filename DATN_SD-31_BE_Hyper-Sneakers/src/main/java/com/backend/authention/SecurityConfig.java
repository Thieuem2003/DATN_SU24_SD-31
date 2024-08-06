package com.backend.authention;
//package com.spring.beebeta.authention;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.authentication.AuthenticationProvider;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.http.SessionCreationPolicy;
//import org.springframework.security.web.SecurityFilterChain;
//import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
//
//
//import lombok.RequiredArgsConstructor;
//
//@Configuration
//@EnableWebSecurity
//@RequiredArgsConstructor
//public class SecurityConfig {
//
//    private final JwtAuthenticationFilter jwtAuthenticationFilter;
//    private final AuthenticationProvider authProvider;
//
//    // Configure the security filter chain
//    @Bean
//    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//        return http
//            .csrf(csrf -> csrf.disable()) // Disable CSRF protection
//            .authorizeHttpRequests(
//                authRequest -> authRequest
//                    .requestMatchers("/api/product","/api/auth/login").permitAll() // Allow unauthenticated access to /auth/**
//                    .anyRequest().authenticated() // Require authentication for all other requests
//            )
//            .sessionManagement(
//                sessionManager -> sessionManager.sessionCreationPolicy(SessionCreationPolicy.STATELESS) // Set session creation policy to STATELESS
//            )
//            .authenticationProvider(authProvider) // Set the custom authentication provider
//            .addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class) // Add custom JWT authentication filter before UsernamePasswordAuthenticationFilter
//            .build();
//    }
//}