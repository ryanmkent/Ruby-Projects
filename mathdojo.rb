class MathDojo
	def initialize
		puts "You didn't spell initialize wrong.  Kudos!"
	end
	def add x
		@first_variable = x
		@second_variable = self
		@sum = @first_variable + @second_variable
	end
	def subtract
		puts @first_variable-@second_variable
		self
	end	
end

challenge1 = MathDojo.new.add(2).add(2,5)
challenge1

