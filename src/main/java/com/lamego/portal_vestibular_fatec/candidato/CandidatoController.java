package com.lamego.portal_vestibular_fatec.candidato;

import com.lamego.portal_vestibular_fatec.curso.Curso;
import com.lamego.portal_vestibular_fatec.curso.CursoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/cadastro")
public class CandidatoController {

    private final CandidatoService candidatoService;
    private final CursoService cursoService;

    public CandidatoController(CandidatoService candidatoService, CursoService cursoService) {
        this.candidatoService = candidatoService;
        this.cursoService = cursoService;
    }

    @GetMapping
    public String exibirFormulario(Model model) {
        model.addAttribute("cursos", cursoService.listarAtivos());
        return "cadastro";
    }

    @PostMapping
    public String cadastrar(@RequestParam Long cursoId,
                            @RequestParam String nomeCompleto,
                            @RequestParam String email,
                            @RequestParam String telefoneCelular,
                            @RequestParam String bairro,
                            @RequestParam(defaultValue = "false") boolean concordaReceberMensagem,
                            RedirectAttributes redirectAttributes) {
        try {
            Curso curso = new Curso();
            curso.setId(cursoId);

            CandidatoDTO dto = new CandidatoDTO(
                    null,
                    curso,
                    nomeCompleto,
                    email,
                    telefoneCelular,
                    bairro,
                    null,
                    concordaReceberMensagem
            );

            candidatoService.salvar(dto);
            redirectAttributes.addFlashAttribute("sucesso", "Cadastro realizado com sucesso!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("erro", e.getMessage());
        }
        return "redirect:/cadastro";
    }
}