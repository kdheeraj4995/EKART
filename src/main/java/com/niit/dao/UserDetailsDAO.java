package com.niit.dao;

import java.util.List;

import com.niit.models.UserDetails;

public interface UserDetailsDAO {


	public List<UserDetails> list();

	public UserDetails get(int id);

	public void saveOrUpdate(UserDetails user);

	public void delete(int id);
	
	public boolean isValidUser(String userName,String password);
	
	public UserDetails get(String userName);
}
