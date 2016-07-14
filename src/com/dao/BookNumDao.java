package com.dao;

import com.model.BookNum;

public interface BookNumDao {
	public BookNum findById(int id);
	public void saveOrUpdate(BookNum bookNum);
	public void delete(int id);
}
