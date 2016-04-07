#LIFO
class Stack
	#had to change store variable name so it doesn't clash
	#with the queue store variable
  def initialize
    @store_employee = Array.new
  end
  
  def pop
  	@store_employee.pop
  end
  
  def push(element)
  	@store_employee << element
  end
  
  def size
  	@store_employee.length
  end

  def empty?
		size == 0
  end
end
