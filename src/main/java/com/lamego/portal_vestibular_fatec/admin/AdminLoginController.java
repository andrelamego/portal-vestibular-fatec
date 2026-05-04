package com.lamego.portal_vestibular_fatec.admin;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AdminLoginController {

    private final AdminLoginService service;

    public AdminLoginController(AdminLoginService service) {
        this.service = service;
    }

    @GetMapping({"/admin/login", "/admin"})
    public String telaLogin() {
        return "adminLogin";
    }

    @PostMapping("/admin/login")
    public String autenticar(@RequestParam String login,
                             @RequestParam String senha,
                             HttpSession session,
                             RedirectAttributes redirectAttributes) {
        if (service.validarLogin(login, senha)) {
            session.setAttribute("adminAutenticado", true);
            return "redirect:/admin/curiosidades";
        }
        redirectAttributes.addFlashAttribute("erro", "Login ou senha inválidos.");
        return "redirect:/admin/login";
    }

    @GetMapping("/admin/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/admin/login";
    }
}