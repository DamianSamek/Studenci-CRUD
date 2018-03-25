package com.database.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.database.entity.Student;
import com.database.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {

	@Autowired
	private StudentService studentService;

	@RequestMapping("/list")
	public String listStudents(Model theModel) {

		List<Student> students = studentService.getStudents();

		theModel.addAttribute("students", students);

		return "list-students";
	}

	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {
		Student student = new Student();

		theModel.addAttribute("students", student);

		return "student-form";
	}

	@PostMapping("/saveStudent")
	public String saveStudent(@ModelAttribute("students") Student student) {

		studentService.saveStudent(student);

		return "redirect:/student/list";
	}

	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("studentId") int id, Model theModel) {

		Student student = studentService.getStudent(id);

		theModel.addAttribute("students", student);

		return "student-form";
	}

	@GetMapping("/delete")
	public String deleteStudent(@RequestParam("studentId") int id) {
		studentService.deleteStudent(id);
		return "redirect:/student/list";
	}

}
