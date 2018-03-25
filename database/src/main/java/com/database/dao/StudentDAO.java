package com.database.dao;

import java.util.List;

import com.database.entity.Student;

public interface StudentDAO {

	public List<Student> getStudents();

	public void saveStudent(Student student);

	public Student getStudent(int id);

	public void deleteStudent(int id);
	
}
