package com.niit.dao;

import java.util.List;

import com.niit.models.Product;

public interface ProductDAO {


	public List<Product> list();

	public Product get(int id);

	public void saveOrUpdate(Product product);

	public void delete(int id);

	public List<Product> getcatitem(int id);
	
	public List<Product> Homelist();
	
	public List<Product> getindividual(int id);
}
