require 'pry'
class Department
attr_accessor :id, :name 

  def initialize
    @id = id
    @name = name 
  end

  def self.create_table
    sql = """CREATE TABLE IF NOT EXISTS departments (
            id INTEGER PRIMARY KEY,
            name TEXT 
      )"""
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = "DROP TABLE IF EXISTS departments;"
    DB[:conn].execute(sql)
  end

  def insert 
    sql = "INSERT INTO departments (name) VALUES (?)"
    DB[:conn].execute(sql, name)
    sql = "SELECT last_insert_rowid() FROM departments"
    id = DB[:conn].execute(sql)
    self.id = id.flatten.first
  end

  def self.new_from_db(row)
    d = new
    d.id = row[0]
    d.name = row[1]
    d
  end

  def self.find_by_name(name)
    sql = "SELECT * FROM departments WHERE name = ?;"
    # binding.pry
    results = DB[:conn].execute(sql, name)
    results.map {|row| self.new_from_db(row)}.first
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM departments WHERE id = ?;"
    results = DB[:conn].execute(sql, id)
    results.map {|row| self.new_from_db(row)}.first
  end

  def update 
    sql = "UPDATE departments SET id = ?, name = ?;"
    results = DB[:conn].execute(sql, id, name)
    results.map {|row| self.new_from_db(row)}
  end

  def persisted?
    !!self.id
  end

  def save
    persisted? ? update : insert 
  end
  
  def courses
    #find all courses by department_id
    Course.find_all_by_department_id(self.id)
  end

  def add_course(course)
  #   #add a course to a department and save it
    course.department_id = self.id
    sql = """ INSERT INTO courses (name, department_id) VALUES (?, ?);"""
    DB[:conn].execute(sql, "#{course.name}", "#{course.department_id}")
    # binding.pry
    # course.save
    self.save

  end

end
