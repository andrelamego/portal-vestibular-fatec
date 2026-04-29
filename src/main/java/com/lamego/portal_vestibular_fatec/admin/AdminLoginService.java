package com.lamego.portal_vestibular_fatec.admin;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class AdminLoginService {

    private final JdbcTemplate jdbcTemplate;

    public AdminLoginService(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public boolean validarLogin(String login, String senha) {
        Integer resultado = jdbcTemplate.queryForObject(
                "EXEC sp_validar_login @login = ?, @senha = ?",
                Integer.class,
                login, senha
        );
        return resultado != null && resultado == 1;
    }
}

