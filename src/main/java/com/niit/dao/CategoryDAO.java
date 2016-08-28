package com.niit.dao;

import java.util.List;

import com.niit.models.Category;

public interface CategoryDAO {


	public List<Category> list();

	public Category get(int id);

	public void saveOrUpdate(Category category);

	public void delete(int id);


}
