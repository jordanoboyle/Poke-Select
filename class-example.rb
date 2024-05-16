

class Chair
  attr_reader :type
  attr_writer :type
  def initialize(type)
    @type = type
  end

  def change_type(input_type)
    @type = input_type
  end
end

chair1 = Chair.new("lounge")

p chair1
p chair1.type

chair1.change_type("rocking")

p chair1
p chair1.type