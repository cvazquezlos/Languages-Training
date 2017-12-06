class Fraccion
  def initialize(numerador, denominador)
    @numerador, @denominador = numerador, denominador
  end
  
  def to_s
    "(#{@numerador}, #{@denominador})"
  end
  
  def esMayor (otra)
    #(@numerador * otra.denominador) > (@denominador * otra.numerador)  
    compare(otra) > 0
  end
  
  def esMenor (otra)
  #  (@numerador * otra.denominador) < (@denominador * otra.numerador)
    compare(otra) < 0 
  end
  
  def esEquivalente (otra)
    (@numerador * otra.denominador) == (@denominador * otra.numerador) 
    compare(otra) == 0 
  end
  
  #attr_reader :numerador, :denominador
  
  def numerador #get numerador
    return @numerador
  end
  
  def denominador #get denominador
    return @denominador
  end
  #self. es la palabra reservada para el atributo propia de la clase
  
  # Se puede crear un método privado para que se puedan compara ya que el código se parece
  # A esto se le llama refactorizar el código. Es lo positivo de la encapsulación.
  # Se aumenta la mantenibilidad del código
  
  private
  
  def compare (otra)
    @numerador * otra.denominador - @denominador * otra.numerador
    #Aqui se compara si la diferencia es positiva, 0 o negativa
  end
end