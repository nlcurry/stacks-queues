#FIFO
class Queue
	#had to change store variable name so it doesn't clash
	#with stack variable name
  def initialize
  	@store_wait = Array.new
  end
  
  def dequeue
  	@store_wait.shift
  end
  
  def enqueue(element)
  	@store_wait << element
  end
  
  def size
  	@store_wait.length
  end

  def empty?
  	size == 0
  end
end
