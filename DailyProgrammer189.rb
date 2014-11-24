#!/usr/bin/env ruby

require 'open-uri'

# get the word list using open-uri
# split word list into an array
wordlist = open('http://s3.buzzy.geek.nz/wordlist.txt').read
wordarray = wordlist.lines

# take random sample from array. Remove newline, split the word into a char array
targetword = wordarray.sample.chomp!.split(//)  # consider chars method of word?
filter = Array.new(targetword.length, "_")

puts "Here's the word: " + "_ " * targetword.length + " that's " + targetword.length.to_s + " characters."

lives = 0

while lives < 10 do
	correct_guess = FALSE
	displayword = ""	#this needs to be fixed

	puts "have a guess: "
	char_guess = gets
	char_guess.chomp!  # need to ensure this is a char
	
	# Check for a letter match
	for i in 0...targetword.length
		if char_guess == targetword[i]
			filter[i] = char_guess
			# Fill in the filter where there's a match
			correct_guess = TRUE
			# If there's a match, you don't lose a life
		end
	end

	# Display the partial word. This needs to be fixed
	for i in 0...targetword.length
		displayword << filter[i]
	end

	# has the player won?
	puts displayword
	
	# if still going, did we lose a life?
	if (not(correct_guess))
		lives += 1
	end
end
	


