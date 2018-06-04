class Proceso
  
  def initialize(id, parentId, name, memory)
    @id = id
    @parentId = parentId
    @name = name
    @memory = memory
  end
  
  def to_s
    "#{@name}, #{@id}, #{@parentId}, #{@memory}"
  end
  
  attr_reader :id, :parentId, :name, :memory
  
end