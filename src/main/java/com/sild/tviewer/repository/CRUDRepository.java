package com.sild.tviewer.repository;

import java.util.List;

public interface CRUDRepository<T> {
	
	public void add(T element);
	public void update(T element);
	public T get(int id);
	public void delete(int id);
	public List<T> getAll();

}
