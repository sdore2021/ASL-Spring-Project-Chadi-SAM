package com.skillshare.project.service;

import com.skillshare.project.model.Category;
import com.skillshare.project.model.Service;
import com.skillshare.project.model.User;
import java.util.List;
import java.util.Optional;

public interface JobService {
    Service save(Service service);
    void delete(Service service);
    Service approve(Service service);
    List<Service> findAll();
    Optional<Service> findById(int id);
    List<Service> findByTitle(String title);
}

