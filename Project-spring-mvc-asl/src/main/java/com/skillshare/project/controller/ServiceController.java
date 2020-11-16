package com.skillshare.project.controller;

import com.skillshare.project.facade.Facade;
import com.skillshare.project.model.Category;
import com.skillshare.project.model.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
@RequestMapping("/service")
public class ServiceController {

    @Autowired
    private Facade facade;

    @GetMapping("/list")
    public String ServiceList(Model model){
        model.addAttribute("services",facade.getAllServices());
        model.addAttribute("user",facade.getCurrentUser());
        model.addAttribute("categories",facade.getAllCategory());
        return "main-page";
    }

    @PostMapping("/search")
    public String searchServices(Model model,@RequestParam("title")String title,@RequestParam("tags")String tags,@RequestParam("category")int category){
        model.addAttribute("services",facade.searchServices(title,tags,category));
        model.addAttribute("user",facade.getCurrentUser());
        model.addAttribute("categories",facade.getAllCategory());
        return "main-page";
    }

    @GetMapping("/moderation")
    public String demandList(Model model){
        model.addAttribute("services",facade.getAllServices());
        model.addAttribute("user",facade.getCurrentUser());
        return "moderation";
    }

    @GetMapping("/{id}")
    public String showService(@PathVariable("id")int id, Model model){
        model.addAttribute("service",facade.getServiceById(id));
        return "detaille";
    }

    @GetMapping("/form")
    public String ServicePage(Model model)
    {
        Service service=new Service();
        model.addAttribute("service",service);

        List<Category> categories = facade.getAllCategory();
        model.addAttribute("categories",categories);
        return "proposer";
    }

    @PostMapping("/create")
    public String createService(@ModelAttribute("service")Service service,@RequestParam("category")int category)
    {
        facade.saveService(service,category);
        return "redirect:list";
    }

    @GetMapping("/approve/{id}")
    public String approveService(@PathVariable("id") int id){
        facade.approveService(id);
        return "redirect:/service/moderation";
    }

    @GetMapping("/buy/{id}")
    public String buyService(@PathVariable("id")int id,Model model) throws Exception {
        facade.buyService(id);
        return "redirect:/service/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteService(@PathVariable("id")int id)
    {
        facade.deleteService(id);
        return "redirect:/service/list";
    }

    @GetMapping("/finish/{id}")
    public String finishService(@PathVariable("id")int id)
    {
        facade.finishService(id);
        return "redirect:/user/myservices";
    }
}
