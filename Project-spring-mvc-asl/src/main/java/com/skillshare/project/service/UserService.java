package com.skillshare.project.service;

import com.skillshare.project.model.Service;
import com.skillshare.project.model.User;

import java.util.List;

public interface UserService {
     User save(User user);
     List<User> getAll();
     User changeRole(User user,String role);
     User findByUsername(String username);
     User getCurrentUser();
     User sellService(Service service);
     User buyService(Service service) throws Exception;
     void refund(Service service);
}
