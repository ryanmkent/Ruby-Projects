def guess_number guess
	number = 25
	unless guess > number || guess < number
		puts 'your guess was correct!'
	else
		puts'your guess was incorrect!'
	end
end
guess_number 24