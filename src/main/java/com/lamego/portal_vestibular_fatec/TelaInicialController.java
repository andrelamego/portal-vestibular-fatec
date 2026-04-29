package com.lamego.portal_vestibular_fatec;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TelaInicialController {

    @GetMapping("/")
    public String telaInicial() {
        return "telaInicial"; // aponta para src/main/webapp/WEB-INF/views/index.jsp
    }

    @GetMapping("/escolhaTimes")
    public String escolhaTime() {
        return "escolhaTimes";
    }
}