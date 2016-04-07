require './Stack.rb'
require './Queue.rb'

class JobSim

	def initialize
	@people_quota = 6
	@applicants = 12
	@waiting = waitlist
	@workers = initial_hire
	end

	def initial_hire
		#creates an array that represents a person already working
		counting = 0
		workers= Stack.new
		@people_quota.times do
			counting += 1
			workers.push(counting)
		end
		return workers
	end

	def waitlist
		#creates an array that represents a person on the waitlist
		# for each element
		count = @people_quota
		waiting = Queue.new
		@applicants.times do
			count += 1
			waiting.enqueue(count)
		end
		return waiting
	end

	def shuffle
		@people_quota = rand(1..6)
		#change firing quota to adjust to worker availability
		if @waiting.size < @people_quota
			@people_quota = @waiting.size
		end
		#this loop fires current workers and places them on waitlist
		@people_quota.times do
			@waiting.enqueue(@workers.pop)			
		end
		#this loop inserts the people on the waitlist in the workforce
		#the two loops need to be done separately so that the order
		#stays intact
		@people_quota.times do
			@workers.push(@waiting.dequeue)
		end
	end
end

