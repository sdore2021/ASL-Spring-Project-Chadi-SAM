package com.skillshare.project.dao;

import com.skillshare.project.model.Category;
import com.skillshare.project.model.Service;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends CrudRepository<Category,Integer> {
}
