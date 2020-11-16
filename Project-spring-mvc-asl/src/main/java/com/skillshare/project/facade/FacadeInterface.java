package com.skillshare.project.facade;

import com.skillshare.project.model.Category;
import com.skillshare.project.model.Service;
import com.skillshare.project.model.User;

import java.util.List;

public interface FacadeInterface {
    User saveUser(User user);
    User getUserByUsername(String username);
    User promoteUser(String username);
    User getCurrentUser();
    List<User> getAllUsers();
    User banUser(String username) throws Exception;
    User unbanUser(String username);
    List<Service> getAllServices();
    Service getServiceById(int id);
    Service finishService(int id);
    Service saveService(Service service,int category);
    List <Service> searchServices(String title, String tags, int category);
    void approveService(int id);
    void buyService(int id) throws Exception;
    void deleteService(int id);
    List<Category> getAllCategory();
}
