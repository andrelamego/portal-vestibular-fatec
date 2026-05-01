package com.lamego.portal_vestibular_fatec.time;

import com.lamego.portal_vestibular_fatec.curiosidade.CuriosidadeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class TimeController {

    private final TimeService timeService;
    private final CuriosidadeService curiosidadeService;

    public TimeController(TimeService timeService, CuriosidadeService curiosidadeService) {
        this.timeService = timeService;
        this.curiosidadeService = curiosidadeService;
    }

    @GetMapping("/escolhaTime")
    public String escolhaTime(Model model) {
        model.addAttribute("times", timeService.listarTodos());
        return "escolhaTimes";
    }
}