package com.database.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.database.entity.Student;

@Repository
public class StudentDAOImpl implements StudentDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Student> getStudents() {

		Session currentSession = sessionFactory.getCurrentSession();

		Query<Student> theQuery = currentSession.createQuery("from Student order by lastName", Student.class);

		List<Student> students = theQuery.getResultList();

		return students;
	}

	@Override
	public void saveStudent(Student student) {

		Session currentSession = sessionFactory.getCurrentSession();

		currentSession.saveOrUpdate(student);

	}

	@Override
	public Student getStudent(int id) {

		Session currentSession = sessionFactory.getCurrentSession();

		Student student = currentSession.get(Student.class, id);

		return student;
	}

	@Override
	public void deleteStudent(int id) {

		Session currentSession = sessionFactory.getCurrentSession();

		Student student = currentSession.get(Student.class, id);

		currentSession.delete(student);
	}

}
