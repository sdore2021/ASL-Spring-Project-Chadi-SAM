package com.skillshare.project.controller;

import com.skillshare.project.facade.Facade;
import com.skillshare.project.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    Facade facade;

    @GetMapping("/list")
    public String getUsers(Model model){
        model.addAttribute("users",facade.getAllUsers());
        model.addAttribute("user",facade.getCurrentUser());
        return "administration";
    }

    @PostMapping("/create")
    public String saveUser(@ModelAttribute("user") User user){
        facade.saveUser(user);
        return "redirect:/service/list";
    }

    @GetMapping("/myservices")
    public String listServices(Model model){
        model.addAttribute("services",facade.getCurrentUser().getServices());
        model.addAttribute("user",facade.getCurrentUser());
        return "myservices";
    }

    @GetMapping("/purchases")
    public String listPurchases(Model model){
        model.addAttribute("services",facade.getCurrentUser().getProvidedServices());
        model.addAttribute("user",facade.getCurrentUser());
        return "mypurchases";
    }

    @GetMapping("/ban/{username}")
    public String banUser(@PathVariable("username")String username) throws Exception {
        facade.banUser(username);
        return "redirect:/user/list";
    }

    @GetMapping("/promote/{username}")
    public String promote(@PathVariable("username") String username){
        facade.promoteUser(username);
        return "redirect:/user/list";
    }

    @GetMapping("/unban/{username}")
    public String unbanUser(@PathVariable("username")String username){
        facade.unbanUser(username);
        return "redirect:/user/list";
    }
}
