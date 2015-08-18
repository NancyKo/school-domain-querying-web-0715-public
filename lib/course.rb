require 'pry'
class Course
attr_accessor :id, :name, :department_id
	def initialize
		@id = id
		@name = name
		@department_id = department_id
	end

	def self.create_table
		sql = """CREATE TABLE IF NOT EXISTS courses (
						id INTEGER PRIMARY KEY,
						name TEXT, 
						department_id INTEGER REFERENCES departments);"""
		DB[:conn].execute(sql)
	end

	def self.drop_table
		sql = """DROP TABLE IF EXISTS courses"""
		DB[:conn].execute(sql)
	end

	def insert 
		sql = """ INSERT INTO courses (name)
		VALUES (?)"""
		DB[:conn].execute(sql, name)
		sql = """SELECT last_insert_rowid() FROM courses"""
		@id = DB[:conn].execute(sql)
    self.id = @id.length
	end

	def self.new_from_db(row)
		new_course = new 
		new_course.id = row[0]
		new_course.name = row[1]
		new_course
	end

	def self.find_by_name(name)
		sql = """SELECT * FROM courses WHERE name = ?;"""
		# binding.pry
		results = DB[:conn].execute(sql, name)
    results.map {|row| self.new_from_db(row) }.first
	end

	def self.find_all_by_department_id(department_id)
		sql = """SELECT * FROM courses WHERE department_id = ?"
		results	=	DB[:conn].execute(sql, department_id)
		binding.pry
		results.map {|row| self.new_from_db(row) }.first

	end

end
