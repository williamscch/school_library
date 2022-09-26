class Person 
  def initialize(age, name = "Unknown", parent_permission = true)
     @id = Random.rand(1..100)
     @name = name
     @parent_permission = parent_permission
  end

  def id 
    @id
  end

  def name 
    @name 
  end

  def age
    @age
  end

  def name=(value)
   @name = value
  end

  def age=(value) 
    @age = value
  end



  def can_use_services? 
   is_of_age? || @parent_permission
  end

  private

  def is_of_age? 
   @age>= 18
   end
end