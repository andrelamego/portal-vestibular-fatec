package com.lamego.portal_vestibular_fatec.curiosidade;

import com.lamego.portal_vestibular_fatec.time.TimeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/curiosidade")
public class CuriosidadeController {

    private final CuriosidadeService curiosidadeService;
    private final TimeService timeService;

    public CuriosidadeController(CuriosidadeService curiosidadeService, TimeService timeService) {
        this.curiosidadeService = curiosidadeService;
        this.timeService = timeService;
    }

    @GetMapping
    public String exibirCuriosidade(@RequestParam Long timeId, Model model) {
        model.addAttribute("curiosidade", curiosidadeService.sortearCuriosiade(timeId));
        model.addAttribute("time", timeService.buscarPorId(timeId));
        return "curiosidade";
    }
}