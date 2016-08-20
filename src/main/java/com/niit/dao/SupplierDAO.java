package com.niit.dao;

import java.util.List;

import com.niit.models.Supplier;

public interface SupplierDAO {


	public List<Supplier> list();

	public Supplier get(String id);
	
	//public Supplier getSupplier(String id);

	public void saveOrUpdate(Supplier supplier);

	public void delete(String id);


}
