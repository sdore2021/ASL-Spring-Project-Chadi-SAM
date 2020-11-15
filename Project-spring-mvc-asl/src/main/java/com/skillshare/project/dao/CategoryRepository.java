package com.skillshare.project.dao;

import com.skillshare.project.model.Service;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends CrudRepository<Service,Integer> {
}
