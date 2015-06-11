##Objectives: You are going to build an ORM, which stands for <a href="http://en.wikipedia.org/wiki/Object-relational_mapping">Object Relational Mapper</a>. ORM's are powerful tools that abstract away raw SQL statements, giving you access to methods for searching, sorting, associating, just to name a few. Ruby on Rails is powered by an ORM called Active Record, which is what makes Rails so awesome. The overall goal of this lab is to gain an understanding of ORM's and an appreciation for the abstraction that is provided.

###Right now your ORM Student class has methods that will:

1. Insert students into the database with their associated attributes.
2. Update a student's attributes in the database and have it persist(continue to exist).
3. Delete students from the database.
4. Create a new instance of a student from the database.(Students will exist in the database in a row, you will create an instance (object) so you can use that object.)
5. Find a student by their name or id.
6. Add a course to a student.
7. Retreive all of the courses of a student.

After completing this lab, your Course, Department and Registration classes will have similar functionality and the abilitiy to talk to each other. In order to make this happen, your tables will use <a href="http://www.sql-join.com/">SQL joins</a>. You will be able to do things like find all courses by department name or add a course to a particular student.

###A Note On Integration Tests
<a href="Integration testing - Wikipedia, the free encyclopedia">Integration testing</a>combines all of your models and tests them as a group. It occurs after unit testing and before validation testing to make sure everything "integrates" and works together.

In order for the integration tests to pass completely, you will need to build methods that relate Course and Student to Department. They will go in the Course and Student classes.

###Department 
```ruby 
def course
  #find all courses by department_id
end

def add_course(course)
  #add a course to a department and save it
end
```

###Course 

```ruby
def department
  #successfully gets department
end
```
  
def department=(department)
  #set department id when deparment is set
end

```ruby 
def students
  #find all students by department_id
end

def add_student(student)
  #add a student to a particular course and save them
end
```
