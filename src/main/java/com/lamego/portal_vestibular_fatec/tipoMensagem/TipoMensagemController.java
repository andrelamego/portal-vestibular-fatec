package com.lamego.portal_vestibular_fatec.tipoMensagem;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/cadastraTipo")
public class TipoMensagemController {

    private final TipoMensagemService service;

    public TipoMensagemController(TipoMensagemService service) {
        this.service = service;
    }

    @GetMapping
    public String listar(Model model) {
        model.addAttribute("tipos", service.listarTodos());
        return "cadastraTipo";
    }

    @GetMapping("/editar")
    public String editar(@RequestParam Long id, Model model, RedirectAttributes redirectAttributes) {
        return service.buscarPorId(id)
                .map(tipo -> {
                    model.addAttribute("tipos", service.listarTodos());
                    model.addAttribute("tipoEdicao", tipo);
                    return "cadastraTipo";
                })
                .orElseGet(() -> {
                    redirectAttributes.addFlashAttribute("erro", "Tipo não encontrado.");
                    return "redirect:/admin/cadastraTipo";
                });
    }

    @GetMapping("/consulta")
    public String consulta(@RequestParam Long id, Model model) {
        model.addAttribute("tipos", service.listarTodos());
        model.addAttribute("consultaId", id);

        service.buscarPorId(id)
                .ifPresentOrElse(
                        tipo -> model.addAttribute("tipoConsulta", tipo),
                        () -> model.addAttribute("erroConsulta", "Nenhum tipo encontrado com o ID " + id + ".")
                );

        return "cadastraTipo";
    }

    @PostMapping
    public String salvar(@RequestParam(required = false) Long id,
                         @RequestParam String descricao,
                         RedirectAttributes redirectAttributes) {
        TipoMensagemDTO dto = new TipoMensagemDTO(id, descricao);
        try {
            if (id == null) {
                service.cadastrar(dto);
                redirectAttributes.addFlashAttribute("sucesso", "Tipo cadastrado com sucesso!");
            } else {
                service.atualizar(id, dto);
                redirectAttributes.addFlashAttribute("sucesso", "Tipo atualizado com sucesso!");
            }
        } catch (IllegalArgumentException e) {
            redirectAttributes.addFlashAttribute("erro", e.getMessage());
        }
        return "redirect:/admin/cadastraTipo";
    }
}