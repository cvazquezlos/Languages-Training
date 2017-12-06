class Persona
  #Hereda de la clase object
  def initialize(nombre, apellidos, f_nacimiento, edad)
    @nombre, @apellidos, @f_nacimiento, @edad = nombre, apellidos, f_nacimiento, edad
  end
  
  def to_s
    "(#{@nombre}, #{@apellidos}, #{@f_nacimiento}, #{@edad})"
  end
  
  def nombre
    return @nombre
  end
  
  def apellidos
    return @apellidos
  end
  
  def f_nacimiento
    return @f_nacimiento
  end
  
  def edad
    return @edad
  end
end