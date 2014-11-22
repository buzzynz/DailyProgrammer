#!/usr/bin/env ruby

sourcefile = File.open (ARGV[0])
printcounter = 0
# read a line, pass a block
sourcefile.each do |line|
	line.chomp!
	# read the first four characters of the line
	firstfour = line[0, 4]

	#Check for YYYY format
	if ((firstfour =~ /[0-9]{4}/) == 0)
		puts line
		printcounter += 1
	end	

	#Check for mm/ format
	if ((firstfour =~ /[0-9][0-9]\//) == 0)
		lineyear = line[-2, 2]
		if lineyear.to_i > 50
			lineyear = lineyear.to_i + 1900
		else
			lineyear = lineyear.to_i + 2000
		end
		linemonth = line[-5, 2]
		lineday = line[-8, 2]
		puts lineyear.to_s + "-" + linemonth + "-" + lineday	
		printcounter += 1
	end	

	#Check for mm# format
	if ((firstfour =~ /[0-9][0-9]#/) == 0)
		lineyear = line[-5, 2]
		if lineyear.to_i > 50
			lineyear = lineyear.to_i + 1900
		else
			lineyear = lineyear.to_i + 2000
		end
		linemonth = line[-8, 2]
		lineday = line[-2, 2]
		puts lineyear.to_s + "-" + linemonth + "-" + lineday	
		printcounter += 1
	end	
	
	#Check for dd* format
	if ((firstfour =~ /[0-9][0-9]\*/) == 0)
		lineyear = line[-4, 4]
		linemonth = line[-7, 2]
		lineday = line[-10, 2]
		puts lineyear.to_s + "-" + linemonth + "-" + lineday	
		printcounter += 1
	end	

	#Check for mmm format
	if ((firstfour =~ /[A-Z][a-z][a-z]*/) == 0)
		if line.length == 10
			lineday = line[-6, 2]
			lineyear = line[-2, 2]
			linemonth = line[0, 3]
			if lineyear.to_i > 50
				lineyear = lineyear.to_i + 1900
			else
				lineyear = lineyear.to_i + 2000
			end
		else
			lineyear = line[-4, 4]
			lineday = line[-8, 2]
			linemonth = line[0, 3]
		end
		case linemonth
			when "Jan"
			nummonth = "01"
			when "Feb"
			nummonth = "02"
			when "Mar"
			nummonth = "03"
			when "Apr"
			nummonth = "04"
			when "May"
			nummonth = "05"
			when "Jun"
			nummonth = "06"
			when "Jul"
			nummonth = "07"
			when "Aug"
			nummonth = "08"
			when "Sep"
			nummonth = "09"
			when "Oct"
			nummonth = "10"
			when "Nov"
			nummonth = "11"
			when "Dec"
			nummonth = "12"
		end	
			puts lineyear.to_s + "-" + nummonth + "-" + lineday	
			printcounter += 1
	end	
end
puts printcounter
