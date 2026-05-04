package com.lamego.portal_vestibular_fatec.curiosidade;

import com.lamego.portal_vestibular_fatec.time.Time;
import com.lamego.portal_vestibular_fatec.time.TimeService;
import com.lamego.portal_vestibular_fatec.tipoMensagem.TipoMensagem;
import com.lamego.portal_vestibular_fatec.tipoMensagem.TipoMensagemService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/curiosidades")
public class AdminCuriosidadeController {

    private final CuriosidadeService curiosidadeService;
    private final TimeService timeService;
    private final TipoMensagemService tipoMensagemService;

    public AdminCuriosidadeController(CuriosidadeService curiosidadeService,
                                      TimeService timeService,
                                      TipoMensagemService tipoMensagemService) {
        this.curiosidadeService = curiosidadeService;
        this.timeService = timeService;
        this.tipoMensagemService = tipoMensagemService;
    }

    @GetMapping
    public String listar(Model model) {
        carregarDadosTela(model);
        return "adminCuriosidades";
    }

    @PostMapping
    public String cadastrar(@RequestParam Long timeId,
                            @RequestParam Long tipoMensagemId,
                            @RequestParam String texto,
                            @RequestParam(defaultValue = "true") boolean ativa,
                            RedirectAttributes redirectAttributes) {
        try {
            Time time = new Time();
            time.setId(timeId);

            TipoMensagem tipoMensagem = new TipoMensagem();
            tipoMensagem.setId(tipoMensagemId);

            CuriosidadeDTO dto = new CuriosidadeDTO(
                    null,
                    time,
                    tipoMensagem,
                    texto,
                    ativa,
                    false,
                    null
            );

            curiosidadeService.salvar(dto);
            redirectAttributes.addFlashAttribute("sucesso", "Curiosidade cadastrada com sucesso!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("erro", e.getMessage());
        }

        return "redirect:/admin/curiosidades";
    }

    private void carregarDadosTela(Model model) {
        model.addAttribute("curiosidades", curiosidadeService.listarTodos());
        model.addAttribute("times", timeService.listarTodos());
        model.addAttribute("tipos", tipoMensagemService.listarTodos());
    }
}
