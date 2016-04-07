require './Stack.rb'
require './Queue.rb'

class JobSim

	def initialize
	@people_quota = 6
	@applicants = 12
	@waiting = waitlist
	@workers = Stack.new
	end

	#need to run hire after initializing class because the company
	#has no workers
	
	def hire
		#for however many people needed, an applicant 
		#will be taken out of the waiting list and inserted in @workers
		@people_quota.times do
			@workers.push(@waiting.dequeue)
		end
	end

	def fire
		#picking random of 6 number because of roll of dice
		#a loop will be done to put the current worker 
		#in the waitlist circulation
		@people_quota = rand(1..6)
		@people_quota.times do
			@waiting.enqueue(@workers.pop)			
		end
	end

	def waitlist
		#creates an array that represents a person for each element
		count = 0
		waiting = Queue.new
		@applicants.times do
			count += 1
			waiting.enqueue(count)
		end
		return waiting
	end

end

