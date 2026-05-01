package com.lamego.portal_vestibular_fatec.candidato;

import com.lamego.portal_vestibular_fatec.curso.CursoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/consultaCandidatos")
public class ConsultaCandidatosController {

    private final CandidatoService candidatoService;
    private final CursoService cursoService;

    public ConsultaCandidatosController(CandidatoService candidatoService,
                                        CursoService cursoService) {
        this.candidatoService = candidatoService;
        this.cursoService = cursoService;
    }

    @GetMapping
    public String tela(Model model) {
        model.addAttribute("cursos", cursoService.listarAtivos());
        return "consultaCandidatos";
    }

    @GetMapping(params = "tipo")
    public String consultar(@RequestParam String tipo,
                            @RequestParam(required = false) Long cursoId,
                            @RequestParam(required = false) String bairro,
                            Model model) {

        model.addAttribute("cursos", cursoService.listarAtivos());
        model.addAttribute("tipoBusca", tipo);

        switch (tipo) {
            case "por-curso" -> {
                model.addAttribute("candidatos", candidatoService.buscarPorCurso(cursoId));
                model.addAttribute("cursoFiltro", cursoId);
            }
            case "por-bairro" -> {
                model.addAttribute("candidatos", candidatoService.buscarPorBairro(bairro));
                model.addAttribute("bairroFiltro", bairro);
            }
            case "todos-curso" ->
                    model.addAttribute("candidatos", candidatoService.listarTodosOrdenadoPorCurso());
            case "todos-bairro" ->
                    model.addAttribute("candidatos", candidatoService.listarTodosOrdenadoPorBairro());
            case "primeiros10" ->
                    model.addAttribute("candidatos", candidatoService.listarPrimeiros10());
            case "ultimos10" ->
                    model.addAttribute("candidatos", candidatoService.listarUltimos10());
        }

        return "consultaCandidatos";
    }
}