package com.lamego.portal_vestibular_fatec.curso;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/curso")
public class CursoController {

    private final CursoService service;

    public CursoController(CursoService service) {
        this.service = service;
    }

    @GetMapping
    public String listar(Model model) {
        model.addAttribute("cursos", service.listarAtivos());
        return "curso";
    }

    @GetMapping("/editar")
    public String editar(@RequestParam Long id, Model model,
                         RedirectAttributes redirectAttributes) {
        try {
            model.addAttribute("cursoEdicao", service.buscarPorId(id));
            model.addAttribute("cursos", service.listarAtivos());
            return "curso";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("erro", "Curso não encontrado.");
            return "redirect:/admin/curso";
        }
    }

    @PostMapping
    public String salvar(@RequestParam(required = false) Long id,
                         @RequestParam String nome,
                         @RequestParam(defaultValue = "true") boolean ativo,
                         RedirectAttributes redirectAttributes) {
        try {
            CursoDTO dto = new CursoDTO(id, nome, ativo);
            service.salvar(dto);
            String msg = id == null ? "Curso cadastrado com sucesso!" : "Curso atualizado com sucesso!";
            redirectAttributes.addFlashAttribute("sucesso", msg);
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("erro", e.getMessage());
        }
        return "redirect:/admin/curso";
    }
}