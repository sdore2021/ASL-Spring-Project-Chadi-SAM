package com.skillshare.project.dao;

import com.skillshare.project.model.Category;
import com.skillshare.project.model.Service;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ServiceRepository extends JpaRepository<Service,Integer> {
    List<Service> findByTitleContains(String title);
}
