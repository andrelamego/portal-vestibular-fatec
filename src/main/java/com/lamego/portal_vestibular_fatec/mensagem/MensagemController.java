package com.lamego.portal_vestibular_fatec.mensagem;

import com.lamego.portal_vestibular_fatec.tipoMensagem.TipoMensagem;
import com.lamego.portal_vestibular_fatec.tipoMensagem.TipoMensagemService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/mensagem")
public class MensagemController {

    private final MensagemService mensagemService;
    private final TipoMensagemService tipoMensagemService;

    public MensagemController(MensagemService mensagemService,
                              TipoMensagemService tipoMensagemService) {
        this.mensagemService = mensagemService;
        this.tipoMensagemService = tipoMensagemService;
    }

    @GetMapping
    public String listar(Model model) {
        model.addAttribute("tipos", tipoMensagemService.listarTodos());
        return "mensagem";
    }

    @GetMapping("/porTipo")
    public String listarPorTipo(@RequestParam Long tipoId, Model model) {
        model.addAttribute("mensagens", mensagemService.buscarPorTipoMensagem(tipoId));
        model.addAttribute("tipos", tipoMensagemService.listarTodos());
        model.addAttribute("tipoSelecionado", tipoId);
        return "mensagem";
    }

    @PostMapping
    public String cadastrar(@RequestParam Long tipoMensagemId,
                            @RequestParam String titulo,
                            @RequestParam String conteudo,
                            RedirectAttributes redirectAttributes) {
        try {
            TipoMensagem tipo = new TipoMensagem();
            tipo.setId(tipoMensagemId);

            MensagemDTO dto = new MensagemDTO(
                    null,
                    tipo,
                    titulo,
                    conteudo,
                    null
            );

            mensagemService.salvar(dto);
            redirectAttributes.addFlashAttribute("sucesso", "Mensagem cadastrada com sucesso!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("erro", e.getMessage());
        }
        return "redirect:/admin/mensagem";
    }
}