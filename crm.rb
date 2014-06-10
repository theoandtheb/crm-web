require_relative 'contact'
require_relative 'rolodex'

require 'sinatra'



get '/' do
	@crm_app_name = "My CRM"
	erb :index
	# CRM.run("G.U.S.S.")
	end
	
def sleepForSleepsSake
	sleep 0.1
end


def intCheck(x,y)
		$selectr = gets.chomp.to_i
		unless $selectr.between?(x,y)
			until $selectr.between?(x,y)
			print "\nLet\'s try that again.\n\nEnter a number: "
			$selectr = gets.chomp.to_i
			end
		end
end


class CRM
	attr_accessor :name
		def initialize(name)
			@name = name
			@rolodex = Rolodex.new
			print "Welcome to #{name}"
			sleep 1.4
		end

		def self.run(name)
			crm = CRM.new(name)
			crm.mainMenu
			crm.selectOption
		end


	def mainMenu
		print "\n\nMAIN MENU\n"
		2 * sleepForSleepsSake
		print "_______________________________\n\n"
		sleepForSleepsSake
		print "[1] Add a new contact\n"
		sleepForSleepsSake
		print "[2] Modify an existing contact\n"
		sleepForSleepsSake
		print "[3] Delete a contact\n"
		sleepForSleepsSake
		print "[4] Display all contacts\n"
		sleepForSleepsSake
		print "[5] Display an attribute\n"
		sleepForSleepsSake
		print "[6] Exit\n\n"
	end

	def selectOption
		sleep 0.6
		print "Please enter the number from the list above and press enter."
		sleep 0.8
		print "  I'll wait."
		3.times { sleepForSleepsSake }
		print "  =>  "
		intCheck(1,6)
		selectr = $selectr
		call_option(selectr)
	end

	def call_option(selectr)
		5.times { sleepForSleepsSake }
		puts "\e[H\e[2J"
		case $selectr
		when 1
			addNewContact
		when 2
			modifyContact
		when 3
			deleteContact
		when 4
			displayContacts
		when 5
			displayAttribute
		when 6
			return
		end
	end

	def addNewContact
		print "ADDING A NEW CONTACT\n______________\n\n"
		5.times { sleepForSleepsSake }		
 		 print "Enter First Name: "
 		 first_name = gets.chomp
 		 sleepForSleepsSake
 		 print "\n\nEnter Last Name: "
 		 last_name = gets.chomp
 		 sleepForSleepsSake
 		 print "\n\nEnter Email Address: "
 		 email = gets.chomp
 		 	unless email.include? "@"
 		 		print "\n\nPlease Enter Valid Email Address: "
 			 	email = gets.chomp
		 	end
		 	sleepForSleepsSake
 		 print "\n\nEnter a Note: "
 		 note = gets.chomp
 		contact = Contact.new(first_name, last_name, email, note)
 		@rolodex.addContact(contact)
			4.times { sleepForSleepsSake }
 		print "\n\nAdding contact and returning to the main menu.  "
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
 		 mainMenu
 		 selectOption
	end

	def findUser
	 	print "\nPlease specify the contact ID would you like to address: " 	
 		modId = gets.chomp.to_i
		unless modId >= 1000
			until modId >= 1000
				 "\nLet\'s try that again.\n\nEnter the contact ID of the contact you wish to modify: : "
				modId = gets.chomp.to_i
			end
		end
  		modId
  	end

  	def modifyContact
  		modId = findUser
  		@rolodex.modify(modId)
  		mainMenu
  		selectOption
  	end

  	def deleteContact
  		modId = findUser
  		@rolodex.delete(modId)
  		mainMenu
  		selectOption
  	end

  	def displayContacts
  		@rolodex.displayContacts
  		mainMenu
  		selectOption
  	end

  	def displayAttribute
  		@rolodex.displayAttribute
  		mainMenu
  		selectOption
  	end
end