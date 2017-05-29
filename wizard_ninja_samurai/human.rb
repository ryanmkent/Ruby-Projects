class Human
	attr_accessor :strength, :intelligence, :stealth, :health

	def initialize
		@strength = 3
		@intelligence = 3
		@stealth = 3
		@health = 100
	end

	def attack(object)
		if obj.class.ancestors.include?(Human)
			obj.health -= 10
			puts 'this objects ancestors include the Human class'
		else
			puts 'this objects ancestors DO NOT include the Human class'
		end
	end
end	

h1 = Human.new
h2 = Human.new

puts h1.attack(h2)
puts h2.health