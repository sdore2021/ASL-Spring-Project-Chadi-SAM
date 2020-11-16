package com.skillshare.project.facade;

import com.skillshare.project.dao.CategoryRepository;
import com.skillshare.project.model.Category;
import com.skillshare.project.model.Service;
import com.skillshare.project.model.User;
import com.skillshare.project.service.JobService;
import com.skillshare.project.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@org.springframework.stereotype.Service
public class Facade implements FacadeInterface {

    @Autowired
    UserService userService;

    @Autowired
    JobService jobService;

    @Autowired
    CategoryRepository categoryRepository;

    @Override
    public User saveUser(User user) {
        return userService.save(user);
    }

    @Override
    public User getUserByUsername(String username) {
        return userService.findByUsername(username);
    }

    @Override
    public User promoteUser(String username) {
        User user=this.getUserByUsername(username);
        if(user.getRole().equals("user"))
            return userService.changeRole(user,"mod");
        else
            return userService.changeRole(user,"admin");
    }

    @Override
    public User getCurrentUser() {
        return userService.getCurrentUser();
    }

    @Override
    public List<User> getAllUsers() {
        return userService.getAll();
    }

    @Override
    public User banUser(String username) throws Exception {
        User user=this.getUserByUsername(username);
        if(user.getRole().equals("admin")) throw new Exception("Vous ne pouvez pas bannir un admin !");
        return userService.changeRole(user,"ban");
    }

    @Override
    public User unbanUser(String username) {
        User user=this.getUserByUsername(username);
        return userService.changeRole(user,"user");
    }

    @Override
    public List<Service> getAllServices() {
        return jobService.findAll();
    }

    @Override
    public Service getServiceById(int id) {
        return jobService.findById(id).get();
    }

    @Override
    public Service finishService(int id) {
        Service service=this.getServiceById(id);
        service.setDone(true);
        return jobService.save(service);
    }

    @Override
    public Service saveService(Service service,int category) {
        service.setProvider(this.getCurrentUser());
        service.setCategory(categoryRepository.findById(category).get());
        return jobService.save(service);
    }

    @Override
    public List<Service> searchServices(String title, String tags, int category) {
        List<Service> services=jobService.findByTitle(title);
        List<String> tagsList= Arrays.asList(tags.split(","));
        List<Service> result=new ArrayList<Service>();
        for(String tag :tagsList){
            for(Service s:services){
                if (s.getTags().contains(tag)) result.add(s);
            }
        }
        return result.stream().filter(s->s.getCategory().getId()==category).collect(Collectors.toList());
    }

    @Override
    public void approveService(int id) {
        Service service=this.getServiceById(id);
        jobService.approve(service);
    }

    @Override
    public void buyService(int id) throws Exception {
        Service service=this.getServiceById(id);
        userService.buyService(service);
        userService.sellService(service);
    }

    @Override
    public void deleteService(int id) {
        Service service=this.getServiceById(id);
        userService.refund(service);
        jobService.delete(service);
    }

    @Override
    public List<Category> getAllCategory() {
        return jobService.getAllCategories();
    }
}
