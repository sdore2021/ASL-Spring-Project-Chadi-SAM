package com.skillshare.project.controller;

import com.skillshare.project.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/login")
    public String login()
    {
        return "login-page";
    }

    @RequestMapping("/register")
    public String registerPage(Model model){
        User user=new User();
        model.addAttribute("user",user);
        return "register";
    }
}
