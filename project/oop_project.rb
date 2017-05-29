class Project
	#code goes here	
	attr_accessor :project_name, :project_description

	def initialize p_name, p_description
		puts "You didn't spell 'initialize' wrong.  Kudos!"
		@project_name = p_name
		@project_description = p_description
	end	

	def elevator_pitch
		puts "#{@project_name}, #{@project_description}"
	end
end
project1 = Project.new("Project 1", "Description 1")
puts project1.project_name
project1.elevator_pitch