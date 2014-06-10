class Rolodex
	attr_accessor :contacts
	def initialize
		@id = 1000
		@contacts = Array.new
	end

	def contacts
		@contacts
	end

	def addContact(contact)
		contact.id = @id
		@contacts << contact
		@id += 1
	end

	def modify(modId)
		5.times { sleepForSleepsSake }
		print "MODIFYING A CONTACT\n"
		sleepForSleepsSake
		print "______________________________\n\n"
				5.times { sleepForSleepsSake }
		print "Please select which attribute you wish to change.\n"
		sleepForSleepsSake
		print "Enter the corresponding number and press enter.\n"
		5.times { sleepForSleepsSake }
		print "[1] First Name\n"
		sleepForSleepsSake
		print "[2] Last Name\n"
		sleepForSleepsSake
		print "[3] Email\n"
		sleepForSleepsSake
		print "[4] Notes\n"
		5.times { sleepForSleepsSake }
		print "\n\n =>  "
		attrSel = gets.chomp.to_i
		unless attrSel.between?(1,4)
			until attrSel.between?(1,4)
				print "\nLet\'s try that again.\n\nEnter a number: "
				attrSel = gets.chomp.to_i
			end
		end
		5.times { sleepForSleepsSake }
		print "\nWhat would you like to change it to?  "
		repl = gets.chomp
		if attrSel == 3
 		 	unless repl.include? "@"
 		 		print "\n\nPlease Enter Valid Email Address: "
 			 	repl = gets.chomp
		 	end
	 	end
		5.times { sleepForSleepsSake }
		@contacts.each do |contact|
			if contact.id == modId
				case attrSel
					when 1
						print "\nAre you sure you would like me to replace \"#{contact.first_name}\" with \"#{repl}\"? y/n  "
						modAnswer = gets.chomp
						if modAnswer == ("y")
							contact.first_name = repl
						end
					when 2
						print "\nAre you sure you would like me to replace \"#{contact.last_name}\" with \"#{repl}? y/n  "
						modAnswer = gets.chomp
						if modAnswer == ("y")
							contact.last_name = repl
						end
					when 3
						print "\nAre you sure you would like me to replace \"#{contact.email}\" with \"#{repl}? y/n  "
						modAnswer = gets.chomp
						if modAnswer == ("y")
							contact.email = repl
						end
					when 4
						print "\nAre you sure you would like me to replace \"#{contact.note}\" with \"#{repl}? y/n  "
						modAnswer = gets.chomp
						if modAnswer == ("y")
							contact.note = repl
						end
				end

 		
			else 
						print "\nI'm sorry, but there is no contact with that ID.  Please try again."
						sleep 2.2
			end

		end
		5.times { sleepForSleepsSake }	
 		print "\n\nYour contact\'s information is being updated.  "
 		6.times { sleepForSleepsSake }
 		print "Please wait."
 		3.times { sleepForSleepsSake }
 		print "\n\nProcessing"
 		sleep (rand/5)
 		print "."
 		sleep (rand/5)
 		print "." 		
 		sleep (rand/5)
 		print "."
 		 sleep (2*rand)
 		print "."
 		 sleep (3*rand)
 		print "."
 		sleep (rand/20)
 		print "."
 		sleep (rand/20)
 		print "."
 		4.times { sleepForSleepsSake }
		puts "\e[H\e[2J"
	end

	def delete(modId)
		@contacts.each do |contact|
			if contact.id == modId
				4.times { sleepForSleepsSake }
				print "\nAre you sure you would like to delete the profile for #{contact.first_name} #{contact.last_name}?  y/n "
				delAnswer = gets.chomp
				if delAnswer == ("y")
					@contacts.delete(contact)
					5.times { sleepForSleepsSake }	
 					print "\nDeleting selected contact.  "
 					6.times { sleepForSleepsSake }
 					print "Please wait."
 					3.times { sleepForSleepsSake }
 					print "\n\nProcessing"
 					sleep (rand/5)
 					print "."
 					sleep (rand/5)
 					print "." 		
 					sleep (rand/5)
 					print "."
 					 sleep (2*rand)
 					print "."
 					 sleep (3*rand)
 					print "."
 					sleep (rand/20)
 					print "."
 					sleep (rand/20)
 					print "."
 					4.times { sleepForSleepsSake }
				end 
			end
		end
		puts "\e[H\e[2J"
	end

	def displayContacts
		print "\nYOUR CONTACTS\n"
		5.times { sleepForSleepsSake }
		print "______________________________\n\n"
		@contacts.each do |contact|
			5.times { sleepForSleepsSake }
			print "#{contact.first_name} #{contact.last_name} can be reached at #{contact.email}.\n"
			print "Don't forget, #{contact.note}\n"
			sleepForSleepsSake
			print "______________________________\n"
		end
			sleep 3
		print "\n\nPress any key to continue"
		pointless = gets.chomp
		puts "\e[H\e[2J"
	end

	def displayAttribute
		print "DISPLAY ATTRIBUTE\n"
		5.times { sleepForSleepsSake }
		print "______________________________\n\n"
		print "\nWhich of these attributes would you like me to display?\n"
		5.times { sleepForSleepsSake }
		print "[1] First Name\n"
		sleepForSleepsSake
		print "[2] Last Name\n"
		sleepForSleepsSake
		print "[3] Email\n"
		sleepForSleepsSake
		print "[4] Notes\n"
		sleepForSleepsSake
		print "\n\n =>  "
		attrSel = gets.chomp.to_i
		unless attrSel.between?(1,4)
			until attrSel.between?(1,4)
				print "\nLet\'s try that again.\n\nEnter a number: "
				attrSel = gets.chomp.to_i
			end
		end
		@contacts.each do |contact|
			5.times { sleepForSleepsSake }
			case attrSel
				when 1
					print "\nFirst Name: #{contact.first_name}"
				when 2
					print "\nLast Name: #{contact.last_name}"
				when 3
					print "\nEmail: #{contact.email}"
				when 4
					print "\nNote: #{contact.note}"
			end
		end
		print "\n\nPress any key to continue"
		pointless = gets.chomp
		puts "\e[H\e[2J"	
	end
end




