package com.skillshare.project.service;

import com.skillshare.project.dao.ServiceRepository;
import com.skillshare.project.model.Category;
import com.skillshare.project.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service("JobService")
public class JobServiceImpl implements JobService {

    @Autowired
    private ServiceRepository serviceRepository;

    @Override
    public com.skillshare.project.model.Service save(com.skillshare.project.model.Service service) {
        return serviceRepository.save(service);
    }

    @Override
    public void delete(com.skillshare.project.model.Service service) {
        serviceRepository.delete(service);
    }

    @Override
    public com.skillshare.project.model.Service approve(com.skillshare.project.model.Service service) {
        service.setAvailable(true);
        return serviceRepository.save(service);
    }

    @Override
    public List<com.skillshare.project.model.Service> findAll() {
        return serviceRepository.findAll();
    }

    @Override
    public Optional<com.skillshare.project.model.Service> findById(int id) {
        return serviceRepository.findById(id);
    }

    @Override
    public List<com.skillshare.project.model.Service> findByTitle(String title) {
        return serviceRepository.findByTitleContains(title);
    }

}
