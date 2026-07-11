package com.example.jwt_auth.controller;

import java.nio.charset.StandardCharsets;
import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;

import com.example.jwt_auth.model.AuthenticationResponse;
import com.example.jwt_auth.service.JwtUtil;

@RestController
public class AuthController {

    @Autowired
    JwtUtil jwtUtil;

    @GetMapping("/authenticate")
    public AuthenticationResponse authenticate(
            @RequestHeader("Authorization") String authorizationHeader) {
        String encoded = authorizationHeader.substring(6);
        byte[] decodedBytes = Base64.getDecoder().decode(encoded);
        String decoded = new String(decodedBytes, StandardCharsets.UTF_8);
        String username = decoded.split(":")[0];
        String token = jwtUtil.generateToken(username);
        return new AuthenticationResponse(token);

    }

}